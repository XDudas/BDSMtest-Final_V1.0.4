using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            TextBox ean = (TextBox)FormView1.FindControl("EANTextBox");
            FileUpload foto = (FileUpload)FormView1.FindControl("FileUpload1");

            foto.SaveAs(Server.MapPath("/Imagens/Items_Loja/" + ean.Text.TrimEnd() + ".jpg"));

        }
    }
}