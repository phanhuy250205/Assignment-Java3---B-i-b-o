<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Đăng nhập</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
	crossorigin="anonymous"></script>
<style>
body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
}

.red {
	color: red;
}

.options {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
}

.options a {
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
	transition: color 0.3s ease;
}

.options a:hover {
	color: #0056b3;
	text-decoration: underline;
}
</style>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<link href="<%=url%>/css/signin.css" rel="stylesheet">
</head>
<body>
	<main class="form-signin">
		<form action=<%=url%>/Login method="POST">
			<h1 class="h3 mb-3 fw-normal text-center">Đăng nhập</h1>

			<%
                String baoLoi = (String) request.getAttribute("baoLoi");
                if (baoLoi == null) {
                    baoLoi = "";
                }
            %>
			<div class="text-center">
				<span class="red"><%= baoLoi %></span>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="tenDangNhap"
					name="tenDangNhap" placeholder="Tên đăng nhập" required> <label
					for="tenDangNhap">Tên đăng nhập</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="matKhau"
					name="matKhau" placeholder="Mật khẩu" required> <label
					for="matKhau">Mật khẩu</label>
			</div>

			<button class="w-100 btn btn-lg btn-primary" type="submit">Đăng
				nhập</button>

			<div class="options">
				<a href="doimatkhau.jsp">Quên mật khẩu?</a> <a href="dangky.jsp">Đăng
					ký</a>
			</div>

			<p class="mt-5 mb-3 text-muted text-center">&copy; 2024–2025</p>
		</form>
	</main>
</body>
</html>
