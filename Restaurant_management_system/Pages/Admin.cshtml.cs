using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;


namespace Restaurant_management_system.Pages
{
    public class AdminModel : PageModel
    {
        public Admin a = new Admin();
        public string success_msg = "";
        public string error_msg = "";
        public void OnPost()
        {
            try
            {
                string connection = "Data Source=INLPF3KSCQZ;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                SqlConnection conn = new SqlConnection(connection);


                a.admin_email = Request.Form["AdminEmail"];
                a.admin_password = Request.Form["AdminPassword"];

                conn.Open();

                SqlCommand cmd = new SqlCommand("admin_verify", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                cmd.Parameters.Add("@a_email", System.Data.SqlDbType.VarChar).Value = a.admin_email;
                cmd.Parameters.Add("@a_pass", System.Data.SqlDbType.VarChar).Value = a.admin_password;


               // cmd.ExecuteNonQuery();
                SqlDataReader reader = cmd.ExecuteReader();
                int check = 0;
                while (reader.Read())
                {
                    check = reader.GetInt32(0);

                    if (check == 1)
                    {
                        success_msg = "Successfully Logged In";
                    }

                }
                if (check == 0)
                {
                    error_msg = "Enter the correct credentials";
                }

                conn.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine("Sql Related Issue");
                error_msg = "Error -sql problem";

                return;
            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.Message);
                Console.WriteLine("C# related Issue");
                error_msg = "Error C# problem";

                return;
            }

        }
        public class Admin {
            public int admin_id;
            public string admin_email;
            public string admin_password;
        }
    }

}

