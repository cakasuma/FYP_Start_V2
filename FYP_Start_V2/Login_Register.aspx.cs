using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class Login_Register : System.Web.UI.Page
    {

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
                string forpassid = Guid.NewGuid().ToString();
                string name = "";
                String query = "Select Name FROM T_User WHERE Email='" + Email + "'";
                SqlConnection conn = Connection.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                SqlDataReader sdr = cm.ExecuteReader();
                while (sdr.Read())
                {
                    name = sdr["Name"].ToString();
                }

                if (!string.IsNullOrEmpty(name))
                {

                    MailMessage mm = new MailMessage();
                    mm.From = new MailAddress("amammustofa@gmail.com");
                    mm.To.Add(Email);
                    mm.Subject = "Reset Password";
                    string body = "Hello " + Email + ",";
                    body += "<br /><br />Please click the following link to reset your password";
                    body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("Login_Register.aspx", "Reset_Password.aspx?email=" + Email + "&forpassid=" + forpassid) + "'>Click here to reset your password.</a>";
                    body += "<br /><br />Thanks";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();

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
                string Password = Request.Form["passlog"];
                bool log_in = new Connection().Login(Email, Password);
                if (log_in == true)
                {
                    
                        String currentUser = Session["UserType"].ToString();
                        if (currentUser.Equals("Customer"))
                        {
                            Response.Redirect("User_Home.aspx");
                        }
                        else if (currentUser.Equals("Admin"))
                        {
                            Response.Redirect("Admin_Home.aspx");
                        }
                        else
                        {
                            Response.Redirect("Login_Register.aspx?nouser=true");
                        }
                    
                    

                }
                else
                {
                    Response.Redirect("Login_Register.aspx?loginfailed=true");
                }
            }

            if (Request.QueryString["Register"] != null)
            {
                String Email = Request.Form["emailreg"];
                string Password = Request.Form["passreg"];
                string hashpassword = new Cryptography().HashPass(Password);
                System.Diagnostics.Debug.WriteLine(hashpassword);
                String Name = Request.Form["namereg"];
                String Contact = Request.Form["contactreg"];
                String UserType = "Customer";
                
                String[] regUserData = {Email,hashpassword,Name,Contact,UserType};
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
            try
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
                smtp.Send(mm);
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}