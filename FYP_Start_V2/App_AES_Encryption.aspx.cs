using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class App_AES_Encryption : System.Web.UI.Page
    {
        public string elapsedMs = "";
        public string filename = "";
        public string uploadenc = "";
        public string uploaddec = "";
        public string uploadpath = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["testencrypt"] != null)
            {
                if (Request.Form["encryptButton"] != null)
                {
                    string key = Request.Form["key"];

                    var path = Path.Combine(Server.MapPath("~/testEncryption"));
                    string pathString = System.IO.Path.Combine(path.ToString());
                    bool isExists = System.IO.Directory.Exists(pathString);
                    if (!isExists) System.IO.Directory.CreateDirectory(pathString);

                    filename = Path.GetFileName(fileupload1.PostedFile.FileName);

                    var uploadpath = string.Format("{0}\\{1}", pathString, filename);
                    var uploadenc = string.Format("{0}\\enc_{1}", pathString, filename);

                    fileupload1.PostedFile.SaveAs(uploadpath);

                    try
                    {

                        var watch = System.Diagnostics.Stopwatch.StartNew();
                        new Cryptography().EncryptFile(@key, uploadpath, uploadenc);
                        watch.Stop();
                        elapsedMs = watch.ElapsedMilliseconds.ToString();
                        Cryptography.encdecspeed = elapsedMs;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "countspeed('" + elapsedMs + "')", true);
                        //Response.Write("<script>alert(the speed of enc/dec is: '" + elapsedMs + "'ms)</script>");
                        string query = "INSERT INTO T_Encryption (Enc_type, Enc_speed) VALUES ('AES'," + elapsedMs + ")";
                        Connection.executeQuery(query);
                        System.Diagnostics.Debug.WriteLine("---------------------------------"+elapsedMs);
                        for (int attempts = 0; attempts < 10; attempts++)
                        {
                            try
                            {
                                Response.ContentType = "application/octet-stream";
                                
                                Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
                                
                                Response.TransmitFile(uploadenc);
                                Response.Flush();
                                if (File.Exists(uploadenc))
                                {
                                    File.Delete(uploadpath);
                                    File.Delete(uploadenc);
                                }
                                Response.End();
                                
                                break;

                            }
                            catch (IOException ex)
                            {

                            }
                            Thread.Sleep(100);
                        }
                        


                    }
                    catch
                    {

                    }
                    
                }
                if (Request.Form["decryptButton"] != null)
                {
                    string key = Request.Form["key"];

                    var path = Path.Combine(Server.MapPath("~/testEncryption"));
                    string pathString = System.IO.Path.Combine(path.ToString());
                    bool isExists = System.IO.Directory.Exists(pathString);
                    if (!isExists) System.IO.Directory.CreateDirectory(pathString);

                    filename = Path.GetFileName(fileupload1.PostedFile.FileName);
                    var uploadpath = string.Format("{0}\\{1}", pathString, filename);
                    var uploaddec = string.Format("{0}\\enc_{1}", pathString, filename);
                    fileupload1.PostedFile.SaveAs(uploadpath);

                    try
                    {

                        var watch = System.Diagnostics.Stopwatch.StartNew();
                        new Cryptography().DecryptFile(@key, uploadpath, uploaddec);
                        watch.Stop();
                        elapsedMs = watch.ElapsedMilliseconds.ToString();
                        Cryptography.encdecspeed = elapsedMs;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "countspeed('" + elapsedMs + "')", true);
                        //Response.Write("<script>alert(the speed of enc/dec is: '" + elapsedMs + "'ms)</script>");
                        string query = "INSERT INTO T_Encryption (Enc_type, Enc_speed) VALUES ('AES_Decrypt'," + elapsedMs + ")";
                        Connection.executeQuery(query);
                        System.Diagnostics.Debug.WriteLine("---------------------------------" + elapsedMs);
                        for (int attempts = 0; attempts < 10; attempts++)
                        {
                            try
                            {
                                Response.ContentType = "application/octet-stream";

                                Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);

                                Response.TransmitFile(uploaddec);
                                Response.Flush();
                                if (File.Exists(uploaddec))
                                {
                                    File.Delete(uploadpath);
                                    File.Delete(uploaddec);
                                }
                                Response.End();

                                break;

                            }
                            catch (IOException ex)
                            {

                            }
                            Thread.Sleep(100);
                        }



                    }
                    catch
                    {

                    }
                }
            }
        }



    }

}