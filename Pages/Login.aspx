<%@ Page Title="Login to the Funky Bank" Language="C#" MasterPageFile="~/MasterPages/mstSecure.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div>
        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
        <br />
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
        <br />
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <asp:SqlDataSource ID="sdsUserInformation" runat="server" ConnectionString="<%$ ConnectionStrings:2016Fall3050001ConnectionString %>" SelectCommand="SELECT [vcUserName], [vcPassword], [pkUserID] FROM [VlaservichtblUser] WHERE ([vcUserName] = @vcUserName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUsername" Name="vcUserName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

