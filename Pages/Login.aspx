<%@ Page Title="Login to the Bank" Language="C#" MasterPageFile="~/MasterPages/mstSecure.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <h2>Please Login</h2>
    <div>
        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
        <br />
        <asp:TextBox ID="txtUsername" placeholder="username = rhyneav" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" CssClass="alert-warning" Display="Dynamic" ErrorMessage="You must put in a username!" SetFocusOnError="True" ValidationGroup="vgLogin"></asp:RequiredFieldValidator>
    </div>
    <div>
        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
        <br />
        <asp:TextBox ID="txtPassword" placeholder="password = password" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" CssClass="alert-warning" Display="Dynamic" ErrorMessage="You must put in a password!" ValidationGroup="vgLogin"></asp:RequiredFieldValidator>
    </div>
    <div>
        <asp:Button ID="btnLogin" class="btn btn-success login" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="vgLogin" />
        <asp:SqlDataSource ID="sdsUserInformation" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="SELECT [vcUserName], [vcPassword], [pkUserID] FROM [VlaservichtblUser] WHERE ([vcUserName] = @vcUserName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUsername" Name="vcUserName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

