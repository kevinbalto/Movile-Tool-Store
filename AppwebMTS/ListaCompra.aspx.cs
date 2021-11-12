using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppwebMTS
{
    public partial class ListaCompra : System.Web.UI.Page
    {
        public List<Carrito> lista;
        private DataTable listaCompra;
        private decimal total;
        public int cantidad;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void dtsListaCompra_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                this.generarListaCompra();
                this.BindData();
                int row = Convert.ToInt32(dtsListaCompra.DataKeys[e.RowIndex].Value.ToString());
                this.total = this.total - (this.lista[row].precio * this.lista[row].cantidad);
                this.lblTotal.Text = total + "";
                this.listaCompra.Rows.RemoveAt(row);
                this.dtsListaCompra.DataSource = this.listaCompra;
                this.lista.RemoveAt(row);
                if (this.lista.Count != 0)
                {
                    Session["Lista"] = this.lista;
                }
                else 
                {
                    Session["Lista"] = null;
                }
                this.generarListaCompra();
                this.BindData();
            }
            catch (Exception ex)
            {

                throw ex;
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
            this.total = 0;

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
                    row["precio"] = "₡" + lista[i].precio;
                    row["subtotal"] = "₡" + lista[i].precio * lista[i].cantidad;

                    this.total += lista[i].precio * lista[i].cantidad;
                    this.lblTotal.Text = total + "";
                    this.listaCompra.Rows.Add(row);  
                }
            }
        }
        private void BindData()
        {
            this.dtsListaCompra.DataSource = this.listaCompra;
            this.dtsListaCompra.DataBind();
        }
        protected void dtsListaCompra_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.dtsListaCompra.EditIndex = e.NewEditIndex;
            this.generarListaCompra();
            this.BindData();
        }
        protected void dtsListaCompra_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.dtsListaCompra.EditIndex = -1;
            this.generarListaCompra();
            this.BindData();
        }
        protected void dtsListaCompra_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = this.dtsListaCompra.Rows[e.RowIndex];
                this.generarListaCompra();
                this.BindData();
                int posicion = Convert.ToInt32(dtsListaCompra.DataKeys[e.RowIndex].Value.ToString());
                this.lista[posicion].cantidad = Int32.Parse((row.Cells[2].Controls[0] as TextBox).Text);
                if (this.lista[posicion].cantidad > 0)
                {
                    this.dtsListaCompra.EditIndex = -1;
                    this.generarListaCompra();
                    this.BindData();
                }
                else {
                    this.mensaje("La cantidad solicitada debe ser mayor a 0.");
                }
            }
            catch (Exception ex)
            {

                this.mensaje("Valor de la cantidad no reconocido.");
            }
        }
        protected void dtsListaCompra_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.dtsListaCompra.PageIndex = e.NewPageIndex;
            this.generarListaCompra();
            this.BindData();
        }
        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Lista"] != null)
                    Response.Redirect("Factura.aspx");
                else
                    this.mensaje("El carrito de compras se encuentra vacio.");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Session["Lista"] = null;
                Response.Redirect("CatalogoProductos.aspx");
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
        protected void btnGenerarCarrito_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Lista"] != null)
                {
                    this.generarListaCompra();
                    this.BindData();
                    this.btnContinuar.Visible = true;
                    this.btnCancelar.Visible = true;
                    this.btnGenerarCarrito.Visible = false;
                }
                else 
                {
                    this.mensaje("La lista de compras se encuentra vacia.");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}