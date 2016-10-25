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

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataView dview = (DataView)(sdsUserInformation.Select(DataSourceSelectArguments.Empty));

        foreach(DataRow drow in dview.Table.Rows)
        {
            if (txtPassword.Text == drow["vcPassword"].ToString())
            {
                Session["UserID"] = drow["pkUserID"];
                Response.Redirect("Landing.aspx");
            }
        }

        txtUsername.Focus();
    }
}