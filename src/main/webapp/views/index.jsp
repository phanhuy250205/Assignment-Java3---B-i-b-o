<%@page import="model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="/ASM_JAVA3_PD10267/views/assets/css/base.css">
<link rel="stylesheet"
	href="/ASM_JAVA3_PD10267/views/assets/css/index.css">

</head>
<body>
	<div class="logo">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<img src="/ASM_JAVA3_PD10267/views/assets/img/anhlogo.jpg" alt=""
						class="logonne">

				</div>
			</div>
		</div>
	</div>
	<div class="testimonials">
		<div class="container">
			<div class="row baidang1">
				<div class="col-12">

					<!-- Menu -->

					<nav id="primary_nav_wrap">
						<ul>
							<li class="current-menu-item"><a href="#">Home</a></li>
							<li><a
								href="${pageContext.request.contextPath}/theloaithethao">Thể
									Thao </a></li>
							<li><a
								href="${pageContext.request.contextPath}/theloaiphapluat">Văn
									Hóa</a></li>
							<li><a
								href="${pageContext.request.contextPath}/theloaivanhoa">Phát
									Luật</a></li>
							<!-- Hiển thị quản lý tin tức cho tất cả người dùng -->

							<%
							Users user1 = (Users) session.getAttribute("khachHang");
							Boolean isAdmin = false;

							// Kiểm tra nếu người dùng đã đăng nhập và xác định quyền
							if (user1 != null) {
								isAdmin = user1.isRole(); // true nếu là quản trị, false nếu không
							}
							%>
							<!-- Chỉ hiển thị quản lý loại tin và người dùng nếu là admin -->
							<%
							if (isAdmin) {
							%>
							<li class="dropdown"><a href="#">Công cụ phát triển</a>
								<ul class="dropdown-menu">

									<li><a
										href="${pageContext.request.contextPath}/categories?action=list">Quản
											Lý Loại tin</a></li>
									<li><a
										href="${pageContext.request.contextPath}/Usermanger">Quản
											Lý Người Dùng</a></li>
									<li><a
										href="${pageContext.request.contextPath}/Newsletter">Quản
											Lý Bản Tin</a></li>
								</ul></li>
							<%
							} else {
							%>
							<li class="hidden">
								<!-- hide disabled links from non-admin users --> <span
								class="disabled-link">Quản Lý Loại tin</span>
							</li>
							<li class="hidden">
								<!-- hide disabled links from non-admin users --> <span
								class="disabled-link">Quản Lý Người Dùng</span>
							</li>
							<li class="hidden">
								<!-- hide disabled links from non-admin users --> <span
								class="disabled-link">Quản Lý Bản Tin</span>
							</li>
							<%
							}
							%>
						</ul>


						<%
						// Lấy đối tượng người dùng từ session
						Object obj = session.getAttribute("khachHang");
						Users user = null;

						// Kiểm tra nếu đối tượng không null
						if (obj != null) {
							user = (Users) obj; // Gán đối tượng người dùng
						}
						%>

						<form class="d-flex" role="search"
							style="position: relative; display: block; float: right; margin-top: -47px;">


							<%
							if (user == null) {
							%>
							<!-- Nếu người dùng chưa đăng nhập, hiển thị nút đăng nhập -->
							<a class="btn btn-primary" style="white-space: nowrap;"
								href="/ASM_JAVA3_PD10267/views/Login/dangnhap.jsp"> Đăng
								nhập </a>
							<%
							} else {
							%>
							<!-- Nếu người dùng đã đăng nhập, hiển thị menu tài khoản  nút đăng nhập sẽ bị ẩn -->
							<ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor">
								<li class="nav-item dropdown dropstart"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> Tài khoản
								</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">Thông báo</a></li>
										<li><a class="dropdown-item"
											href="/ASM_JAVA3_PD10267/views/Login/Capnhapthonghtin.jsp">Thay
												đổi thông tin</a></li>
										<li><a class="dropdown-item"
											href="/ASM_JAVA3_PD10267/views/Login/doimatkhau.jsp">Đổi
												mật khẩu</a></li>
										<li><a
											href="${pageContext.request.contextPath}/news/list">Quản
												Lý Tin tức</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="out">Thoát tài
												khoản</a></li>
									</ul></li>
							</ul>
							<%
							}
							%>
						</form>

					</nav>


				</div>
			</div>
			<div class="menu-1" style="display: flex;">
				<div class="right-sidebar">
					<div class="BaiVietMoiNhat">
						<h2>Bài viết mới nhất</h2>
						<ul>
							<!-- Lặp qua danh sách các bài viết mới nhất -->
							<c:forEach var="news" items="${latestNews}">
								<li><a href="details.jsp?id=${news.id}">${news.title}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="BaiVietNoiBat">
						<h2>Bài viết nổi bật</h2>
						<ul>
							<!-- Lặp qua danh sách các bài viết có lượt xem nhiều nhất -->
							<c:forEach var="news" items="${topViewedNews}">
								<li><a href="details.jsp?id=${news.id}">${news.title}</a>
									(${news.viewCount} lượt xem)</li>
							</c:forEach>
						</ul>
					</div>

				</div>
				<div class="row baidang">
					<c:forEach var="news" items="${newsList}">
						<div class="col-xl-4 col-md-4 col-sm-6 col-12">
							<div class="inner-box">
								<div class="inner-info">
									<c:if test="${not empty news.image}">
										<img
											src="${pageContext.request.contextPath}/uploads/${news.image}"
											alt="${news.title}">
									</c:if>
									<h3 class="inner-name">
										<a
								href="${pageContext.request.contextPath}/details?id=${news.id}">
								${news.title} </a>
									</h3>
									<p class="inner-position">${news.content}</p>
									<div class="comnet" style="display: flex;">
										<p>Ngày Đăng: ${news.postedDate}</p>
										<p>Tác Giả: ${news.author}</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>



			</div>


		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gybBogGzG1Y5L9/6p73lPJNPnN/QbFf5weoU5qrGh4Ep2JFcXP"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-DKf6MQNHgIo78RZ7+t7Q1Lr3LqlCkgaC/vuMP+HfkGDf6lFQImCWdtfiKfjIpmsr"
		crossorigin="anonymous"></script>


	<script>
		
	</script>
</body>


</html>