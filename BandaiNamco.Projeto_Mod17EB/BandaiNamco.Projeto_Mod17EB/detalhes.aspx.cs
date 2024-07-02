using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNavarro;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        BaseDados bd = new BaseDados();
        protected void Page_Load(object sender, EventArgs e)
        {
            Image2.ImageUrl = "/Imagens/Items_Loja/" + Request.QueryString["ean"] + ".jpg";

            HttpCookie autorizacao_cookies = Request.Cookies["Autorizacao"];
            if (autorizacao_cookies != null)
                Response.Cookies["ultimo_visitado"].Value = Request.QueryString["ean"];

            if (Session["user"] != null)
                if (bd.devolve_consulta("select count(ean) from favoritos where ean='" + Request.QueryString["ean"] + "' and username='" + Session["user"] + "'").Rows[0][0].ToString() == "1")
                {
                    btn_favorito.ImageUrl = "imagens/geral/botao_tornarfavorito.png";
                }
                else
                {
                    btn_favorito.ImageUrl = "imagens/geral/botao_favorito.png";
                }
            else
            {
                btn_favorito.Visible = false;
            }

        }
        protected void btn_favorito_click(object sender, ImageClickEventArgs e)
        {
            // Gravar como favorito
            if (bd.devolve_consulta("select count(ean) from favoritos where ean='" + Request.QueryString["ean"] + "' and username='" + Session["user"] + "'").Rows[0][0].ToString() == "1")
            {
                bd.executa_SQL("delete from favoritos where ean='" + Request.QueryString["ean"] + "' and username='" + Session["user"] + "'");
                btn_favorito.ImageUrl = "imagens/geral/botao_favorito.png";
            }
            else
            {
                bd.executa_SQL("Insert into favoritos(username,ean) values('" + Session["user"] + "','" + Request.QueryString["ean"] + "')");
                btn_favorito.ImageUrl = "imagens/geral/botao_tornarfavorito.png";
            }
            Response.Redirect("detalhes.aspx?ean=" + Request.QueryString["ean"]);
        }


        protected void bt_add_carrinho_ServerClick(object sender, EventArgs e)
        {
            // --- Adicionar produto à tabela da encomenda ----

            int id_compra;

            Label preco = new Label();
            preco = (Label)FormView2.FindControl("PrecoLabel");

            // Verificar se já existem produtos no carrinho
            if (bd.devolve_consulta("select count(id) from compras where finalizada=0 and UtilizadorID='" + Session["user"] + "'").Rows[0][0].ToString() == "0")
                bd.executa_SQL("insert into compras(UtilizadorID,total,finalizada) values('" + Session["user"].ToString() + "',0,'0')");

            // Verificar o código da compra ativa
            id_compra = int.Parse(bd.devolve_consulta("select max(id) from compras where UtilizadorID='" + Session["user"] + "'").Rows[0][0].ToString());

            // Verificar se o produto escolhido já se encontra no carrinho
            if (bd.devolve_consulta("Select count(ean) from ProdutosCompra where CompraID=" + id_compra + " and ean='" + Request.QueryString["ean"] + "'").Rows[0][0].ToString() == "0")
            {
                string strSQL = "Insert into ProdutosCompra (CompraID,ean,quantidade,preco)";
                strSQL += " values(@CompraID, @ean, @quantidade, @preco)";
                List<SqlParameter> parametros = new List<SqlParameter>();
                parametros.Add(new SqlParameter("@CompraID", id_compra));
                parametros.Add(new SqlParameter("@ean", Request.QueryString["ean"].ToString()));
                parametros.Add(new SqlParameter("@quantidade", 1));
                parametros.Add(new SqlParameter("@preco", preco.Text.Replace(',', '.')));

                bd.executa_SQL(strSQL, parametros);
            }
            else
            {
                bd.executa_SQL("Update ProdutosCompra set quantidade=quantidade+1, preco=preco+" + preco.Text.Replace(',', '.') + " where CompraID=" + id_compra + " and ean='" + Request.QueryString["ean"] + "'");
            }

            bd.executa_SQL("Update compras set total=total+" + preco.Text.Replace(',', '.') + " where id=" + id_compra);
            Response.Redirect("detalhes.aspx?ean=" + Request.QueryString["ean"]);
        }



        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Obtém o nome de usuário da sessão
            string username = Session["user"] != null ? Session["user"].ToString() : "";
            
            // Obtém o EAN do produto da query string
            string ean = Request.QueryString["ean"];

            int estrelas = Convert.ToInt32(RatingList.SelectedValue); // Obtém a quantidade de estrelas selecionada
            DateTime dataAvaliacao = DateTime.Now; // Obtém a data e hora atual

            // Insere os dados na tabela de avaliações
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Bandai_NamcoConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Avaliacoes (Username, EAN, Estrelas, DataAvaliacao) VALUES (@Username, @EAN, @Estrelas, @DataAvaliacao)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@EAN", ean);
                    command.Parameters.AddWithValue("@Estrelas", estrelas);
                    command.Parameters.AddWithValue("@DataAvaliacao", dataAvaliacao);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // Recarrega os dados do GridView de avaliações
            GridViewAvaliacoes.DataBind();
        }

        protected void GridViewAvaliacoes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SubmitCommentButton_Click(object sender, EventArgs e)
        {
            // Obtém o nome de usuário da sessão
            string username = Session["user"] != null ? Session["user"].ToString() : "";

            // Obtém o EAN do produto da query string
            string ean = Request.QueryString["ean"];

            string comentario = CommentTextBox.Text; // Obtém o texto do comentário
            DateTime dataComentario = DateTime.Now; // Obtém a data e hora atual

            // Insere os dados na tabela de comentários
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Bandai_NamcoConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Comentarios (Username, EAN, Comentario, DataComentario) VALUES (@Username, @EAN, @Comentario, @DataComentario)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@EAN", ean);
                    command.Parameters.AddWithValue("@Comentario", comentario);
                    command.Parameters.AddWithValue("@DataComentario", dataComentario);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // Recarrega os dados do GridView de comentários
            GridViewComentarios.DataBind();
        }
    }
}