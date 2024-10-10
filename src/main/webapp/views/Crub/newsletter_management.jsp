<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.NEWSLETTERS" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý Email và Trạng thái</title>
    <style>
        /* CSS của bạn giữ nguyên như cũ */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f7fa;
            color: #333;
        }
        h1, h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #2c3e50;
            font-weight: bold;
        }
        input[type="email"],
        input[type="checkbox"] {
            margin-bottom: 20px;
            padding: 10px;
            width: calc(100% - 22px);
            border: 1px solid #bdc3c7;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            font-family: inherit;
        }
        button {
            display: inline-block;
            padding: 12px 20px;
            background-color: #1abc9c;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        button:hover {
            background-color: #16a085;
        }
        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ecf0f1;
            font-size: 16px;
        }
        th {
            background-color: #3498db;
            color: white;
            font-size: 18px;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        .message, .error {
            max-width: 600px;
            margin: 20px auto;
            padding: 15px;
            border-radius: 4px;
            text-align: center;
            font-weight: bold;
        }
        .message {
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
        }
        .actions {
            display: flex;
            justify-content: space-around;
        }
        .actions button {
            background-color: #e74c3c;
            padding: 10px 15px;
            font-size: 14px;
        }
        .actions button:hover {
            background-color: #c0392b;
        }
        .edit-button {
            background-color: #3498db;
        }
        .edit-button:hover {
            background-color: #2980b9;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Hàm AJAX để thêm hoặc cập nhật email
        function saveNewsletter() {
            var email = $("#email").val();
            var enabled = $("#enabled").is(':checked'); // Lấy trạng thái "Enabled"
            
            $.ajax({
                url: 'NewsletterController',
                type: 'POST',
                data: {
                    action: 'save',
                    email: email,
                    enabled: enabled
                },
                success: function (response) {
                    $("#message").text("Lưu email thành công").addClass("message").removeClass("error");
                    loadNewsletterData(); // Tải lại bảng dữ liệu
                },
                error: function () {
                    $("#message").text("Có lỗi xảy ra").addClass("error").removeClass("message");
                }
            });
        }

        // Hàm AJAX để xóa email
        function deleteNewsletter(email) {
            $.ajax({
                url: 'NewsletterController',
                type: 'POST',
                data: {
                    action: 'delete',
                    email: email
                },
                success: function (response) {
                    $("#message").text("Xóa email thành công").addClass("message").removeClass("error");
                    loadNewsletterData(); // Tải lại bảng dữ liệu
                },
                error: function () {
                    $("#message").text("Có lỗi xảy ra khi xóa").addClass("error").removeClass("message");
                }
            });
        }

        // Hàm để tải lại dữ liệu từ server và cập nhật bảng
        function loadNewsletterData() {
            $.ajax({
                url: 'NewsletterController',
                type: 'GET',
                success: function (response) {
                    $("#newsletterTable").html($(response).find("#newsletterTable").html());
                }
            });
        }

        // Hàm để chỉnh sửa thông tin email
        function editNewsletter(email, enabled) {
            // Đặt giá trị vào form để chỉnh sửa
            $("#email").val(email);
            $("#enabled").prop('checked', enabled);
        }

        $(document).ready(function () {
            // Khi form submit, gọi AJAX để lưu hoặc cập nhật
            $("#newsletterForm").submit(function (e) {
                e.preventDefault(); // Ngăn form submit thông thường
                saveNewsletter();
            });

            // Tải dữ liệu khi trang đã sẵn sàng
            loadNewsletterData();
        });
    </script>
</head>
<body>

    <h1>Quản lý Email và Trạng thái</h1>

    <!-- Form để thêm hoặc cập nhật Gmail và trạng thái -->
    <h2>Thêm hoặc Cập nhật Email</h2>
    <form id="newsletterForm">
        <input type="hidden" name="action" value="save">

        <label>Email:</label>
        <input type="email" id="email" name="email" required />

        <label>Enabled:</label>
        <input type="checkbox" id="enabled" name="enabled" value="true" />

        <button type="submit">Lưu</button>
    </form>

    <div id="message"></div> <!-- Hiển thị thông báo thành công hoặc lỗi -->

    <!-- Bảng hiển thị các Gmail và trạng thái đã lưu -->
    <h2>Danh sách Email và Trạng thái</h2>
    <table id="newsletterTable">
        <thead>
            <tr>
                <th>Email</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="newsletter" items="${newsletters}">
                <tr>
                    <td>${newsletter.email}</td>
                    <td>${newsletter.enabled ? "Enabled" : "Disabled"}</td>
                    <td class="actions">
                        <!-- Nút sửa -->
                        

                        <!-- Nút xóa -->
                        <button class="delete-button" onclick="deleteNewsletter('${newsletter.email}')">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty newsletters}">
                <tr>
                    <td colspan="3">Chưa có dữ liệu</td>
                </tr>
            </c:if>
        </tbody>
    </table>

</body>
</html>
