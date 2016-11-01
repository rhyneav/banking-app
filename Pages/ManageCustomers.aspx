<%@ Page Title="Manage Customers" Language="C#" MasterPageFile="~/MasterPages/mstSecure.master" AutoEventWireup="true" CodeFile="ManageCustomers.aspx.cs" Inherits="Pages_ManageCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:GridView ID="grdvCustomerList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pkCustomerID" DataSourceID="sdsCustomerList" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="pkCustomerID" HeaderText="pkCustomerID" InsertVisible="False" ReadOnly="True" SortExpression="pkCustomerID" Visible="False" />
            <asp:BoundField DataField="vcName" HeaderText="Customer Name" SortExpression="vcName" />
            <asp:BoundField DataField="dtCreated" DataFormatString="{0:d}" HeaderText="Since" SortExpression="dtCreated" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:FormView ID="frmvCustomerEdit" runat="server" DataKeyNames="pkCustomerID" DataSourceID="sdsCustomerEdit">
        <EditItemTemplate>
            pkCustomerID:
            <asp:Label ID="pkCustomerIDLabel1" runat="server" Text='<%# Eval("pkCustomerID") %>' />
            <br />
            vcName:
            <asp:TextBox ID="vcNameTextBox" runat="server" Text='<%# Bind("vcName") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            vcName:
            <asp:TextBox ID="vcNameTextBox" runat="server" Text='<%# Bind("vcName") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            pkCustomerID:
            <asp:Label ID="pkCustomerIDLabel" runat="server" Text='<%# Eval("pkCustomerID") %>' />
            <br />
            vcName:
            <asp:Label ID="vcNameLabel" runat="server" Text='<%# Bind("vcName") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsCustomerEdit" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" DeleteCommand="DELETE FROM [VlaservichtblCustomer] WHERE [pkCustomerID] = @pkCustomerID" InsertCommand="INSERT INTO [VlaservichtblCustomer] ([vcName]) VALUES (@vcName)" SelectCommand="SELECT [pkCustomerID], [vcName] FROM [VlaservichtblCustomer] WHERE ([pkCustomerID] = @pkCustomerID)" UpdateCommand="UPDATE [VlaservichtblCustomer] SET [vcName] = @vcName WHERE [pkCustomerID] = @pkCustomerID">
        <DeleteParameters>
            <asp:Parameter Name="pkCustomerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="vcName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdvCustomerList" Name="pkCustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="vcName" Type="String" />
            <asp:Parameter Name="pkCustomerID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="SELECT * FROM [VlaservichtblCustomer]"></asp:SqlDataSource>
</asp:Content>

