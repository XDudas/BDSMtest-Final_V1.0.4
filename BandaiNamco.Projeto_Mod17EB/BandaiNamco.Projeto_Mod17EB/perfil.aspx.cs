using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNavarro;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null && Session["admin"] == null)
                Response.Redirect("login.aspx");
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            Response.Write("<script> alert('Os seus dados foram alterados com sucesso') </script>");
        }

        protected void Bt_confirmar_Click(object sender, EventArgs e)
        {
            if (txt_pass.Text != Txt_confirma_pass.Text)
            {
                Response.Write("<script> alert('A passwords não coincidem')");
                return;
            }

            BaseDados bd = new BaseDados();
            string strsql = "Update utilizadores set pass=HASHBYTES('MD5',@passord) where username='" + Session["user"] + "'";
            List<SqlParameter> sp = new List<SqlParameter>();
            sp.Add(new SqlParameter("@password", txt_pass.Text));
            bd.executa_SQL(strsql, sp);
            Response.Write("<script> alert('A sua passwords foi alterada com sucesso') </script>");
        }

        protected void bt_foto_Click(object sender, EventArgs e)
        {
            if (Upload_Foto.HasFile)
            {
                Upload_Foto.SaveAs(Server.MapPath("~/Imagens/Utilizadores/" + Session["user"] + ".jpg"));
            }
        }
    }
}