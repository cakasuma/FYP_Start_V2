using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class App_RSA_Encryption : System.Web.UI.Page
    {

        public string pubkey = "";
        public string prikey = "";
        public string elapsedMs = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            int keySize = 1024;
            var keys = EncryptorRSA.GenerateKeys(keySize);
            pubkey = keys.PublicKey;
            
            prikey = keys.PrivateKey;
            

            if (Request.QueryString["testencrypt"] != null)
            {
                if (Request.Form["encryptButton"] != null)
                {
                    string text = Request.Form["testtext"];
                    var watch = System.Diagnostics.Stopwatch.StartNew();
                    string encrypted = EncryptorRSA.EncryptText(text, pubkey);
                    watch.Stop();
                    elapsedMs = watch.ElapsedMilliseconds.ToString();
                    Cryptography.encdecspeed = elapsedMs;
                    Cryptography.pubkey = pubkey;
                    Cryptography.prikey = prikey;
                    testenc.InnerText = encrypted;
                    string query = "INSERT INTO T_Encryption (Enc_type, Enc_speed) VALUES ('RSA'," + elapsedMs + ")";
                    Connection.executeQuery(query);
                }
                if (Request.Form["decryptButton"] != null)
                {
                    string textenc = Request.Form["testtext"];
                    var watch = System.Diagnostics.Stopwatch.StartNew();
                    string decrypted = EncryptorRSA.DecryptText(textenc, Cryptography.prikey);
                    watch.Stop();
                    elapsedMs = watch.ElapsedMilliseconds.ToString();
                    Cryptography.encdecspeed = elapsedMs;
                    testenc.InnerText = decrypted;
                    string query = "INSERT INTO T_Encryption (Enc_type, Enc_speed) VALUES ('RSA_Decrypt'," + elapsedMs + ")";
                    Connection.executeQuery(query);
                }
            }

        }
    }
}