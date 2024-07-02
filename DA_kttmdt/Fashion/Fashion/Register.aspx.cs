using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fashion
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!IsValidEmail(email.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('email không hợp lệ');", true);
                return;
            }
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\DA_kttmdt\DA_kttmdt\Fashion\Fashion\App_Data\DB.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string checkQuery = "SELECT COUNT(*) FROM Account WHERE email = @email";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@email", email.Text);

                    int count = (int)checkCmd.ExecuteScalar();
                    if (count > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email đã tồn tại. Vui lòng sử dụng email khác.');", true);
                        return;
                    }
                }

                string query = "INSERT INTO Account (surname, name, email, phoneNumber, password) VALUES (@surname, @name, @email, @phoneNumber, @password)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@surname", surnumber.Text);
                    cmd.Parameters.AddWithValue("@name", name.Text);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    cmd.Parameters.AddWithValue("@phoneNumber", phoneNumber.Text);
                    cmd.Parameters.AddWithValue("@password", password.Text);

                    cmd.ExecuteNonQuery();
                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đăng ký thành công');", true);

            //Response.Redirect("Login.aspx");
        }
        private bool IsValidEmail(string email)
        {
            string pattern = @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(email);
        }
    }
}