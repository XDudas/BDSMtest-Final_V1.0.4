<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BandaiNamco.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; /* Cor de fundo para contraste */
            color: #333; /* Cor do texto principal */
        }

        .container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 30px;
        }

        .card {
            width: 300px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 20px;
        }

            .card img {
                width: 100%;
                height: auto;
            }

        .card-content {
            padding: 20px;
            text-align: center;
        }

        h3.jin-title {
            color: #ff0000; /* Vermelho */
        }

        h3.mishima-title {
            color: #007bff; /* Azul */
        }

        h2 {
            text-align: center;
            margin-top: 50px;
            font-size: 2.5rem;
            color: #007bff; /* Azul */
        }

        .after-party-button-container {
            text-align: center;
            margin-top: 50px;
        }

        .after-party-button {
            display: inline-block;
            padding: 15px 30px;
            font-size: 18px;
            text-transform: uppercase;
            color: #fff;
            background-color: #007bff;
            border: 2px solid #007bff;
            border-radius: 30px;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            text-decoration: none;
        }

            .after-party-button:before {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 300px;
                height: 300px;
                background-color: rgba(255, 255, 255, 0.1);
                border-radius: 50%;
                transform: translate(-50%, -50%) scale(0);
                transition: all 0.5s ease;
                z-index: 0;
            }

            .after-party-button:hover:before {
                transform: translate(-50%, -50%) scale(1);
            }

            .after-party-button:hover {
                color: #007bff;
                background-color: #fff;
            }

            .after-party-button:after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, #007bff, transparent);
                transition: all 0.3s ease;
                z-index: 1;
            }

            .after-party-button:hover:after {
                filter: blur(20px);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Carrossel -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Slides do carrossel -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Imagens do carrossel -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="/Imagens/Carrossel/tekken8.jpg" style="width: 100%; height: auto;" />
            </div>
            <div class="item">
                <img src="/imagens/Carrossel/sparkingzero.jpg" style="width: 100%; height: auto;" />
            </div>
            <div class="item">
                <img src="/imagens/Carrossel/stormconnection.jpg" style="width: 100%; height: auto;" />
            </div>
        </div>

        <!-- Controlos do carrossel -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- Título -->
    <h2>The Devil Awakens!</h2>

    <!-- Conteúdo principal -->
    <div class="container">
        <!-- Thumbnail Jin Kazama -->
        <div class="card">
            <img src="/Imagens/Thumbnail/jinkazama.png" alt="Jin Kazama">
            <div class="card-content">
                <h3 class="jin-title">JIN KAZAMA</h3>
                <p>JAPAN</p>
                <p>FIGHTING STYLE: Karate</p>
                <p>RAGE ART: Polar Demon Gouge</p>
                <p>HEAT SMASH: Hellfire Trespass Slayer</p>
                <p>ALIAS: Lightning of Fate</p>
            </div>
        </div>

        <!-- Vídeo TEKKEN 8 -->
        <div class="video">
            <video controls autoplay>
                <source src="/Videos/TEKKEN 8  Reveal Trailer.mp4" type="video/mp4">
            </video>
        </div>

        <!-- Thumbnail Kazuya Mishima -->
        <div class="card">
            <img src="/Imagens/Thumbnail/kazuhamishima.png" alt="Kazuya Mishima">
            <div class="card-content">
                <h3 class="mishima-title">KAZUYA MISHIMA</h3>
                <p>FIGHTING STYLE: Mishima-Style Fighting Karate</p>
                <p>RAGE ART: Demonic Catastrophe</p>
                <p>HEAT SMASH: Omega Crash</p>
                <p>ALIAS: Cold Blooded Oppressor</p>
            </div>
        </div>
    </div>

    <div class="after-party-button-container">
        <a href="Memes.aspx" class="after-party-button">AFTER PARTY</a>
    </div>
</asp:Content>


