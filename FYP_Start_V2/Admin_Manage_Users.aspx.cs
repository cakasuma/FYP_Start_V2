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
    public partial class Admin_Manage_Users : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Email"] != null)
            { 
            String query = "SELECT u.User_Id, u.Name, u.Email, u.Contact, a.verified FROM T_User u INNER JOIN UserActivation a ON u.User_Id = a.UserId";
            SqlConnection conn = Connection.getConnection();
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            sdr = cm.ExecuteReader();
            }
            if(Request.QueryString["deleteuserid"] != null)
            {
                string user_id = Request.QueryString["deleteuserid"].ToString();
                string query = "DELETE FROM UserActivation WHERE UserId='" + user_id + "';DELETE FROM T_User WHERE User_Id='"+user_id+"'";
                Connection.executeQuery(query);
                Response.Redirect("Admin_Manage_Users.aspx");
            }
            if (Request.QueryString["notifyuser"] != null)
            {
                string Email = Request.QueryString["notifyuser"].ToString();
                MailMessage mm = new MailMessage();
                mm.From = new MailAddress("amammustofa@gmail.com");
                mm.To.Add(Email);
                mm.Subject = "AFMOS Notification";
                string body = "Hello " + Email + ",";
                body += "<br /><br />We have identified that your account have not verified yet";
                body += "<br />Please verify your account within a week";
                body += "<br /><br />Thanks";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("amammustofa@gmail.com", "cakaamam15951");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                Response.Redirect("Admin_Manage_Users.aspx");
            }

        }
    }
}