using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;


namespace Restaurant_management_system.Pages
{
    public class LoginModel : PageModel
    {
        public List<CustomerRegistration> stu_list = new List<CustomerRegistration>();
        public CustomerRegistration c = new CustomerRegistration();
        public string success_msg = "";
        public string error_msg = "";

        public void OnPost()
        {
            try
            {
                string connection = "Data Source=INLPF3KSCQZ;Initial Catalog=master;trusted_connection=true";
                SqlConnection conn = new SqlConnection(connection);
                c.cust_email = Request.Form["CustomerEmail"];
                c.cust_password = Request.Form["CustomerPassword"];
                conn.Open();

                SqlCommand cmd = new SqlCommand("chech_customer_credential", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                cmd.Parameters.Add("@c_email", System.Data.SqlDbType.VarChar).Value = c.cust_email;
                cmd.Parameters.Add("@c_pass", System.Data.SqlDbType.VarChar).Value = c.cust_password;
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
                reader.Close();

                SqlCommand cmd1 = new SqlCommand("cust_fetch", conn);
                cmd1.CommandType = System.Data.CommandType.StoredProcedure;


                cmd1.Parameters.Add("@c_email", System.Data.SqlDbType.VarChar).Value = c.cust_email;
                cmd1.Parameters.Add("@c_pass", System.Data.SqlDbType.VarChar).Value = c.cust_password;

                SqlDataReader reader1 = cmd1.ExecuteReader();


                while (reader1.Read())
                {
                    CustomerRegistration s2 = new CustomerRegistration();

                    s2.cust_email = reader1.GetString(0);
                    s2.cust_password = reader1.GetString(1);

                    stu_list.Add(s2);
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

    }

}
 public class CustomerRegistration
    {
        public int cust_id;
        public string cust_name, cust_email, cust_password;
    }


