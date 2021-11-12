using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace AppwebMTS
{
    public partial class FormularioComentario : System.Web.UI.Page
    {
        private Comentario comentario;
        private MobileToolStoreEntities entities;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.entities = new MobileToolStoreEntities();
            if (!IsPostBack)
            {
                this.estadoInicial();
            }
        }
        protected void btnEnviarComentario_Click(object sender, EventArgs e)
        {
            try
            {
                this.comentario = new Comentario();

                this.comentario.nombreCompleto = this.txtNombre.Text.Trim();
                this.comentario.correo = this.txtCorreo.Text.Trim();
                this.comentario.telefono = this.txtTelefono.Text.Trim();
                this.comentario.mensaje = this.txtComentario.Text.Trim();

                this.guardarComentario(comentario);
                this.mensaje("Comentario enviado.");

                this.estadoInicial();

                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void guardarComentario(Comentario comentario)
        {
            try
            {
                TblComentario tblComentario = new TblComentario();

                tblComentario.nombreCompleto = comentario.nombreCompleto;
                tblComentario.telefono = comentario.telefono;
                tblComentario.correoElectronico = comentario.correo;
                tblComentario.mensaje = comentario.mensaje;

                this.entities.TblComentario.Add(tblComentario);
                this.entities.SaveChanges();
                this.enviarMail(comentario);
            }
            catch (Exception ex)
            {
                throw ex;
                //this.mensaje("Datos guardados correctamente.");
            }
        }
        public void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
        private void estadoInicial()
        {
            this.txtNombre.Text = "";
            this.txtTelefono.Text = "";
            this.txtComentario.Text = "";
            this.txtCorreo.Text = "";
        }
        private void enviarMail(Comentario temp)
        {
            try
            {
                //Se instancia un objeto email
                Email email = new Email();
                //Se envia el objeto cliente y se construlle la URL de la foto 
                email.enviarCorreo(temp, Server.MapPath(".") + @"\www\css\img\Mobile_Tool_Store.jpg");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}