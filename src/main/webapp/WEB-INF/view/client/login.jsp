<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>ShyShop - Đăng Nhập</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                a {
                    text-decoration: none;
                    /* Loại bỏ gạch dưới */
                }

                body {
                    font-family: 'Roboto', sans-serif;
                    background-color: #1a1a1a;
                    color: #e0e0e0;
                    line-height: 1.6;
                }

                /* Header */
                header {
                    background-color: #2c2c2c;
                    padding: 15px 20px;
                    position: fixed;
                    width: 100%;
                    top: 0;
                    z-index: 1000;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
                }

                .header-container {
                    max-width: 1400px;
                    margin: 0 auto;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                }

                header h1 {
                    color: #f28c38;
                    font-size: 24px;
                    font-weight: 700;
                }

                .header-actions a {
                    color: #f28c38;
                    margin-left: 20px;
                    text-decoration: none;
                    font-size: 14px;
                }

                .header-actions a:hover {
                    color: #ff9f38;
                }

                /* Form Container */
                .form-container {
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 80px 20px 20px;
                }

                .card {
                    background: #252525;
                    border-radius: 12px;
                    padding: 30px;
                    width: 100%;
                    max-width: 450px;
                    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
                }

                .card-header {
                    background: none;
                    border-bottom: 1px solid #333;
                    padding-bottom: 15px;
                    margin-bottom: 20px;
                    text-align: center;
                }

                .card-header h4 {
                    color: #f28c38;
                    font-size: 24px;
                    font-weight: 700;
                    margin: 0;
                }

                .card-body label {
                    font-size: 16px;
                    color: #e0e0e0;
                    margin-bottom: 5px;
                    display: block;
                }

                .card-body input {
                    width: 100%;
                    padding: 12px;
                    margin-bottom: 20px;
                    border: 1px solid #333;
                    border-radius: 8px;
                    background-color: #333;
                    color: #e0e0e0;
                    font-size: 14px;
                    outline: none;
                    transition: border-color 0.3s ease;
                }

                .card-body input:focus {
                    border-color: #f28c38;
                }

                .card-body input::placeholder {
                    color: #999;
                }

                .card-body button {
                    width: 100%;
                    padding: 12px;
                    background-color: #f28c38;
                    color: #fff;
                    border: none;
                    border-radius: 20px;
                    font-size: 16px;
                    font-weight: 500;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }

                .card-body button:hover {
                    background-color: #e07b30;
                }

                /* Responsive */
                @media (max-width: 576px) {
                    .card {
                        padding: 20px;
                    }

                    .card-header h4 {
                        font-size: 20px;
                    }

                    .card-body input {
                        padding: 10px;
                    }

                    .card-body button {
                        padding: 10px;
                        font-size: 14px;
                    }
                }
            </style>
        </head>

        <body>
            <!-- Header -->
            <header>
                <div class="header-container">
                    <a href="/">
                        <h1>ShyShop</h1>
                    </a>
                    <div class="header-actions">
                        <a href="../user/register">Đăng ký</a>
                        <a href="#">Giỏ hàng</a>
                    </div>
                </div>
            </header>

            <!-- Form Container -->
            <div class="form-container">
                <div class="card">
                    <div class="card-header">
                        <h4>Đăng Nhập</h4>
                    </div>
                    <div class="card-body">
                        <!-- Form đăng nhập sử dụng modelAttribute="user" -->
                        <form:form method="post" action="/user/register" modelAttribute="user">
                            <!-- Trường Email -->
                            <div class="mb-3">
                                <label for="email">Email</label>
                                <form:input type="email" id="email" placeholder="Nhập email" path="email" />
                            </div>

                            <!-- Trường Mật khẩu -->
                            <div class="mb-3">
                                <label for="password">Mật khẩu</label>
                                <form:input type="password" id="password" placeholder="Nhập mật khẩu" path="password" />
                            </div>

                            <!-- Nút submit -->
                            <button type="submit">Đăng Nhập</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </body>

        </html>