using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    
    public partial class Reset_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["reset"] != null)
            {
                string pass = Request.Form["pass"];
                string hashpass = new Cryptography().HashPass(pass);
                string email = Request.QueryString["email"];
                System.Diagnostics.Debug.WriteLine(hashpass);
                System.Diagnostics.Debug.WriteLine(email);
                Connection.executeQuery("UPDATE [T_User] SET [Password] = '"+hashpass+"' WHERE [Email] = '"+email+"'");
                Response.Redirect("Reset_Password.aspx?resetsuccess=true");
            }
        }
    }
}