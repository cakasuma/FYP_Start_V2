using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FYP_Start_V2
{
    public partial class Default : System.Web.UI.MasterPage
    {
        public string name = "";
        public string email = "";
        public string photourl = "";
        public string userid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                email = Session["email"].ToString();
                name = Connection.getUserName(email);
                userid = Connection.getUserID(email);
                photourl = Connection.getPhotoUrl(email);
            }
        }


    }
}