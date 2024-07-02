using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Obter o ID do produto da URL
            string EAN = Request.QueryString["Ean"];

            // Use o ID do produto para carregar e exibir os detalhes do produto
            // (por exemplo, consulte o banco de dados para obter informações sobre o produto)
        }

        protected void btnDetalhes_Click(object sender, EventArgs e)
        {
            // Obtenha o ID do produto do argumento do comando
            ImageButton btn = (ImageButton)sender;
            string Ean = btn.CommandArgument;

            // Redirecione para a página de detalhes com o ID do produto na URL
            Response.Redirect("detalhes.aspx?ean=" + Ean);
        }
    }
}