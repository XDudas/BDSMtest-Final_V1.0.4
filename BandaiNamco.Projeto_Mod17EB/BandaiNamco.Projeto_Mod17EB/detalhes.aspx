<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="detalhes.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .details-container {
            max-width: 800px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.8); /* Cor de fundo com opacidade */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
        }

        .details-header {
            margin-bottom: 40px;
        }

            .details-header h1 {
                font-size: 3rem;
                color: #007bff;
                margin-bottom: 10px;
            }

            .details-header p {
                font-size: 1.2rem;
                color: #6c757d;
            }

        .details-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        .image-container {
            margin-bottom: 20px; /* Adiciona margem inferior para afastar a imagem dos detalhes */
            background-image: url('Imagens/Background/Backgroundapresentacao.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 270px;
            width: 600px;
        }

        .Image1 {
            animation: pulse 2s infinite alternate;
            margin-bottom: 30px; /* Adiciona margem inferior para afastar a imagem dos detalhes */
            margin-top: 20px;
        }

        .details-info {
            background-color: #f8f9fa; /* Cor de fundo */
            padding: 20px;
            border-radius: 8px; /* Bordas arredondadas */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra */
            width: 100%; /* Largura total */
            max-width: 400px; /* Largura máxima */
            margin-top: 20px; /* Espaçamento superior */
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.05);
            }

            100% {
                transform: scale(1);
            }
        }

        @keyframes fade-in {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        @keyframes slide-in {
            0% {
                transform: translateY(-100%);
            }

            100% {
                transform: translateY(0);
            }
        }

        /* Estilo do modal */
        .modal-dialog {
            margin: 100px auto; /* Centraliza o modal verticalmente */
        }

        .modal-content {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            background-color: #007bff; /* Cor de fundo do cabeçalho */
            color: #fff; /* Cor do texto do cabeçalho */
            border-radius: 10px 10px 0 0; /* Bordas arredondadas apenas no topo */
        }

        .modal-body {
            padding: 20px;
        }

        .modal-footer {
            border-radius: 0 0 10px 10px; /* Bordas arredondadas apenas na parte inferior */
            background-color: #f8f9fa; /* Cor de fundo do rodapé */
        }

        .avaliacao-comentarios {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

            .avaliacao-comentarios h3 {
                color: #007bff;
                margin-top: 0;
            }

            .avaliacao-comentarios input[type="button"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

                .avaliacao-comentarios input[type="button"]:hover {
                    background-color: #0056b3;
                }

            .avaliacao-comentarios textarea {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                resize: none;
            }

            .avaliacao-comentarios label {
                display: block;
                margin-bottom: 5px;
            }

        .avaliacoes-comentarios-existentes {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

            .avaliacoes-comentarios-existentes h3 {
                color: #007bff;
                margin-top: 0;
            }

            .avaliacoes-comentarios-existentes table {
                width: 100%;
                border-collapse: collapse;
            }

            .avaliacoes-comentarios-existentes th,
            .avaliacoes-comentarios-existentes td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .avaliacoes-comentarios-existentes th {
                background-color: #f2f2f2;
            }

            .avaliacoes-comentarios-existentes tr:hover {
                background-color: #f2f2f2;
            }

        .radio-list label {
            display: block;
            margin-bottom: 10px;
        }

        .radio-list input[type="radio"] {
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="details-container">
            <div class="details-header">
                <h1>Detalhes do Produto</h1>
                <p>Veja mais informações sobre este produto abaixo.</p>
            </div>
            <div class="details-content">
                <div class="image-container">
                    <asp:Image ID="Image2" runat="server" Height="248px" Width="274" CssClass="Image1" />
                </div>
                <div class="details-info">
                    <% if (Session["user"] != null)
                        { %>
                    <!-- Botão para favorito -->
                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="EAN" DataSourceID="DadosProduto">
                        <EditItemTemplate>
                            EAN:
                            <asp:Label ID="EANLabel1" runat="server" Text='<%# Eval("EAN") %>' />
                            <br />
                            Nome:
                            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                            <br />
                            Descricao:
                            <asp:TextBox ID="DescricaoTextBox" runat="server" Text='<%# Bind("Descricao") %>' />
                            <br />
                            Tipo:
                            <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                            <br />
                            Preco:
                            <asp:TextBox ID="PrecoTextBox" runat="server" Text='<%# Bind("Preco") %>' />
                            <br />
                            Desconto:
                            <asp:TextBox ID="DescontoTextBox" runat="server" Text='<%# Bind("Desconto") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            EAN:
                            <asp:TextBox ID="EANTextBox" runat="server" Text='<%# Bind("EAN") %>' />
                            <br />
                            Nome:
                            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                            <br />
                            Descricao:
                            <asp:TextBox ID="DescricaoTextBox" runat="server" Text='<%# Bind("Descricao") %>' />
                            <br />
                            Tipo:
                            <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                            <br />
                            Preco:
                            <asp:TextBox ID="PrecoTextBox" runat="server" Text='<%# Bind("Preco") %>' />
                            <br />
                            Desconto:
                            <asp:TextBox ID="DescontoTextBox" runat="server" Text='<%# Bind("Desconto") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Inserir" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            EAN:
                            <asp:Label ID="EANLabel" runat="server" Text='<%# Eval("EAN") %>' />
                            <br />
                            Nome:
                            <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' />
                            <br />
                            Descricao:
                            <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Bind("Descricao") %>' />
                            <br />
                            Tipo:
                            <asp:Label ID="TipoLabel" runat="server" Text='<%# Bind("Tipo") %>' />
                            <br />
                            Preco:
                            <asp:Label ID="PrecoLabel" runat="server" Text='<%# Bind("Preco") %>' />
                            <br />
                            Desconto:
                            <asp:Label ID="DescontoLabel" runat="server" Text='<%# Bind("Desconto") %>' />
                            <br />

                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="DadosProduto" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT * FROM [ItemLoja] WHERE ([EAN] = @EAN)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="EAN" QueryStringField="ean" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ImageButton ID="btn_favorito" runat="server" Height="41px" Width="53px" OnClick="btn_favorito_click" />
                    <!-- Botão para adicionar ao carrinho -->
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">Adicionar ao Carrinho</button>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <imagebutton type="image" class="close" data-dismiss="modal">&times;</imagebutton>
                        <h4 class="modal-title">Adicionar produto ao carrinho</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                <td style="padding-right: 15px">
                                    <image id="ImageLabel" src="Imagens/Items_Loja/<%Response.Write(Request.QueryString["ean"]);%>.jpg" style="width: 80px; height: 80px" />
                                </td>
                                <td>
                                    <h2>
                                        <%
                                            Label Nome = new Label();
                                            Nome = (Label)FormView2.FindControl("NomeLabel");
                                            Response.Write(Nome.Text);%>
                                        <asp:Label ID="Label1" runat="server" />
                                        <br />
                                    </h2>
                                    <h4>
                                        <%
                                            Label Preco = new Label();
                                            Preco = (Label)FormView2.FindControl("PrecoLabel");
                                            Response.Write(Preco.Text + "€");%>
                                        <asp:Label ID="Label3" runat="server" />
                                    </h4>
                                    <asp:Label ID="Label2" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="Button1" class="btn btn-default" data-dismiss="modal" runat="server" onserverclick="bt_add_carrinho_ServerClick">Adicionar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="avaliacao-comentarios">
        <div class="avaliacao">
            <h3>Avaliação:</h3>
            <asp:RadioButtonList ID="RatingList" runat="server">
                <asp:ListItem Text="1 Estrela" Value="1" />
                <asp:ListItem Text="2 Estrelas" Value="2" />
                <asp:ListItem Text="3 Estrelas" Value="3" />
                <asp:ListItem Text="4 Estrelas" Value="4" />
                <asp:ListItem Text="5 Estrelas" Value="5" />
            </asp:RadioButtonList>
            <asp:Button ID="SubmitButton" runat="server" Text="Enviar Avaliação" OnClick="SubmitButton_Click" />
        </div>
        <div class="comentario">
            <h3>Comentário:</h3>
            <asp:TextBox ID="CommentTextBox" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
            <br />
            <asp:Button ID="SubmitCommentButton" runat="server" Text="Enviar Comentário" OnClick="SubmitCommentButton_Click" />
        </div>
    </div>

    <div class="avaliacoes-comentarios-existentes">
        <div class="avaliacoes">
            <h3>Avaliações:</h3>
            <asp:GridView ID="GridViewAvaliacoes" runat="server" AutoGenerateColumns="False" DataSourceID="Dados_Avaliacoes">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="Estrelas" HeaderText="Estrelas" SortExpression="Estrelas" />
                    <asp:BoundField DataField="DataAvaliacao" HeaderText="DataAvaliacao" SortExpression="DataAvaliacao" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Dados_Avaliacoes" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT [Username], [Estrelas], [DataAvaliacao] FROM [Avaliacoes] WHERE ([EAN] = @EAN) ORDER BY [DataAvaliacao] DESC" InsertCommand="INSERT INTO [Avaliacoes] ([Username], [EAN], [Estrelas], [DataAvaliacao]) VALUES (@Username, @EAN, @Estrelas, GETDATE())" UpdateCommand="UPDATE [Avaliacoes] SET [Estrelas] = @Estrelas WHERE [Username] = @Username AND [EAN] = @EAN">
                <InsertParameters>
                    <asp:Parameter Name="Username" />
                    <asp:Parameter Name="EAN" />
                    <asp:Parameter Name="Estrelas" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="EAN" QueryStringField="ean" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Estrelas" />
                    <asp:Parameter Name="Username" />
                    <asp:Parameter Name="EAN" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div class="comentarios">
            <h3>Comentários:</h3>
            <asp:GridView ID="GridViewComentarios" runat="server" AutoGenerateColumns="False" DataSourceID="Dados_Comentario">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="Comentario" HeaderText="Comentario" SortExpression="Comentario" />
                    <asp:BoundField DataField="DataComentario" HeaderText="DataComentario" SortExpression="DataComentario" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Dados_Comentario" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT [Username], [Comentario], [DataComentario] FROM [Comentarios] WHERE ([EAN] = @EAN) ORDER BY [DataComentario] DESC" InsertCommand="INSERT INTO [Comentarios] ([Username], [EAN], [Comentario], [DataComentario]) VALUES (@Username, @EAN, @Comentario, GETDATE())
                "
                UpdateCommand="UPDATE [Comentarios] SET [Comentario] = @Comentario WHERE [Username] = @Username AND [EAN] = @EAN">
                <InsertParameters>
                    <asp:Parameter Name="Username" />
                    <asp:Parameter Name="EAN" />
                    <asp:Parameter Name="Comentario" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="EAN" QueryStringField="ean" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Comentario" />
                    <asp:Parameter Name="Username" />
                    <asp:Parameter Name="EAN" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>


    <asp:SqlDataSource ID="DadosItem" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT [EAN], [Nome], [Descricao], [Tipo], [Preco], [Desconto] FROM [ItemLoja] WHERE ([EAN] = @EAN)">
        <SelectParameters>
            <asp:QueryStringParameter Name="EAN" QueryStringField="ean" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>










