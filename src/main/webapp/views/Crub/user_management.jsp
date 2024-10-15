<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
</head>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    width: 90%;
    max-width: 800px;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    overflow-x: auto; /* Ensures the table is scrollable on small screens */
}

h2 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #ffffff;
}

th, td {
    border: 1px solid #ddd;
    padding: 12px 15px;
    text-align: left;
    font-size: 14px;
}

th {
    background-color: #f0f0f0;
    color: #333;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

input, select {
    width: calc(100% - 22px);
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 10px 0;
    color: white;
    background-color: #1a4fc5;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #0056b3;
}

.btn-delete {
    background-color: #dc3545;
}

.btn-delete:hover {
    background-color: #c82333;
}

.actions a {
    padding: 5px 10px;
    text-decoration: none;
    color: white;
    border-radius: 4px;
    display: inline-block;
    margin-right: 5px;
}

.edit-link {
    background-color: #ffc107;
}

.edit-link:hover {
    background-color: #e0a800;
}

.delete-link {
    background-color: #dc3545;
}

.delete-link:hover {
    background-color: #c82333;
}


</style>
<body>
    <div class="container">
        <h2>User Management</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Birthday</th>
                    <th>Gender</th>
                    <th>Mobile</th>
                    <th>Role</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.email}</td>
                        <td>${user.fullname}</td>
                        <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" /></td>
                        <td>${user.gender ? 'Male' : 'Female'}</td>
                        <td>${user.mobile}</td>
                        <td>${user.role ? 'Admin' : 'User'}</td> <!-- Here, role is interpreted -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
