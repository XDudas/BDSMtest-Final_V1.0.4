<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="recuperar_password.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Nova Password
    <asp:TextBox ID="txt_password" runat="server"></asp:TextBox>
    <asp:Button ID="bt_AlterarPassword" runat="server" Text="OK" OnClick="bt_AlterarPassword_Click" />
&nbsp;
</asp:Content>
