<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta name="description" content="FShop - Mua sắm công nghệ">
                    <title>Nowshop - Công nghệ trong tay bạn</title>
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

                        .search-bar {
                            flex-grow: 1;
                            margin: 0 20px;
                        }

                        .search-bar input {
                            width: 100%;
                            padding: 10px;
                            border: none;
                            border-radius: 20px;
                            font-size: 14px;
                            background-color: #333;
                            color: #fff;
                            outline: none;
                        }

                        .search-bar input::placeholder {
                            color: #999;
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

                        /* Main Container */
                        .container {
                            display: flex;
                            margin-top: 70px;
                            min-height: calc(100vh - 70px);
                        }

                        /* Sidebar Filter */
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
                        }

                        .filter-group {
                            margin-bottom: 20px;
                        }

                        .filter-group h4 {
                            font-size: 16px;
                            color: #e0e0e0;
                            margin-bottom: 10px;
                            font-weight: 500;
                        }

                        .filter-options label {
                            display: flex;
                            align-items: center;
                            margin: 8px 0;
                            font-size: 14px;
                            color: #b0b0b0;
                        }

                        .filter-options label:hover {
                            color: #e0e0e0;
                        }

                        .filter-options input[type="checkbox"] {
                            margin-right: 10px;
                            accent-color: #f28c38;
                        }

                        /* Product Section */
                        .product-section {
                            margin-left: 250px;
                            padding: 20px;
                            width: calc(100% - 250px);
                            display: grid;
                            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
                            gap: 20px;
                            background-color: #1a1a1a;
                        }

                        .product {
                            background: #252525;
                            border-radius: 8px;
                            padding: 15px;
                            text-align: center;
                            transition: all 0.3s ease;
                            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
                        }

                        .product:hover {
                            transform: translateY(-5px);
                            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
                        }

                        .product img {
                            width: 100%;
                            height: 180px;
                            object-fit: contain;
                            margin-bottom: 10px;
                        }

                        .product h2 {
                            font-size: 16px;
                            font-weight: 500;
                            color: #e0e0e0;
                            margin-bottom: 10px;
                            height: 40px;
                            overflow: hidden;
                        }

                        .product .price {
                            font-size: 18px;
                            color: #f28c38;
                            font-weight: 700;
                            margin-bottom: 10px;
                        }

                        .product .old-price {
                            font-size: 14px;
                            color: #666;
                            text-decoration: line-through;
                            margin-bottom: 10px;
                        }

                        .product button {
                            background-color: #f28c38;
                            color: #fff;
                            border: none;
                            padding: 10px 20px;
                            border-radius: 20px;
                            font-size: 14px;
                            cursor: pointer;
                            transition: background-color 0.3s ease;
                        }

                        .product button:hover {
                            background-color: #e07b30;
                        }

                        /* Footer */
                        footer {
                            background-color: #2c2c2c;
                            color: #b0b0b0;
                            padding: 30px 20px;
                            text-align: center;
                        }

                        footer p {
                            font-size: 13px;
                        }

                        /* Responsive Design */
                        @media (max-width: 768px) {
                            .container {
                                flex-direction: column;
                            }

                            .sidebar {
                                position: relative;
                                width: 100%;
                                height: auto;
                                border-right: none;
                                border-bottom: 1px solid #333;
                            }

                            .product-section {
                                margin-left: 0;
                                width: 100%;
                            }

                            .header-container {
                                flex-direction: column;
                            }

                            .search-bar {
                                margin: 10px 0;
                            }

                            a {
                                text-decoration: none;
                                /* Loại bỏ gạch dưới */
                            }

                        }
                    </style>
                </head>

                <body>
                    <!-- Header -->
                    <header>
                        <div class="header-container">
                            <a href="/">
                                <h1>NowShop</h1>
                            </a>
                            <div class="search-bar">
                                <input type="text" placeholder="Tìm kiếm sản phẩm...">
                            </div>
                            <div class="header-actions">
                                <a href="#">Giỏ hàng</a>
                                <a href="user/login">Đăng nhập</a>
                            </div>
                        </div>
                    </header>

                    <!-- Main Container -->
                    <div class="container">
                        <!-- Sidebar Filter -->
                        <aside class="sidebar">
                            <h3>Bộ lọc sản phẩm</h3>
                            <div class="filter-group">
                                <h4>Danh mục</h4>
                                <div class="filter-options">
                                    <label><input type="checkbox" class="filter" value="iphone"> iPhone</label>
                                    <label><input type="checkbox" class="filter" value="macbook"> MacBook</label>
                                    <label><input type="checkbox" class="filter" value="watch"> Apple Watch</label>
                                </div>
                            </div>
                            <div class="filter-group">
                                <h4>Giá</h4>
                                <div class="filter-options">
                                    <label><input type="checkbox" class="filter" value="under-20"> Dưới 20 triệu</label>
                                    <label><input type="checkbox" class="filter" value="20-30"> 20 - 30 triệu</label>
                                    <label><input type="checkbox" class="filter" value="over-30"> Trên 30 triệu</label>
                                </div>
                            </div>
                        </aside>

                        <!-- Product Section -->
                        <section class="product-section">


                            <c:forEach var="product" items="${products}">
                                <div class="product" data-category="${product.category}">
                                    <img src="" alt="">
                                    <h2>${product.name}</h2> <br>
                                    <h3>${product.category}</h3>
                                    <div class="price">
                                        <fmt:formatNumber value="${product.price}" type="currency" currencyCode="VND" />
                                    </div>

                                    <button>Mua ngay</button>
                                </div>
                            </c:forEach>





                        </section>
                    </div>

                    <!-- Footer -->
                    <footer>
                        <p>© 2025 ShyShop. Bản quyền thuộc về @ShyInc.</p>
                    </footer>

                    <!-- JavaScript -->
                    <script>
                        // Filter functionality
                        const filters = document.querySelectorAll('.filter');
                        const products = document.querySelectorAll('.product');

                        filters.forEach(filter => {
                            filter.addEventListener('change', applyFilters);
                        });

                        function applyFilters() {
                            const checkedCategories = Array.from(document.querySelectorAll('.filter[value^="iphone"], .filter[value^="macbook"], .filter[value^="watch"]:checked')).map(cb => cb.value);
                            const checkedPrices = Array.from(document.querySelectorAll('.filter[value^="under"], .filter[value^="20-30"], .filter[value^="over"]:checked')).map(cb => cb.value);

                            products.forEach(product => {
                                const category = product.dataset.category;
                                const price = product.dataset.price;
                                let show = true;

                                if (checkedCategories.length > 0 && !checkedCategories.includes(category)) {
                                    show = false;
                                }
                                if (checkedPrices.length > 0 && !checkedPrices.includes(price)) {
                                    show = false;
                                }

                                product.style.display = show ? 'block' : 'none';
                            });
                        }
                    </script>
                </body>

                </html>