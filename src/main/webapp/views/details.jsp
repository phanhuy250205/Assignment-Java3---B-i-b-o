<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${news != null ? news.title : "Không tìm thấy bài viết"}</title>
    <style>
    body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 1200px; /* Tăng độ rộng container để bài viết rộng hơn */
    margin: 0 auto;
    background-color: #fff;
    padding: 30px; /* Tăng padding để có khoảng cách thoải mái hơn */
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); /* Tăng bóng đổ cho hiệu ứng 3D */
    border-radius: 10px; /* Tăng độ bo tròn góc */
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 30px; /* Tăng khoảng cách phía dưới tiêu đề */
    font-size: 3em; /* Tăng kích thước tiêu đề */
    word-break: break-word;
    overflow-wrap: break-word;
}

img {
    display: block;
   width: 50%;
    height: auto;
    margin: 20px auto;
    border-radius: 10px;
    object-fit: cover;
}

p {
    font-size: 1.0em; /* Tăng kích thước chữ */
    margin-bottom: 20px; /* Tăng khoảng cách giữa các đoạn văn */
    line-height: 1.8;
    text-align: justify;
    color: #555;
    word-break: break-word;
    overflow-wrap: break-word;
}

.meta-info {
    font-size: 1em; /* Tăng kích thước thông tin meta */
    color: #888;
    margin-bottom: 20px;
}

.meta-info strong {
    color: #333;
}

.error {
    text-align: center;
    color: red;
    font-size: 1.5em;
}

nav {
	text-align: center;
	background-color: #f9f9f9;
	padding: 15px 0;
}

nav ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

nav ul li {
	display: inline-block;
	margin-right: 20px;
}

nav ul li a {
	color: black;
	text-decoration: none;
	padding: 10px 15px;
	display: inline-block;
	font-size: 1.2em; /* Tăng kích thước chữ trong menu */
	transition: color 0.3s ease;
}

nav ul li a:hover {
	color: #4a90e2;
}

    </style>
</head>
<body>
<nav>
		<ul>
			<li><a href="/ASM_JAVA3_PD10267/views/index.jsp">Trang Chủ</a></li>
			<li><a href="about.jsp">Giới Thiệu</a></li>
			<li><a href="contact.jsp">Liên Hệ</a></li>
		</ul>
	</nav>
    <div class="container">
        <c:choose>
            <c:when test="${news != null}">
                <h1>${news.title}</h1>
                <img src="${pageContext.request.contextPath}/uploads/${news.image}" alt="${news.title}">
                <p>${news.content}</p>
                <div class="meta-info">
                    <p><strong>Tác giả:</strong> ${news.author}</p>
                    <p><strong>Ngày đăng:</strong> <fmt:formatDate value="${news.postedDate}" pattern="dd-MM-yyyy"/></p>
                </div>
            </c:when>

            <c:otherwise>
                <p class="error"><strong>Lỗi:</strong> ${errorMessage}</p>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>
