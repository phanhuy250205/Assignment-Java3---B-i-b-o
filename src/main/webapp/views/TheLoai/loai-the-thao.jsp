<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thể Thao</title>
    <link rel="stylesheet"
	href="/ASM_JAVA3_PD10267/views/assets/css/theloai.css">
   
</head>
<style>
.main {
    display: flex;
    flex-wrap: wrap; /* Đảm bảo rằng các bài viết tự động xuống dòng */
    justify-content: space-between; /* Phân bố đều các bài viết */
    gap: 15px; /* Khoảng cách giữa các bài viết */
    padding: 20px;
    box-sizing: border-box;
}

.slidebar-1 {

    padding: 10px; /* Giảm padding để bố cục gọn hơn */
    border-radius: 8px;
    box-shadow: var(--box-shadow);
    width: calc(33.333% - 15px); /* Đảm bảo 3 bài trên một hàng với khoảng cách 15px */
    box-sizing: border-box;
    transition: all 0.3s ease;
    margin-bottom: 20px; /* Thêm khoảng cách giữa các hàng */
}

.slidebar-1:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

/* Image styles */
.inner-logo img {
    width: 100%;
    height: 120px; /* Giảm chiều cao hình ảnh */
    object-fit: cover;
    border-radius: 8px;
    margin-bottom: 10px;
}

/* Content styles */
.inner-content h1 {
    font-size: 1em; /* Giảm kích thước tiêu đề */
    color: var(--main-color);
    margin-bottom: 8px;
}

.inner-content p {
    font-size: 0.8em; /* Giảm kích thước đoạn văn */
    color: #666;
    line-height: 1.4;
    white-space: normal;
    word-wrap: break-word;
    word-break: break-word;
    margin-bottom: 8px;
    
    display: -webkit-box !important;
    -webkit-line-clamp: 4 !important; /* Hiển thị tối đa 4 hàng */
    -webkit-box-orient: vertical !important;
    overflow: hidden !important;
    text-overflow: ellipsis !important;
}

/* Responsive styles for medium screens */
@media (max-width: 768px) {
    .slidebar-1 {
        width: calc(50% - 15px); /* 2 bài trên một hàng cho màn hình vừa */
    }
}

/* Responsive styles for small screens */
@media (max-width: 480px) {
    .slidebar-1 {
        width: 100%; /* 1 bài trên một hàng cho màn hình nhỏ */
    }
}
nav {
    text-align: center; /* Căn giữa các mục trong menu */
    background-color: #f9f9f9; /* Đặt màu nền cho thanh điều hướng */
    padding: 15px 0; /* Thêm khoảng cách phía trên và dưới */
}

nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

nav ul li {
    display: inline-block; /* Hiển thị các mục trong cùng một dòng */
    margin-right: 20px; /* Thêm khoảng cách giữa các mục */
}

nav ul li a {
    color: black;
    text-decoration: none;
    padding: 10px 15px;
    display: inline-block;
    font-size: 1em;
    transition: color 0.3s ease; /* Hiệu ứng chuyển màu khi hover */
}

nav ul li a:hover {
    color: #4a90e2; /* Thay đổi màu khi di chuột vào */
}

</style>
<body>

<nav>
        <ul>
            <li>
                <a href="/ASM_JAVA3_PD10267/views/index.jsp">Trang Chủ</a>
            </li>
            <li>
                <a href="about.jsp">Giới Thiệu</a>
            </li>
            <li>
                <a href="contact.jsp">Liên Hệ</a>
            </li>
        </ul>
    </nav>
    <ul>
        <li class="current-menu-item" style="list-style-type: none;">
            <a href="index.html">
                <img src="<c:url value='/assets/img/logologin.png' />" alt="" style="width: 150px; border-radius: 50px;">
            </a>
        </li>
    </ul>

    <div class="main">
        <!-- Kiểm tra nếu không có bài viết nào -->
        <c:if test="${empty cultureNews}">
            <p>Không có bài viết nào trong danh mục này.</p>
        </c:if>

        <!-- Lặp qua danh sách bài viết và hiển thị -->
        <c:forEach var="news" items="${cultureNews}">
            <div class="box slidebar-1">
                <div class="inner-box">
                    <div class="inner-logo">
                        <!-- Sử dụng c:url nếu image là đường dẫn tương đối -->
                       <img src="${pageContext.request.contextPath}/uploads/${news.image}" alt="${news.title}">

                    </div>
                    <div class="inner-content">
                        <h1>
							<a
								href="${pageContext.request.contextPath}/details?id=${news.id}">
								${news.title} </a>
						</h1>
                          <p>${news.content}</p>
                        <p><strong>Tác giả:</strong> ${news.author}</p>
                        <p><strong>Ngày đăng:</strong> <fmt:formatDate value="${news.postedDate}" pattern="dd-MM-yyyy"/></p>
                      
                    </div>
                </div>
            </div>
        </c:forEach>

        <div class="clear-fix"></div>
    </div>
</body>
</html>
