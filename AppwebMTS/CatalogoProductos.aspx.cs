using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppwebMTS
{
    public partial class CatalogoProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCatologoMoviles_Click(object sender, EventArgs e)
        {
            Session["controlCatalogo"] = "Móvil";
            Response.Redirect("VistaCatalogoProductos.aspx");
        }
        protected void btnComputadoras_Click(object sender, EventArgs e)
        {
            Session["controlCatalogo"] = "Laptop";
            Response.Redirect("VistaCatalogoProductos.aspx");
        }
        protected void btnComponentes_Click(object sender, EventArgs e)
        {
            Session["controlCatalogo"] = "Componentes";
            Response.Redirect("VistaCatalogoProductos.aspx");
        }
        protected void btnTablet_Click(object sender, EventArgs e)
        {
            Session["controlCatalogo"] = "Tablet";
            Response.Redirect("VistaCatalogoProductos.aspx");
        }
    }
}