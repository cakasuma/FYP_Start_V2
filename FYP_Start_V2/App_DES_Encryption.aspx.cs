using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class App_DES_Encryption : System.Web.UI.Page
    {
        public string elapsedMs = "";
        public string filename = "";
        public string uploadpathenc = "";
        public string uploadpathdec = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["testencrypt"] != null)
            {
                if (Request.Form["encryptButton"] != null)
                {
                    string key = Request.Form["key"];
                    string filepath = Server.MapPath("//testEncryption//");
                    filename = Path.GetFileName(fileupload1.PostedFile.FileName);
                    uploadpathenc = string.Format("{0}enc_{1}", filepath, filename);
                    fileupload1.PostedFile.SaveAs(uploadpathenc);

                    try
                    {

                        var watch = System.Diagnostics.Stopwatch.StartNew();
                        Cryptography.EncryptFileDES(uploadpathenc, @key);
                        watch.Stop();
                        elapsedMs = watch.ElapsedMilliseconds.ToString();
                        Cryptography.encdecspeed = elapsedMs;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "countspeed('" + elapsedMs + "')", true);
                        //Response.Write("<script>alert(the speed of enc/dec is: '" + elapsedMs + "'ms)</script>");
                        string query = "INSERT INTO T_Encryption (Enc_type, Enc_speed) VALUES ('DES'," + elapsedMs + ")";
                        Connection.executeQuery(query);
                        System.Diagnostics.Debug.WriteLine("---------------------------------" + elapsedMs);
                        for (int attempts = 0; attempts < 10; attempts++)
                        {
                            try
                            {
                                Response.ContentType = "application/octet-stream";

                                Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);

                                Response.TransmitFile(uploadpathenc);
                                Response.Flush();
                                if (File.Exists(uploadpathenc))
                                {
                                    File.Delete(uploadpathenc);
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
                    string filepath = Server.MapPath("//testEncryption//");
                    filename = Path.GetFileName(fileupload1.PostedFile.FileName);
                    uploadpathdec = string.Format("{0}dec_{1}", filepath, filename);
                    fileupload1.PostedFile.SaveAs(uploadpathdec);

                    try
                    {

                        var watch = System.Diagnostics.Stopwatch.StartNew();
                        Cryptography.DecryptFileDES(uploadpathdec, @key);
                        watch.Stop();
                        elapsedMs = watch.ElapsedMilliseconds.ToString();
                        Cryptography.encdecspeed = elapsedMs;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "countspeed('" + elapsedMs + "')", true);
                        //Response.Write("<script>alert(the speed of enc/dec is: '" + elapsedMs + "'ms)</script>");
                        string query = "INSERT INTO T_Encryption (Enc_type, Enc_speed) VALUES ('DES_Decrypt'," + elapsedMs + ")";
                        Connection.executeQuery(query);
                        System.Diagnostics.Debug.WriteLine("---------------------------------" + elapsedMs);
                        for (int attempts = 0; attempts < 10; attempts++)
                        {
                            try
                            {
                                Response.ContentType = "application/octet-stream";

                                Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);

                                Response.TransmitFile(uploadpathdec);
                                Response.Flush();
                                if (File.Exists(uploadpathdec))
                                {
                                    File.Delete(uploadpathdec);
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