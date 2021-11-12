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
    public partial class Proveedores : System.Web.UI.Page
    {
        private Proveedor proveedor;
        private MobileToolStoreEntities entities;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.estadoInicial();
            }
            this.entities = new MobileToolStoreEntities();
        }
        public void registroProveedor(Proveedor proveedor)
        {
            try
            {
                TblProveedores tblProveedores = new TblProveedores();

                tblProveedores.cedulaLegalProveedor = proveedor.cedulaLegal;
                tblProveedores.nombreProveedor = proveedor.nombreProveedor;
                tblProveedores.correoElectronico = this.proveedor.correoElectronico;
                tblProveedores.telefono = this.proveedor.telefono;
                tblProveedores.direccion = this.proveedor.direccion;
                tblProveedores.contacto = this.proveedor.contacto;

                this.entities.TblProveedores.Add(tblProveedores);
                this.entities.SaveChanges();
                this.mensaje("Proveedor guardado correctamente.");
            }
            catch (Exception ex)
            {
                this.mensaje("Proveedor guardado correctamente.");

            }

        }
        private void consultar(string pCedulaLegal)
        {
            try
            {
                TblProveedores tblProveedores = this.entities.TblProveedores.FirstOrDefault(u => u.cedulaLegalProveedor == pCedulaLegal);
                if (tblProveedores != null)
                {
                    this.mensaje("Se ha encontrado una coincidencia dentro del sistema.");
                    this.txtCedulaLegal.Text = tblProveedores.cedulaLegalProveedor;
                    this.txtNombre.Text = tblProveedores.nombreProveedor;
                    this.TxtCorreo.Text = tblProveedores.correoElectronico.ToString();
                    this.txtTelefono.Text = tblProveedores.telefono.ToString();
                    this.txtDireccion.Text = tblProveedores.direccion.ToString();
                    this.txtContacto.Text = tblProveedores.contacto.ToString();
                    
                    this.estadoModEli();
                }

            }
            catch (Exception ex)
            {
                this.mensaje("Hubo un error.");
            }
        }
        public void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
        protected void btnRegistrarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                this.proveedor = new Proveedor();

                this.proveedor.cedulaLegal = this.txtCedulaLegal.Text.Trim();
                this.proveedor.nombreProveedor = this.txtNombre.Text.Trim();
                this.proveedor.correoElectronico = this.TxtCorreo.Text.Trim();
                this.proveedor.telefono = this.txtTelefono.Text.Trim();
                this.proveedor.direccion = this.txtDireccion.Text.Trim();
                this.proveedor.contacto = this.txtContacto.Text.Trim();

                this.registroProveedor(proveedor);
                this.estadoInicial();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void estadoInicial()
        {
            this.txtCedulaLegal.Text = "";
            this.txtNombre.Text = "";
            this.TxtCorreo.Text = "";
            this.txtTelefono.Text = "";
            this.txtDireccion.Text = "";
            this.txtContacto.Text = ""; 
            this.txtCedulaLegal.Enabled = true;
            this.btnRegistrarProveedor.Enabled = true;
            this.btnEliminarProveedor.Enabled = false;
            this.btnModificarProveedor.Enabled = false;
        }
        private void estadoModEli()
        {
            this.txtCedulaLegal.Enabled = false;
            this.btnRegistrarProveedor.Enabled = false;
            this.btnEliminarProveedor.Enabled = true;
            this.btnModificarProveedor.Enabled = true;
        } 
        protected void btnModificarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                this.proveedor = new Proveedor();

                this.proveedor.cedulaLegal = this.txtCedulaLegal.Text.Trim();
                this.proveedor.nombreProveedor = this.txtNombre.Text.Trim();
                this.proveedor.correoElectronico = this.TxtCorreo.Text.Trim();
                this.proveedor.telefono = this.txtTelefono.Text.Trim();
                this.proveedor.direccion = this.txtDireccion.Text.Trim();
                this.proveedor.contacto = this.txtContacto.Text.Trim();

                this.modificarProveedor(proveedor);
                this.estadoInicial();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btnEliminarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                this.proveedor = new Proveedor();

                this.proveedor.cedulaLegal = this.txtCedulaLegal.Text.Trim();

                this.eliminar(proveedor.cedulaLegal);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void txtCedulaLegal_TextChanged(object sender, EventArgs e)
        {
            try
            {
                this.consultar(this.txtCedulaLegal.Text.Trim());
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void modificarProveedor(Proveedor proveedor)
        {
            try
            {
                TblProveedores tblProveedores = this.entities.TblProveedores.FirstOrDefault(c => (c.cedulaLegalProveedor.Equals(proveedor.cedulaLegal)));

                if (tblProveedores != null)
                {
                    tblProveedores.cedulaLegalProveedor = proveedor.cedulaLegal;
                    tblProveedores.nombreProveedor = proveedor.nombreProveedor;
                    tblProveedores.correoElectronico = this.proveedor.correoElectronico;
                    tblProveedores.telefono = this.proveedor.telefono;
                    tblProveedores.direccion = this.proveedor.direccion;
                    tblProveedores.contacto = this.proveedor.contacto;

                    this.entities.SaveChanges();
                    this.mensaje("Datos modificados correctamente.");
                }
            }
            catch (Exception ex)
            {

                this.mensaje("Este proveedor ya existe.");
            }
        }
        private void eliminar(string pCedulaLegal)
        {
            try
            {
                TblProveedores tblProveedores = this.entities.TblProveedores.FirstOrDefault(c => (c.cedulaLegalProveedor.Equals(proveedor.cedulaLegal)));
            
                this.entities.TblProveedores.Remove(tblProveedores);

                this.entities.SaveChanges();
                this.estadoInicial();
                this.mensaje("Datos eliminados correctamente");
            }
            catch (Exception ex)
            {
                this.mensaje("Hubo un error.");
            }
        }
    }
}