<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>ShyShop - Cập nhật tài khoản</title>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    a {
                        text-decoration: none;
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
                        font-size: 14px;
                    }

                    .header-actions a:hover {
                        color: #ff9f38;
                    }

                    /* Sidebar */
                    .admin-container {
                        display: flex;
                        margin-top: 70px;
                    }

                    .sidebar {
                        width: 250px;
                        background: #252525;
                        padding: 20px;
                        position: fixed;
                        height: calc(100vh - 70px);
                        overflow-y: auto;
                        border-right: 1px solid #333;
                    }

                    .sidebar h3 {
                        font-size: 18px;
                        color: #f28c38;
                        margin-bottom: 20px;
                        font-weight: 700;
                        text-align: center;
                    }

                    .sidebar a {
                        display: block;
                        color: #b0b0b0;
                        text-decoration: none;
                        margin-bottom: 15px;
                        font-size: 16px;
                        padding: 10px;
                        border-radius: 5px;
                        transition: background-color 0.3s, color 0.3s;
                    }

                    .sidebar a:hover {
                        background-color: #333;
                        color: #f28c38;
                    }

                    /* Form Container */
                    .admin-content {
                        margin-left: 250px;
                        padding: 20px;
                        width: 100%;
                        min-height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
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

                    .card-body input[disabled] {
                        background-color: #444;
                        color: #777;
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

                    .card-body .message {
                        color: #f28c38;
                        text-align: center;
                        margin-top: 10px;
                        font-size: 14px;
                    }

                    /* Responsive */
                    @media (max-width: 768px) {
                        .sidebar {
                            display: none;
                        }

                        .admin-content {
                            margin-left: 0;
                        }
                    }

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
                        <a href="/admin">
                            <h1>ShyShop - Admin</h1>
                        </a>
                        <div class="header-actions">
                            <a href="/admin/logout">Đăng xuất</a>
                        </div>
                    </div>
                </header>

                <!-- Admin Container -->
                <div class="admin-container">
                    <!-- Sidebar -->
                    <aside class="sidebar">
                        <h3>Menu Quản trị</h3>
                        <a href="/admin"><i class="fas fa-tachometer-alt"></i> Tổng quan</a>
                        <a href="/admin/viewproduct"><i class="fas fa-box"></i> Quản lý sản phẩm</a>
                        <a href="/admin/viewoders"><i class="fas fa-box"></i> Quản lý đơn hàng</a>
                        <a href="/admin/viewuser"><i class="fas fa-users"></i> Quản lý người dùng</a>
                    </aside>

                    <!-- Admin Content -->
                    <div class="admin-content">
                        <div class="card">
                            <div class="card-header">
                                <h4>Tạo Account mới </h4>
                            </div>
                            <div class="card-body">
                                <!-- Form cập nhật sử dụng modelAttribute="user" -->
                                <form:form method="post" action="/admin/user/update" modelAttribute="user">

                                    <!-- Trường Họ và tên -->
                                    <div class="mb-3">
                                        <label for="fullName">Họ và tên</label>
                                        <form:input type="text" id="fullName" path="name"
                                            placeholder="Nhập họ và tên" />
                                    </div>

                                    <!-- Trường Email -->
                                    <div class="mb-3">
                                        <label for="email">Email</label>
                                        <form:input type="email" id="email" path="email" placeholder="Nhập email" />
                                    </div>

                                    <!-- Trường Mật khẩu -->
                                    <div class="mb-3">
                                        <label for="password">Mật khẩu</label>
                                        <form:input type="password" id="password" path="password"
                                            placeholder="Nhập mật khẩu" />
                                    </div>

                                    <!-- Nút submit -->
                                    <button type="submit">Cập nhật</button>

                                    <!-- Hiển thị thông báo -->
                                    <c:if test="${not empty message}">
                                        <div class="message">${message}</div>
                                    </c:if>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    <c:if test="${not empty message}">
                        alert("${message}");
                    </c:if>
                </script>
            </body>

            </html>