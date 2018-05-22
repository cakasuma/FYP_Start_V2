using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthenticatedEncryption;

namespace FYP_Start_V2
{
    public partial class testEncryption : System.Web.UI.Page
    {
        private byte[] cryptKey = null;
        private byte[] authKey = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            cryptKey = AuthenticatedEncryption.AuthenticatedEncryption.NewKey();
            authKey = AuthenticatedEncryption.AuthenticatedEncryption.NewKey();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string input = TextBox1.Text;
            string chipherText = AuthenticatedEncryption.AuthenticatedEncryption.Encrypt(input, cryptKey, authKey);
            string plainText = AuthenticatedEncryption.AuthenticatedEncryption.Decrypt(chipherText, cryptKey, authKey);
            Label1.Text = chipherText;
            Label2.Text = plainText;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string chipher = Label1.Text;
            string plainText = AuthenticatedEncryption.AuthenticatedEncryption.Decrypt(chipher, cryptKey, authKey);
            Label3.Text = plainText;
        }
    }
}