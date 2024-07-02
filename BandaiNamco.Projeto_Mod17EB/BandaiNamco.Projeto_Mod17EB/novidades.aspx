<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="novidades.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <style>
        .title-container {
            text-align: center;
            margin-bottom: 30px;
            position: relative; /* Adicionado */
        }

        .title {
            font-size: 24px;
            color: #FF0000; /* cor vermelha */
            text-transform: uppercase;
            display: inline-block; /* Adicionado */
            position: relative; /* Adicionado */
        }

            .title::before {
                content: "";
                position: absolute;
                top: calc(50% - 2px); /* Ajustado para centralizar verticalmente */
                left: 0;
                right: 0;
                height: 4px; /* Aumentando a altura da linha vermelha */
                background-color: #FF0000; /* cor vermelha */
                animation: electric 0.5s infinite alternate; /* Reduzindo a duração da animação para que seja mais rápida */
                z-index: -1; /* Adicionado para colocar a linha atrás do texto */
            }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .card {
            width: calc(50% - 20px);
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; /* Adicionado */
        }

            .card:nth-child(even) {
                margin-right: 20px;
            }

        .card-image img {
            width: 100%;
            height: auto;
            border-radius: 8px 8px 0 0; /* Adicionado */
        }

        .card-content {
            padding: 20px;
        }

            .card-content h3 {
                margin-top: 0;
                margin-bottom: 10px;
                font-size: 18px;
                color: #333;
            }

            .card-content h2 {
                margin: 0;
                font-size: 24px;
                color: #009688;
            }

        @keyframes electric {
            from {
                transform: translateY(-20px);
                opacity: 0.5;
            }

            to {
                transform: translateY(20px);
                opacity: 1;
            }
        }

        @media (max-width: 768px) {
            .card {
                width: calc(100% - 40px);
            }
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .video-container {
            width: 100%; /* Defina a largura do container de vídeo */
            max-width: 800px; /* Defina a largura máxima do container de vídeo */
            margin: 0 auto; /* Centralize o vídeo horizontalmente */
            overflow: hidden; /* Evite que o vídeo ultrapasse os limites do container */
        }

        .custom-video {
            width: 100%; /* Faça o vídeo preencher todo o espaço disponível no container */
            height: auto; /* Defina a altura do vídeo automaticamente com base na largura */
            border-radius: 10px; /* Adicione bordas arredondadas ao vídeo */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Adicione uma sombra ao vídeo */
        }

        .carousel-item {
            text-align: center; /* Centraliza o conteúdo do carrossel */
        }

        .carousel-control-prev,
        .carousel-control-next {
            width: 5%;
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-image: none;
        }

            .carousel-control-prev-icon:before,
            .carousel-control-next-icon:before {
                content: '\2039'; /* Use um ícone Unicode para as setas */
                font-size: 30px;
            }

            .carousel-control-next-icon:before {
                content: '\203A';
            }

        .promo-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .promo-item {
            flex: 0 0 20%; /* Distribui uniformemente as imagens */
            max-width: 20%; /* Define a largura máxima */
            position: relative;
        }

            .promo-item img {
                width: 100%; /* Assegura que a imagem preencha todo o espaço */
                border-radius: 10px; /* Adiciona bordas arredondadas */
                transition: transform 0.3s ease-in-out; /* Adiciona transição suave ao passar o mouse */
            }

            .promo-item:hover img {
                transform: scale(1.1); /* Aumenta ligeiramente a imagem ao passar o mouse */
            }

            .promo-item p {
                position: absolute;
                bottom: 10px;
                left: 50%;
                transform: translateX(-50%);
                color: white; /* Cor do texto */
                background-color: rgba(0, 0, 0, 0.5); /* Fundo semi-transparente */
                padding: 5px 10px; /* Espaçamento interno */
                border-radius: 5px; /* Bordas arredondadas */
                font-size: 14px; /* Tamanho da fonte */
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-container">
        <h1 class="title">O Franchise Favorito de todos está de volta: Tekken</h1>
    </div>
    <div class="card-container">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="dadosNovidades">
            <ItemTemplate>
                <div class="card">
                    <table>
                        <tr>
                            <td class="card-image">
                                <img src="/Imagens/Items_Loja/<%#Eval("EAN") %>.jpg" class="img-thumbnail" style="width: 200px; height: 150px; padding-right: 20px" />
                            </td>
                            <td class="card-content">
                                <h3><%#Eval("Nome") %> &nbsp ; <%#Eval("Tipo") %></h3>
                                <h2><%#Eval("Preco") %> € </h2>
                                <asp:ImageButton ID="btnVerMais" runat="server" CssClass="btn btn-primary btn-ver-mais" ImageUrl="Imagens/Icons/botao_vermais.png" CommandArgument='<%# Eval("Ean") %>' OnClick="btnDetalhes_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- Vídeo -->
                <div class="video-container">
                    <video controls autoplay class="custom-video">
                        <source src="/Videos/My Last Stand [With Lyrics] - Tekken 8.mp4" type="video/mp4">
                    </video>
                </div>
            </div>
            <div class="col-md-6">
                <!-- Carrossel -->
                <div id="promoCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicadores do carrossel -->
                    <ol class="carousel-indicators">
                        <li data-target="#promoCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#promoCarousel" data-slide-to="1"></li>
                        <li data-target="#promoCarousel" data-slide-to="2"></li>
                        <li data-target="#promoCarousel" data-slide-to="3"></li>
                        <li data-target="#promoCarousel" data-slide-to="4"></li>
                    </ol>

                    <!-- Imagens do carrossel -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="/Imagens/Promo_Tekken_8/Arcade.jpg" alt="Arcade Mode" style="width: 100%; height: auto;" />
                            <div class="carousel-caption">
                                <h3>Arcade Mode</h3>
                                <p>Modo arcade é uma experiência clássica de luta.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="/Imagens/Promo_Tekken_8/characterepisodes.jpg" alt="Character Episodes" style="width: 100%; height: auto;" />
                            <div class="carousel-caption">
                                <h3>Character Episodes</h3>
                                <p>Descubra a história de cada personagem.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="/Imagens/Promo_Tekken_8/controllerstyle.jpg" alt="Controller Styles" style="width: 100%; height: auto;" />
                            <div class="carousel-caption">
                                <h3>Controller Styles</h3>
                                <p>Personalize os controles para o seu estilo de jogo.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="/Imagens/Promo_Tekken_8/rankedmatch.jpg" alt="Ranked Match" style="width: 100%; height: auto;" />
                            <div class="carousel-caption">
                                <h3>Ranked Match</h3>
                                <p>Desafie jogadores de todo o mundo e suba no ranking.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="/Imagens/Promo_Tekken_8/roster.jpg" alt="Roster" style="width: 100%; height: auto;" />
                            <div class="carousel-caption">
                                <h3>Roster</h3>
                                <p>Escolha entre uma vasta seleção de personagens.</p>
                            </div>
                        </div>
                        <!-- Adicione mais itens conforme necessário -->
                    </div>

                    <!-- Controlos do carrossel -->
                    <a class="left carousel-control" href="#promoCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#promoCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="dadosNovidades" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT [Nome], [Tipo], [Preco], [EAN] FROM [ItemLoja] WHERE ([Nome] LIKE '%' + @Nome + '%')">
        <SelectParameters>
            <asp:Parameter DefaultValue="Tekken" Name="Nome" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
