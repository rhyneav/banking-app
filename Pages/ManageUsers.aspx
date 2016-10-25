<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mstSecure.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Pages_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:GridView ID="grdvUserList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkUserID" DataSourceID="sdsUserList">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="vcUserName" HeaderText="vcUserName" SortExpression="vcUserName" />
            <asp:BoundField DataField="vcPassword" HeaderText="vcPassword" SortExpression="vcPassword" />
            <asp:BoundField DataField="vcName" HeaderText="vcName" SortExpression="vcName" />
            <asp:BoundField DataField="pkUserID" HeaderText="pkUserID" InsertVisible="False" ReadOnly="True" SortExpression="pkUserID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsUserList" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="SELECT [vcUserName], [vcPassword], [vcName], [pkUserID] FROM [VlaservichtblUser] ORDER BY [dtCreated]"></asp:SqlDataSource>
    <asp:FormView ID="frmvEditUser" runat="server" DataKeyNames="pkUserID" DataSourceID="sdsEditUser">
        <EditItemTemplate>
            pkUserID:
            <asp:Label ID="pkUserIDLabel1" runat="server" Text='<%# Eval("pkUserID") %>' />
            <br />
            vcUserName:
            <asp:TextBox ID="vcUserNameTextBox" runat="server" Text='<%# Bind("vcUserName") %>' />
            <br />
            vcPassword:
            <asp:TextBox ID="vcPasswordTextBox" runat="server" Text='<%# Bind("vcPassword") %>' />
            <br />
            vcName:
            <asp:TextBox ID="vcNameTextBox" runat="server" Text='<%# Bind("vcName") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            vcUserName:
            <asp:TextBox ID="vcUserNameTextBox" runat="server" Text='<%# Bind("vcUserName") %>' />
            <br />
            vcPassword:
            <asp:TextBox ID="vcPasswordTextBox" runat="server" Text='<%# Bind("vcPassword") %>' />
            <br />
            vcName:
            <asp:TextBox ID="vcNameTextBox" runat="server" Text='<%# Bind("vcName") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            pkUserID:
            <asp:Label ID="pkUserIDLabel" runat="server" Text='<%# Eval("pkUserID") %>' />
            <br />
            vcUserName:
            <asp:Label ID="vcUserNameLabel" runat="server" Text='<%# Bind("vcUserName") %>' />
            <br />
            vcPassword:
            <asp:Label ID="vcPasswordLabel" runat="server" Text='<%# Bind("vcPassword") %>' />
            <br />
            vcName:
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

