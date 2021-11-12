using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace AppwebMTS
{
    public partial class Marcas : System.Web.UI.Page
    {
        private Marca marca;
        private MobileToolStoreEntities entities;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.entities = new MobileToolStoreEntities();
            if (!IsPostBack)
            {
                this.estadoInicial();
            } 
        }
        protected void btnRegistrarMarca_Click(object sender, EventArgs e)
        {
            try
            {
                this.marca = new Marca();

                this.marca.nombreMarca = this.txtNombreMarca.Text.Trim();
                this.marca.codigoMarca = this.txtCodigoMarca.Text.Trim();
                this.marca.paisOrigen = this.txtPaisOrigen.Text.Trim();
                this.marca.correoElectronico = this.txtCorreoMarca.Text.Trim();
                this.marca.contacto = this.txtContactoMarca.Text.Trim();
                this.marca.telefono = this.txtTelefonoMarca.Text.Trim();

                this.registrarMarca(marca);
                this.mensaje("Marca guardada correctamente.");

                this.estadoInicial();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public void registrarMarca(Marca marca)
        {
            try
            {
                TblMarcas tblMarcas = new TblMarcas();

                tblMarcas.codigoMarca = marca.codigoMarca;
                tblMarcas.nombreMarca = marca.nombreMarca;
                tblMarcas.paisOrigen = marca.paisOrigen;
                tblMarcas.correoElectronico = marca.correoElectronico;
                tblMarcas.contacto = marca.contacto;
                tblMarcas.telefono = marca.telefono;

                this.entities.TblMarcas.Add(tblMarcas);
                this.entities.SaveChanges();

            }
            catch (Exception)
            {

                this.mensaje("Datos guardados correctamente.");
            }
        }
        public void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
        private void estadoInicial()
        {
            this.txtCodigoMarca.Text = "";
            this.txtNombreMarca.Text = "";
            this.txtPaisOrigen.Text = "";
            this.txtCorreoMarca.Text = "";
            this.txtContactoMarca.Text = "";
            this.txtTelefonoMarca.Text = "";
            this.txtCodigoMarca.Enabled = true;
            this.btnRegistrarMarca.Enabled = true;
            this.btnEliminarMarca.Enabled = false;
            this.btnModificarMarca.Enabled = false;
        }
        protected void txtCodigoMarca_TextChanged(object sender, EventArgs e)
        {
            try
            {
                this.consultarMarca(this.txtCodigoMarca.Text.Trim());
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private void consultarMarca(string pCodigoMarca)
        {
            try
            {
                TblMarcas tblMarcas = this.entities.TblMarcas.FirstOrDefault(u => u.codigoMarca == pCodigoMarca);

                if (tblMarcas != null)
                {
                    this.mensaje("Se ha encontrado una coincidencia dentro del sistema.");
                    this.txtNombreMarca.Text = tblMarcas.nombreMarca;
                    this.txtCodigoMarca.Text = tblMarcas.codigoMarca;
                    this.txtPaisOrigen.Text = tblMarcas.paisOrigen.ToString();
                    this.txtCorreoMarca.Text = tblMarcas.correoElectronico.ToString();
                    this.txtContactoMarca.Text = tblMarcas.contacto.ToString();
                    this.txtTelefonoMarca.Text = tblMarcas.telefono.ToString();

                    this.estadoModEli();
                }

            }
            catch (Exception ex)
            {
                this.mensaje("Hubo un error.");
            }
        }
        public void modificarMarca(Marca marca)
        {
            try
            {
                TblMarcas tblMarcas = this.entities.TblMarcas.FirstOrDefault(c => (c.codigoMarca.Equals(marca.codigoMarca)));

                if (tblMarcas != null)
                {
                    tblMarcas.codigoMarca = marca.codigoMarca;
                    tblMarcas.nombreMarca = marca.nombreMarca;
                    tblMarcas.paisOrigen = marca.paisOrigen;
                    tblMarcas.correoElectronico = marca.correoElectronico;
                    tblMarcas.contacto = marca.contacto;
                    tblMarcas.telefono = marca.telefono;

                    this.entities.SaveChanges();
                    this.mensaje("Datos modificados correctamente.");
                }
            }
            catch (Exception ex)
            {

                this.mensaje("Hubo un error.");
            }
        }
        private void estadoModEli()
        {
            this.txtCodigoMarca.Enabled = false;
            this.btnRegistrarMarca.Enabled = false;
            this.btnEliminarMarca.Enabled = true;
            this.btnModificarMarca.Enabled = true;
        }
        protected void btnBuscarMacar_Click(object sender, EventArgs e)
        {

        }
        protected void btnModificarMarca_Click(object sender, EventArgs e)
        {
            try
            {
                this.marca = new Marca();

                this.marca.nombreMarca = this.txtNombreMarca.Text.Trim();
                this.marca.codigoMarca = this.txtCodigoMarca.Text.Trim();
                this.marca.paisOrigen = this.txtPaisOrigen.Text.Trim();
                this.marca.correoElectronico = this.txtCorreoMarca.Text.Trim();
                this.marca.contacto = this.txtContactoMarca.Text.Trim();
                this.marca.telefono = this.txtTelefonoMarca.Text.Trim();

                this.modificarMarca(marca);

                this.estadoInicial();
            }
            catch (Exception ex)
            {

                this.mensaje("Hubo un error al modificar el producto.");
            }
        }
        private void eliminarMarca(string pCodigoMarca)
        {
            try
            {
                TblMarcas tblMarcas = this.entities.TblMarcas.FirstOrDefault(c => (c.codigoMarca.Equals(marca.codigoMarca)));

                this.entities.TblMarcas.Remove(tblMarcas);

                this.entities.SaveChanges();
                this.estadoInicial();
                this.mensaje("Datos eliminados correctamente");
            }
            catch (Exception ex)
            {
                this.mensaje("Hubo un error.");
            }
        }
        protected void btnEliminarMarca_Click(object sender, EventArgs e)
        {
            try
            {
                this.marca = new Marca();

                this.marca.codigoMarca = this.txtCodigoMarca.Text.Trim();

                this.eliminarMarca(this.marca.codigoMarca);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}