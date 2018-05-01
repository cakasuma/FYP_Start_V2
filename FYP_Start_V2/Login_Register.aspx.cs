using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class Login_Register : System.Web.UI.Page
    {
        String namefor = "";
        String passfor = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["ActivationCode"] != null)
            {
                string verified = "true";
                string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();
                int rowsAffected = Connection.executeQueryVerification("UPDATE UserActivation SET verified = '"+verified+"' WHERE ActivationCode = '" + activationCode + "'");
                if (rowsAffected == 1)
                {
                    Response.Redirect("Login_Register.aspx?actvationsuccess=true");
                }
                else
                {
                    Response.Redirect("Login_Register.aspx?activationfailed=true");
                }
            }

            if(Request.QueryString["forgotpass"] != null)
            {
                String Email = Request.Form["emailfor"];
                
                String query = "Select Name, Password FROM T_User WHERE Email='" + Email + "'";
                SqlConnection conn = Connection.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                SqlDataReader sdr = cm.ExecuteReader();
                while (sdr.Read())
                {
                    namefor = sdr["Name"].ToString();
                    passfor = sdr["Password"].ToString();
                }

                if (!string.IsNullOrEmpty(passfor))
                {
                    MailMessage mm = new MailMessage();
                    mm.From = new MailAddress("amammustofa@gmail.com");
                    mm.To.Add(Email);
                    mm.Subject = "Password Recovery";
                    mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", namefor, passfor);
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential();
                    NetworkCred.UserName = "amammustofa@gmail.com";
                    NetworkCred.Password = "cakaamam15951";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    Response.Redirect("Login_Register.aspx?forpasssuccess=true");
                }
                else
                {
                    Response.Redirect("Login_Register.aspx?forpassfailed=true");

                }
            }
            if (Request.QueryString["Login"] != null)
            {
                String Email = Request.Form["emaillog"];
                String Password = Request.Form["passlog"];
                bool[] log_in = new Connection().Login(Email, Password);
                if (log_in[0] == true)
                {
                    if(log_in[1] == true)
                    {
                        String currentUser = Session["UserType"].ToString();
                        if (currentUser.Equals("Customer"))
                        {
                            Response.Redirect("Home.aspx");
                        }
                        else if (currentUser.Equals("Admin"))
                        {
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            Response.Redirect("Login_Register.aspx?nouser=true");
                        }
                    }
                    else
                    {
                        Response.Redirect("Login_Register.aspx?accnotverified=true");
                    }

                }
                else
                {
                    Response.Redirect("Login_Register.aspx?loginfailed=true");
                }
            }

            if (Request.QueryString["Register"] != null)
            {
                String Email = Request.Form["emailreg"]; ;
                String Password = Request.Form["passreg"]; ;
                String Name = Request.Form["namereg"]; ;
                String Contact = Request.Form["contactreg"]; ;
                String UserType = "Customer";
                String[] regUserData = { Email, Password, Name, Contact, UserType };
                int userId = Connection.executeQueryRegister(regUserData);
                if (userId == -1)
                {
                    Response.Redirect("Login_Register.aspx?emailexist=true");
                }
                else
                {
                    SendActivationEmail(userId, Email, Name);
                    Response.Redirect("Login_Register.aspx?registrationsuccess=true");

                }
                //Connection.executeQuery("Insert into T_User (Name, Email, Password, Contact, User_Type) values ('" + Name + "','" + Email + "','" + Password + "','" + Contact + "','" + UserType + "')");

            }
        }
        private void SendActivationEmail(int userId, string email, string name)
        {
            string verified = "false";
            string activationCode = Guid.NewGuid().ToString();
            Connection.executeQuery("Insert into UserActivation (UserId, ActivationCode,verified) values ('" + userId + "','" + activationCode + "', '" + verified + "')");

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("amammustofa@gmail.com");
            mm.To.Add(email);
            mm.Subject = "Account Activation";
            string body = "Hello " + name + ",";
            body += "<br /><br />Please click the following link to activate your account";
            body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("Login_Register.aspx", "Login_Register.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
            body += "<br /><br />Thanks";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "amammustofa@gmail.com";
            NetworkCred.Password = "cakaamam15951";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }
    }
}