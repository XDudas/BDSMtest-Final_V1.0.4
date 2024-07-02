using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNavarro;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        BaseDados bd = new BaseDados();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["opc"] == "remover")
            {
                // Calcula preço unitário
                double preco = double.Parse(bd.devolve_consulta("select preco from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                preco = preco / int.Parse(bd.devolve_consulta("select quantidade from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());

                // Atualiza preço do item
                int quantidade = int.Parse(bd.devolve_consulta("select quantidade from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                double novo_preco = (quantidade - 1) * preco;

                // Atualiza total da encomenda
                int n_compra = int.Parse(bd.devolve_consulta("select compraid from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                bd.executa_SQL("update compras set total=total-" + preco.ToString().Replace(',','.') + " where id=" + n_compra);

                bd.executa_SQL("delete from produtoscompra where id=" + Request.QueryString["id"]);

            }
            else if (Request.QueryString["opc"] == "diminuir")
            {
                if (int.Parse(bd.devolve_consulta("select quantidade from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString()) > 1)
                {
                    // Calcula preço unitário
                    double preco = double.Parse(bd.devolve_consulta("select preco from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                    preco = preco / int.Parse(bd.devolve_consulta("select quantidade from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());

                    // Atualiza preço do item
                    int quantidade = int.Parse(bd.devolve_consulta("select quantidade from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                    double novo_preco = (quantidade - 1) * preco;

                    // atualiza preço do item na BD
                    bd.executa_SQL("update produtoscompra set preco=" + novo_preco.ToString().Replace(',', '.') + " where id=" + Request.QueryString["id"]);

                    // atualizar a quantidade na BD
                    bd.executa_SQL("update produtoscompra set quantidade= quantidade -1 where id=" + Request.QueryString["id"]);

                    // Atualiza total da encomenda
                    int n_compra = int.Parse(bd.devolve_consulta("select compraid from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                    bd.executa_SQL("update compras set total=total-" + preco.ToString().Replace(',', '.') + " where id=" + n_compra);
                }
            }
            else if (Request.QueryString["opc"] == "aumentar")
            {
                // Calcula preço unitário
                double preco = double.Parse(bd.devolve_consulta("select preco from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                preco = preco / int.Parse(bd.devolve_consulta("select quantidade from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());

                // Atualiza preço do item
                int quantidade = int.Parse(bd.devolve_consulta("select quantidade from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                double novo_preco = (quantidade + 1) * preco;

                // atualiza preço do item na BD
                bd.executa_SQL("update produtoscompra set preco=" + novo_preco.ToString().Replace(',', '.') + " where id=" + Request.QueryString["id"]);

                // atualizar a quantidade na BD
                bd.executa_SQL("update produtoscompra set quantidade= quantidade +1 where id=" + Request.QueryString["id"]);

                // Atualiza total da encomenda
                int n_compra = int.Parse(bd.devolve_consulta("select compraid from produtoscompra where id=" + Request.QueryString["id"]).Rows[0][0].ToString());
                bd.executa_SQL("update compras set total=total+" + preco.ToString().Replace(',', '.') + " where id=" + n_compra);

            }

            Response.Redirect("Carrinho.aspx");
        }
    }
}