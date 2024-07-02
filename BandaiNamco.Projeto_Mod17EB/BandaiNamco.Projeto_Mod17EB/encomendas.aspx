<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="encomendas.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container" style="width:60%">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Lista de Compras</h3>
            </div>
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="Dados_Compras" ForeColor="Black" GridLines="Vertical" CssClass="table table-striped table-bordered">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                        <asp:BoundField DataField="UtilizadorID" HeaderText="Utilizador ID" SortExpression="UtilizadorID" />
                        <asp:CheckBoxField DataField="Finalizada" HeaderText="Finalizada" SortExpression="Finalizada" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="Dados_Compras" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT * FROM [Compras]"></asp:SqlDataSource>
            </div>
        </div>
        <br />
        <br />
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Detalhes da Compra</h3>
            </div>
            <div class="panel-body">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="Lista_Compras_Encomenda_Selecionada" DataKeyNames="id" CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                        <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                        <asp:BoundField DataField="Preco" HeaderText="Preco" SortExpression="Preco" />
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:Button ID="expedir_compra" Text="Expedir Compra" runat="server" OnClick="expedir_compra_Click" CssClass="btn btn-success" />
            </div>
        </div>
        <asp:SqlDataSource ID="Lista_Compras_Encomenda_Selecionada" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="Select ItemLoja.Nome,  ItemLoja.Descricao,  ItemLoja.Preco, ProdutosCompra.id from ItemLoja, ProdutosCompra where ItemLoja.ean= ProdutosCompra.ean and compraID=@compra">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="compra" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Dados_Encomendas_Fechadas" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT * FROM [Compras]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
