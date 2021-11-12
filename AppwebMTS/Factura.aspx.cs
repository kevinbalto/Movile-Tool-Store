using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
namespace AppwebMTS
{
    public partial class Factura : System.Web.UI.Page
    {
        private DateTime fechaActual;
        public List<Carrito> lista;
        private DataTable listaCompra;
        private decimal total;
        public int cantidad;
        private string cliente;
        private Facturas factura;
        private DetalleFactura detalle;
        private ProductosMasvendido productosMasvendido;
        private MobileToolStoreEntities entities;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            this.entities = new MobileToolStoreEntities();
            this.cliente = (string)Session["usuarioActual"];
            this.consultarCliente(this.cliente);
            this.fechaActual = DateTime.Now;
            this.lblFecha.Text = fechaActual.ToString();
            if (!IsPostBack)
            {
                this.generarListaCompra();
                this.BindData();
            }
        }
        private void BindData()
        {
            this.dtsListaCompra.DataSource = this.listaCompra;
            this.dtsListaCompra.DataBind();
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
                Session.Remove("lista");
                Response.Redirect("CompraCancelada.aspx");
        }
        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (verificarEspacios())
                {
                    this.factura = new Facturas();
                    this.factura.codigoFactura = this.generarCodFactura();
                    this.factura.nombreCliente = txtNombre.Text.Trim();
                    this.factura.fechaFacturacion = DateTime.Parse(this.lblFecha.Text.Trim());
                    this.factura.totalPagar = Decimal.Parse(this.lblTotal.Text.Trim());
                    this.factura.fechaCaducidad = DateTime.Parse(this.lblFecha.Text.Trim());
                    this.factura.numeroTarjeta = txtNumeroTarjeta.Text.Trim();
                    this.factura.codigoSeguridad = txtCodigoSeguridad.Text.Trim();

                    var opciones = new TransactionOptions();
                    opciones.IsolationLevel = System.Transactions.IsolationLevel.Serializable;
                    using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Required, opciones))
                    {
                        this.registrarFactura(factura);
                        this.generarDetalle();
                        entities.SaveChanges();
                        scope.Complete();
                    }

                    Session.Remove("lista");
                    Response.Redirect("CompraFinalizada.aspx");
                }
            }
            catch (Exception ex)
            {
                
                this.mensaje("Hubo un error al generar la factura.");
            }
        }
        public void generarListaCompra()
        {
            this.listaCompra = new DataTable();

            this.listaCompra.Columns.Add(new DataColumn("id", typeof(string)));
            this.listaCompra.Columns.Add(new DataColumn("codigoBarra", typeof(string)));
            this.listaCompra.Columns.Add(new DataColumn("nombre", typeof(string)));
            this.listaCompra.Columns.Add(new DataColumn("cantidad", typeof(string)));
            this.listaCompra.Columns.Add(new DataColumn("precio", typeof(string)));
            this.listaCompra.Columns.Add(new DataColumn("subtotal", typeof(string)));

            this.lista = (List<Carrito>)Session["Lista"];

            if (this.lista != null)
            {
                for (int i = 0; i < lista.Count; i++)
                {
                    DataRow row = listaCompra.NewRow();

                    row["id"] = i;
                    row["codigoBarra"] = lista[i].codigoBarra;
                    row["nombre"] = lista[i].nombre;
                    row["cantidad"] = lista[i].cantidad;
                    //this.cantidad = lista[i].cantidad;
                    row["precio"] = lista[i].precio;
                    row["subtotal"] = lista[i].precio * lista[i].cantidad;

                    this.total += lista[i].precio * lista[i].cantidad;
                    this.lblTotal.Text = total + "";
                    this.listaCompra.Rows.Add(row);
                }
            }
        }
        public void consultarCliente(string email)
        {
            try
            {
                TblUsuarios tblUsuarios = this.entities.TblUsuarios.FirstOrDefault(u => u.correoElectronico == email);
                if (tblUsuarios != null)
                {
                    txtNombre.Text = tblUsuarios.nombre.ToString();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public int generarCodFactura()
        {
            SqlConnection connection = new SqlConnection("data source=LAPTOP-2MLDA4Q8\\SQLEXPRESS;initial catalog=MobileToolStore;user id=MTSUser;password=ucr2020;MultipleActiveResultSets=True;App=EntityFramework");
            connection.Open();
            SqlCommand command = new SqlCommand("select count(*) from TblFacturas", connection);
            SqlDataReader lector = command.ExecuteReader();
            int id = 0;
            if (lector.Read())
            {
                int consulta = int.Parse(lector[0] + "");
                id = consulta;
            }
            connection.Close();
            connection.Dispose();
            command.Dispose();
            lector.Dispose();
            return id + 1;
        }
        public void registrarFactura(Facturas facturas)
        {
            try
            {
                TblFacturas tblFacturas = new TblFacturas();

                tblFacturas.codigoFactura = facturas.codigoFactura;
                tblFacturas.nombreCliente = facturas.nombreCliente;
                tblFacturas.fechaFacturacion = facturas.fechaFacturacion;
                tblFacturas.totalPagar = facturas.totalPagar;
                tblFacturas.fechaCaducidad = facturas.fechaCaducidad;
                tblFacturas.codigoSeguridad = facturas.codigoSeguridad;
                tblFacturas.numeroTarjeta = facturas.numeroTarjeta;

                this.entities.TblFacturas.Add(tblFacturas);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void registrarDetalleFactura(DetalleFactura detalle)
        {
            try
            {
                TblDetalleFactura tblDetalleFactura = new TblDetalleFactura();

                tblDetalleFactura.codigoFactura = detalle.codigoFactura;
                tblDetalleFactura.codigoBarras = detalle.codigoBarras;
                tblDetalleFactura.nombreProducto = detalle.nombreProducto;
                tblDetalleFactura.cantidad = detalle.cantidad;
                tblDetalleFactura.precio = detalle.precio;
                tblDetalleFactura.subtotal = detalle.subTotal;

                this.entities.TblDetalleFactura.Add(tblDetalleFactura);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void generarDetalle()
        {
            try
            {
                foreach (GridViewRow gr in dtsListaCompra.Rows)
                {
                    this.detalle = new DetalleFactura();

                    this.detalle.codigoFactura = this.factura.codigoFactura;
                    this.detalle.codigoBarras = gr.Cells[0].Text;
                    this.detalle.nombreProducto = gr.Cells[1].Text;
                    this.detalle.cantidad = Int32.Parse(gr.Cells[2].Text);
                    this.detalle.precio = decimal.Parse(gr.Cells[3].Text);
                    this.detalle.subTotal = decimal.Parse(gr.Cells[4].Text);

                    this.registrarDetalleFactura(detalle);
                    this.nuevaCantidad(gr.Cells[0].Text, Int32.Parse(gr.Cells[2].Text));

                    this.productosMasvendido = new ProductosMasvendido();
                    this.productosMasvendido.codigoBarras = gr.Cells[0].Text;
                    this.productosMasvendido.foto = traerFoto(gr.Cells[0].Text);
                    this.productosMasvendido.nombre = gr.Cells[1].Text;
                    this.registrarMasVendidos(this.productosMasvendido);

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
        public bool verificarEspacios()
        {
            bool verificacion = true;
            this.txtNumeroTarjeta.BorderColor = Color.Empty;
            this.txtCodigoSeguridad.BorderColor = Color.Empty;
            this.txtFechaCaducidad.BorderColor = Color.Empty;
            if (this.txtNumeroTarjeta.Text.Trim().Equals("") && this.txtCodigoSeguridad.Text.Trim().Equals("") && this.txtFechaCaducidad.Text.Trim().Equals(""))
            {
                this.txtNumeroTarjeta.BorderColor = Color.Red;
                this.txtCodigoSeguridad.BorderColor = Color.Red;
                this.txtFechaCaducidad.BorderColor = Color.Empty;
                verificacion = false;
            }
            else if (this.txtNumeroTarjeta.Text.Trim().Equals("") && this.txtCodigoSeguridad.Text.Trim().Equals(""))
            {
                this.txtNumeroTarjeta.BorderColor = Color.Red;
                this.txtCodigoSeguridad.BorderColor = Color.Red;
                verificacion = false;
            }
            else if (this.txtCodigoSeguridad.Text.Trim().Equals("") && this.txtFechaCaducidad.Text.Trim().Equals(""))
            {
                this.txtFechaCaducidad.BorderColor = Color.Red;
                this.txtCodigoSeguridad.BorderColor = Color.Red;
                verificacion = false;
            }
            else if (this.txtFechaCaducidad.Text.Trim().Equals("") && this.txtNumeroTarjeta.Text.Trim().Equals(""))
            {
                this.txtFechaCaducidad.BorderColor = Color.Red;
                this.txtNumeroTarjeta.BorderColor = Color.Red;
                verificacion = false;
            }
            else if (this.txtNumeroTarjeta.Text.Trim().Equals(""))
            {
                this.txtNumeroTarjeta.BorderColor = Color.Red;
                verificacion = false;
            }
            else if (this.txtCodigoSeguridad.Text.Trim().Equals(""))
            {
                this.txtCodigoSeguridad.BorderColor = Color.Red;
                verificacion = false;
            }
            else if (this.txtFechaCaducidad.Text.Trim().Equals(""))
            {
                this.txtCodigoSeguridad.BorderColor = Color.Red;
                verificacion = false;
            }
            return verificacion;
        }
        public void nuevaCantidad(string codigo, int cantidad)
        {
            int cant = 0;
            cant = traerCantidad(codigo) - cantidad;

            this.actualizarCantidad(cant, codigo);
            if (cant == 0)
            {
                this.ActualizarDisponibilidad(codigo);
            }
        }
        public int traerCantidad(string codigo)
        {
            SqlConnection connection = new SqlConnection("data source=LAPTOP-2MLDA4Q8\\SQLEXPRESS;initial catalog=MobileToolStore;user id=MTSUser;password=ucr2020;MultipleActiveResultSets=True;App=EntityFramework");
            connection.Open();
            SqlCommand command = new SqlCommand("select cantidad from TblProductos where codigoBarras='" + codigo + "'", connection);
            SqlDataReader lector = command.ExecuteReader();
            int cant = 0;
            if (lector.Read())
            {
                int consulta = int.Parse(lector[0] + "");
                cant = consulta;
            }
            connection.Close();
            connection.Dispose();
            command.Dispose();
            lector.Dispose();
            return cant;
        }
        public void actualizarCantidad(int cantidad, string codigo)
        {

            SqlConnection connection = new SqlConnection("data source=LAPTOP-2MLDA4Q8\\SQLEXPRESS;initial catalog=MobileToolStore;user id=MTSUser;password=ucr2020;MultipleActiveResultSets=True;App=EntityFramework");
            connection.Open();
            SqlCommand command = new SqlCommand("update TblProductos set cantidad= " + cantidad + " where codigoBarras='" + codigo + "'", connection);
            SqlDataReader lector = command.ExecuteReader();
            connection.Close();
            connection.Dispose();
            command.Dispose();
            lector.Dispose();
        }
        public void ActualizarDisponibilidad(string codigo)
        {
            SqlConnection connection = new SqlConnection("data source=LAPTOP-2MLDA4Q8\\SQLEXPRESS;initial catalog=MobileToolStore;user id=MTSUser;password=ucr2020;MultipleActiveResultSets=True;App=EntityFramework");
            connection.Open();
            SqlCommand command = new SqlCommand("update TblProductos set disponibilidad=0 where codigoBarras='" + codigo + "'", connection); ;
            SqlDataReader lector = command.ExecuteReader();
            connection.Close();
            connection.Dispose();
            command.Dispose();
            lector.Dispose();
        }
        public string traerFoto(string codigo)
        {
            SqlConnection connection = new SqlConnection("data source=LAPTOP-2MLDA4Q8\\SQLEXPRESS;initial catalog=MobileToolStore;user id=MTSUser;password=ucr2020;MultipleActiveResultSets=True;App=EntityFramework");
            connection.Open();
            SqlCommand command = new SqlCommand("select foto from TblProductos where codigoBarras='" + codigo + "'", connection);
            SqlDataReader lector = command.ExecuteReader();
            string foto = "";
            if (lector.Read())
            {
                string consulta = lector[0] + "";
                foto = consulta;
            }
            connection.Close();
            connection.Dispose();
            command.Dispose();
            lector.Dispose();
            return foto;
        }
        public void registrarMasVendidos(ProductosMasvendido productomasVendido)
        {
            try
            {
                TblProductosMasVendidos tblProductosMas = new TblProductosMasVendidos();

                tblProductosMas.codigoBarras = productomasVendido.codigoBarras;
                tblProductosMas.foto = productomasVendido.foto;
                tblProductosMas.nombre = productomasVendido.nombre;
                this.entities.TblProductosMasVendidos.Add(tblProductosMas);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}