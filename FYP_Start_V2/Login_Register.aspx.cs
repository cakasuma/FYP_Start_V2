using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Start_V2
{
    public partial class Login_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Login"] != null)
            {
                String Email = Request.Form["emaillog"];
                String Password = Request.Form["passlog"];
                if (new Connection().Login(Email, Password) == true)
                {
                    String currentUser = Session["UserType"].ToString();
                    if (currentUser.Equals("Customer"))
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else if (currentUser.Equals("Admin"))
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Response.Write("Login Failed");
                    }
                }
            }

            if(Request.QueryString["Register"] != null)
            {
                String Email = Request.Form["emailreg"]; ;
                String Password = Request.Form["passreg"]; ;
                String Name = Request.Form["namereg"]; ;
                String Contact = Request.Form["contactreg"]; ;
                String UserType = "Customer";
                Connection.executeQuery("Insert into T_User (Name, Email, Password, Contact, User_Type) values ('" + Name + "','" + Email + "','" + Password + "','" + Contact + "','" + UserType + "')");
                Response.Redirect("Login_Register.aspx?UserRegistrationSuccessful=True");
            }
        }
    }
}