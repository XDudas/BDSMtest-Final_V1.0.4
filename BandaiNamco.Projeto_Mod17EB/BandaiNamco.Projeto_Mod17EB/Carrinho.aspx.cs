using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNavarro;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        BaseDados bd = new BaseDados();
        public DataTable itens_carrinho = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            // Consulta para listar os itens do carrinho
            if (bd.devolve_consulta("select count(*) from compras where UtilizadorID='" + Session["user"] + "' and finalizada='False'").Rows[0][0].ToString() == "0")
            {
                Response.Write("<script> alert('Não tem produtos no carrinho') </script>");
                Response.Redirect("BandaiNamco.aspx");
            }
            else
            {
                string id_compra = bd.devolve_consulta("select max(id) from compras where UtilizadorID='" + Session["user"] + "'").Rows[0][0].ToString();
                itens_carrinho = bd.devolve_consulta("select ItemLoja.Nome, ItemLoja.Descricao, produtoscompra.* from ItemLoja, produtoscompra where ItemLoja.ean=Produtoscompra.ean and compraid= " + id_compra);
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {

            // Recuperar os valores do formulário
            string username = Session["user"].ToString(); // Obtenha o nome de user do contexto de autenticação ou de onde você o armazena
            string cardType = ddlCardType.Value;
            string cardNumber = txtCardNumber.Value;
            string expiryDate = txtExpiryDate.Value;
            string securityCode = txtSecurityCode.Value;

            // Inserir os dados na tabela PaymentDetails
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Bandai_NamcoConnectionString"].ConnectionString; 
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO PaymentDetails (Username, CardType, CardNumber, ExpiryDate, SecurityCode) 
                        VALUES (@Username, @CardType, @CardNumber, @ExpiryDate, @SecurityCode)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@CardType", cardType);
                command.Parameters.AddWithValue("@CardNumber", cardNumber);
                command.Parameters.AddWithValue("@ExpiryDate", expiryDate);
                command.Parameters.AddWithValue("@SecurityCode", securityCode);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void Fechar_compra_Click(object sender, EventArgs e)
        {
            // Consulta para listar os itens do carrinho
            string id_compra = bd.devolve_consulta("select max(id) from compras where UtilizadorID='" + Session["user"] + "'").Rows[0][0].ToString();

            // Fechar a encomenda na BD
            bd.executa_SQL("update compras set finalizada=1 where id=" + id_compra);

            Response.Redirect("BandaiNamco.aspx");
        }
    }
}