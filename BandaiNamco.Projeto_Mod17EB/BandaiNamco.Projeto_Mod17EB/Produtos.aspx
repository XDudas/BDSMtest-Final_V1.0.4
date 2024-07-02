<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Produtos.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .espacamento {
            padding-left: 40px;
        }

        .panel-body {
            background: linear-gradient(to bottom, rgba(0,0,0,0.6) 0%,rgba(0,0,0,0) 100%), url('Imagens/Background/Backgroundfiltros.jpg');
            background-size: cover;
            color: white;
            position: relative;
        }

        .panel {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .panel-heading {
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            font-size: 18px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            padding: 10px;
            text-align: center;
        }

        .panel-body {
            padding: 20px;
        }

        hr {
            border: 0;
            height: 1px;
            background-color: rgba(255, 255, 255, 0.3);
            margin: 20px 0;
        }

        .btn-vermais {
            display: inline-block;
            padding: 8px 16px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            position: relative;
            overflow: hidden;
        }

        .btn-vermais:hover {
            background-color: #0056b3;
        }

        .btn-vermais::after {
            content: '\2192';
            margin-left: 5px;
            position: absolute;
            top: 50%;
            right: -20px;
            transition: right 0.3s ease;
        }

        .btn-vermais:hover::after {
            right: 5px;
        }

        /* Efeito de Hover nos Itens */
        .panel-body:hover {
            background-color: rgba(0, 0, 0, 0.7);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .panel-body:hover img {
            opacity: 0.8;
        }

        .panel-body:hover .btn-vermais {
            background-color: #0056b3;
        }

        /* Transições Suaves */
        .panel-body img, .btn-vermais {
            transition: opacity 0.3s ease;
        }

        /* Ícones de Setas nos Botões */
        .btn-vermais::after {
            content: '\2192';
            margin-left: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-3">
        <div class="panel">
            <div class="panel-heading">
                FILTROS
            </div>
            <div class="panel-body">
                <hr />
                <b>Jogos e Merchandising</b>
                <hr />
                <asp:CheckBoxList ID="Chk_Tipo" runat="server" DataSourceID="Lista_Tipos" DataTextField="Tipo" DataValueField="Tipo" AutoPostBack="True" Width="172px" OnSelectedIndexChanged="alterar_selecao">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="Lista_Tipos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT DISTINCT [Tipo] FROM [ItemLoja]"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <div class="col-sm-9">
        <asp:GridView ID="DGV_DadosItemsLoja" runat="server" AutoGenerateColumns="False" DataKeyNames="EAN" DataSourceID="DadosProdutos" GridLines="None" OnSelectedIndexChanged="DGV_DadosItemsLoja_SelectedIndexChanged" ShowHeader="False" ShowFooter="True">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="panel">
                            <div class="panel-body">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ean", "~/Imagens/Items_Loja/{0}.jpg") %>' />
                                <b><%# Eval("Nome") %></b>
                                <br />
                                <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Eval("Descricao") %>' />
                                <br />
                                <asp:Label ID="TipoLabel" runat="server" Text='<%# Eval("Tipo") %>' />
                                <br />
                                <asp:Label ID="PrecoLabel" runat="server" Text='<%# Eval("Preco", "{0:c}") %>' />
                                <br />
                                <asp:ImageButton ID="vermais" runat="server" CommandName="Select" ImageUrl="Imagens/Icons/botao_vermais.png" CssClass="btn-vermais" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DadosProdutos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT [EAN], [Nome], [Descricao], [Tipo], [Preco] FROM [ItemLoja]"></asp:SqlDataSource>
    </div>
</asp:Content>

