using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class User_Files : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            }
            if (Session["Email"] != null)
            {
                string email = Session["Email"].ToString();
                string user_id = Connection.getUserID(email);
                if (Request.QueryString["file_category"] != null)
                {
                    if (Request.QueryString["notags"] == "false")
                    {
                        string file_category = Request.QueryString["file_category"].ToString();
                        String query = "SELECT * FROM T_Files WHERE User_Id=" + user_id + " AND File_Category='" + file_category + "' ORDER BY File_DateCreated DESC";
                        SqlConnection conn = Connection.getConnection();
                        conn.Open();
                        SqlCommand cm = new SqlCommand(query, conn);
                        sdr = cm.ExecuteReader();
                    }

                }
                if (Request.QueryString["delete"] != null)
                {
                    string id = Request.QueryString["fileids"].ToString();
                    string query = "DELETE FROM T_Files WHERE File_Id='" + id + "'";
                    Connection.executeQuery(query);
                    object refUrl = ViewState["RefUrl"];
                    if (refUrl != null)
                        Response.Redirect((string)refUrl);
                }
                if (Request.QueryString["tags"] != null)
                {
                    string tag = Request.QueryString["tags"].ToString();
                    String query = "SELECT * FROM T_Files WHERE User_Id=" + user_id + " AND File_Tags LIKE'%" + tag + ",%' or File_Tags LIKE'%," + tag + ",%' or File_Tags LIKE'%," + tag + "%' ORDER BY File_DateCreated DESC";
                    SqlConnection conn = Connection.getConnection();
                    conn.Open();
                    SqlCommand cm = new SqlCommand(query, conn);
                    sdr = cm.ExecuteReader();
                }
                if (Request.QueryString["searchbox"] != null)
                {
                    string searchs = Request.QueryString["searchbox"].ToString();
                    String query = "SELECT * FROM T_Files WHERE User_Id=" + user_id + " AND File_Name LIKE '%"+searchs+"%'";
                    SqlConnection conn = Connection.getConnection();
                    conn.Open();
                    SqlCommand cm = new SqlCommand(query, conn);
                    sdr = cm.ExecuteReader();
                }

                if (Request.QueryString["download"] != null)
                {
                    string filename = Request.QueryString["filename"];
                    string filelocation = Server.MapPath("~/Upload/" + filename);
                    string filedec = Server.MapPath("~/Upload/dec_" + filename);
                    new Cryptography().DecryptFile(@"myKey123", filelocation, filedec);
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
                    Response.TransmitFile(Server.MapPath("~/Upload/dec_" + filename));
                    Response.Flush();
                    if (File.Exists(filedec))
                    {
                        File.Delete(filedec);
                    }
                    object refUrl = ViewState["RefUrl"];
                    if (refUrl != null)
                        Response.Redirect((string)refUrl);

                }
                if (Request.QueryString["addtags"] != null)
                {
                    string labels = Request.Form["taglabels[]"];
                    string fileid = Request.Form["fileid"];
                    string[] filetags = Connection.loadTags(user_id);
                    
                    string[] labelArray = labels.Split(',');
                    string[] newtags = new String[filetags.Length+labelArray.Length];
                    filetags.CopyTo(newtags, 0);
                    labelArray.CopyTo(newtags, filetags.Length);
                    string[] realNewTags = newtags.Distinct().ToArray();
                    string realnewTagsyeah = string.Join(",", realNewTags);
                    string query = "UPDATE T_Files SET File_Tags='"+labels+"' WHERE File_Id='"+fileid+"'";
                    Connection.executeQuery(query);
                    string query2 = "UPDATE T_User SET User_Tags='" + realnewTagsyeah + "' WHERE User_Id='" + user_id + "'";
                    Connection.executeQuery(query2);
                    object refUrl = ViewState["RefUrl"];
                    if (refUrl != null)
                        Response.Redirect((string)refUrl);
                }
            }
            else
            {
                Response.Redirect("Login_Register.aspx");
            }


        }


        
    }
}