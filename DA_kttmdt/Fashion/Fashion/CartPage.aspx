<%@ Page Language="C#" MaintainScrollPositionOnPostBack="true" EnableEventValidation ="false" MasterPageFile="~/Master/Menu.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="Fashion.CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .main-cart-page {
            max-width: 1140px;
            min-height: 300px;
            display: block;
            box-sizing: border-box;
            unicode-bidi: isolate;
            font-size: 14px;
            font-family: 'Montserrat', sans-serif;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            text-align: left;
            margin: 0 auto;
        }

        .cart-header-info {
            display: flex;
            padding: 7px 0;
            border: solid 1px #1c5b41;
            border-bottom: none;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
        }

        .cart-page .cart-header-info div:nth-child(1) {
            width: 51%;
            text-align: left;
            padding-left: 10px;
        }

        .cart-page .cart-header-info div:nth-child(2) {
            width: 16%;
            text-align: center;
        }

        .cart-page .cart-header-info div:nth-child(3) {
            width: 16%;
            text-align: center;
        }

        .cart-page .cart-header-info div:nth-child(4) {
            width: 16%;
            text-align: center;
        }

        .cart-page .cart_body {
            border: solid 1px #1c5b41;
            border-radius: 0 0 10px 10px;
        }

            .cart-page .cart_body .ajaxcart__row:first-child {
                border-top: none;
            }

            .cart-page .cart_body .ajaxcart__row .cart_product {
                width: 100%;
                height: 120px;
                display: flex;
                align-items: center;
            }

            .cart-page .cart_body .grid {
                width: 20%;
                display: flex;
                align-items: center;
                justify-content: center;
            }

        .product_image {
            width: 110px;
            height: 110px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 10px;
        }

        .cart-page .cart_body .cart_info {
            padding-left: 15px;
            vertical-align: top;
            padding-right: 10px;
            display: flex;
            width: calc(100% - 110px);
        }

        .btn-remove {
            background-color: transparent;
            border: none;
        }

        .cart-page .cart_body .cart_info .cart_name {
            width: 50%;
            margin-bottom: 5px;
        }

            .cart-page .cart_body .cart_info .cart_name a {
                margin-bottom: 4px;
                font-size: 13px;
                font-weight: 500;
                line-height: 18px;
                display: block;
                text-decoration: none;
                color: black;
            }

            .cart-page .cart_body .cart_info .cart_name .remove-item-cart {
                display: block;
                color: #1c5b41;
                font-weight: 300;
            }

        .cart-page .cart_body .grid {
            width: 20%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .cart-page .cart_body .cart_select button {
            border-radius: 0;
            border: 1px solid #e5e5e5;
            border-color: #e5e5e5;
            color: #222;
            line-height: 26px;
            padding: 0;
            margin: 0;
            width: 28px;
            background-color: #fff;
            height: 28px;
            float: left;
        }

        .cart-page .cart_body .cart_select input {
            display: inline-block;
            padding: 0;
            text-align: center;
            border-radius: 0;
            width: 35px;
            min-height: 28px;
            border: 1px solid #e5e5e5;
            color: #222;
            height: 28px;
            font-size: 14px;
            margin: 0;
            float: left;
            border-left: none;
            border-right: none;
        }

        .cart-page .cart_body .grid .cart_prices .cart-price {
            font-weight: bold;
            display: block;
            font-size: 14px;
            color: #fe9614;
        }

        .cart-page .ajaxcart__footer {
            margin-top: 20px;
        }

        .offset-xl-8 {
            margin-left: 66.666667%;
        }

        .col-12 {
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 30%;
        }

        .cart-page .ajaxcart__footer .cart__subtotal {
            font-size: 15px;
            font-weight: 500;
            margin-bottom: 12px;
            display: flex;
        }

            .cart-page .ajaxcart__footer .cart__subtotal .cart__col-6 {
                width: 50%;
                float: left;
            }

            .cart-page .ajaxcart__footer .cart__subtotal .cart__totle {
                width: 50%;
                float: left;
                text-align: right;
            }

        .cart__btn-proceed-checkout {
            display: block;
            position: relative;
            width: 100%;
            background-color: #1c5b41;
            color: #fff;
            text-align: center;
            line-height: 40px;
            border: 1px solid #1c5b41;
            border-radius: 10px;
        }

        .row {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
        }

        .cart-page .ajaxcart__footer .cart__subtotal .cart__totle .total-price {
            color: #fe9614;
            font-weight: bold;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <section class="main-cart-page main-container col1-layout">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional">
        <ContentTemplate>
        <div class="container">
            <div class="wrap_background_aside margin-bottom-40">
                <div class="header-cart"></div>
                <div class="cart-page d-xl-block d-none">
                    <div class="drawer__inner">
                        <div class="CartPageContainer">
                            <div class="cart-header-info">
                                <div>Thông tin sản phẩm</div>
                                <div>Đơn giá</div>
                                <div>Số lượng</div>
                                <div>Thành tiền</div>
                            </div>
                                    <div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">
                                        <asp:Repeater ID="ProductRepeater" runat="server" >
                                            <ItemTemplate>
                                                <div class="ajaxcart__row">
                                                    <div class="ajaxcart__product cart_product">
                                                        <a href='<%# Eval("ProductLink") %>' class="ajaxcart__product-image cart_image" title='<%# Eval("ProductName") %>'>
                                                            <asp:Image CssClass="product_image" ID="ProductImage" ImageUrl='<%# Eval("ProductImage") %>' runat="server" />
                                                        </a>
                                                        <div class="grid__item cart_info">
                                                            <div class="ajaxcart__product-name-wrapper cart_name">
                                                                <a href='<%# Eval("ProductLink") %>' class="ajaxcart__product-name h4" title='<%# Eval("ProductName") %>'><%# Eval("ProductName") %></a>
                                                                 <asp:Button runat="server" CssClass="btn-remove" Text="Xóa" CommandName="DeleteItem" CommandArgument='<%# Eval("ProductId") %>' OnCommand="RemoveItem_Command" />
                                                            </div>
                                                            <div class="grid">
                                                                <div class="grid__item one-half text-right cart_prices">
                                                                    <span class="cart-price"><%# Eval("ProductPrice") %></span>
                                                                </div>
                                                            </div>
                                                            <div class="grid">
                                                                <div class="grid__item one-half cart_select">
                                                                    <div class="ajaxcart__qty input-group-btn">
                                                                        <asp:Button runat="server" CssClass="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" Text="-" CommandArgument='<%# Eval("ProductId") %>' OnClick="DecreaseQuantity_Click" />
                                                                        <asp:TextBox Text='<%# Eval("Quantity") %>' CssClass="ajaxcart__qty-num number-sidebar" runat="server" OnTextChanged="QuantityTextBox_TextChanged" data-productid='<%# Eval("ProductId") %>' AutoPostBack ="true"></asp:TextBox>
                                                                        <asp:Button runat="server" CssClass="ajaxcart__qty-adjust ajaxcart__qty--plus items-count" Text="+" CommandArgument='<%# Eval("ProductId") %>' OnClick="IncreaseQuantity_Click" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="grid">
                                                                <div class="grid__item one-half text-right cart_prices">
                                                                    <span class="cart-price"><%# Eval("TotalPrice") %></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                            <div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">
                                <div class="row">
                                    <div" class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">
                                        <div class="ajaxcart__subtotal">
                                            <div class="cart__subtotal">
                                                <div class="cart__col-6">Tổng tiền:</div>
                                                <div class="text-right cart__totle">
                                                    <span class="total-price" id="totalPrice">
                                                        <asp:Label ID="TotalPriceLabel" runat="server" Text="0₫"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                            <asp:Button runat="server" CssClass="button btn btn-default cart__btn-proceed-checkout" ID="btnProceedCheckout" Text="Thanh toán" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="cart-mobile-page d-block d-xl-none">
                    <div class="CartMobileContainer"></div>
                </div>
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </section>
</asp:Content>
