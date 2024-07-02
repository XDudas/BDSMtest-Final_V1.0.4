<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="favoritos.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <div class="container" style="width:60%">


        <asp:DataList ID="DataList1" runat="server" DataKeyField="EAN" DataSourceID="DadosItem" CellSpacing="60" RepeatColumns="3" CellPadding="20">
            <ItemTemplate>
                <a href="detalhes.aspx?ean=<%# Eval("ean") %>"><asp:Image ID="Image1" runat="server" Height="144px" ImageUrl='<%# Eval("EAN", "Imagens/ItemsLoja/{0}.jpg") %>' Width="167px" /></a>
                <br />
                Nome:
                <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                <br />
                Descrição:
                <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Eval("Descricao") %>' />
                <br />
                Tipo:
                <asp:Label ID="TipoLabel" runat="server" Text='<%# Eval("Tipo") %>' />
                <br />
                Preço:
                <asp:Label ID="PrecoLabel" runat="server" Text='<%# Eval("Preco") %>' />
                <br />
                Desconto:
                <asp:Label ID="DescontoLabel" runat="server" Text='<%# Eval("Desconto") %>' />
                <br />
                <div style="padding-right:300px"></div>

            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="DadosItem" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="select ItemsLoja * from ItemsLoja, favoritos where favoritos.username=@username and ItemsLoja.ean=favoritos.ean">
            <SelectParameters>
                <asp:Parameter Name="username" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <asp:CheckBox ID="CheckBox1" runat="server" />





    </div>

</asp:Content>
