using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;


namespace Restaurant_management_system.Pages
{
    public class pizzaModel : PageModel
    {
        public CustomerRegistration c1=new CustomerRegistration();
        public ItemPrice i1=new ItemPrice();
        public CustomerOrder co = new CustomerOrder();
        public string success_msg = "";
        public string error_msg = "";
        public string cust_n = "";
        public int custom_id = 0;

        public void OnGet()
        {
            try
            {
                c1.cust_email = Request.Query["cust_email"];
                c1.cust_password = Request.Query["cust_password"];


                string ConnectionString = "Data Source=INLPF3KSCQZ;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

                SqlConnection sqlCon = new SqlConnection(ConnectionString);
                sqlCon.Open();
                string query = "select pizza_price,burger_price,fries_price,pasta_price from OrderPrice";
                string query1 = "select customer_name from registration where customer_email=@cust_email and customer_password=@cust_password";
                SqlCommand cmd = new SqlCommand(query, sqlCon);

                SqlCommand cmd1 = new SqlCommand(query1, sqlCon);
                cmd1.Parameters.Add("@cust_email", System.Data.SqlDbType.VarChar).Value = c1.cust_email;
                cmd1.Parameters.Add("@cust_password", System.Data.SqlDbType.VarChar).Value =c1.cust_password;





                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    i1.pizza_p = reader.GetInt32(0);
                    i1.burger_p = reader.GetInt32(1);
                    i1.fries_p = reader.GetInt32(2);
                    i1.pasta_p = reader.GetInt32(0);
                }
                reader.Close();

                SqlDataReader reader1=cmd1.ExecuteReader();
                while(reader1.Read())
                {
                    cust_n = "Hi," + reader1.GetString(0);
                }
                reader1.Close();
                sqlCon.Close();
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

        public void OnPost()
        {
            try { 
            c1.cust_email = Request.Query["cust_email"];
            c1.cust_password = Request.Query["cust_password"];

            string ConnectionString = "Data Source=INLPF3KSCQZ;Initial Catalog=master;trusted_connection=true";

            SqlConnection sqlCon = new SqlConnection(ConnectionString);
            sqlCon.Open();
            string query = "select customer_id,customer_name from registration where customer_email=@email and customer_password=@password ";
            SqlCommand cmd = new SqlCommand(query, sqlCon);

            cmd.Parameters.Add("@email", System.Data.SqlDbType.VarChar).Value = c1.cust_email;
            cmd.Parameters.Add("@password", System.Data.SqlDbType.VarChar).Value = c1.cust_password;

            SqlDataReader reader = cmd.ExecuteReader();


              

            while (reader.Read())
            {
                custom_id = reader.GetInt32(0);
                    
              }
            reader.Close();
            Console.WriteLine(cust_n);

            co.pizza = Convert.ToInt32(Request.Form["pizza"]);
            co.burger = Convert.ToInt32(Request.Form["burger"]);
            co.fries = Convert.ToInt32(Request.Form["fries"]);
            co.pasta = Convert.ToInt32(Request.Form["pasta"]);


            SqlCommand cmd1 = new SqlCommand("customer_order", sqlCon);
            cmd1.CommandType = System.Data.CommandType.StoredProcedure;


            cmd1.Parameters.Add("@cust_id", System.Data.SqlDbType.Int).Value = custom_id;
            cmd1.Parameters.Add("@piz_q", System.Data.SqlDbType.Int).Value = co.pizza;
            cmd1.Parameters.Add("@bug_q", System.Data.SqlDbType.Int).Value = co.burger;
            cmd1.Parameters.Add("@fri_q", System.Data.SqlDbType.Int).Value = co.fries;
            cmd1.Parameters.Add("@pasta_q", System.Data.SqlDbType.Int).Value = co.pasta;

            cmd1.ExecuteNonQuery();

             


            sqlCon.Close();
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
        public class ItemPrice
        {
            public int pizza_p, burger_p, pasta_p, fries_p;
        }

        public class CustomerOrder
        {
           public int customer_id, customer_order, pizza, burger, fries, pasta;
        }

    }
}
