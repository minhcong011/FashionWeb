<%@ Page Language="C#" MasterPageFile="~/Master/Menu.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Fashion.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8f9fa;
        }

        .page-login {
            max-width: 400px;
            width: 100%;
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .wpx{
            padding: 30px;
        }
        .page-login .title_heads {
            font-size: 24px !important;
            font-weight: 600;
            text-transform: uppercase;
            color: #333333;
            margin-bottom: 20px;
        }

        .register-link-1 {
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }

        .register-link-2 {
            font-size: 14px;
            color: #1c5b41;
            text-decoration: none;
        }

        .a-center {
            text-align: center;
        }

        .margin-top-10 {
            margin-top: 10px;
        }

        .input-textbox {
            width: 100%;
            margin: 20px 0;
        }

        .input-textbox .form-control-lg {
            margin-top:10px;
            width: 100%;
            height: 40px;
            border-radius: 10px;
            background-color: #ebebeb;
            border: none;
            font-size: 14px;
        }

        .pull-xs-left {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .btn-register {
            background-color: #1c5b41;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-register:hover {
            border: 2px solid orange;
            border-width: thin;
            background-color: white;
            color: orange;
        }

        .pull-xs-left .quenmk a {
            color: #007bff;
            text-decoration: none;
        }

        .pull-xs-left .quenmk a:hover {
            color: orange;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="page-login pagecustome clearfix">
                <div class="wpx">
                    <h1 class="title_heads a-center">Đăng ký</h1>
                    <div class="register-link-1  margin-top-10">
                        Đã có tài khoản, đăng nhập
                        <a href="../Login.aspx" class="register-link-2">tại đây</a>

                    </div>
                    <div class="section">
                        <div class="form-signup">
                            <div class="input-textbox">
                                <asp:TextBox ID="surnumber" runat="server" CssClass="form-control-lg" placeholder="Họ" Required="true"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="name" runat="server"  CssClass="form-control-lg" placeholder="Tên" Required="true"></asp:TextBox>
                                 <br />
                                <asp:TextBox ID="email" runat="server"  CssClass="form-control-lg" placeholder="email" Required="true"></asp:TextBox>
                                 <br />
                                <asp:TextBox ID="phoneNumber" runat="server" CssClass="form-control-lg" placeholder="Số điện thoại" Required="true"></asp:TextBox>
                                 <br />
                                <asp:TextBox ID="password" runat="server"  CssClass="form-control-lg" placeholder="Mật khẩu" Required="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <%--                <div class="social-login">
                    <p>Hoặc đăng nhập bằng</p>
                    <asp:ImageButton ID="btnFacebookLogin" runat="server" ImageUrl="//bizweb.dktcdn.net/assets/admin/images/login/fb-btn.svg" OnClick="btnFacebookLogin_Click" />
                    <asp:ImageButton ID="btnGoogleLogin" runat="server" ImageUrl="//bizweb.dktcdn.net/assets/admin/images/login/gp-btn.svg" OnClick="btnGoogleLogin_Click" />
                </div>--%>
                                    <div class="pull-xs-left">
                    <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" CssClass="btn btn-register" OnClick="btnRegister_Click"/>
                </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
