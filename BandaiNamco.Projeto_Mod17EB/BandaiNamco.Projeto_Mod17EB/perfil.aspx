<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm17" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container" style="width: 60%; margin-top: 20px;">
        <h1> Perfil:</h1>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Username" DataSourceID="Dados_Utilizador_Editar" DefaultMode="Edit">
            <EditItemTemplate>
                <div class="form-group">
                    <label for="UsernameLabel1">Username:</label>
                    <asp:Label ID="UsernameLabel1" runat="server" Text='<%# Eval("Username") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="NomeTextBox">Nome:</label>
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="EmailTextBox">Email:</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" />
                </div>
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar" CssClass="btn btn-primary" />
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-default" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <div class="form-group">
                    <label for="UsernameTextBox">Username:</label>
                    <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="NomeTextBox">Nome:</label>
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="EmailTextBox">Email:</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" />
                </div>
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Inserir" CssClass="btn btn-primary" />
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-default" />
            </InsertItemTemplate>
            <ItemTemplate>
                <div class="form-group">
                    <label for="UsernameLabel">Username:</label>
                    <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="NomeLabel">Nome:</label>
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="EmailLabel">Email:</label>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" />
                </div>
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" CssClass="btn btn-primary" />
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Excluir" CssClass="btn btn-danger" />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Novo" CssClass="btn btn-success" />
            </ItemTemplate>
        </asp:FormView>

        <br />

        <div class="form-group">
            <label for="txt_pass">Nova Password:</label>
            <asp:TextBox ID="txt_pass" placeholder="Nova Password" runat="server" TextMode="Password" CssClass="form-control" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Txt_confirma_pass" ControlToValidate="txt_pass" ErrorMessage="As passwords não coincidem" ForeColor="Red" Display="Dynamic" CssClass="text-danger" />
        </div>

        <div class="form-group">
            <label for="Txt_confirma_pass">Confirma Password:</label>
            <asp:TextBox ID="Txt_confirma_pass" placeholder="Confirma Password" runat="server" TextMode="Password" CssClass="form-control" />
        </div>

        <asp:Button ID="Bt_confirmar" runat="server" Text="Gravar" OnClick="Bt_confirmar_Click" CssClass="btn btn-primary" />

        <br />
        <br />

        <div class="form-group">
            <asp:FileUpload ID="Upload_Foto" runat="server" />
            <asp:Button ID="bt_foto" runat="server" OnClick="bt_foto_Click" Text="Atualizar Foto" CssClass="btn btn-primary" />

        </div>

        <asp:SqlDataSource ID="Dados_Utilizador_Editar" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" DeleteCommand="DELETE FROM [Utilizadores] WHERE [Username] = @original_Username AND (([Nome] = @original_Nome) OR ([Nome] IS NULL AND @original_Nome IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [Utilizadores] ([Username], [Nome], [Email]) VALUES (@Username, @Nome, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Username], [Nome], [Email] FROM [Utilizadores] WHERE ([Username] = @Username)" UpdateCommand="UPDATE [Utilizadores] SET [Nome] = @Nome, [Email] = @Email WHERE [Username] = @original_Username AND (([Nome] = @original_Nome) OR ([Nome] IS NULL AND @original_Nome IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Nome" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Nome" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="user" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nome" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Nome" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
