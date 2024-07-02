using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["pesquisa"] != null)
            {
                DadosProdutos.FilterExpression = "nome like '%" + Request.QueryString["pesquisa"] + "%'";
            }
            
        }

        protected void DGV_DadosItemsLoja_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Abrir a página dos detalhes
            Response.Redirect("detalhes.aspx?ean=" + DGV_DadosItemsLoja.SelectedValue);
        }
        protected void alterar_selecao(object sender, EventArgs e)
        {
            string filtro = "";

            // Aplicar o filtro na marca
            foreach (ListItem Tipo in Chk_Tipo.Items)
            {
                if (Tipo.Selected)
                    if (filtro == "")
                        filtro += "(Tipo='" + Tipo.Value + "'";
                    else
                        filtro += " or Tipo='" + Tipo.Value + "'";
            }

            if (filtro != "")
                filtro += ")";



            // Aplicar os filtros no datasource


            if (filtro == "")
            {
                if (Request.QueryString["pesquisa"] == null)
                {
                    Response.Redirect("produtos.aspx?tipo=" + Request.QueryString["Tipo"]);
                }
                else
                {
                    Response.Redirect("produtos.aspx?pesquisa=" + Request.QueryString["pesquisa"]);
                }
            }
            else
            {
                if (Request.QueryString["pesquisa"] == null)
                {
                        DadosProdutos.FilterExpression = filtro;
                }
                else
                {
                        DadosProdutos.FilterExpression = filtro + "and nome like '%" + Request.QueryString["pesquisa"] +"%'";
                      
                }
            }

        }
    }
}