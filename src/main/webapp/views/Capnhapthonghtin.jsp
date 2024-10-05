<%@page import="model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cập Nhật Thông Tin Người Dùng</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.wrapper {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	background-color: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	max-width: 800px;
	width: 100%;
}

.container {
	width: 60%;
	padding-right: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 8px;
	color: #555;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
	box-sizing: border-box;
}

.form-group button {
	background-color: #28a745;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.form-group button:hover {
	background-color: #218838;
}

.image-preview {
	width: 35%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 10px;
	background-color: #fafafa;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
}

.image-preview img {
	max-width: 100%;
	border-radius: 10px;
	margin-bottom: 10px;
}

.image-preview label {
	margin-bottom: 10px;
	font-size: 14px;
	color: #333;
	font-weight: bold;
}
</style>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
</head>
<body>
	<%
        Object obj = session.getAttribute("khachHang");
        Users khachHang = null;
        if (obj != null) {
            khachHang = (Users) obj;
        }
        if (khachHang == null) {
    %>
	<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
	<%
        } else {
    %>

	<div class="container">

		<%
        String baoLoi = request.getAttribute("baoLoi") != null ? request.getAttribute("baoLoi").toString() : "";
        String email = request.getAttribute("email") != null ? request.getAttribute("email").toString() : "";
        String role = request.getAttribute("role") != null ? request.getAttribute("role").toString() : "";
        String fullname = request.getAttribute("fullname") != null ? request.getAttribute("fullname").toString() : "";
        String birthday = request.getAttribute("birthday") != null ? request.getAttribute("birthday").toString() : "";
        String gender = request.getAttribute("gender") != null ? request.getAttribute("gender").toString() : "";
        String mobile = request.getAttribute("mobile") != null ? request.getAttribute("mobile").toString() : "";
        
    %>
    
		<h2>Cập Nhật Thông Tin Người Dùng</h2>
		<form id="userForm" action="<%=url%>/CapNhatthongtinn" method="POST" >
			
			<div class="form-group">
				<label for="email">Email Người dùng :</label> <input type="email"
					id="email" name="email" required
					value="<%= khachHang.getemail() %>">
			</div>

			<div class="form-group">
				<label for="fullname">Họ và tên:</label> <input type="text"
					id="fullname" name="fullname" required
					value="<%= khachHang.getfullname() %>">
			</div>

			<div class="form-group">
				<label for="birthday">Ngày sinh:</label> <input type="date"
					id="birthday" name="birthday" required
					value="<%= khachHang.getbirthday() %>">
			</div>

			<div class="form-group">
				<label for="gender">Giới tính:</label> <select id="gender"
					name="gender" required>
					<option value="1">Nam</option>
					<option value="0">Nữ</option>
					<option value="2">Khác</option>
				</select>
			</div>

			<div class="form-group">
				<label for="mobile">Số điện thoại:</label> <input type="text"
					id="mobile" name="mobile" required
					value="<%= khachHang.getmobile() %>">
			</div>

			<div class="form-group">
				<button onclick="location.href='index.jsp'">Cập Nhật thông
					tin</button>
			</div>
		</form>
	</div>

	<div class="image-preview" id="image-preview">
		<label for="image-preview">Ảnh của bạn:</label> <img
			id="image-display" src="#" alt="Image preview" style="display: none;">
	</div>

	<%
        }
    %>

	<script>
    const imageInput = document.getElementById('image-upload');
    const imageDisplay = document.getElementById('image-display');

    imageInput?.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                imageDisplay.src = e.target.result;
                imageDisplay.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });
</script>

</body>
</html>
