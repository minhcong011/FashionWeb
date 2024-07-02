using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fashion
{
    public partial class CartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            LoadCart();
        }

        private void LoadCart()
        {
            var cart = Session["Cart"] as List<CartItem>;
            if (cart == null || cart.Count == 0)
            {
                ProductRepeater.DataSource = null;
                ProductRepeater.DataBind();
                TotalPriceLabel.Text = "0₫";
                return;
            }

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\DA_kttmdt\DA_kttmdt\Fashion\Fashion\App_Data\DB.mdf;Integrated Security=True";

            var productDetails = new List<CartItem>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                foreach (var item in cart)
                {
                    string query = "SELECT id, name, price,decription, imageUrl, type FROM Produce WHERE id = @id";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@id", item.ProductId);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                item.ProductName = reader["name"].ToString();
                                int amount = Convert.ToInt32(reader["price"]);
                                item.ProductPriceInt = amount;
                                item.ProductPrice = string.Format("{0:N0}₫", amount);
                                item.ProductImage = reader["imageUrl"].ToString();
                                item.totalPriceInt = item.ProductPriceInt * item.Quantity;
                                item.TotalPrice = string.Format("{0:N0}₫", item.totalPriceInt);
                                productDetails.Add(item);
                            }
                        }
                    }
                }
            }

            ProductRepeater.DataSource = productDetails;
            ProductRepeater.DataBind();

            decimal totalPrice = productDetails.Sum(i => i.totalPriceInt);
            TotalPriceLabel.Text = string.Format("{0:N0}₫", totalPrice);
        }

        protected void IncreaseQuantity_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var productId = button.CommandArgument;

            var cart = Session["Cart"] as List<CartItem>;
            if (cart != null)
            {
                var item = cart.FirstOrDefault(i => i.ProductId == productId);
                if (item != null)
                {
                    item.Quantity++;
                    Session["Cart"] = cart;
                }
            }

            LoadCart();
        }

        protected void DecreaseQuantity_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var productId = button.CommandArgument;
            var cart = Session["Cart"] as List<CartItem>;
            if (cart != null)
            {
                var item = cart.FirstOrDefault(i => i.ProductId == productId);
                if (item != null && item.Quantity > 1)
                {
                    item.Quantity--;
                    Session["Cart"] = cart;
                }
            }

            LoadCart();
        }
        protected void RemoveItem_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                string productId = e.CommandArgument.ToString();
                var cart = Session["Cart"] as List<CartItem>;
                if (cart != null)
                {
                    var itemToRemove = cart.FirstOrDefault(i => i.ProductId == productId);
                    if (itemToRemove != null)
                    {
                        cart.Remove(itemToRemove);
                        Session["Cart"] = cart;
                    }
                }

                LoadCart();
            }
        }
        protected void QuantityTextBox_TextChanged(object sender, EventArgs e)
        {
            TextBox textBox = (TextBox)sender;
            string productId = textBox.Attributes["data-productid"];
            int newQuantity = Convert.ToInt32(textBox.Text);
            var cart = Session["Cart"] as List<CartItem>;
            if (cart != null)
            {
                var item = cart.FirstOrDefault(i => i.ProductId == productId);
                if (item != null)
                {
                    item.Quantity = newQuantity;
                    Session["Cart"] = cart;
                }
            }

            LoadCart();
        }

    }
}
public class CartItem
{
    public string ProductId { get; set; }
    public string ProductName { get; set; }
    public int ProductPriceInt { get; set; }

    public string ProductPrice { get; set; }
    public string ProductImage { get; set; }
    public int Quantity { get; set; }
    public int totalPriceInt { get; set; }
    public string TotalPrice { get; set; }
    public string ProductLink => $"/product/{ProductId}";
}