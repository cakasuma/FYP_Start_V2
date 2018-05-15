using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
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
                string query = "DELETE FROM T_User WHERE User_Id='"+user_id+"';DELETE FROM UserActivation WHERE UserId='"+user_id+"'";
                Connection.executeQuery(query);
                Response.Redirect("Admin_Manage_Users.aspx");
            }

        }
    }
}