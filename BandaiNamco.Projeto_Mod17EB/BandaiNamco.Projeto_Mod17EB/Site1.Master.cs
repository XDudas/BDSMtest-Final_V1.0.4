using System;
using WebNavarro;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        BaseDados bd = new BaseDados();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.QueryString["pesquisa"] != null)
                    txt_pesquisa.Value = Request.QueryString["pesquisa"];

            if (Session["user"] != null)
            {
                if (int.Parse(bd.devolve_consulta("select count(id) from compras where UtilizadorID='" + Session["user"] + "' and finalizada=0").Rows[0][0].ToString()) > 0)
                {
                    int n_compra = int.Parse(bd.devolve_consulta("select id from compras where UtilizadorID='" + Session["user"] + "' and finalizada=0").Rows[0][0].ToString());
                    N_produtos_carrinho.Value = bd.devolve_consulta("select sum(quantidade) from produtoscompra where compraid=" + n_compra).Rows[0][0].ToString();
                }
                else
                {
                    N_produtos_carrinho.Value = "0";
                }
            }

            if (int.Parse(bd.devolve_consulta("select count(id) from compras where estado='Espera confirmação'").Rows[0][0].ToString()) > 0)
            {
                N_encomendas.Value = bd.devolve_consulta("select count(id) from compras where estado='Espera Confirmação'").Rows[0][0].ToString();
            }

        }

        protected void aceitar_Click(object sender, EventArgs e)
        {
            // Criar a Cookie
            Response.Cookies["autorizacao"].Value = "sim";
            Response.Redirect("BandaiNamco.aspx");
        }

        protected void pesquisa_click(object sender, EventArgs e)
        {
            Response.Redirect("produtos.aspx?pesquisa=" + txt_pesquisa.Value);
        }


    }
}