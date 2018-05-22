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

                if(Request.QueryString["download"]!= null)
                {

                    string filename = Request.QueryString["filename"];
                    string filelocation = Server.MapPath("~/Upload/" + filename);
                    string filedec = Server.MapPath("~/Upload/dec_" + filename);
                    DecryptFile(filelocation, filedec);
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
                    Response.TransmitFile(Server.MapPath("~/Upload/dec_" + filename));
                    Response.Flush();
                    if (File.Exists(filedec))
                    {
                        File.Delete(filedec);
                    }
                   
                }
            }
            else
            {
                Response.Redirect("Login_Register.aspx");
            }

        }


        private void DecryptFile(string inputFile, string outputFile)
        {

            {
                string password = @"myKey123"; // Your Key Here

                UnicodeEncoding UE = new UnicodeEncoding();
                byte[] key = UE.GetBytes(password);

                FileStream fsCrypt = new FileStream(inputFile, FileMode.Open);

                RijndaelManaged RMCrypto = new RijndaelManaged();

                CryptoStream cs = new CryptoStream(fsCrypt,
                    RMCrypto.CreateDecryptor(key, key),
                    CryptoStreamMode.Read);

                FileStream fsOut = new FileStream(outputFile, FileMode.Create);

                int data;
                while ((data = cs.ReadByte()) != -1)
                    fsOut.WriteByte((byte)data);

                fsOut.Close();
                cs.Close();
                fsCrypt.Close();

            }
        }
    }
}