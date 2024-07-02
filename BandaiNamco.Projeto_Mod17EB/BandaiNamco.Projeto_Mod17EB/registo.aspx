<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="registo.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://www.google.com/recaptcha/api.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Adiciona uma camada de opacidade ao fundo para facilitar a leitura do texto */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #007bff; /* Cor do título */
        }

        .card {
            margin-bottom: 15px;
        }

        .card label {
            font-weight: bold;
        }

        .card input[type="text"],
        .card input[type="password"],
        .card input[type="file"],
        .card input[type="submit"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .card input[type="submit"] {
            background-color: #28a745; /* Cor do botão */
            color: #fff; /* Cor do texto do botão */
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .card input[type="submit"]:hover {
            background-color: #218838; /* Cor do botão ao passar o mouse */
        }

        .g-recaptcha {
            margin-top: 15px;
        }

        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; /* Garante que a imagem de fundo esteja atrás de todo o conteúdo */
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img class="background-image" src="Imagens/Background/Backgroundregistar.jpg" alt="Background Image">
    <div class="container">
        <div class="card">
            <h2>Registar nova conta</h2>
            <hr />

            <div class="card">
                <label for="txt_nome">Nome:</label>
                <input type="text" id="txt_nome" class="form-control" runat="server" placeholder="Introduza o Nome..." />
            </div>

            <div class="card">
                <label for="txt_username">Username:</label>
                <input type="text" id="txt_username" class="form-control" runat="server" placeholder="Introduza o Username..." />
            </div>

            <div class="card">
                <label for="txt_password">Password:</label>
                <input type="password" id="txt_password" class="form-control" runat="server" placeholder="Introduza o Password..." />
            </div>

            <div class="card">
                <label for="txt_confirmar">Confirmar Password:</label>
                <input type="password" id="txt_confirmar" class="form-control" runat="server" placeholder="Confirma a Password..." />
            </div>

            <div class="card">
                <label for="txt_email">Email:</label>
                <input type="text" id="txt_email" class="form-control" runat="server" placeholder="Introduza o Email..." />
            </div>

            <div class="card">
                <label for="UP_foto">Foto Perfil:</label>
                <asp:FileUpload ID="UP_foto" runat="server" />
            </div>

            <div class="card">
                <asp:Button ID="btn_registar" CssClass="btn btn-success" runat="server" OnClick="btn_registo_Click" Text="Registar" />
            </div>
            <div class="g-recaptcha" data-sitekey="6LcTCmIpAAAAAEwDuVqcjhjQJwYYzWQLdas2oRSC"></div>
        </div>
    </div>
</asp:Content>
