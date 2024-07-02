using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fashion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtEmail.Text;
            string password = txtPassword.Text;

            if (ValidateUser(username, password))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đăng nhập thành công');", true);
                Response.Redirect("~/HomePage.aspx");
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đăng nhập không thành công. Vui lòng kiểm tra lại thông tin đăng nhập.');", true);
            }
        }
        public bool ValidateUser(string email, string password)
        {
            bool isValid = false;
            string query = "SELECT COUNT(*) FROM Account WHERE email = @email AND password = @password";
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\DA_kttmdt\DA_kttmdt\Fashion\Fashion\App_Data\DB.mdf;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        isValid = true;
                    }
                }
            }

            return isValid;
        }
    }
}