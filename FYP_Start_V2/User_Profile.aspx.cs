using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class User_Profile : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        public string User_Name = string.Empty;
        public string User_Contact = string.Empty;
        public string User_Photo = string.Empty;
        public string User_Type = string.Empty;
        public string User_Tags = string.Empty;
        public string User_Email = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                string email = Session["Email"].ToString();
                string id = Connection.getUserID(email);
                String sqlquery = "SELECT * FROM T_User where User_Id=" + id + "";
                SqlConnection conn = Connection.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(sqlquery, conn);
                sdr = cm.ExecuteReader();
                while (sdr.Read())
                {
                    User_Name = sdr["Name"].ToString();
                    User_Contact = sdr["Contact"].ToString();
                    User_Type = sdr["User_Type"].ToString();
                    User_Photo = sdr["Photo_URL"].ToString();
                    User_Tags = sdr["User_Tags"].ToString();
                    User_Email = sdr["Email"].ToString();
                }

                if (Request.QueryString["deletetag"] != null)
                {
                    string tag = Request.QueryString["deletetag"];
                    string[] userTags = User_Tags.Split(',');
                    var list = new List<string>(userTags);
                    list.Remove(tag);
                    userTags = list.ToArray();
                    string result = string.Join(",", userTags);
                    string query = "UPDATE T_User SET User_Tags='" + result + "' WHERE User_Id='" + id + "'";
                    Connection.executeQuery(query);
                    Response.Redirect("User_Profile.aspx");
                }

                if (Request.QueryString["changeinfo"] != null)
                {
                    string name = Request.Form["name"];
                    string contact = Request.Form["contact"];
                    string query = "UPDATE T_User SET Name='" + name + "', Contact='" + contact + "' WHERE User_Id='" + id + "'";
                    Connection.executeQuery(query);
                }
                if (Request.QueryString["deleteaccount"] != null)
                {
                    string query = "DELETE FROM T_User WHERE User_Id="+id+";DELETE FROM UserActivation WHERE UserId=" + id + ";DELETE FROM T_Files WHERE User_Id=" + id + "";
                    Connection.executeQuery(query);
                }
                if (Request.QueryString["uploadimage"] != null)
                {
                    fileUpload1.PostedFile.SaveAs(Server.MapPath("//img//") + System.IO.Path.GetFileName(fileUpload1.PostedFile.FileName));
                    String FileName = System.IO.Path.GetFileName(fileUpload1.PostedFile.FileName);
                    string query = "UPDATE T_User SET Photo_URL='" + FileName + "' WHERE User_Id=" + id + "";
                    Connection.executeQuery(query);
                    //HttpPostedFile file = Request.Files["fileUpload1"];

                    //if (file != null && file.ContentLength > 0)
                    //{
                    //    string FileName = Path.GetFileName(file.FileName);
                    //    string filepath = Server.MapPath("~/img/") + FileName;
                    //    if (File.Exists(filepath))
                    //    {
                    //        File.Delete(filepath);
                    //    }
                    //    file.SaveAs(filepath);

                    //    string query = "UPDATE T_User SET Photo_URL='" + FileName + "' WHERE User_Id=" + id + "";
                    //    Connection.executeQuery(query);
                    //}


                }
            }
            else
            {
                Response.Redirect("Login_Register.aspx");
            }
        }

    }

}