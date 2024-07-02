<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Menu.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="Fashion.SanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .body{
            margin: 20px 300px 0 300px; 
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            grid-template-rows: 280px;
            grid-gap: 30px;
            grid-column: 3;
            justify-content: center;
        }

        .product-item {
            padding: 5px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            .product-item text {
                text-decoration: none;
            }

        .product-image {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
            display: inline-block;
            transition: box-shadow 0.3s ease;
             transition: max-width 0.3s ease;
              transition: max-height 0.3s ease;
        }

            .product-image:hover {
                max-width: 102%;
                max-height: 102%;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            }

        .name {
            text-decoration: none;
            font-size: 15px;
            color: #444444;
        }

        .price {
            color: #fda434;
            text-decoration: none;
            font-size: 20px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            color: #333;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color 0.3s;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: #fda434;
            color: white;
            border-color: #fda434;
        }

        .pagination a:hover:not(.active) {
            background-color: #ddd;
        }
    </style>

    <div id="MainProduct">
        <div class="contai_mainPro">
            <div>
                <asp:Image runat="server" ImageUrl="img\produce\banner.png" Style="display: flex; max-width: 100%; margin-top: 10px" />
                <div class="body">
                    <h4 >Sản phẩm</h4>
                    <div class="products-grid">
                        <asp:Repeater ID="ProductsRepeater" runat="server">
                            <ItemTemplate>
                                <div class="product-item">
                                    <a href='<%# Eval("id", "../ProductInfoPage.aspx?id={0}") %>' class="button">
                                        <asp:Image CssClass="product-image" runat="server" ImageUrl='<%# Eval("imageUrl") %>' />
                                    </a>
                                    <h3 class="name"><%# Eval("name") %></h3>
                                    <p class="price"><%# Eval("price") %>đ</p>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                     <div class="pagination">
                        <asp:Literal ID="PaginationLiteral" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

