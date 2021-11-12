using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
namespace AppwebMTS
{
    public partial class RegistroUsuarios : System.Web.UI.Page
    {
        private Usuario usuario;
        private MobileToolStoreEntities entities;
        private string key = "jwey89e09ewhfo24";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.entities = new MobileToolStoreEntities();
        }
        public void registrarUsuario(Usuario usuario)
        {
            try
            {
                TblUsuarios tblUsuarios = new TblUsuarios();

                tblUsuarios.correoElectronico = usuario.correoElectronico;
                tblUsuarios.nombre = usuario.nombre;
                tblUsuarios.fechaNacimiento = usuario.fechaDeNacimiento;
                tblUsuarios.direccion = usuario.direccion;
                tblUsuarios.contrasenna = usuario.contrasena;
                tblUsuarios.rol = usuario.rol;
                this.entities.TblUsuarios.Add(tblUsuarios);
                this.entities.SaveChanges();
                this.mensaje("Datos guardados correctamente.");
            }
            catch (Exception )
            {

                this.mensaje("Este usuario ya existe.");
            }
        }
        public void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
        private void limpiarPantalla()
        {
            this.txtCorreoElectronico.Text = "";
            this.txtNombreCompleto.Text = "";
            this.txtDireccion.Text = "";
            this.txtFechaNacimiento.Text ="";
            this.txtContrasenna.Text = "";
            this.txtConfirmarContrasenna.Text = "";
        }
        protected void btnRegistrarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                this.usuario = new Usuario();

                this.usuario.correoElectronico = this.txtCorreoElectronico.Text.Trim();
                this.usuario.nombre = this.txtNombreCompleto.Text.Trim();
                this.usuario.fechaDeNacimiento = DateTime.Parse(this.txtFechaNacimiento.Text.Trim());
                this.usuario.direccion = this.txtDireccion.Text.Trim();
                this.usuario.contrasena = this.txtContrasenna.Text.Trim();
                this.usuario.rol = "c";
                string confirmacion = this.txtConfirmarContrasenna.Text.Trim();
                if (this.usuario.contrasena == confirmacion)
                {
                    this.usuario.contrasena = this.encriptar(this.usuario.contrasena, key);
                    this.registrarUsuario(usuario);
                    Response.Redirect("Login.aspx");
                    this.limpiarPantalla();
                }
                else
                {
                    Response.Write("<script language='Javascript'> alert ('Las contraseñas no coinciden.')</script>");
                    this.txtContrasenna.BorderColor = Color.Red;
                    this.txtConfirmarContrasenna.BorderColor = Color.Red;
                }

            }
            catch (Exception ex)
            {

                this.mensaje("Ha ocurrido un error al guardar los datos.");
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
    }
}