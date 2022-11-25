using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace Restaurant_management_system.Pages
{
    public class UpdateDetailsModel : PageModel
    {
        public List<CustomerRegistration> list_name = new List<CustomerRegistration>();
        public CustomerRegistration update1 = new CustomerRegistration();
        public string success_msg = "";
        public string error_msg = "";
        public void OnGet()
        {

            try
            {
                update1.cust_id = Convert.ToInt32(Request.Query["id"]);

                

                string ConnectionString = "Data Source=INLPF3KSCQZ;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                
                SqlConnection sqlCon = new SqlConnection(ConnectionString);
                sqlCon.Open();
                string query = "select customer_name,customer_email,customer_password from registration where customer_id=@id";


                SqlCommand cmd = new SqlCommand(query, sqlCon);

                cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = update1.cust_id;
               

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    update1.cust_name = reader.GetString(0);
                    update1.cust_email = reader.GetString(1);
                    update1.cust_password = reader.GetString(2);
                    

                    list_name.Add(update1);


                }
                list_name.ForEach(x => Console.WriteLine(x.cust_id + " " + x.cust_name + " "  + x.cust_email));



                
                sqlCon.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine("Sql related problem");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine("C# related problem");
            }
        }


        public void OnPost()
        {
            try
            {
                update1.cust_id = Convert.ToInt32(Request.Query["id"]);


                string ConnectionString = "Data Source=INLPF3KSCQZ;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                SqlConnection sqlCon = new SqlConnection(ConnectionString);

                Console.WriteLine("OnPost");

                update1.cust_name = Request.Form["name"];
                
                update1.cust_email = Request.Form["email_id"];
                update1.cust_password = Request.Form["pass"];

                Console.WriteLine(update1.cust_name);
                Console.WriteLine(update1.cust_email);
                Console.WriteLine(update1.cust_password);
                

                sqlCon.Open();

                SqlCommand cmd = new SqlCommand("update_customer", sqlCon);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                cmd.Parameters.Add("@cus_id", System.Data.SqlDbType.Int).Value = update1.cust_id;
                cmd.Parameters.Add("@cus_name", System.Data.SqlDbType.VarChar).Value = update1.cust_name;
                cmd.Parameters.Add("@cus_email", System.Data.SqlDbType.VarChar).Value = update1.cust_email;
                cmd.Parameters.Add("@cus_pas", System.Data.SqlDbType.VarChar).Value = update1.cust_password;
                


                cmd.ExecuteNonQuery();



                sqlCon.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine("Sql related problem");
                error_msg = ex.Message;
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine("C# related problem");
                error_msg = ex.Message;
                return;
            }
           
           

        }

    }
    public class CustomerRegistration
    {
        public int cust_id;
        public string cust_name, cust_email, cust_password;
    }

}

