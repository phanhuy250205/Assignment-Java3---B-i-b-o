<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý loại tin</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 90%;
            max-width: 600px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px 10px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #f9f9f9;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color .3s;
        }

        input:focus, select:focus {
            border-color: #555;
        }

        button {
            width: 100%;
            padding: 10px;
            color: white;
            background-color: #0056b3;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color .3s;
        }

        button:hover {
            background-color: #004494;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .actions a {
            text-decoration: none;
            color: #726868;
            padding: 5px 10px;
            border-radius: 4px;
            display: inline-block;
        }

        
    </style>
</head>
<body>
    <div class="container">
        <h2>Quản lý loại tin</h2>
        <!-- Form để thêm hoặc cập nhật loại tin -->
        <form action="${pageContext.request.contextPath}/categories?action=${category.id == null ? 'insert' : 'update'}" method="post">
            <label for="id">Nhập ID Loại Tin : </label>
            <input type="text" id="id" name="id" value="${category.id}" placeholder="Nhập ID loại tin" required>
            <label for="name">Tên loại tin:</label>
            <input type="text" id="name" name="name" value="${category.name}" placeholder="Tên loại tin" required>
            <button type="submit">${category.id == null ? 'Thêm mới' : 'Cập nhật'}</button>
        </form>

        <!-- Hiển thị danh sách loại tin -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên loại tin</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categoriesList}">
                    <tr>
                        <td>${category.id}</td>
                        <td>${category.name}</td>
                        <td class="actions">
                            <!-- Nút sửa -->
                            <a href="${pageContext.request.contextPath}/categories?action=edit&id=${category.id}" class="edit-link">Sửa</a>
                            <!-- Nút xóa -->
                            <a href="${pageContext.request.contextPath}/categories?action=delete&id=${category.id}" class="delete-link" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
