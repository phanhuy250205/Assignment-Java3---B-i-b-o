<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản lý CRUD</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/crud.css">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f2f5;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 1200px;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
    font-size: 24px;
}

form {
    margin-bottom: 20px;
}

input, select, textarea {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: 1px solid #ddd;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 14px;
}

button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px 15px;
    margin: 8px 0;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
}

button:hover {
    background-color: #218838;
}

button:active {
    transform: scale(0.98);
}

.news-card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    justify-content: center;
    margin-top: 20px;
}

.news-card {
    background: #ffffff;
    width: 100%;
    max-width: 250px;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    margin: 10px;
    min-height: 350px; /* Đảm bảo thẻ có chiều cao tối thiểu để các nút luôn căn đều */
}

.news-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.12);
}

.news-card img {
    width: 100%;
    height: auto;
    max-width: 220px;
    margin-bottom: 10px;
    border-radius: 6px;
    object-fit: cover;
}

.news-card h3 {
    color: #333;
    margin-bottom: 8px;
    font-size: 16px;
    text-align: center;
}

.news-card p {
    color: #555;
    font-size: 13px;
    line-height: 1.4;
    text-align: center;
    margin: 4px 0;
    word-wrap: break-word; /* Đảm bảo văn bản xuống dòng khi quá dài */
    overflow-wrap: break-word; /* Hỗ trợ cho các trình duyệt khác */
    max-width: 100%; /* Đảm bảo không vượt quá kích thước thẻ chứa */
    white-space: normal; /* Cho phép văn bản xuống dòng */
}

.news-card strong {
    color: #333;
    font-weight: bold;
}

button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px 20px;
    margin: 8px 0;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
    min-width: 80px;
    text-align: center;
}

button:hover {
    background-color: #218838;
}

button:active {
    transform: scale(0.98);
}

.actions {
    display: flex;
    justify-content: space-around;
    width: 100%;
    margin-top: auto; /* Đảm bảo các nút luôn nằm ở cuối thẻ */
}

.actions button {
    flex-grow: 1;
    margin: 0 5px;
}


@media (max-width: 768px) {
    .news-card-container {
        flex-direction: column;
        align-items: center;
    }

    .news-card {
        max-width: 100%;
    }

    .news-card img {
        max-width: 100%;
    }

    .actions {
        flex-direction: column;
        width: 100%;
    }

    .actions button {
        width: 100%;
        margin-bottom: 10px;
    }
}


</style>
</head>
<body>
    <div class="container">
        <h2>Quản lý tin tức</h2>
        <!-- Hiển thị thông báo thành công hoặc lỗi -->
        <c:if test="${not empty successMessage}">
            <div style="color: green;">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div style="color: red;">${errorMessage}</div>
        </c:if>

        <!-- Form để thêm và sửa tin tức -->
        <form action="${pageContext.request.contextPath}/news/${empty news.id ? 'insert' : 'update'}" method="post" enctype="multipart/form-data">
            <input type="hidden" id="newsId" name="id" value="${not empty news.id ? news.id : ''}">
            
            <label for="newsTitleInput">Tiêu đề:</label>
            <input type="text" id="newsTitleInput" name="title" value="${not empty news.title ? news.title : ''}" placeholder="Tiêu đề tin tức" required>
            
            <label for="newsContent">Nội dung:</label>
            <textarea id="newsContent" name="content" placeholder="Nội dung tin tức" required>${not empty news.content ? news.content : ''}</textarea>
            
            <label for="newsFile">Hình ảnh:</label>
            <input type="file" id="newsFile" name="image" accept="image/*">
            
            <label for="postedDate">Ngày đăng:</label>
            <input type="date" id="postedDate" name="postedDate" value="${not empty news.postedDate ? news.postedDate : ''}" required>
            
            <label for="newsAuthor">Tác giả:</label>
            <input type="text" id="newsAuthor" name="author" value="${not empty news.author ? news.author : ''}" placeholder="Tác giả" required>
            
            <label for="viewCount">Lượt xem:</label>
            <input type="number" id="viewCount" name="viewCount" value="${not empty news.viewCount ? news.viewCount : ''}" placeholder="Lượt xem" required>
            
            <label for="categoryId">Mã loại tin:</label>
            <input type="text" id="categoryId" name="categoryId" value="${not empty news.categoryId ? news.categoryId : ''}" placeholder="Mã loại tin" required>
            
            <label for="home">Xuất hiện trên trang chủ:</label>
            <select id="home" name="home" required>
                <option value="true" ${news.home ? 'selected' : ''}>Có</option>
                <option value="false" ${!news.home ? 'selected' : ''}>Không</option>
            </select>

            <button type="submit">${empty news.id ? 'Thêm mới' : 'Cập nhật'}</button>
            <button type="reset">Làm mới</button>
        </form>

        <!-- Hiển thị danh sách tin tức -->
        <div class="news-card-container">
            <c:if test="${not empty newsList}">
                <c:forEach var="news" items="${newsList}">
                    <div class="news-card">
                        <h3>${news.title}</h3>
                     
                        
                        <c:if test="${not empty news.image}">
                            <img src="${pageContext.request.contextPath}/uploads/${news.image}" alt="${news.title}">
                        </c:if>
                        <c:if test="${empty news.image}">
                            <p>Chưa có hình ảnh</p>
                        </c:if>
                        
                        <p><strong>Nội dung:</strong> ${news.content}</p>
                        <p><strong>Ngày đăng:</strong> ${news.postedDate}</p>
                        <p><strong>Tác giả:</strong> ${news.author}</p>
                        <p><strong>Lượt xem:</strong> ${news.viewCount}</p>
                        <p><strong>Mã loại tin:</strong> ${news.categoryId}</p>
                        <p><strong>Xuất hiện trên trang chủ:</strong> ${news.home ? 'Có' : 'Không'}</p>
                        
                        <div class="actions">
                            <form action="${pageContext.request.contextPath}/news/edit" method="get">
                                <input type="hidden" name="id" value="${news.id}">
                                <button type="submit">Sửa</button>
                            </form>
                            
                            <form action="${pageContext.request.contextPath}/news/delete" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn xóa tin tức này?');">
                                <input type="hidden" name="id" value="${news.id}">
                                <button type="submit">Xóa</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty newsList}">
                <p>Không có tin tức nào.</p>
            </c:if>
        </div>
    </div>
</body>
</html>
