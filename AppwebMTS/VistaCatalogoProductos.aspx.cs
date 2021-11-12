using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace AppwebMTS
{
    public partial class VistaCatalogoProductos : System.Web.UI.Page
    {
        private Carrito carrito;
        private List<Carrito> lista;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lDatos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("añadir"))
                {
                    int indiceItem = Convert.ToInt32(e.CommandArgument);

                    DataListItem item = this.lDatos.Items[indiceItem];

                    Label codigoBarras = (Label)item.FindControl("codBarra");
                    Label nombre = (Label)item.FindControl("nombre");
                    Label precio = (Label)item.FindControl("precio");

                    this.carrito = new Carrito();
                    this.carrito.codigoBarra = codigoBarras.Text;
                    this.carrito.nombre = nombre.Text;
                    this.carrito.precio = decimal.Parse(precio.Text);
                    this.carrito.cantidad = 1;

                    if (Session["Lista"] != null)
                    {
                        this.lista = (List<Carrito>)Session["Lista"];
                        int contador = 0;
                        for (int i = 0; i < this.lista.Count; i++)
                        {
                            if (this.lista[i].codigoBarra.Equals(this.carrito.codigoBarra))
                            {
                                this.mensaje("Este producto ya se encuentra en el carrito");
                                break;
                            }
                            contador++;
                        }
                        if (contador == this.lista.Count)
                        {
                            this.lista.Add(this.carrito);
                            this.mensaje("Producto agregado al carrito de compras.");
                        }
                    }
                    else
                    {
                        this.lista = new List<Carrito>();
                        this.lista.Add(this.carrito);
                        this.mensaje("Producto agregado al carrito de compras.");
                    }
                    Session["Lista"] = this.lista;                  
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
    }
}