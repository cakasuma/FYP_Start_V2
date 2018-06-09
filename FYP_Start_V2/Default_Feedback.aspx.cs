using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class Default_Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["feedback"] != null)
            {
                string title = Request.Form["title"];
                string name = Request.Form["name"];
                string email = Request.Form["email"];
                string message = Request.Form["message"];
                string query = $"INSERT INTO T_Feedback (Title, Name, Email, Message) VALUES ('{title}','{name}','{email}','{message}')";
                Connection.executeQuery(query);
                Response.Redirect("Default_Feedback.aspx?submittrue=true");
            }
        }
    }
}