<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Editar_Produto.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EAN" DataSourceID="Dados_Produtos">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="EAN" HeaderText="EAN" ReadOnly="True" SortExpression="EAN" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                <asp:BoundField DataField="Preco" HeaderText="Preco" SortExpression="Preco" />
                <asp:BoundField DataField="Desconto" HeaderText="Desconto" SortExpression="Desconto" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Dados_Produtos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" DeleteCommand="DELETE FROM [ItemLoja] WHERE [EAN] = @original_EAN" InsertCommand="INSERT INTO [ItemLoja] ([EAN], [Nome], [Descricao], [Tipo], [Preco], [Desconto]) VALUES (@EAN, @Nome, @Descricao, @Tipo, @Preco, @Desconto)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [EAN], [Nome], [Descricao], [Tipo], [Preco], [Desconto] FROM [ItemLoja] ORDER BY [EAN]" UpdateCommand="UPDATE [ItemLoja] SET [Nome] = @Nome, [Descricao] = @Descricao, [Tipo] = @Tipo, [Preco] = @Preco, [Desconto] = @Desconto WHERE [EAN] = @original_EAN">
            <DeleteParameters>
                <asp:Parameter Name="original_EAN" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EAN" Type="String" />
                <asp:Parameter Name="Nome" />
                <asp:Parameter Name="Descricao" />
                <asp:Parameter Name="Tipo" />
                <asp:Parameter Name="Preco" Type="Double" />
                <asp:Parameter Name="Desconto" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nome" />
                <asp:Parameter Name="Descricao" />
                <asp:Parameter Name="Tipo" />
                <asp:Parameter Name="Preco" Type="Double" />
                <asp:Parameter Name="Desconto" />
                <asp:Parameter Name="original_EAN" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
