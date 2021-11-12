using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
namespace AppwebMTS
{
    public partial class Productos : System.Web.UI.Page
    {
        private Producto producto;
        private ProductoMarca productoMarca;
        private ProductoProveedor productoProveedor;
        private MobileToolStoreEntities entities;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.cargarProvedores();
                this.cargarMarcas();
                this.estadoInicial();
            }
            this.entities = new MobileToolStoreEntities();
        }
        protected void btnRegistrarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                this.producto = new Producto();

                this.producto.codigoBarras = this.txtCodigoBarra.Text.Trim();
                this.producto.nombre = this.txtNombre.Text.Trim();
                this.producto.precio = Decimal.Parse(this.txtPrecio.Text.Trim());
                this.producto.tipo = this.ddlTipo.SelectedValue;
                this.producto.modelo = this.txtModelo.Text.Trim();
                this.producto.cantidad = int.Parse(this.txtCantidad.Text.Trim());
                this.producto.estado = this.ddlEstado.SelectedValue;
                this.producto.descripcion = this.txtModelo.Text.Trim();

                if (this.fileUpload.HasFile)
                {
                    this.subirFoto(this.producto.codigoBarras, this.fileUpload.PostedFile);
                    this.producto.foto = this.producto.codigoBarras + "_" + this.fileUpload.FileName;
                }

                this.productoMarca = new ProductoMarca();
                this.productoMarca.codigoBarras = this.txtCodigoBarra.Text.Trim();
                this.productoMarca.codigoMarcas = this.ddlMarca.SelectedValue;

                this.productoProveedor = new ProductoProveedor();
                this.productoProveedor.codigoBarras = this.txtCodigoBarra.Text.Trim();
                this.productoProveedor.cedulaLegarlProveedor = this.ddlProveedor.SelectedValue;

                var opciones = new TransactionOptions();
                opciones.IsolationLevel = System.Transactions.IsolationLevel.Serializable;
                using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Required, opciones))
                {
                    this.registrarProducto(producto, productoProveedor, productoMarca);
                    scope.Complete();
                }

                this.estadoInicial();
            }
            catch (Exception)
            {
                this.mensaje("Ha ocurrido un error al guardar los datos.");
            }
        }
        public void registrarProducto(Producto producto, ProductoProveedor productoProveedor, ProductoMarca productoMarca)
        {
            try
            {
                TblProductos tblProductos = new TblProductos();

                tblProductos.codigoBarras = producto.codigoBarras;
                tblProductos.nombre = producto.nombre;
                tblProductos.precio = producto.precio;
                tblProductos.tipo = producto.tipo;
                tblProductos.modelo = producto.modelo;
                tblProductos.cantidad = producto.cantidad;
                tblProductos.estado = producto.estado;
                tblProductos.descripcion = producto.descripcion;
                tblProductos.disponibilidad = "1";
                tblProductos.foto = producto.foto;

                this.entities.TblProductos.Add(tblProductos);

                TblProductoProveedor tblProductoProveedor = new TblProductoProveedor();

                tblProductoProveedor.codigoBarras = productoProveedor.codigoBarras;
                tblProductoProveedor.cedulaLegalProveedor = productoProveedor.cedulaLegarlProveedor;

                this.entities.TblProductoProveedor.Add(tblProductoProveedor);

                TblProductoMarca tblProductoMarca = new TblProductoMarca();

                tblProductoMarca.codigoBarras = productoMarca.codigoBarras;
                tblProductoMarca.codigoMarca = productoMarca.codigoMarcas;

                this.entities.TblProductoMarca.Add(tblProductoMarca);

                this.entities.SaveChanges();
                this.mensaje("Datos guardados correctamente.");
            }
            catch (Exception ex)
            {

                this.mensaje("Este producto ya existe.");
            }
        }
        private void subirFoto(string pCodBarras, HttpPostedFile archivo)
        {
            try
            {
                string ruta = Server.MapPath(".") + @"\Productos\" + pCodBarras + "_" + archivo.FileName;
                this.fileUpload.SaveAs(ruta);
            }
            catch (Exception)
            {
                this.mensaje("Ups, Hubo un error!");
            }
        }
        public void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
        private void estadoInicial()
        {
            this.txtCodigoBarra.Text = "";
            this.txtNombre.Text = "";
            this.txtPrecio.Text = "";
            this.ddlTipo.SelectedValue = "";
            this.txtModelo.Text = "";
            this.txtCantidad.Text = "1";
            this.ddlEstado.SelectedValue = "";
            this.ddlMarca.SelectedValue = "0";
            this.txtDescripcion.Text = "";
            this.ddlProveedor.SelectedValue = "0";
            this.txtCodigoBarra.Enabled = true;
            this.btnRegistrarProducto.Enabled = true;
            this.btnEliminarProducto.Enabled = false;
            this.btnModificarProducto.Enabled = false;
        }
        public DataSet conexion(string strSQL)
        {
            string strConexion = "data source=LAPTOP-2MLDA4Q8\\SQLEXPRESS;initial catalog=MobileToolStore;user id=MTSUser;password=ucr2020;MultipleActiveResultSets=True;App=EntityFramework";
            SqlConnection conexion = new SqlConnection(strConexion);
            conexion.Open();
            SqlCommand command = new SqlCommand(strSQL, conexion);
            SqlDataAdapter dataAdap = new SqlDataAdapter(command);
            DataSet dataSet = new DataSet();
            dataAdap.Fill(dataSet);
            conexion.Close();
            return dataSet;
        }
        public void cargarProvedores()
        {
            this.ddlProveedor.DataSource = conexion("select cedulaLegalProveedor,nombreProveedor from TblProveedores");
            this.ddlProveedor.DataTextField = "nombreProveedor";
            this.ddlProveedor.DataValueField = "cedulaLegalProveedor";
            this.ddlProveedor.DataBind();
            this.ddlProveedor.Items.Insert(0, new System.Web.UI.WebControls.ListItem("[Seleccionar]", "0"));
        }
        public void cargarMarcas()
        {
            this.ddlMarca.DataSource = conexion("select codigoMarca,nombreMarca from TblMarcas");
            this.ddlMarca.DataTextField = "nombreMarca";
            this.ddlMarca.DataValueField = "codigoMarca";
            this.ddlMarca.DataBind();
            this.ddlMarca.Items.Insert(0, new System.Web.UI.WebControls.ListItem("[Seleccionar]", "0"));
        }
        protected void txtCodigoBarra_TextChanged(object sender, EventArgs e)
        {
            try
            {
                this.consultar(this.txtCodigoBarra.Text.Trim());
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private void consultar(string pCodigoBarras)
        {
            try
            {
                TblProductos tblProductos = this.entities.TblProductos.FirstOrDefault(u => u.codigoBarras == pCodigoBarras & u.disponibilidad.Equals("1"));
                TblProductoProveedor tblProductoProveedor = this.entities.TblProductoProveedor.FirstOrDefault(u => u.codigoBarras == pCodigoBarras);
                TblProductoMarca tblProductoMarca = this.entities.TblProductoMarca.FirstOrDefault(u => u.codigoBarras == pCodigoBarras);

                if (tblProductos != null)
                {
                    this.mensaje("Se ha encontrado una coincidencia dentro del sistema.");
                    this.txtCodigoBarra.Text = tblProductos.codigoBarras;
                    this.txtNombre.Text = tblProductos.nombre;
                    this.txtPrecio.Text = tblProductos.precio.ToString();
                    this.ddlTipo.SelectedValue = tblProductos.tipo.ToString();
                    this.txtModelo.Text = tblProductos.modelo.ToString();
                    this.txtCantidad.Text = tblProductos.cantidad.ToString();
                    this.ddlEstado.Text = tblProductos.estado.ToString();
                    this.txtDescripcion.Text = tblProductos.descripcion.ToString();
                    this.ddlProveedor.SelectedValue = tblProductoProveedor.cedulaLegalProveedor.ToString();

                    this.ddlMarca.SelectedValue = tblProductoMarca.codigoMarca.ToString();

                    this.estadoModEli();
                }

            }
            catch (Exception ex)
            {
                this.mensaje("Hubo un error.");
            }
        }
        public void modificarProducto(Producto producto, ProductoProveedor productoProveedor, ProductoMarca productoMarca)
        {
            try
            {
                TblProductos tblProductos = this.entities.TblProductos.FirstOrDefault(c => (c.codigoBarras.Equals(producto.codigoBarras)));
                TblProductoProveedor tblProductoProveedor = this.entities.TblProductoProveedor.FirstOrDefault(c => (c.codigoBarras.Equals(producto.codigoBarras)));
                TblProductoMarca tblProductoMarca = this.entities.TblProductoMarca.FirstOrDefault(c => (c.codigoBarras.Equals(producto.codigoBarras)));

                if (tblProductos != null)
                {
                    tblProductos.codigoBarras = producto.codigoBarras;
                    tblProductos.nombre = producto.nombre;
                    tblProductos.precio = producto.precio;
                    tblProductos.tipo = producto.tipo;
                    tblProductos.modelo = producto.modelo;
                    tblProductos.cantidad = producto.cantidad;
                    tblProductos.estado = producto.estado;
                    tblProductos.descripcion = producto.descripcion;
                    tblProductos.foto = producto.foto;

                    tblProductoProveedor.codigoBarras = productoProveedor.codigoBarras;
                    tblProductoProveedor.cedulaLegalProveedor = productoProveedor.cedulaLegarlProveedor;

                    tblProductoMarca.codigoBarras = productoMarca.codigoBarras;
                    tblProductoMarca.codigoMarca = productoMarca.codigoMarcas;

                    this.entities.SaveChanges();
                    this.mensaje("Datos modificados correctamente.");
                }
            }
            catch (Exception ex)
            {

                this.mensaje("Este producto ya existe.");
            }
        }
        private void estadoModEli()
        {
            this.txtCodigoBarra.Enabled = false;
            this.btnRegistrarProducto.Enabled = false;
            this.btnEliminarProducto.Enabled = true;
            this.btnModificarProducto.Enabled = true;
        }
        protected void btnModificarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                this.producto = new Producto();

                this.producto.codigoBarras = this.txtCodigoBarra.Text.Trim();
                this.producto.nombre = this.txtNombre.Text.Trim();
                this.producto.precio = Decimal.Parse(this.txtPrecio.Text.Trim());
                this.producto.tipo = this.ddlTipo.SelectedValue;
                this.producto.modelo = this.txtModelo.Text.Trim();
                this.producto.cantidad = int.Parse(this.txtCantidad.Text.Trim());
                this.producto.estado = this.ddlEstado.SelectedValue;
                this.producto.descripcion = this.txtModelo.Text.Trim();
                if (this.fileUpload.HasFile)
                {
                    this.subirFoto(this.producto.codigoBarras, this.fileUpload.PostedFile);
                    this.producto.foto = this.producto.codigoBarras + "_" + this.fileUpload.FileName;
                }

                this.productoMarca = new ProductoMarca();
                this.productoMarca.codigoBarras = this.txtCodigoBarra.Text.Trim();
                this.productoMarca.codigoMarcas = this.ddlMarca.SelectedValue;

                this.productoProveedor = new ProductoProveedor();
                this.productoProveedor.codigoBarras = this.txtCodigoBarra.Text.Trim();
                this.productoProveedor.cedulaLegarlProveedor = this.ddlProveedor.SelectedValue;

                var opciones = new TransactionOptions();
                opciones.IsolationLevel = System.Transactions.IsolationLevel.Serializable;
                using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Required, opciones))
                {
                    this.modificarProducto(producto, productoProveedor, productoMarca);
                    scope.Complete();
                }
               
                this.estadoInicial();
            }
            catch (Exception ex)
            {

                this.mensaje("Hubo un error al modificar el producto.");
            }
        }
        private void eliminarProducto(string pCodigoBarras)
        {
            try
            {
                TblProductos tblProductos = this.entities.TblProductos.FirstOrDefault(c => (c.codigoBarras.Equals(pCodigoBarras)));

                tblProductos.disponibilidad = "0";

                this.entities.SaveChanges();
                this.estadoInicial();
                this.mensaje("Datos eliminados correctamente");
            }
            catch (Exception ex)
            {
                this.mensaje("Hubo un error.");
            }
        }
        protected void btnEliminarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                this.eliminarProducto(this.txtCodigoBarra.Text.Trim());
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}