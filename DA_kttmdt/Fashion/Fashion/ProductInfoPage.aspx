<%@ Page Language="C#" MasterPageFile="~/Master/Menu.master" AutoEventWireup="true" CodeBehind="ProductInfoPage.aspx.cs" Inherits="Fashion.ProductInfoPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .product-details {
            max-width: 1000px;
            margin: 20px auto;
            padding: 0px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

            .product-details .product-image {
                flex: 1;
                text-align: center;
                width: 450px;
                height: 500px;
                border-radius: 5px;
            }

            .product-details .product-info {
                margin-left: 100px;
                flex: 1;
            }

            .product-details h2 {
                margin-top: 0;
            }

        .product-name {
            font-size: 20px;
            font-weight: bold;
        }

        .product-price {
            font-size: 25px;
            color: #f57877;
            font-weight: bold;
        }

        .product-info ul {
            list-style-type: none;
            padding: 0;
        }

            .product-info ul li {
                margin-top: 30px;
            }

        .product-code {
            font-size: 12px;
            color: gray;
        }

        .transposs-free {
            display: flex;
        }

            .transposs-free .icon {
                flex: 1;
                width: 10px;
                height: 50px;
            }

            .transposs-free .content {
                flex: 2;
                margin-left: 20px;
            }

                .transposs-free .content .p1 {
                    font-size: 15px;
                    font-weight: bold;
                }

                .transposs-free .content .p2 {
                    font-size: 13px;
                    color: grey;
                }

        .quatity-change {
            display: flex;
            height: 40px;
        }

        .quatity-text {
            box-sizing: border-box;
            font-size: 15px;
            color: black;
            text-align: center;
            font-weight: bold;
            Width: 50px;
            height: 100%;
            border-top-width: 0.3px;
            border-bottom-width: 0.3px;
            border-left-width: 0px;
            border-right-width: 0px;
            border-style: solid;
            border-color: gainsboro;
        }

        .up-bt {
            width: 40px;
            height: 100%;
            color: red;
            border-style: solid;
            border-width: 0.3px;
            border-color: gainsboro;
            border-radius: 0px 5px 5px 0px;
            background-color: white;
        }
        .up-bt:hover{
            background-color: #1b5a3f;
                        color: white;
        }
        .down-bt {
            color: red;
            width: 40px;
            height: 100%;
            border-style: solid;
            border-width: 0.3px;
            border-color: gainsboro;
            border-radius: 5px 0 0 5px;
            background-color: white;
        }
         .down-bt:hover{
            background-color: #1b5a3f;
            color: white;
        }
        .buy-bt {
            margin-top: 20px;
            width: 100%;
            height: 50px;
            border-radius: 10px;
            border-width: 0px;
            background-color: #1b5a3f;
            color: white;
            font-weight: bold;
        }

            .buy-bt:hover {
                background-color: orange;
            }

        .addCart-bt {
            margin-top: 20px;
            width: 100%;
            height: 50px;
            border-radius: 10px;
            border-color: #1b5a3f;
            font-weight: bold;
        }
        .addCart-bt:hover{
             background-color: orange;
              border-width: 0px;
        }
        .auto-style1 {
            font-size: 15px;
            color: gray;
            font-weight: bold;
            Width: 137px;
            height: 22px;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <h4>Thông tin mặt hàng</h4>
    <div class="product-details">
        <asp:Image CssClass="product-image" ID="product_image" runat="server" ImageUrl="\img\product\Ao1.png" />
        <div class="product-info">
            <asp:Label CssClass="product-name" ID="product_name" runat="server">Quan ao</asp:Label>
            <br />
            <p class="product-code">Mã sp: Đang cập nhật</p>
            <ul>
                <li>
                    <asp:Label CssClass="product-price" ID="product_price" runat="server">15000đ</asp:Label>
                </li>
                <li class="transposs-free">
                    <asp:Image CssClass="icon" ID="transpossIcon1" runat="server" ImageUrl="~/img/freeShipIcon1.png" />
                    <div class="content">
                        <p class="p1">Miễn phí vận chuyển</p>
                        <p class="p2">Cho đơn hàng từ 499.000đ</p>
                    </div>
                </li>
                <li class="transposs-free">
                    <asp:Image CssClass="icon" ID="Image1" runat="server" ImageUrl="~/img/freeShipIcon1.png" />
                    <div class="content">
                        <p class="p1">Miễn phí đổi, sửa hàng</p>
                        <p class="p2">Đổi hàng trong 30 ngày từ ngày mua</p>
                    </div>
                </li>
                <li class="quatity">
                    <p class="auto-style1">Số lượng</p>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="quatity-change">
                                <asp:Button CssClass="down-bt" ID="QuatityDownBt" runat="server" Text="-" OnClick="QuatityDownBt_Click" />
                                <asp:TextBox CssClass="quatity-text" ID="QuatityTextBox" runat="server">1</asp:TextBox>
                                <asp:Button CssClass="up-bt" ID="QuatityUpBt" runat="server" Text="+" OnClick="QuatityUpBt_Click" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </li>
            </ul>
            <p>
                <asp:Button CssClass="buy-bt" ID="BuyBt" runat="server" Text="Mua" />
                <br />
                <asp:Button CssClass="addCart-bt" ID="AddCartBt" runat="server" Text="Thêm vào giỏ hàng" OnClick="AddCartBt_Click" />
        </div>
    </div>
    <h4>Thông tin chi tiết</h4>
    <asp:Label ID="Decription" runat="server" Text="minh công"></asp:Label>
</asp:Content>
