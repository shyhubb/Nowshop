<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="ShyShop - Quản trị hệ thống">
            <title>ShyShop - Quản trị</title>
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Roboto', sans-serif;
                    background-color: #1a1a1a;
                    color: #e0e0e0;
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

                /* Admin Content */
                .admin-content {
                    margin-left: 250px;
                    padding: 20px;
                    width: 100%;
                }

                .card {
                    background: #252525;
                    border-radius: 8px;
                    padding: 20px;
                    margin-bottom: 20px;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
                }

                .card-header {
                    font-size: 20px;
                    color: #f28c38;
                    margin-bottom: 10px;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 10px;
                }

                th,
                td {
                    padding: 10px;
                    text-align: center;
                    border: 1px solid #333;
                }

                th {
                    background-color: #2c2c2c;
                }

                tr:nth-child(even) {
                    background-color: #333;
                }

                tr:hover {
                    background-color: #444;
                }

                /* Buttons */
                .btn {
                    display: flex;
                    align-items: center;
                    gap: 5px;
                    padding: 8px 14px;
                    border-radius: 6px;
                    font-size: 14px;
                    font-weight: bold;
                    transition: all 0.3s ease-in-out;
                    text-decoration: none;
                    text-align: center;
                    cursor: pointer;
                    border: none;
                }

                .edit-btn {
                    background-color: #4CAF50;
                    /* Xanh lá */
                    color: white;
                }

                .edit-btn:hover {
                    background-color: #45a049;
                }

                .delete-btn {
                    background-color: #f44336;
                    /* Đỏ */
                    color: white;
                }

                .delete-btn:hover {
                    background-color: #d32f2f;
                }
            </style>
        </head>

        <body>
            <!-- Header -->
            <header>
                <div class="header-container">
                    <h1>Admin Panel</h1>
                    <div class="header-actions">
                        <a href="#">Đăng xuất</a>
                    </div>
                </div>
            </header>

            <!-- Admin Content -->
            <div class="admin-container">
                <!-- Sidebar -->
                <aside class="sidebar">
                    <h3>Menu Quản trị</h3>
                    <a href="/admin"><i class="fas fa-tachometer-alt"></i> Tổng quan</a>
                    <a href="/admin/viewproduct"><i class="fas fa-box"></i> Quản lý sản phẩm</a>
                    <a href="/admin/viewoders"><i class="fas fa-box"></i> Quản lý đơn hàng</a>
                    <a href="/admin/viewuser"><i class="fas fa-users"></i> Quản lý người dùng</a>
                </aside>

                <!-- Admin Main Content -->
                <div class="admin-content">
                    <div class="card">
                        <div class="card-header">Quản lý sản phẩm </div>
                        <a href="/user/register" class="btn edit-btn"><i class="fas fa-user-plus"></i> Thêm sản phẩm
                        </a>
                        <table>
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Tên sản phẩm </th>
                                    <th>Giá</th>
                                    <th>Hãng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.name}</td>
                                        <td>${user.email}</td>
                                        <td>
                                            <div style="display: flex; gap: 10px; justify-content: center;">
                                                <!-- Nút Sửa -->
                                                <a href="/admin/edit/${user.id}" class="btn edit-btn">
                                                    <i class="fas fa-edit"></i> Chi tiết
                                                </a>

                                                <!-- Nút Xóa -->
                                                <form action="/admin/delete/${user.id}" method="post"
                                                    onsubmit="return confirm('Bạn có chắc chắn muốn xóa ${user.name}?')">
                                                    <button type="submit" class="btn delete-btn">
                                                        <i class="fas fa-trash-alt"></i> Xóa
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </body>

        </html>