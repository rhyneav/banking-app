using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_mstSecure : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // If there is no session id, redirect to the login page
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
