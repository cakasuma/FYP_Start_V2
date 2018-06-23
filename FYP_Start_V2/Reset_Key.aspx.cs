using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class Reset_Key : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["reset"] != null)
            {
                string key = Request.Form["key"];
                string hashkey = new Cryptography().HashPass(key);
                string email = Request.QueryString["email"];
                System.Diagnostics.Debug.WriteLine(hashkey);
                System.Diagnostics.Debug.WriteLine(email);
                Connection.executeQuery("UPDATE [T_User] SET [secret_key] = '" + hashkey + "' WHERE [Email] = '" + email + "'");
                Response.Redirect("Reset_Key.aspx?resetkeysuccess=true");
            }
        }
    }
}