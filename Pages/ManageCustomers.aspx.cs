using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ManageCustomers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void frmvCustomerEdit_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        // Get new data to update table on submit
        sdsCustomerList.DataBind();
        grdvCustomerList.DataBind();
    }
}