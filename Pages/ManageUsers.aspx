<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/MasterPages/mstSecure.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Pages_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:GridView ID="grdvUserList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkUserID" DataSourceID="sdsUserList" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="vcUserName" HeaderText="User Name" SortExpression="vcUserName" />
            <asp:BoundField DataField="vcPassword" HeaderText="Password" SortExpression="vcPassword" />
            <asp:BoundField DataField="vcName" HeaderText="Name" SortExpression="vcName" />
            <asp:BoundField DataField="pkUserID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="pkUserID" />
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
    <asp:SqlDataSource ID="sdsUserList" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="SELECT [vcUserName], [vcPassword], [vcName], [pkUserID] FROM [VlaservichtblUser] ORDER BY [dtCreated]"></asp:SqlDataSource>
    <asp:FormView ID="frmvEditUser" runat="server" DataKeyNames="pkUserID" DataSourceID="sdsEditUser">
        <EditItemTemplate>
            User ID:
            <asp:Label ID="pkUserIDLabel1" runat="server" Text='<%# Eval("pkUserID") %>' />
            <br />
            User Name:
            <asp:TextBox ID="vcUserNameTextBox" runat="server" Text='<%# Bind("vcUserName") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="vcUserNameTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter a Username" SetFocusOnError="True" ValidationGroup="Update"></asp:RequiredFieldValidator>
            <br />
            Password:
            <asp:TextBox ID="vcPasswordTextBox" runat="server" Text='<%# Bind("vcPassword") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="vcPasswordTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter a Password" SetFocusOnError="True" ValidationGroup="Update"></asp:RequiredFieldValidator>
            <br />
            Name:
            <asp:TextBox ID="vcNameTextBox" runat="server" Text='<%# Bind("vcName") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="vcNameTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter a Name" SetFocusOnError="True" ValidationGroup="Update"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            User Name:
            <asp:TextBox ID="vcUserNameTextBox" runat="server" Text='<%# Bind("vcUserName") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="vcUserNameTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter a Username" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
            <br />
            Password:
            <asp:TextBox ID="vcPasswordTextBox" runat="server" Text='<%# Bind("vcPassword") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="vcPasswordTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter a Password" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
            <br />
            Name:
            <asp:TextBox ID="vcNameTextBox" runat="server" Text='<%# Bind("vcName") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="vcNameTextBox" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Enter a Name" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            User ID:
            <asp:Label ID="pkUserIDLabel" runat="server" Text='<%# Eval("pkUserID") %>' />
            <br />
            User Name:
            <asp:Label ID="vcUserNameLabel" runat="server" Text='<%# Bind("vcUserName") %>' />
            <br />
            Password:
            <asp:Label ID="vcPasswordLabel" runat="server" Text='<%# Bind("vcPassword") %>' />
            <br />
            Name:
            <asp:Label ID="vcNameLabel" runat="server" Text='<%# Bind("vcName") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsEditUser" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" DeleteCommand="DELETE FROM [VlaservichtblUser] WHERE [pkUserID] = @pkUserID" InsertCommand="INSERT INTO [VlaservichtblUser] ([vcUserName], [vcPassword], [vcName]) VALUES (@vcUserName, @vcPassword, @vcName)" SelectCommand="SELECT [pkUserID], [vcUserName], [vcPassword], [vcName] FROM [VlaservichtblUser] WHERE ([pkUserID] = @pkUserID)" UpdateCommand="UPDATE [VlaservichtblUser] SET [vcUserName] = @vcUserName, [vcPassword] = @vcPassword, [vcName] = @vcName WHERE [pkUserID] = @pkUserID">
        <DeleteParameters>
            <asp:Parameter Name="pkUserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="vcUserName" Type="String" />
            <asp:Parameter Name="vcPassword" Type="String" />
            <asp:Parameter Name="vcName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdvUserList" Name="pkUserID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="vcUserName" Type="String" />
            <asp:Parameter Name="vcPassword" Type="String" />
            <asp:Parameter Name="vcName" Type="String" />
            <asp:Parameter Name="pkUserID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

