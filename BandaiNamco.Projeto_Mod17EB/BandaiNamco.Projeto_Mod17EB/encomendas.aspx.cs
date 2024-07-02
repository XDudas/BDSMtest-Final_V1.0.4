using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNavarro;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null && Session["admin"] == null)
                Response.Redirect("login.aspx");

            if (Session["admin"] != null)
            {
                Dados_Compras.FilterExpression = "estado='Espera confirmação'";
                expedir_compra.Visible = true;
            }
            else
            {
                Dados_Compras.FilterExpression = "UtilizadorID='" + Session["user"] + "'";
                expedir_compra.Visible = false;
            }
        }

        protected void expedir_compra_Click(object sender, EventArgs e)
        {
            BaseDados bd = new BaseDados();
            bd.executa_SQL("update compras set estado='Em expedição' where id=" + GridView1.SelectedValue);
            Response.Redirect("encomendas.aspx");
        }
    }
}