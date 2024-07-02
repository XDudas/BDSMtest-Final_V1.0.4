<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="promocoes.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .promo-title {
            text-align: center; /* Centralizando o título */
            margin-bottom: 40px; /* Espaçamento inferior */
            font-size: 48px; /* Tamanho do título */
            color: #ff4500;; /* Cor do título */
            text-transform: uppercase; /* Transformação para maiúsculas */
            font-family: 'Roboto', sans-serif;; /* Adicionando uma fonte mais ousada */
            letter-spacing: 3px; /* Espaçamento entre as letras */
            text-shadow: 2px 2px 4px rgba(255, 69, 0, 0.5); /* Sombra de texto */
        }

        .promo-item {
            margin-bottom: 30px; /* Reduzindo o espaço entre os itens */
            height: auto; /* Removendo a altura fixa */
            width: 90%; /* Definindo largura do container */
            max-width: 400px; /* Definindo largura máxima do container */
            margin: 0 auto; /* Centralizando horizontalmente */
            animation: fadeIn 1s ease-in-out;
        }

        .promo-content {
            border: 2px solid #ddd; /* Reduzindo a espessura da borda */
            border-radius: 15px; /* Reduzindo o raio da borda */
            padding: 20px; /* Reduzindo o espaçamento interno */
        }

            .promo-content:hover {
                box-shadow: 0 0 15px rgba(0,0,0,0.1); /* Reduzindo a sombra ao passar o mouse */
            }

        .promo-image {
            width: 100%;
            height: auto;
            border-radius: 15px; /* Reduzindo o raio da borda */
            margin-bottom: 15px; /* Reduzindo o espaço abaixo da imagem */
            transition: transform 0.3s ease-in-out; /* Adicionando efeito de transição */
        }

            .promo-image:hover {
                transform: scale(1.05); /* Aumenta o tamanho ao passar o mouse */
            }

        .promo-details h4 {
            margin-bottom: 15px; /* Reduzindo o espaçamento abaixo do título */
            font-size: 22px; /* Reduzindo o tamanho do título */
        }

        .promo-details p {
            margin-bottom: 10px; /* Reduzindo o espaçamento entre os parágrafos */
            font-size: 18px; /* Reduzindo o tamanho do texto */
        }

        .btn-vermais {
            display: block;
            margin-top: 20px; /* Ajustando a margem superior do botão */
            width: 100%;
            max-width: 200px; /* Definindo largura máxima do botão */
            height: auto;
            transition: transform 0.3s ease-in-out; /* Adicionando efeito de transição */
        }

            .btn-vermais:hover {
                transform: translateY(-5px); /* Move para cima ao passar o mouse */
            }

        /* Destaque para produtos em promoção */
        .promo-content.promo-desconto {
            border: 2px solid #ff5722; /* Cor laranja para destacar */
        }

        /* Animação de fade-in para elementos */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
    </style>



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="promo-title">Promoções</h1>
        <div class="row">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="EAN" DataSourceID="promocoes" CssClass="promo-list" RepeatColumns="3">
                <ItemTemplate>
                    <div class="col-md-4 promo-item">
                        <div class="promo-content<%# Convert.ToBoolean(Eval("Desconto")) ? " promo-desconto" : "" %>">
                            <asp:Image ID="Image1" runat="server" CssClass="promo-image" ImageUrl='<%# Eval("EAN","/Imagens/Items_Loja/{0}.jpg") %>' />
                            <div class="promo-details">
                                <h4><%# Eval("Nome") %></h4>
                                <p><%# Eval("Tipo") %></p>
                                <p class="price"><%# Eval("Preco", "{0:C}") %></p>
                                <p class="discount">Desconto: <%# Eval("Desconto", "{0}%") %></p>
                                <asp:ImageButton ID="vermais" runat="server" ButtonType="Image" CssClass="btn-vermais" ImageUrl="Imagens/Icons/botao_vermais.png" CommandArgument='<%# Eval("Ean") %>' OnClick="btnDetalhes_Click" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <asp:SqlDataSource ID="promocoes" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT [Nome], [Tipo], [Preco], [Desconto], [EAN] FROM [ItemLoja] WHERE ([Desconto] IS NOT NULL)"></asp:SqlDataSource>

</asp:Content>





