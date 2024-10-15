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
