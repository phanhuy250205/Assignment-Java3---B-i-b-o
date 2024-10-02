<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Đăng nhập</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>

<style>
.red {
	color: red;
}

html, body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media (min-width: 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<!-- Custom styles for this template -->
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<link href="<%=url%>/css/signin.css" rel="stylesheet">

</head>
<body>
	<main class="form-signin w-100 m-auto">
		<form class="text-center" action="<%=url%>/Logiin" method="POST">
			<img class="mb-4" src="<%=url %>/img/logo/logo.png" alt="" width="72">
			<h1 class="h3 mb-3 fw-normal">ĐĂNG NHẬP</h1>
			<%
				String baoLoi = (String) request.getAttribute("baoLoi");
				if (baoLoi == null) {
					baoLoi = "";
				}
			%>
			<div class="text-center"><span class="red"><%=baoLoi %></span></div>

			<div class="form-floating">
				<input type="text" class="form-control" id="tenDangNhap" placeholder="Tên đăng nhập" name="tenDangNhap" required>
				<label for="tenDangNhap">Tên đăng nhập</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="matKhau" placeholder="Mật khẩu" name="matKhau" required>
				<label for="matKhau">Mật khẩu</label>
			</div>

			<div class="checkbox mb-3">
				<label><input type="checkbox" value="remember-me"> Ghi nhớ tài khoản này</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Đăng nhập</button>
			<a href="dangky.jsp">Đăng ký tài khoản mới</a>
			<p class="mt-5 mb-3 text-muted">&copy; 2017–2025</p>
		</form>
	</main>
</body>
</html>
