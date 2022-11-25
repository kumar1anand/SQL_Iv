using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace Restaurant_management_system.Pages
{
    public class BillGeneratorModel : PageModel
    {
        public List<customer_bill> c_list = new List<customer_bill>();
       
        public void OnGet()
        {
            try
            {
                int c_id = Convert.ToInt32(Request.Query["cust_id"]);
                string ConnectionString = "Data Source=INLPF3KSCQZ;Initial Catalog=master;trusted_connection=true";
                SqlConnection sqlCon = new SqlConnection(ConnectionString);
                sqlCon.Open();

                string query = "Select a.pizza,b.pizza_price,a.burger,b.burger_price,a.fries,b.fries_price,a.pasta,b.pasta_price,a.pizza*b.pizza_price+a.burger*b.burger_price+a.fries*b.fries_price+a.pasta*b.pasta_price as totalOrder from customerOrder a,orderPrice b where customer_id=@id";
                SqlCommand cmd = new SqlCommand(query, sqlCon);

                cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = c_id;

                SqlDataReader reader = cmd.ExecuteReader();



                while (reader.Read())
                {
                    customer_bill i1 = new customer_bill();

                    i1.pizza = reader.GetInt32(0);
                    i1.pizza_price = reader.GetInt32(1);
                    i1.burger = reader.GetInt32(2);
                    i1.burger_price = reader.GetInt32(3);
                    i1.fries = reader.GetInt32(4);
                    i1.fries_price = reader.GetInt32(5);
                    i1.pasta = reader.GetInt32(6);
                    i1.pasta_price = reader.GetInt32(7);
                    i1.total_bill = reader.GetInt32(8);

                    c_list.Add(i1);


                }
                reader.Close();
                sqlCon.Close();

            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine("Sql Related Issue");
                return;
            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.Message);
                Console.WriteLine("C# related Issue");
                return;

            }




        }
    }
    public class customer_bill
    {
        public int cust_id, pizza,pizza_price, burger,burger_price, fries,fries_price, pasta,pasta_price ,total_bill;
    }
   
}
