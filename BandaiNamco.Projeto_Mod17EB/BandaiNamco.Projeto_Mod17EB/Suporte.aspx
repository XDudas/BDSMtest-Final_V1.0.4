<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Suporte.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Página de Suporte</title>
    <!-- Adicionando Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Adicionando Font Awesome para os ícones -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .form-container {
            display: none;
            margin-bottom: 20px;
        }

        .form-content {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .social-icon {
            font-size: 24px;
            margin-right: 10px;
            cursor: pointer;
        }
    </style>
    <script>
        function toggleForm(formId) {
            var form = document.getElementById(formId);
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 class="mt-5">Suporte</h2>
        <ul class="list-group mt-3">
            <li class="list-group-item"><a href="#" onclick="toggleForm('games')">Games</a></li>
            <li class="list-group-item"><a href="#" onclick="toggleForm('about')">About Us</a></li>
            <li class="list-group-item"><a href="#" onclick="toggleForm('press')">Press</a></li>
            <li class="list-group-item"><a href="#" onclick="toggleForm('careers')">Careers</a></li>
            <li class="list-group-item"><a href="#" onclick="toggleForm('licensing')">Licensing</a></li>
        </ul>

        <div class="form-container" id="games">
            <div class="form-content mt-3">
                <h3>Games</h3>
                <p>Descubra o emocionante mundo dos jogos Bandai Namco! Desde clássicos como Pac-Man e Tekken até as mais recentes inovações, nossos jogos oferecem diversão para todas as idades e preferências. Explore mundos vastos, lute contra inimigos formidáveis e mergulhe em histórias cativantes.</p>
                <p>Nossa loja oferece uma ampla variedade de produtos relacionados aos nossos jogos, incluindo figuras de colecionador, roupas e acessórios exclusivos. Não perca a oportunidade de levar para casa um pedaço do universo Bandai Namco!</p>
            </div>
        </div>

        <div class="form-container" id="about">
            <div class="form-content mt-3">
                <h3>About Us</h3>
                <p>Bem-vindo à Bandai Namco, onde a paixão pelos jogos encontra a excelência em entretenimento! Desde nossa fundação, nos dedicamos a criar experiências únicas para nossos clientes, oferecendo os melhores jogos e produtos do mercado.</p>
                <p>Nosso compromisso é proporcionar momentos inesquecíveis de diversão e aventura, garantindo que cada produto que oferecemos atenda aos mais altos padrões de qualidade e inovação.</p>
            </div>
        </div>

        <div class="form-container" id="press">
            <div class="form-content mt-3">
                <h3>Press</h3>
                <p>Para contato de imprensa e mídia, envie um e-mail para <a href="mailto:bandainamcosuporte@gmail.com">bandainamcosuporte@gmail.com</a>. Estamos disponíveis para entrevistas, fornecimento de materiais de divulgação e outras solicitações relacionadas à cobertura de nossos jogos e eventos.</p>
            </div>
        </div>

        <div class="form-container" id="careers">
            <div class="form-content mt-3">
                <h3>Careers</h3>
                <p>Junte-se a nós em nossa missão de criar experiências de jogo inovadoras e emocionantes! Desde nossa humilde origem até o sucesso global, estamos comprometidos em oferecer oportunidades de carreira gratificantes e desafiadoras em todas as áreas, desde desenvolvimento de jogos até marketing e vendas.</p>
                <p>Descubra nossa história e cultura corporativa única enquanto exploramos juntos o futuro do entretenimento digital.</p>
            </div>
        </div>

        <div class="form-container" id="licensing">
            <div class="form-content mt-3">
                <h3>Licensing</h3>
                <p>Explore as diversas licenças e propriedades intelectuais que tornam a Bandai Namco uma das empresas de entretenimento mais reconhecidas do mundo. Desde franquias icônicas como Dragon Ball e Tekken até colaborações inovadoras, nosso portfólio de propriedades intelectuais oferece oportunidades infinitas para produtos e experiências emocionantes.</p>
            </div>
        </div>

        <!-- Ícones de redes sociais -->
        <div class="mt-5">
            <a href="https://www.instagram.com/bandainamcous" target="_blank" class="text-decoration-none me-3"><i class="fab fa-instagram social-icon"></i></a>
            <a href="https://twitter.com/BandaiNamcoEU" target="_blank" class="text-decoration-none me-3"><i class="fab fa-twitter social-icon"></i></a>
            <a href="https://www.facebook.com/BandaiNamcoUS/?locale=pt_BR" target="_blank" class="text-decoration-none me-3"><i class="fab fa-facebook social-icon"></i></a>
            <a href="https://www.youtube.com/channel/UCETrNUjuH4EoRdZNFx9EI-A" target="_blank" class="text-decoration-none me-3"><i class="fab fa-youtube social-icon"></i></a>
            <a href="https://www.twitch.tv/bandaiNamcoeurope" target="_blank" class="text-decoration-none me-3"><i class="fab fa-twitch social-icon"></i></a>
        </div>
    </div>
</asp:Content>