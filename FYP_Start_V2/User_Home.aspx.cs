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
    public partial class User_Home : System.Web.UI.Page
    {
        public int doc;
        public int com;
        public int app;
        public int img;
        public int mus;
        public int vid;
        public int msc;
        public SqlDataReader sdr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Email"] == null)
            {
                Response.Redirect("Login_Register.aspx");
            }
            else
            {
                var filetype = new File_Type();
                String[] doc_file = filetype.Document;
                String[] com_file = filetype.Compressed;
                String[] app_file = filetype.Application;
                String[] img_file = filetype.Image;
                String[] mus_file = filetype.Music;
                String[] vid_file = filetype.Video;
                string email = Session["Email"].ToString();
                string id = Connection.getUserID(email);
                String query = "SELECT File_Type FROM T_Files where User_Id="+id+"";
                SqlConnection conn = Connection.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
                while (sdr.Read())
                {
                    if (doc_file.Contains(sdr["File_Type"]))
                    {
                        doc++;
                    }
                    else if (com_file.Contains(sdr["File_Type"]))
                    {
                        com++;
                    }
                    else if (app_file.Contains(sdr["File_Type"]))
                    {
                        app++;
                    }
                    else if (img_file.Contains(sdr["File_Type"]))
                    {
                        img++;
                    }
                    else if (mus_file.Contains(sdr["File_Type"]))
                    {
                        mus++;
                    }
                    else if (vid_file.Contains(sdr["File_Type"]))
                    {
                        vid++;
                    }
                    else
                    {
                        msc++;
                    }
                }
            }
            if(Request.QueryString["checkverification"] != null)
            {
                string verified = Connection.verification(Session["Email"].ToString());
                System.Diagnostics.Debug.WriteLine("------------------------------------------------------------------" + verified);
                if (verified == "true")
                {
                    Response.Redirect("User_Home.aspx?verification=true");
                }
                else
                {
                    Response.Redirect("User_Home.aspx?verificationfalse=true");
                }
                
            }
            if (Request != null)
            {
                string email = Session["Email"].ToString();
                string id = Connection.getUserID(email);
                int user_id = Convert.ToInt32(id);
                foreach (string s in Request.Files)
                {
                    HttpPostedFile file = Request.Files[s];
                    string fName = file.FileName;
                    if (file != null && file.ContentLength > 0)
                    {

                        var path = Path.Combine(Server.MapPath("~/Upload"));
                        string pathString = System.IO.Path.Combine(path.ToString());
                        var fileName1 = Path.GetFileName(file.FileName);
                        bool isExists = System.IO.Directory.Exists(pathString);
                        if (!isExists) System.IO.Directory.CreateDirectory(pathString);
                        var uploadpath = string.Format("{0}\\{1}", pathString, file.FileName);
                        string[] type = file.FileName.Split('.');
                        file.SaveAs(uploadpath);
                        try
                        {
                            Connection.executeQuery("Insert into T_Files (File_Name, File_Location, File_Type, User_Id) values ('" + file.FileName + "','" + uploadpath.ToString() + "','" + type[1] + "'," + user_id + ")");
                        }
                        catch(Exception ex)
                        {
                            Response.Write(@"<script language='javascript'>alert('The following errors have occurred: \n" + ex + " .');</script>");
                        }
                    }
                    
                }
            }


        }

    }
    
}