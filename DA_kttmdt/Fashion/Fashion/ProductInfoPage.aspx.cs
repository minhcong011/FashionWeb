using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fashion
{
    public partial class ProductInfoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int productID = Convert.ToInt32(Request.QueryString["id"]);
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\DA_kttmdt\DA_kttmdt\Fashion\Fashion\App_Data\DB.mdf;Integrated Security=True";

            string query = "SELECT id, name, price,decription, imageUrl, type FROM Produce WHERE id = @id";

            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, sqlConn);
                cmd.Parameters.AddWithValue("@id", productID);

                sqlConn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    product_name.Text = rd["name"].ToString();
                    product_price.Text = $"{rd["price"]}đ";
                    product_image.ImageUrl = rd["imageUrl"].ToString();
                    Decription.Text = rd["decription"].ToString();
                }
            }
        }
        protected void QuatityDownBt_Click(object sender, EventArgs e)
        {
            ChangeQuality(-1);
        }

        protected void QuatityUpBt_Click(object sender, EventArgs e)
        {
            ChangeQuality(1);
        }
        private void ChangeQuality(int valueChange)
        {
            int currentValue = Convert.ToInt32(QuatityTextBox.Text);
            currentValue += valueChange;
            if (currentValue < 0) currentValue = 0;
            QuatityTextBox.Text = currentValue.ToString();
        }

        protected void AddCartBt_Click(object sender, EventArgs e)
        {
            AddToCart(Request.QueryString["id"], Convert.ToInt32(QuatityTextBox.Text));
        }
        protected void AddToCart(string productId, int quantity)
        {
            var cart = Session["Cart"] as List<CartItem>;
            if (cart == null)
            {
                cart = new List<CartItem>();
            }

            var existingItem = cart.FirstOrDefault(i => i.ProductId == productId);
            if (existingItem != null)
            {
                existingItem.Quantity += quantity;
            }
            else
            {
                cart.Add(new CartItem { ProductId = productId, Quantity = quantity });
            }

            Session["Cart"] = cart;
        }
    }
}