<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mstSecure.master" AutoEventWireup="true" CodeFile="ManageLoans.aspx.cs" Inherits="Pages_ManageLoans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="txtCustomerSearch" runat="server"></asp:TextBox>
            <br />
            <asp:LinkButton ID="lnkbCustomerSearch" runat="server">Search</asp:LinkButton>
            <asp:GridView ID="grdvCustomerList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkCustomerID" DataSourceID="sdsCustomerList">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

