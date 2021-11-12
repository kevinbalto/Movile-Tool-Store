using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppwebMTS
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void status_LoggedOut(object sender, EventArgs e)
        {
            Session["Rol"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}