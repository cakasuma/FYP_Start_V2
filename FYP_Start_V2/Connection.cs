using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FYP_Start_V2
{
    public class Connection
    {
        public static SqlConnection getConnection()
        {
            SqlConnection conn = null;

            conn = new SqlConnection(@"Data Source=fypstartv2dbserver.database.windows.net;Initial Catalog=FYPStartV2_db;Integrated Security=False;User ID=Cakasuma;Password=P@$$w0rd15951;Connect Timeout=15;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            return conn;
        }

        public static void executeQuery(String strQuery)
        {


            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(strQuery, conn);
            cmd.ExecuteNonQuery();
            closeConnection(conn);

        }

        public static int executeQueryVerification(String strQuery)
        {
            int rowsAffected = 0;

            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(strQuery, conn);
            rowsAffected = cmd.ExecuteNonQuery();
            closeConnection(conn);

            return rowsAffected;
        }

        public static int executeQueryRegister(String[] regUserData)
        {
            int userId = 0;
            SqlConnection conn = getConnection();
            SqlCommand cmd = new SqlCommand("Register_User", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", regUserData[0]);
            cmd.Parameters.AddWithValue("@Password", regUserData[1]);
            cmd.Parameters.AddWithValue("@Name", regUserData[2]);
            cmd.Parameters.AddWithValue("@Contact", regUserData[3]);
            cmd.Parameters.AddWithValue("@User_Type", regUserData[4]);
            try
            {
                conn.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                throw new Exception("Execption adding account. " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return userId;

        }


        public static void closeConnection(SqlConnection conn)
        {

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

        }

        public bool[] Login(String email, String password)
        {
            String query = "Select * from T_User inner join UserActivation on T_User.User_Id = UserActivation.UserId where Email = '" + email + "' and Password = '" + password + "'";
            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            bool[] flag = { false, false };
            if (sdr.HasRows)
            {
                flag[0] = true;
                System.Web.HttpContext.Current.Session["Email"] = email;

                while (sdr.Read())
                {
                    flag[1] = Convert.ToBoolean(sdr["verified"].ToString());
                    System.Web.HttpContext.Current.Session["UserType"] = sdr["User_Type"].ToString();
                }

            }
            closeConnection(conn);
            return flag;
        }


    }
}