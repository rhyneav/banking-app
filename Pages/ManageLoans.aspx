<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mstSecure.master" AutoEventWireup="true" CodeFile="ManageLoans.aspx.cs" Inherits="Pages_ManageLoans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="txtCustomerSearch" runat="server"></asp:TextBox>
            <br />
            <asp:LinkButton ID="lnkbCustomerSearch" runat="server">Search</asp:LinkButton>
            <asp:GridView ID="grdvCustomerList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkCustomerID" DataSourceID="sdsCustomerList" OnSelectedIndexChanged="grdvCustomerList_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="pkCustomerID" HeaderText="pkCustomerID" InsertVisible="False" ReadOnly="True" SortExpression="pkCustomerID" />
                    <asp:BoundField DataField="vcName" HeaderText="vcName" SortExpression="vcName" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="VlaservichspGetCustomerList" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCustomerSearch" Name="vcName" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="grdvCustomerLoanList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkLoanID" DataSourceID="sdsCustomerLoanList" OnSelectedIndexChanged="grdvCustomerLoanList_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="pkLoanID" HeaderText="pkLoanID" InsertVisible="False" ReadOnly="True" SortExpression="pkLoanID" Visible="False" />
                    <asp:BoundField DataField="decPrincipal" HeaderText="Principal" SortExpression="decPrincipal" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="decInterestRate" HeaderText="InterestRate" SortExpression="decInterestRate" />
                    <asp:BoundField DataField="intMonths" HeaderText="Months" SortExpression="intMonths" />
                    <asp:BoundField DataField="dtCreated" HeaderText="Origination Date" SortExpression="dtCreated" DataFormatString="{0:d}" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsCustomerLoanList" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="SELECT [pkLoanID], [decPrincipal], [decInterestRate], [intMonths], [dtCreated] FROM [VlaservichtblLoan] WHERE ([fkCustomerID] = @fkCustomerID) ORDER BY [dtCreated]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdvCustomerList" Name="fkCustomerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="frmvCustomerLoanEdit" runat="server" DataKeyNames="pkLoanID" DataSourceID="sdsCustomerLoanEdit" Visible="False">
                <EditItemTemplate>
                    pkLoanID:
                    <asp:Label ID="pkLoanIDLabel1" runat="server" Text='<%# Eval("pkLoanID") %>' />
                    <br />
                    decPrincipal:
                    <asp:TextBox ID="decPrincipalTextBox" runat="server" Text='<%# Bind("decPrincipal") %>' />
                    <br />
                    fkCustomerID:
                    <asp:TextBox ID="fkCustomerIDTextBox" runat="server" Text='<%# Bind("fkCustomerID") %>' />
                    <br />
                    decInterestRate:
                    <asp:TextBox ID="decInterestRateTextBox" runat="server" Text='<%# Bind("decInterestRate") %>' />
                    <br />
                    intMonths:
                    <asp:TextBox ID="intMonthsTextBox" runat="server" Text='<%# Bind("intMonths") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    decPrincipal:
                    <asp:TextBox ID="decPrincipalTextBox" runat="server" Text='<%# Bind("decPrincipal") %>' />
                    <br />
                    fkCustomerID:
                    <asp:TextBox ID="fkCustomerIDTextBox" runat="server" Text='<%# Bind("fkCustomerID") %>' />
                    <br />
                    decInterestRate:
                    <asp:TextBox ID="decInterestRateTextBox" runat="server" Text='<%# Bind("decInterestRate") %>' />
                    <br />
                    intMonths:
                    <asp:TextBox ID="intMonthsTextBox" runat="server" Text='<%# Bind("intMonths") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    pkLoanID:
                    <asp:Label ID="pkLoanIDLabel" runat="server" Text='<%# Eval("pkLoanID") %>' />
                    <br />
                    decPrincipal:
                    <asp:Label ID="decPrincipalLabel" runat="server" Text='<%# Bind("decPrincipal") %>' />
                    <br />
                    fkCustomerID:
                    <asp:Label ID="fkCustomerIDLabel" runat="server" Text='<%# Bind("fkCustomerID") %>' />
                    <br />
                    decInterestRate:
                    <asp:Label ID="decInterestRateLabel" runat="server" Text='<%# Bind("decInterestRate") %>' />
                    <br />
                    intMonths:
                    <asp:Label ID="intMonthsLabel" runat="server" Text='<%# Bind("intMonths") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="sdsCustomerLoanEdit" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" DeleteCommand="DELETE FROM [VlaservichtblLoan] WHERE [pkLoanID] = @pkLoanID" InsertCommand="INSERT INTO [VlaservichtblLoan] ([decPrincipal], [fkCustomerID], [decInterestRate], [intMonths]) VALUES (@decPrincipal, @fkCustomerID, @decInterestRate, @intMonths)" SelectCommand="SELECT [pkLoanID], [decPrincipal], [fkCustomerID], [decInterestRate], [intMonths] FROM [VlaservichtblLoan] WHERE ([pkLoanID] = @pkLoanID)" UpdateCommand="UPDATE [VlaservichtblLoan] SET [decPrincipal] = @decPrincipal, [decInterestRate] = @decInterestRate, [intMonths] = @intMonths WHERE [pkLoanID] = @pkLoanID">
                <DeleteParameters>
                    <asp:Parameter Name="pkLoanID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="grdvCustomerList" Name="decPrincipal" PropertyName="SelectedValue" Type="Decimal" />
                    <asp:Parameter Name="fkCustomerID" Type="Int32" />
                    <asp:Parameter Name="decInterestRate" Type="Decimal" />
                    <asp:Parameter Name="intMonths" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdvCustomerLoanList" Name="pkLoanID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="decPrincipal" Type="Decimal" />
                    <asp:Parameter Name="decInterestRate" Type="Decimal" />
                    <asp:Parameter Name="intMonths" Type="Int32" />
                    <asp:Parameter Name="pkLoanID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblPayment" runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="grdvAmoritizationSchedule" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="Principal" HeaderText="Beginning Amount" SortExpression="Principal" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="InterestPaid" DataFormatString="{0:c}" HeaderText="Interest Paid" SortExpression="InterestPaid" />
                    <asp:BoundField DataField="PrincipalPaid" DataFormatString="{0:c}" HeaderText="Principal Paid" SortExpression="PrincipalPaid" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

