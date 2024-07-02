<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        .card-container {
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .profile-img-card {
            width: 220px;
            height: 220px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .btn-signin {
            width: calc(100% - 20px);
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
        }

        .btn-signin:hover {
            background-color: #0056b3;
        }

        .forgot-password {
            color: #007bff;
            font-size: 14px;
            text-decoration: none;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .thumbnails {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            border:inherit;
        }

        .thumbnail-container {
            flex-grow: 1;
            max-width: 200px;
            text-align: center;
            margin: 10px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        .thumbnail-container:before {
            content: '';
            position: absolute;
            top: -100%;
            left: -100%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, #00000000, #000000);
            transition: all 0.3s ease-in-out;
            z-index: 1;
        }

        .thumbnail-container:hover:before {
            top: 0;
            left: 0;
        }

        .thumbnail-container img {
            max-width: 100%;
            border-radius: 10px;
            margin-bottom: 10px;
            transition: filter 0.3s ease-in-out;
            position: relative;
            z-index: 2;
        }

        .thumbnail-container:hover img {
            filter: brightness(90%);
        }

        .thumbnail-text {
            font-weight: bold;
            font-size: 16px;
            color: #333;
            position: relative;
            z-index: 2;
        }

        .special-thumbnail-container {
            background-color: #ffe600;
            box-shadow: 0 0 20px rgba(255, 230, 0, 0.5);
            border :inherit;
        }

        .special-thumbnail-container:hover {
            transform: scale(1.1);
        }

        .special-thumbnail-container img {
            filter: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card card-container">
            <% if (Request.Cookies["username"] != null)
                { %>
            <img class="profile-img-card" src="imagens/utilizadores/<%Response.Write(Request.Cookies["username"].Value); %>.jpg" alt="" />
            <%  }
                else
                { %>
            <img class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="" />
            <%  } %>

            <p id="profile-name" class="profile-name-card"></p>
            <span id="reauth-email" class="reauth-email"></span>
            <input type="text" id="inputUserName" class="form-control" placeholder="Username..." required autofocus runat="server">
            <input type="password" id="inputPassword" class="form-control" placeholder="Password..." required runat="server">
            <div id="remember" class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me" id="chk_autorizacao" runat="server">
                    Remember me
                </label>
            </div>
            <asp:Button OnClick="Btn_Login_Click" ID="Btn_Login" class="btn btn-lg btn-primary btn-block btn-signin" type="submit" runat="server" Text="Sign In" />
            <asp:LinkButton id="bt_recuperarpassword" OnClick="bt_recuperarpassword_click" class="forgot-password" Text="Forgot the password?" runat=server />
        </div>
        <!-- /card-container -->
    </div>

    <!-- Thumbnails -->
    <div class="thumbnails">
        <div class="thumbnail-container">
            <asp:Image runat="server" ID="Thumbnail" ImageUrl="~/Imagens/Thumbnail/thumbnail4.jpg" />
            <div class="thumbnail-text">Join the Battle</div>
        </div>

        <div class="thumbnail-container">
            <asp:Image runat="server" ID="Thumbnail2" ImageUrl="~/Imagens/Thumbnail/thumbnail3.jpg" />
            <div class="thumbnail-text">Concentrate your ki</div>
        </div>

        <div class="thumbnail-container">
            <asp:Image runat="server" ID="Thumbnail3" ImageUrl="~/Imagens/Thumbnail/thumbnail2.jpg" />
            <div class="thumbnail-text">Be the Red Star of Hope</div>
        </div>

        <div class="thumbnail-container special-thumbnail-container">
            <asp:Image runat="server" ID="Thumbnail6" ImageUrl="~/Imagens/Thumbnail/thumbnail7.jpg" />
            <div class="thumbnail-text">Embrace the Bandai Namco Industries</div>
        </div>
        
        <div class="thumbnail-container ">
            <asp:Image runat="server" ID="Thumbnail4" ImageUrl="~/Imagens/Thumbnail/thumbnail5.jpg" />
            <div class="thumbnail-text">Master the Elements</div>
        </div>

        <div class="thumbnail-container">
            <asp:Image runat="server" ID="Thumbnail5" ImageUrl="~/Imagens/Thumbnail/thumbnail6.jpg" />
            <div class="thumbnail-text">Unlock Your True Power</div>
        </div>
        
        <div class="thumbnail-container">
            <asp:Image runat="server" ID="Thumbnail7" ImageUrl="~/Imagens/Thumbnail/thumbnail1.jpg" />
            <div class="thumbnail-text">Unleash Your Fury</div>
        </div>
    </div>
</asp:Content>
