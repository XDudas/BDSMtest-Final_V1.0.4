<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Novo_produto.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .form-label {
            font-weight: bold;
        }
        .form-control {
            width: 100%;
        }
        .btn-container {
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="width:60%">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Novo Produto</h3>
            </div>
            <div class="panel-body">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="EAN" DataSourceID="Dados_Novo_computador" DefaultMode="Insert">
                    <InsertItemTemplate>
                        <div class="form-group">
                            <label class="form-label">EAN:</label>
                            <asp:TextBox ID="EANTextBox" runat="server" CssClass="form-control" Text='<%# Bind("EAN") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Nome:</label>
                            <asp:TextBox ID="NomeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Nome") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Descrição:</label>
                            <asp:TextBox ID="DescricaoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Descricao") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Tipo:</label>
                            <asp:TextBox ID="TipoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Tipo") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Preço:</label>
                            <asp:TextBox ID="PrecoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Preco") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Desconto:</label>
                            <asp:TextBox ID="DescontoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Desconto") %>'></asp:TextBox>
                        </div>
                        <div class="btn-container">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Inserir"></asp:LinkButton>
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default" Text="Cancelar"></asp:LinkButton>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
        <asp:SqlDataSource ID="Dados_Novo_computador" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" DeleteCommand="DELETE FROM [ItemLoja] WHERE [EAN] = @EAN" InsertCommand="INSERT INTO [ItemLoja] ([EAN], [Nome], [Descricao], [Tipo], [Preco], [Desconto]) VALUES (@EAN, @Nome, @Descricao, @Tipo, @Preco, @Desconto)" SelectCommand="SELECT * FROM [ItemLoja]" UpdateCommand="UPDATE [ItemLoja] SET [Nome] = @Nome, [Descricao] = @Descricao, [Tipo] = @Tipo, [Preco] = @Preco, [Desconto] = @Desconto WHERE [EAN] = @EAN">
            <DeleteParameters>
                <asp:Parameter Name="EAN" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EAN" Type="String" />
                <asp:Parameter Name="Nome" Type="String" />
                <asp:Parameter Name="Descricao" Type="String" />
                <asp:Parameter Name="Tipo" Type="String"/>
                <asp:Parameter Name="Preco" Type="Double" />
                <asp:Parameter Name="Desconto" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nome" Type="String" />
                <asp:Parameter Name="Descricao" Type="String" />
                <asp:Parameter Name="Tipo" Type="String"/>
                <asp:Parameter Name="Preco" Type="Double" />
                <asp:Parameter Name="Desconto" Type="Byte" />
                <asp:Parameter Name="EAN" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

