<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Novelizy</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* Màu xám nhạt */
            color: #333;
        }

        header.section-header {
            background-color: #FCF6EF; /* Màu cam đậm */
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        #logo {
            max-width: 120px;
            height: auto;
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
            transition: transform 0.3s ease-in-out;
        }

        #logo:hover {
            transform: scale(1.1); /* Hiệu ứng khi di chuột qua logo */
        }

        h3 {
            display: inline-block;
            vertical-align: middle;
            margin: 0;
            font-family: 'Hanuman', cursive; /* Font chữ đẹp */
            font-size: 28px;
            color: #F64501;
            font-weight: bold; 
            line-height: 1;
           
        }

        nav.navbar {
            background-color: #FCF6EF; /* Màu cam đậm - trùng với màu nền của header */
            border-bottom: 1px solid #ddd; /* Đường viền xám nhạt */
        }

        nav.navbar a.nav-link {
            color: #FA4F00 !important;
            transition: color 0.3s ease-in-out;
        }

        nav.navbar a.nav-link:hover {
            color: #ff6600 !important; /* Màu cam khi hover */
        }

        .navbar-light .navbar-toggler-icon {
            background-color: #333; /* Màu xám đậm */
        }

        .dropdown-menu {
            background-color: #fff; /* Màu trắng */
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.1); /* Hiệu ứng bóng đổ nhẹ */
        }

        .dropdown-menu a {
            color: #333 !important;
        }

        .navbar-light .navbar-toggler {
            border-color: #333; /* Màu xám đậm */
        }

        .search {
            margin: 0;
        }

        .search input {
            border-radius: 20px; /* Góc bo tròn */
            border: none;
            padding: 10px 20px;
            background-color: #fff; /* Màu trắng */
            color: #333;
            transition: background-color 0.3s ease-in-out;
        }

        .search input:hover {
            background-color: #f0f0f0; /* Màu xám nhạt khi hover */
        }

        .search button {
            background-color: #ff6600; /* Màu cam đậm */
            border: none;
            border-radius: 20px; /* Góc bo tròn */
            padding: 10px 20px;
            color: #fff;
            transition: background-color 0.3s ease-in-out;
        }

        .search button:hover {
            background-color: #cc5500; /* Darker orange on hover */
        }

        section {
            padding: 20px;
            text-align: center;
        }

        footer {
            background-color: #f8f9fa; /* Màu xám nhạt */
            color: #333;
            padding: 10px;
            text-align: center;
        }
        .footer-link:hover {
            color: #ff6600 !important; /* Orange color */
        }

        /* Use Futura font for specific elements */
        h3, .footer-link, .btn {
            font-family: 'Futura', sans-serif !important;
        }

        /* Use orange color for buttons */
        .btn-primary {
            background-color: #ff6600 !important;
            border-color: #ff6600 !important;
        }

        /* Add hover effect to buttons */
        .btn-primary:hover {
            background-color: #cc5500 !important; /* Darker orange on hover */
            border-color: #cc5500 !important;
        }
        .section-title {
            color: #000; 
        }
        .navbar-light .navbar-nav .nav-link {
            color: #F64501;
            transition: color 0.3s ease-in-out; /* Thêm hiệu ứng màu chữ */
        }
		section.additional-functionalities a[href="${pageContext.request.contextPath}/signup"] {
  		  color: #C77E49 !important;
		}
        
    </style>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Your JavaScript code for dynamic banner effects goes here
        var promoBanner = document.querySelector('.promo-banner img');

        // Example: Scale the banner on hover
        promoBanner.addEventListener('mouseover', function () {
            this.style.transform = 'scale(1.1)';
        });

        promoBanner.addEventListener('mouseout', function () {
            this.style.transform = 'scale(1)';
        });
    });
</script>
</head>

<body>
    <header class="section-header">
        <section class="header-main border-bottom">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 py-3">
                        <a class="text-body" href="${pageContext.request.contextPath}/">
                            <img src="${pageContext.servletContext.contextPath}/images/logo.png" alt="Tiki Logo" id="logo">
                            <h3>Novelizy</h3>
                        </a>
                    </div> <!-- col.// -->
                    <div class="col-lg-4 col-xl-5 ${empty sessionScope.currentUser ? 'mb-3 mb-lg-0' : ''}">
                        <form action="${pageContext.request.contextPath}/search" method="post" class="search">
                            <div class="input-group w-100">
                                <input type="text"
                                    class="form-control"
                                    placeholder="Nhập từ khóa cần tìm ..."
                                    name="q"
                                    value="${requestScope.query}">
                                <button class="btn btn-primary" type="submit">
                                    Tìm kiếm
                                </button>
                            </div>
                        </form>
                    </div> <!-- col.// -->
                	 <div class="col-lg-4 col-xl-3">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item">
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.currentUser}">
                                                <span style="color: #CC834E;">Xin chào <strong>${sessionScope.currentUser.fullname}</strong>!</span>
                                                <a class="btn btn-light ms-2" href="${pageContext.request.contextPath}/signout"
                                                    role="button" style="background-color: #FFA07A; border-color: #FFA07A;">
                                                    Đăng xuất
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="btn btn-light me-2" href="${pageContext.request.contextPath}/signup"
                                                role="button">
                                                    Đăng ký
                                                </a>
                                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/signin"
                                                role="button">
                                                    Đăng nhập
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div> <!-- col.// -->
                </div> <!-- row.// -->
            </div> <!-- container.// -->
        </section> 
        <!-- Add a new section for additional functionalities -->
        <c:if test="${not empty sessionScope.currentUser}">
            <section class="additional-functionalities">
                <div class="container">
                    <div class="row justify-content-end">
                        <div class="col-lg-12">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="btn btn-light me-2" href="${pageContext.request.contextPath}/user" role="button"
                                        style="color: #C77E49;">
                                        <i class="bi bi-person"></i> Tài khoản
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="btn btn-light me-2" href="${pageContext.request.contextPath}/order" role="button"
                                        style="color: #C77E49;">
                                        <i class="bi bi-list-check"></i> Đơn hàng
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="btn btn-light me-2" href="${pageContext.request.contextPath}/cart" role="button"
                                        style="color: #C77E49;">
                                        <i class="bi bi-cart"></i> Giỏ hàng
                                    </a>
                                </li>
                            </ul>
                        </div> <!-- col.// -->
                    </div> <!-- row.// -->
                </div> <!-- container.// -->
            </section>
        </c:if>
    <!-- Promotional Banner Section -->
<section class="promo-banner">
    <div class="container">
        <div class="row">
            <div class="col">
                <img src="${pageContext.servletContext.contextPath}/images/Banner.png" alt="Promotional Banner" class="img-fluid">
            </div>
        </div>
    </div>
</section>
    
</body>
</html>
