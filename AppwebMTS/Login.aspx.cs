using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using System.Drawing;
using System.Web.Security;
using System.Text;
using System.Security.Cryptography;

namespace AppwebMTS
{
    public partial class Login : System.Web.UI.Page
    {
        private MobileToolStoreEntities entities;
        private string key = "jwey89e09ewhfo24";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.entities = new MobileToolStoreEntities();
            if (IsPostBack)
            {
                this.txtUsuario.BorderColor = Color.Empty;
                this.txtContrasena.BorderColor = Color.Empty;
            }
        }
        private string validarPerfil(string pEmail, string pw)
        {
            try
            {
                string autorizado = "";

                TblUsuarios tblUsuarios = this.entities.TblUsuarios.FirstOrDefault(
                    u => (u.correoElectronico.Equals(pEmail) & u.contrasenna.Equals(pw)));

                if (tblUsuarios != null)
                {
                    autorizado = tblUsuarios.nombre;
                    if (tblUsuarios.rol.Equals("a"))
                    {
                        Session["Rol"] = "Admin";
                    }
                    else
                    {
                        Session["Rol"] = "Cliente";
                    }
                    
                }
                return autorizado;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public string encriptar(string cadena, string key)
        {
            byte[] keyArray;
            byte[] encriptar = Encoding.UTF8.GetBytes(cadena);

            keyArray = Encoding.UTF8.GetBytes(key);

            var tdes = new TripleDESCryptoServiceProvider();
            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cryptoTransform = tdes.CreateEncryptor();
            byte[] resultado = cryptoTransform.TransformFinalBlock(encriptar, 0, encriptar.Length);
            tdes.Clear();

            return Convert.ToBase64String(resultado, 0, resultado.Length);
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                this.txtUsuario.BorderColor = Color.Empty;
                this.txtContrasena.BorderColor = Color.Empty;
                if (this.txtUsuario.Text.Trim().Equals("") && this.txtContrasena.Text.Trim().Equals(""))
                {
                    this.txtUsuario.BorderColor = Color.Red;
                    this.txtContrasena.BorderColor = Color.Red;
                }
                else if (this.txtUsuario.Text.Trim().Equals(""))
                {
                    this.txtUsuario.BorderColor = Color.Red;
                }
                else if (this.txtContrasena.Text.Trim().Equals(""))
                {
                    this.txtContrasena.BorderColor = Color.Red;
                }
                else
                {
                    string nombrePerfil = this.validarPerfil(this.txtUsuario.Text.Trim(), this.encriptar(this.txtContrasena.Text.Trim(), key));
                    if (!nombrePerfil.Equals(""))
                    {
                        FormsAuthentication.SetAuthCookie(nombrePerfil, false);
                        Session["usuarioActual"] = this.txtUsuario.Text.Trim();
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        Response.Write("<script language='Javascript'> alert ('Usuario o password incorrecto.')</script>");
                    }
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}