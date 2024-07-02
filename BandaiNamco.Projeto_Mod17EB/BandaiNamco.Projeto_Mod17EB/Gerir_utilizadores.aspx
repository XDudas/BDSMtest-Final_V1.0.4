<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gerir_utilizadores.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Adicionando referência ao Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Estilos adicionais */
        .container {
            margin-top: 20px;
        }

        h2 {
            margin-bottom: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Gerir Utilizadores</h2>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="Dados_Utilizadores">
            <Columns>
                <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary btn-sm" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Perfil" HeaderText="Perfil" SortExpression="Perfil" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Dados_Utilizadores" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" DeleteCommand="DELETE FROM [Utilizadores] WHERE [Username] = @original_Username" InsertCommand="INSERT INTO [Utilizadores] ([Username], [Password], [Nome], [Perfil], [Email]) VALUES (@Username, @Password, @Nome, @Perfil, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Username], [Password], [Nome], [Perfil], [Email] FROM [Utilizadores] ORDER BY [Username]" UpdateCommand="UPDATE [Utilizadores] SET [Password] = @Password, [Nome] = @Nome, [Perfil] = @Perfil, [Email] = @Email WHERE [Username] = @original_Username">
            <DeleteParameters>
                <asp:Parameter Name="original_Username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" />
                <asp:Parameter Name="Nome" />
                <asp:Parameter Name="Perfil" />
                <asp:Parameter Name="Email" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Password" />
                <asp:Parameter Name="Nome" />
                <asp:Parameter Name="Perfil" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="original_Username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
