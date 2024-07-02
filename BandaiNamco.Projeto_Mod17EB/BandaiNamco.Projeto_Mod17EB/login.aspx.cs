using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using WebNavarro;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["username"] != null)
                {
                    inputUserName.Value = Request.Cookies["username"].Value;
                    inputPassword.Value = Request.Cookies["pass"].Value;
                }
            }
        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            if (chk_autorizacao.Checked)
            {
                Response.Cookies["username"].Value = inputUserName.Value;
                Response.Cookies["pass"].Value = inputPassword.Value;
            }

            BaseDados bd = new BaseDados();

            string strsql = "select count(username) from utilizadores where username=@username and password=HASHBYTES('MD5',@pass)";
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("username", inputUserName.Value));
            parametros.Add(new SqlParameter("pass", inputPassword.Value));

            if (bd.devolve_consulta(strsql, parametros).Rows[0][0].ToString() == "1")
            {


                if (bd.devolve_consulta("select perfil from utilizadores where username='" + inputUserName.Value + "'").Rows[0][0].ToString() == "cliente")
                {
                    Session["user"] = inputUserName.Value;
                }
                else
                {
                    Session["admin"] = inputUserName.Value;
                }
                Response.Redirect("BandaiNamco.aspx");
            }
            else
            {
                Response.Write("<script>alert('As credênciais estão incorretas')</script>");
            }
        }
        protected void bt_recuperarpassword_click(object sender, EventArgs e)
        {
            BaseDados bd = new BaseDados();

            if (bd.devolve_consulta("Select count (username) from utilizadores where username='" + inputUserName.Value + "'").Rows[0][0].ToString() == "0")
            {
                Response.Write("<script>alert(' Tens de colocar o Username Correto para ser enviado!')</script>");
                return;
            }

            string email = (bd.devolve_consulta("select email from utilizadores where username='" + inputUserName.Value + "'").Rows[0][0].ToString());

            string token = System.Guid.NewGuid().ToString();

            MailMessage mail = new MailMessage("bandainamcosuporte@gmail.com", email);

            mail.From = new MailAddress("bandainamcosuporte@gmail.com");
            mail.Subject = "Tecnavarro - Recuperação de Password";
            mail.Body = String.Format("Redefine a tua password clicando aqui seu gay: <a href='{0}recuperar_password.aspx?id=" + token + "'> Abrir </a>", HttpContext.Current.Request.Url.AbsoluteUri.Substring(0, (HttpContext.Current.Request.Url.AbsoluteUri).Length - 10));

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("bandainamcosuporte@gmail.com", "dllpztrzphdgakjr");

            smtp.EnableSsl = true;
            smtp.Send(mail);

            bd.executa_SQL("Insert into RecuperarPassword(username, id) values('" + inputUserName.Value + "','" + token + "')");
            Response.Write("<script>alert(' Foi enviado um email para sua conta para recuperar a sua password')</script>");
        }
    }
}