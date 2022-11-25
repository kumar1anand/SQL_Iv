using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
namespace Restaurant_management_system.Pages
{
    public class AdminPageModel : PageModel
    {
        public List<customer_info> list_name = new List<customer_info>();
        public void OnGet()
        {
            try
            {

                string ConnectionString = "Data Source=INLPF3KSCQZ;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                // string ConnectionString1 = _configuration.GetConnectionString("DefaultConnection");
                
                SqlConnection sqlCon = new SqlConnection(ConnectionString);
                sqlCon.Open();
                string query = "select * from registration";

                SqlCommand cmd = new SqlCommand(query, sqlCon);
                // cmd.CommandType = System.Data.CommandType.StoredProcedure;

                //cmd.ExecuteNonQuery();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    customer_info info = new customer_info();

                    info.c_id = reader.GetInt32(0);
                    info.c_name = reader.GetString(1);
                    info.c_email = reader.GetString(2);
                    info.c_pass = reader.GetString(3);                 

                    list_name.Add(info);

                }
                // list_name.ForEach(x=> Console.WriteLine(x.s_id+" "+x.s_name+" "+x.amount+" "+x.city+" "+x.email_id));

                //Console.Log(list_name);
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
    
    }
    public class customer_info 
    {
        public int c_id;
        public string c_name,c_email,c_pass;
    }
}
