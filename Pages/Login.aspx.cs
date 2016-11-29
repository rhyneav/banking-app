using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Redirect away from login page if user is already logged in
        if (Session["UserID"] != null)
        {
            Response.Redirect("Landing.aspx");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            DataView dview = (DataView)(sdsUserInformation.Select(DataSourceSelectArguments.Empty));

            foreach (DataRow drow in dview.Table.Rows)
            {
                if (txtPassword.Text == drow["vcPassword"].ToString())
                {
                    Session["UserID"] = drow["pkUserID"];
                    Response.Redirect("Landing.aspx");
                }
            }
        }
        catch (Exception)
        {
            // it did not work, give a message
        }

        txtUsername.Focus();
    }
}