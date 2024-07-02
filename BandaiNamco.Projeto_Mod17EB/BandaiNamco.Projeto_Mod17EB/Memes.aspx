<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Memes.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm20" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Link para o Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Estilos personalizados */
        body {
            background-color: #000;
            color: #fff;
        }

        .party-zone {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .party-element {
            margin: 10px;
        }

        /* Animação de pulsação */
        @keyframes pulse {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.1);
            }

            100% {
                transform: scale(1);
            }
        }

        .pulse-animation {
            animation: pulse 1s infinite;
        }

        /* Estilos para o texto sobreposto */
        .text-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-family: 'Arial Black', sans-serif;
            font-size: 18px;
            text-align: center;
            color: #fff;
            text-shadow: 2px 2px 4px #000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Conteúdo da página -->
    <div class="container party-zone">
        <!-- Imagens e vídeos de festa -->
        <div class="row">
            <div class="col-md-3 party-element">
                <img src="Imagens/Memes/Artur_di_BOB.png" alt="Festa" class="img-fluid rounded-circle pulse-animation" style="border: 5px solid #fff; box-shadow: 0 0 20px #ff00ff;">
                <div class="text-overlay">Grande DIBOB</div>
            </div>
            <div class="col-md-3 party-element">
                <img src="Imagens/Memes/bitchparty.png" alt="Festa" class="img-fluid rounded-circle pulse-animation" style="border: 5px solid #fff; box-shadow: 0 0 20px #ff00ff;">
                <div class="text-overlay">Bota BITCHPARTY</div>
            </div>
            <div class="col-md-3 party-element">
                <img src="Imagens/Memes/Memes.png" alt="Festa" class="img-fluid rounded-circle pulse-animation" style="border: 5px solid #fff; box-shadow: 0 0 20px #ff00ff;">
                <div class="text-overlay">OS DOIS GRANDES DA INSPIRAÇÃO</div>
            </div>
            <div class="col-md-3 party-element">
                <img src="Imagens/Memes/dibob.png" alt="Festa" class="img-fluid rounded-circle pulse-animation" style="border: 5px solid #fff; box-shadow: 0 0 20px #ff00ff;">
                <div class="text-overlay">NÃO INCOMODES O DIBOB QUE DÁ TE UMA CABEÇADA NO CEU DA BOCA</div>
            </div>
            <div class="col-md-3 party-element">
                <img src="Imagens/Memes/rocket.png" alt="Festa" class="img-fluid rounded-circle pulse-animation" style="border: 5px solid #fff; box-shadow: 0 0 20px #ff00ff;">
                <div class="text-overlay">PRÓXIMO RELEASE NA STORE A 11/9 NÃO PERCAS NOS AEROPORTOS MAIS PERTO DE SÍ</div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <!-- Vídeo no centro -->
            <div class="col-md-8 offset-md-2 text-center">
                <video id="musicVideo" width:"100%" controls autoplay>
                    <source src="Imagens/Memes/ur pretty - keep riding me he spreads my cheeks makes me scream (Lyrics).mp4" type="video/mp4">
                </video>
            </div>
        </div>
        <div class="row mt-4">
        <div class="col-md-8 offset-md-2 text-center">
            <h3>ON THE MAKING: VS BATTLE</h3>
            <video id="promoVideo" width:"100%" controls autoplay>
                <source src="Imagens/Memes/WhatsApp Video 2024-03-22 at 12.13.12.mp4" type="video/mp4">
            </video>
        </div>
    </div>
    </div>
    

    <div class="container text-center mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <img src="Imagens/Memes/Duarte_Leite.png" alt="Duarte Leite" class="img-fluid rounded-circle mb-3 shadow-lg" style="width: 200px; height: 200px; border: 5px solid #fff; animation: rotate 5s infinite;">
                <h4 style="font-family: 'Comic Sans MS', cursive; color: #ff00ff; text-shadow: 2px 2px 4px #000;">Criador do Site: DUARTE LEITE</h4>
                <p style="font-family: 'Comic Sans MS', cursive; color: #ff00ff; text-shadow: 2px 2px 4px #000;">Email: bandainamcosuporte@gmail.com</p>
                <p style="font-family: 'Comic Sans MS', cursive; color: #ff00ff; text-shadow: 2px 2px 4px #000;">Mensagem do Criador: Não seria possível sem o nosso grande CARLITOS MALTA e ajuda do GRANDE COITOS TAMBÊM !!!</p>
            </div>
        </div>
    </div>


</asp:Content>
