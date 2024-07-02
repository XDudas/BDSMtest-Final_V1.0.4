using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNavarro;
using System.Data.SqlClient;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void bt_AlterarPassword_Click(object sender, EventArgs e)
        {
            BaseDados bd = new BaseDados();

            string username = bd.devolve_consulta("Select username from recuperarpassword where id='" + Request.QueryString["id"] + "'").Rows[0][0].ToString();

            string strsql = "update utilizadores set password=HASHBYTES('MD5',@pass) where username=@username";
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("pass", txt_password.Text));
            parametros.Add(new SqlParameter("username", username));
            bd.executa_SQL(strsql, parametros);

            bd.executa_SQL("delete from recuperarpassword where id='" + Request.QueryString["id"] + "'");

            Response.Redirect("login.aspx");
        }
    }
}