﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class User_Home : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Email"] == null)
            {
                Response.Redirect("Login_Register.aspx");
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
                        Connection.executeQuery("Insert into T_Files (File_Name, File_Location, File_Type, User_Id) values ('" + file.FileName + "','" + uploadpath.ToString() + "','" + type[1] + "'," + user_id + ")");
                    }
                    
                }
            }


        }

    }
    
}