<%@ Page Title="Manage Loans" Language="C#" MasterPageFile="~/MasterPages/mstSecure.master" AutoEventWireup="true" CodeFile="ManageLoans.aspx.cs" Inherits="Pages_ManageLoans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-3">
                    Customer Search<br />
                    <asp:TextBox ID="txtCustomerSearch" class="searcher" runat="server"></asp:TextBox>
                    <br />
                    <asp:LinkButton ID="lnkbCustomerSearch" runat="server" CssClass="btn btn-info search">Search</asp:LinkButton>
                </div>
                <div class="col-md-4">
                    Customers
                    <asp:GridView ID="grdvCustomerList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkCustomerID" DataSourceID="sdsCustomerList" OnSelectedIndexChanged="grdvCustomerList_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="pkCustomerID" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="pkCustomerID" />
                            <asp:BoundField DataField="vcName" HeaderText="Name" SortExpression="vcName" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="VlaservichspGetCustomerList" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtCustomerSearch" Name="vcName" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-md-5">
                    Loans
                    <asp:GridView ID="grdvCustomerLoanList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkLoanID" DataSourceID="sdsCustomerLoanList" OnSelectedIndexChanged="grdvCustomerLoanList_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="pkLoanID" HeaderText="pkLoanID" InsertVisible="False" ReadOnly="True" SortExpression="pkLoanID" Visible="False" />
                            <asp:BoundField DataField="decPrincipal" HeaderText="Principal" SortExpression="decPrincipal" DataFormatString="{0:c}" />
                            <asp:BoundField DataField="decInterestRate" HeaderText="Interest Rate" SortExpression="decInterestRate" />
                            <asp:BoundField DataField="intMonths" HeaderText="Months" SortExpression="intMonths" />
                            <asp:BoundField DataField="dtCreated" HeaderText="Origination Date" SortExpression="dtCreated" DataFormatString="{0:d}" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsCustomerLoanList" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="SELECT [pkLoanID], [decPrincipal], [decInterestRate], [intMonths], [dtCreated] FROM [VlaservichtblLoan] WHERE ([fkCustomerID] = @fkCustomerID) ORDER BY [dtCreated]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="grdvCustomerList" Name="fkCustomerID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:FormView ID="frmvCustomerLoanEdit" runat="server" DataKeyNames="pkLoanID" DataSourceID="sdsCustomerLoanEdit" Visible="False">
                        <EditItemTemplate>
                            Loan ID:
                        <asp:Label ID="pkLoanIDLabel1" runat="server" Text='<%# Eval("pkLoanID") %>' />
                            <br />
                            Principal:
                        <asp:TextBox ID="decPrincipalTextBox" runat="server" Text='<%# Bind("decPrincipal") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="decPrincipalTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter a Principal" SetFocusOnError="True" ValidationGroup="Update"></asp:RequiredFieldValidator>
                            <br />
                            Customer ID:
                        <asp:TextBox ID="fkCustomerIDTextBox" runat="server" Text='<%# Bind("fkCustomerID") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fkCustomerIDTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter an ID" SetFocusOnError="True" ValidationGroup="Update"></asp:RequiredFieldValidator>
                            <br />
                            Interest Rate:
                        <asp:TextBox ID="decInterestRateTextBox" runat="server" Text='<%# Bind("decInterestRate") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="decInterestRateTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter an Interest Rate" SetFocusOnError="True" ValidationGroup="Update"></asp:RequiredFieldValidator>
                            <br />
                            Months:
                        <asp:TextBox ID="intMonthsTextBox" runat="server" Text='<%# Bind("intMonths") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="intMonthsTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter Total Months" SetFocusOnError="True" ValidationGroup="Update"></asp:RequiredFieldValidator>
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <asp:LinkButton ID="NewButton" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            Principal:
                        <asp:TextBox ID="decPrincipalTextBox" runat="server" Text='<%# Bind("decPrincipal") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="decPrincipalTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter a Principal" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            <br />
                            Customer ID:
                        <asp:TextBox ID="fkCustomerIDTextBox" runat="server" Text='<%# Bind("fkCustomerID") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fkCustomerIDTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter an ID" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            <br />
                            Interest Rate:
                        <asp:TextBox ID="decInterestRateTextBox" runat="server" Text='<%# Bind("decInterestRate") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="decInterestRateTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter an Interest Rate" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            <br />
                            Months:
                        <asp:TextBox ID="intMonthsTextBox" runat="server" Text='<%# Bind("intMonths") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="intMonthsTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter Total Months" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            Loan ID:
                        <asp:Label ID="pkLoanIDLabel" runat="server" Text='<%# Eval("pkLoanID") %>' />
                            <br />
                            Principal:
                        <asp:Label ID="decPrincipalLabel" runat="server" Text='<%# Bind("decPrincipal") %>' />
                            <br />
                            Customer ID:
                        <asp:Label ID="fkCustomerIDLabel" runat="server" Text='<%# Bind("fkCustomerID") %>' />
                            <br />
                            Interest Rate:
                        <asp:Label ID="decInterestRateLabel" runat="server" Text='<%# Bind("decInterestRate") %>' />
                            <br />
                            Months:
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
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Monthly Payment<br />
                    <div class="payments">
                        <asp:Label ID="lblPayment" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <br />
                <br />
            <div class="col-md-9">
                Payment Details
                <asp:GridView ID="grdvAmoritizationSchedule" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                        <asp:BoundField DataField="Principal" HeaderText="Beginning Amount" SortExpression="Principal" DataFormatString="{0:c}" />
                        <asp:BoundField DataField="InterestPaid" DataFormatString="{0:c}" HeaderText="Interest Paid" SortExpression="InterestPaid" />
                        <asp:BoundField DataField="PrincipalPaid" DataFormatString="{0:c}" HeaderText="Principal Paid" SortExpression="PrincipalPaid" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

