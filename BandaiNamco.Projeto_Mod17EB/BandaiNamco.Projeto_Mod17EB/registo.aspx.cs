using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using WebNavarro;

namespace BandaiNamco.Projeto_Mod17EB
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btn_registo_Click(object sender, EventArgs e)
        {
            //Testar a validação do Recaptph
            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            var isCaptchaValid = ReCaptcha.Validate(encodedResponse);
            if (isCaptchaValid)
            {
                if (txt_password.Value != txt_confirmar.Value)
                {
                    Response.Write("<script> alert('A password não condiz com o confrirmar a Password') </script> ");
                }
                else if (txt_password.Value.Length < 8)
                {
                    Response.Write("<script> alert('A password tem de ter 8 ou mais carateres') </script> ");
                }
                else if (txt_username.Value == "")
                {
                    Response.Write("<script> alert('O Username é obrigatório') </script> ");
                }
                else if (txt_email.Value == "")
                {
                    Response.Write("<script> alert('O Email é obrigatório') </script> ");
                }
                else
                {
                    BaseDados BD = new BaseDados();

                    if (BD.devolve_consulta("Select count (username) from utilizadores where username='" + txt_username.Value + "'").Rows[0][0].ToString() == "1")
                    {
                        Response.Write("<script> alert('Já existe um utlizador com este Username') </script> ");
                        return;
                    }

                    string StrSql = "Insert into utilizadores (username, Password, nome, perfil, email)";
                    StrSql += "values(@username,HASHBYTES('MD5',@pass),@nome, @perfil, @email)";
                    List<SqlParameter> parametros = new List<SqlParameter>();
                    parametros.Add(new SqlParameter("@username", txt_username.Value));
                    parametros.Add(new SqlParameter("@pass", txt_password.Value));
                    parametros.Add(new SqlParameter("@nome", txt_nome.Value));
                    parametros.Add(new SqlParameter("@perfil", "cliente"));
                    parametros.Add(new SqlParameter("@email", txt_email.Value));
                    BD.executa_SQL(StrSql, parametros);
                   
                    if (UP_foto.HasFile)
                    {
                        UP_foto.SaveAs(Server.MapPath("~/Imagens/Utilizadores/" + txt_username.Value + ".jpg"));
                    } 
                    Response.Redirect("Login.aspx");
                }

            }
            else
            {
                Response.Write("<script> alert('Tem de provar que não é um Bot') </script> ");
            }
        }
    }
}