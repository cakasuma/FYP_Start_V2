using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class Admin_Encryption_Stat : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                DataTable dt = new DataTable();
                String query = "SELECT Enc_type, Enc_speed FROM T_Encryption";
                SqlConnection conn = Connection.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cm);
                da.Fill(dt);
                //using (SqlConnection cn = new SqlConnection(Constr))
                //{
                //    string sql = "select * from Chart";
                //    using (SqlCommand cmd = new SqlCommand(sql, cn))
                //    {
                //        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                //        {
                //            da.Fill(dt);
                //        }

                //    }
                //}
                //Chart1.DataSource = dt;
                //Chart1.DataBind();
                Chart1.Series["Series1"].Points.AddXY("AES", Connection.getaesaverage());
                Chart1.Series["Series1"].Points.AddXY("DES", Connection.getdesaverage());
                Chart1.Series["Series1"].Points.AddXY("RSA", Connection.getrsaaverage());
                Chart2.Series["Series1"].Points.AddXY("AES", Connection.getaesaveragedec());
                Chart2.Series["Series1"].Points.AddXY("DES", Connection.getdesaveragedec());
                Chart2.Series["Series1"].Points.AddXY("RSA", Connection.getrsaaveragedec());
            }
            else
            {
                Response.Redirect("Login_Register.aspx");
            }
        }
    }
}