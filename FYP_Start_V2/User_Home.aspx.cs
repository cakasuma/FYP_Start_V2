using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
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
                        var uploadenc = string.Format("{0}\\enc_{1}", pathString, file.FileName);
                        string[] type = file.FileName.Split('.');
                        file.SaveAs(uploadpath);
                        
                        try
                        {
                            string file_cat = checkCategory(type[1]);
                            Connection.executeQuery("Insert into T_Files (File_Name, File_Location, File_Type, User_Id, File_Category, File_Status) values ('" + file.FileName + "','" + uploadpath.ToString() + "','" + type[1] + "'," + user_id + ",'"+file_cat+"','encrypted')");
                            EncryptFile(uploadpath, uploadenc);
                            File.Delete(uploadpath);
                            File.Copy(uploadenc, uploadpath);
                            File.Delete(uploadenc);
                        }
                        catch(Exception ex)
                        {
                            Response.Write(@"<script language='javascript'>alert('The following errors have occurred: \n" + ex + " .');</script>");
                        }
                    }
                    
                }
                
            }


        }

        public string checkCategory(string filetype)
        {
            var file = new File_Type();
            String[] doc_file = file.Document;
            String[] com_file = file.Compressed;
            String[] app_file = file.Application;
            String[] img_file = file.Image;
            String[] mus_file = file.Music;
            String[] vid_file = file.Video;
            string category = string.Empty;
            if (doc_file.Contains(filetype))
            {
                category = "document";
            }
            else if (com_file.Contains(filetype))
            {
                category = "compressed";
            }
            else if (app_file.Contains(filetype))
            {
                category = "application";
            }
            else if (img_file.Contains(filetype))
            {
                category = "image";
            }
            else if (mus_file.Contains(filetype))
            {
                category = "music";
            }
            else if (vid_file.Contains(filetype))
            {
                category = "video";
            }
            else
            {
                category = "miscellaneous";
            }
            return category;
        }

        private void EncryptFile(string inputFile, string outputFile)
        {

            try
            {
                string password = @"myKey123"; // Your Key Here
                UnicodeEncoding UE = new UnicodeEncoding();
                byte[] key = UE.GetBytes(password);

                string cryptFile = outputFile;
                FileStream fsCrypt = new FileStream(cryptFile, FileMode.Create);

                RijndaelManaged RMCrypto = new RijndaelManaged();

                CryptoStream cs = new CryptoStream(fsCrypt,
                    RMCrypto.CreateEncryptor(key, key),
                    CryptoStreamMode.Write);

                FileStream fsIn = new FileStream(inputFile, FileMode.Open);

                int data;
                while ((data = fsIn.ReadByte()) != -1)
                    cs.WriteByte((byte)data);


                fsIn.Close();
                cs.Close();
                fsCrypt.Close();
            }
            catch
            {
                Response.Write("Encryption failed!");
            }
        }


    }
    
}