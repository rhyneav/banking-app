using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ManageLoans : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grdvCustomerLoanList_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoanCalculator.clsLoanCalculator Loan = new LoanCalculator.clsLoanCalculator();

        Loan.Principal = double.Parse(grdvCustomerLoanList.SelectedRow.Cells[2].Text.ToString());
        Loan.APR = double.Parse(grdvCustomerLoanList.SelectedRow.Cells[3].Text.ToString());
        Loan.NumberOfMonths = int.Parse(grdvCustomerLoanList.SelectedRow.Cells[4].Text.ToString());

        lblPayment.Text = Loan.MonthlyPayment.ToString();

        grdvAmoritizationSchedule.DataSource = Loan.Schedule;
        grdvAmoritizationSchedule.DataBind();
    }
}