<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Carrinho.aspx.cs" Inherits="BandaiNamco.Projeto_Mod17EB.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 600px;
            margin: 0 auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

            .table td, .table th {
                border: 1px solid #dddddd;
                padding: 8px;
                text-align: left;
            }

            .table th {
                background-color: #f2f2f2;
            }

            .table img {
                width: 50px;
                height: 50px;
            }

        .btn-success {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

            .btn-success:hover {
                background-color: #218838;
            }

            .btn-success:active {
                background-color: #1e7e34;
            }

            .btn-success:focus {
                outline: none;
                box-shadow: none;
            }

        .payment-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

            .payment-form h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            .payment-form label {
                display: block;
                margin-bottom: 10px;
                color: #555;
            }

            .payment-form input[type="text"],
            .payment-form select {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

                .payment-form input[type="text"]:focus,
                .payment-form select:focus {
                    outline: none;
                    border-color: #007bff;
                }

            .payment-form button {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

                .payment-form button:hover {
                    background-color: #0056b3;
                }

            .payment-form .visa {
                background-image: url('Imagens/Icons/Visa_logo.png'); /* Substitua 'visa_logo.png' pelo caminho para o seu logo Visa */
                background-repeat: no-repeat;
                background-position: right center;
                padding-right: 40px;
            }

            .payment-form .mastercard {
                background-image: url('Imagens/Icons/mastercard_logo.png'); /* Substitua 'mastercard_logo.png' pelo caminho para o seu logo Mastercard */
                background-repeat: no-repeat;
                background-position: right center;
                padding-right: 40px;
            }

            .payment-form .paypal {
                background-image: url('Imagens/Icons/Paypal_logo.png'); /* Substitua 'paypal_logo.png' pelo caminho para o seu logo PayPal */
                background-repeat: no-repeat;
                background-position: right center;
                padding-right: 40px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="container" style="width: 600px">
            <asp:FormView ID="FormView2" runat="server" DataSourceID="Dados_Compra">
                <EditItemTemplate>
                    Data:
                    <asp:TextBox ID="DataTextBox" runat="server" Text='<%# Bind("Data") %>' />
                    <br />
                    Total:
                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                    <br />
                    Estado:
                    <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Data:
                    <asp:TextBox ID="DataTextBox" runat="server" Text='<%# Bind("Data") %>' />
                    <br />
                    Total:
                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                    <br />
                    Estado:
                    <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Inserir" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Data:
                    <asp:Label ID="DataLabel" runat="server" Text='<%# Bind("Data") %>' />
                    <br />
                    Total:
                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Bind("Total") %>' />
                    <br />
                    Estado:
                    <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>

            <asp:SqlDataSource ID="Dados_Compra" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bandai_NamcoConnectionString %>" SelectCommand="SELECT [Data], [Total], [Estado] FROM [Compras] WHERE (([UtilizadorID] = @UtilizadorID) AND ([Finalizada ] = @Finalizada_))">
                <SelectParameters>
                    <asp:Parameter Name="UtilizadorID" />
                    <asp:Parameter DefaultValue="false" Name="finalizada_" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />

            <div class="payment-form">
                <h2>Formulário de Pagamento</h2>
                <label for="ddlCardType">Tipo de Cartão:</label>
                <select id="ddlCardType" runat="server">
                    <option value="Credito">Cartão de Crédito</option>
                    <option value="Debito">Cartão de Débito</option>
                    <option value="PayPal">PayPal</option>
                </select>
                <br />
                <label for="txtCardNumber">Número do Cartão:</label>
                <input type="text" id="txtCardNumber" runat="server" />
                <br />
                <label for="txtExpiryDate">Data de Expiração:</label>
                <input type="text" id="txtExpiryDate" runat="server" placeholder="MM/AA" />
                <br />
                <label for="txtSecurityCode">Código de Segurança:</label>
                <input type="text" id="txtSecurityCode" runat="server" />
                <br />
                <asp:Button ID="btnPay" runat="server" Text="Pagar" OnClick="btnPay_Click" />
            </div>

            <table class="table">
                <tbody>
                    <% for (int i = 0; i < itens_carrinho.Rows.Count; i++)
                        {
                            Response.Write("<tr>");
                            Response.Write("<td style='vertical-align:middle'>");
                            Response.Write("<img src='imagens/Items_Loja/" + itens_carrinho.Rows[i][4].ToString() + ".jpg' style='width:50px; height:50px'>");
                            Response.Write("</td>");
                            Response.Write("<td style='vertical-align:middle'>" + itens_carrinho.Rows[i][0].ToString() + " &nbsp;" + itens_carrinho.Rows[i][1].ToString() + "</td>");
                            Response.Write("<td style='vertical-align:middle'>" + itens_carrinho.Rows[i][6].ToString() + "€ </td>");
                            Response.Write("<td style='vertical-align:middle'>" + itens_carrinho.Rows[i][5].ToString() + " unidades </td>");
                            Response.Write("<td><h3><a href='alterar_quantidade.aspx?opc=diminuir&id=" + itens_carrinho.Rows[i][2].ToString() + "'> - </a></h3> </td>");
                            Response.Write("<td><h3><a href='alterar_quantidade.aspx?opc=aumentar&id=" + itens_carrinho.Rows[i][2].ToString() + "'> + </a></h3></td>");
                            Response.Write("<td style='vertical-align:middle'><a href='alterar_quantidade.aspx?opc=remover&id=" + itens_carrinho.Rows[i][2].ToString() + "'> <img src='imagens/geral/icon_apagar.png' style='width=20px; height:20px'> </a> </td>");
                            Response.Write("</tr>");
                        } %>
                </tbody>
            </table>

            <asp:Button ID="Button1" Text="Finalizar Compra" runat="server" OnClick="Fechar_compra_Click" Class="btn btn-success" />
        </div>
    </div>
</asp:Content>



