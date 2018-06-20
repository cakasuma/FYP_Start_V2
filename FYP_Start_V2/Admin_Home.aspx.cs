using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class Admin_Home : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                
                string query = "SELECT * FROM T_Feedback ORDER BY DESC";
                SqlConnection conn = Connection.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
            }
            if (Request.QueryString["deletefeed"] != null)
            {
                string id = Request.QueryString["deletefeed"];
                string query = "DELETE FROM T_Feedback WHERE Feedback_Id=" + id + "";
                Connection.executeQuery(query);
                Response.Redirect("Admin_Home.aspx");
            }
        }
    }
}