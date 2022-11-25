using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;



namespace Restaurant_management_system.Pages
{
    public class ResistrationModel : PageModel
    {
        public CustomerRegistration c = new CustomerRegistration();
        public string success_msg = "";
        public string error_msg = "";
        public void OnPost()
        {
            try
            {
                string connection = "Data Source=INLPF3KSCQZ;Initial Catalog=master;trusted_connection=true";
                SqlConnection conn = new SqlConnection(connection);

                c.cust_name = Request.Form["customerName"];
                c.cust_email = Request.Form["CustomerEmail"];
                c.cust_password = Request.Form["CustomerPassword"];

                conn.Open();

                SqlCommand cmd = new SqlCommand("customer_registration", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("@c_name", System.Data.SqlDbType.VarChar).Value = c.cust_name;
                cmd.Parameters.Add("@c_email", System.Data.SqlDbType.VarChar).Value = c.cust_email;
                cmd.Parameters.Add("@c_password", System.Data.SqlDbType.VarChar).Value = c.cust_password;


                cmd.ExecuteNonQuery();              


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
            success_msg = "Registration Successful";

        }


    }

}

