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
   /* Base styles */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 20px;
}

/* Styling for the main container */
.container {
    max-width: 1200px;
    margin: 0 auto;
    background-color: #fff;
    padding: 30px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

/* Header styles */
h1 {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
    font-size: 1.3em;
    word-break: break-word;
    overflow-wrap: break-word;
}

/* Image styling */
img {
    display: block;
    width: 50%;
    height: auto;
    margin: 20px auto;
    border-radius: 10px;
    object-fit: cover;
}

/* Paragraph styles */
p {
    font-size: 0.9em;
    margin-bottom: 20px;
    line-height: 1.8;
    text-align: justify;
    color: #555;
    word-break: break-word;
    overflow-wrap: break-word;
}

/* Meta information styling */
.meta-info {
    font-size: 1em;
    color: #888;
    margin-bottom: 20px;
}

.meta-info strong {
    color: #333;
}

/* Error message styling */
.error {
    text-align: center;
    color: red;
    font-size: 1.5em;
}

/* Navigation styling */
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
    font-size: 1.2em;
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
