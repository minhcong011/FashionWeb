using System;
using System.Data.SqlClient;

namespace Fashion
{
    public partial class SanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts()
        {
            string productType = Request.QueryString["type"];
            int currentPage = 1;
            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                currentPage = Convert.ToInt32(Request.QueryString["page"]);
            }
            int pageSize = 8;
            int startRow = (currentPage - 1) * pageSize + 1;
            int endRow = currentPage * pageSize;

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\DA_kttmdt\DA_kttmdt\Fashion\Fashion\App_Data\DB.mdf;Integrated Security=True";

            string query = @"
    SELECT id, name, price, imageUrl, type
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY id) AS RowNum, id, name, price, imageUrl, type
        FROM Produce";
            if (Request.QueryString["type"] != null)
            {
                query += " WHERE type = @Type";
            }

            query += @"
    ) AS ProductsWithRowNumbers
    WHERE RowNum BETWEEN @StartRow AND @EndRow";
            if (Request.QueryString["filter"] != null)
            {
                query = "SELECT * FROM Produce ";
                switch (Request.QueryString["filter"])
                {
                    case "noiBat":
                        {
                            query += "WHERE noiBat = 'True'";
                            break;
                        }
                    case "hotTrend":
                        {
                            query += "WHERE hotTrend = 'True'";
                            break;
                        }
                    case "khuyenMai":
                        {
                            query += "WHERE khuyenMai = 'True'";
                            break;
                        }
                }
            }
            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, sqlConn);

                if (Request.QueryString["type"] != null)
                {
                    cmd.Parameters.AddWithValue("@Type", productType);
                }

                cmd.Parameters.AddWithValue("@StartRow", startRow);
                cmd.Parameters.AddWithValue("@EndRow", endRow);

                sqlConn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ProductsRepeater.DataSource = reader;
                ProductsRepeater.DataBind();
            }

            DisplayPagination(currentPage);

        }

        private void DisplayPagination(int currentPage)
        {
            string productType = Request.QueryString["type"];
            int pageSize = 8;
            int totalProductsCount = GetTotalProductsCount(productType);
            int totalPages = (int)Math.Ceiling((double)totalProductsCount / pageSize);

            PaginationLiteral.Text = "";
            for (int i = 1; i <= totalPages; i++)
            {
                if (i == currentPage)
                {
                    if (Request.QueryString["type"] != null) PaginationLiteral.Text += $"<a class=\"active\" href=\"ProductPage.aspx?type={productType}&page={i}\">{i}</a>";
                    else PaginationLiteral.Text += $"<a class=\"active\" href=\"ProductPage.aspx?page={i}\">{i}</a>";
                }
                else
                {
                    if (Request.QueryString["type"] != null) PaginationLiteral.Text += $"<a href=\"ProductPage.aspx?type={productType}&page={i}\">{i}</a>";
                    else PaginationLiteral.Text += $"<a href=\"ProductPage.aspx?page={i}\">{i}</a>";
                }
            }
        }

        private int GetTotalProductsCount(string productType)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\DA_kttmdt\DA_kttmdt\Fashion\Fashion\App_Data\DB.mdf;Integrated Security=True";
            string query = "SELECT COUNT(*) FROM Produce";

            if (Request.QueryString["type"] != null)
            {
                query += " WHERE type = @Type";
            }
            if (Request.QueryString["filter"] != null)
            {
                switch (Request.QueryString["filter"])
                {
                    case "noiBat":
                        query += " WHERE noiBat = 'True'";
                        break;
                    case "hotTrend":
                        query += " WHERE hotTrend = 'True'";
                        break;
                    case "khuyenMai":
                        query += " WHERE khuyenMai = 'True'";
                        break;
                }
            }

            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, sqlConn);
                if (Request.QueryString["type"] != null)
                    cmd.Parameters.AddWithValue("@Type", productType);

                sqlConn.Open();
                int totalRows = (int)cmd.ExecuteScalar();
                return totalRows;
            }
        }
    }
}
