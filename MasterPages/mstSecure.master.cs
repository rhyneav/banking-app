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
        if (Session["UserID"] == null)
        {
            // Get current page file name
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            
            // if the current page isn't login, redirect to the login page. This prevents endless feedback loop.
            if (currentPage != "Login.aspx")
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
}
