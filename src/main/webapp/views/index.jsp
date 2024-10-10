<%@page import="model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="./assets/css/base.css">
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
							<li><a href="${pageContext.request.contextPath}/theloaithethao">Thể Thao </a></li>
							<li><a href="${pageContext.request.contextPath}/theloaiphapluat">Văn Hóa</a></li>
							<li><a href="${pageContext.request.contextPath}/theloaivanhoa">Phát Luật</a></li>
							<li><a href="#">Công Cụ Cho nhà phát triển </a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/news/list">Quản Lý Tin tức</a></li>
									<li><a href="/ASM_JAVA3_PD10267/categories?action=list">Quản Lý Loại tin</a></li>
									<li><a href="${pageContext.request.contextPath}/Usermanger">Quản Lý Người Dùng</a></li>
									<li><a href="${pageContext.request.contextPath}/Newsletter">Quản Lý Người Dùng</a></li>
									
								</ul>
							</li>
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
								href="/ASM_JAVA3_PD10267/views/Login/dangnhap.jsp"> Đăng nhập </a>
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
										<li><a class="dropdown-item" href="/ASM_JAVA3_PD10267/views/Login/Capnhapthonghtin.jsp">Thay
												đổi thông tin</a></li>
										<li><a class="dropdown-item" href="/ASM_JAVA3_PD10267/views/Login/doimatkhau.jsp">Đổi
												mật khẩu</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="out">Thoát
												tài khoản</a></li>
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
							<li><a href="#"> Sau khi bị Lý Nhã Kỳ nhắc thẳng tên, ca
									sĩ Hồng Gấm đã lên tiếng trên trang cá nhân. </a></li>
							<li><a href="#">Lorem ipsum dolor sit amet consectetur
									adipisicing elit. </a></li>
							<li><a href="#">Lorem ipsum dolor sit amet consectetur
									adipisicing elit</a></li>
						</ul>
					</div>
					<div class="BaiVietNoiBat">
						<h2>Bài viết nổi bật</h2>
						<ul>
							<li><a href="#">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. </a> (100 lượt xem)</li>
							<li><a href="#">Lorem ipsum dolor, sit amet consectetur
									adipisicing elit. </a> (50 lượt xem)</li>
							<li><a href="#">Lorem ipsum dolor sit amet consectetur
									adipisicing elit. </a> (20 lượt xem)</li>
						</ul>
					</div>
				</div>
				<div class="row baidang">

					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">


							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh1.jpg"
									alt="phanhuy">

								<h3 class="inner-name">
									<a
										href="https://kenh14.vn/hot-sao-nu-vbiz-bi-mat-yeu-phi-cong-kem-5-tuoi-dang-trai-da-co-con-rieng-215240924165349731.chn">HOT:
										Sao nữ Vbiz bí mật yêu "phi công" kém 5 tuổi, đàng trai đã có
										con riêng?</a>
								</h3>
								<p class="inner-position">Chuyện tình của cặp đôi này chính
									là 2 người chia tay, 4 người hạnh phúc đây mà!</p>
								<div class="comnet">
									<p>Ngày Đăng :25/02/2005</p>
									<p>Tác Giả : Phan Huy</p>
								</div>
							</div>
						</div>
					</div>


					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">

							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh1.jpg"
									alt="phanhuy">
								<h3 class="inner-name">
									<a
										href="https://kenh14.vn/nu-ca-si-vbiz-cong-khai-xin-loi-ly-nha-ky-vi-khien-dan-chi-gian-du-dang-dan-nhac-thang-ten-215240924214037153.chn">Nữ
										ca sĩ Vbiz công khai xin lỗi Lý Nhã Kỳ vì khiến đàn chị giận
										dữ đăng đàn nhắc thẳng tên</a>
								</h3>
								<p class="inner-position">Sau khi bị Lý Nhã Kỳ nhắc thẳng
									tên, ca sĩ Hồng Gấm đã lên tiếng trên trang cá nhân.</p>
								<div class="comnet" style="display: flex;">
									<p>Ngày Đăng :25/02/2005</p>
									<p>Tác Giả : Phan Huy</p>
								</div>
							</div>
						</div>
					</div>




					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">

							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh3.jpg"
									alt="phanhuy">
								<h3 class="inner-name">
									<a
										href="https://kenh14.vn/my-nhan-ca-doi-chi-dong-1-phim-ma-thanh-huyen-thoai-man-anh-215240924232400248.chn">Mỹ
										nhân cả đời chỉ đóng 1 phim mà thành huyền thoại màn ảnh</a>
								</h3>
								<p class="inner-position">Chỉ đóng một phim nhưng vai diễn
									của người đẹp đã trở thành kinh điển ,Tây Du Ký 1986 là tác
									phẩm kinh điển</p>
								<div class="comnet" style="display: flex;">
									<p>Ngày Đăng :25/02/2005</p>
									<p>
										<img src="/ASM_JAVA3_PD10267/views/assets/img/anh3.jpg" alt=""
											style="width: 40px; height: 20px; margin-right: 10px;">Tác
										Giả : Phan Huy
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">

							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh4.jpg"
									alt="phanhuy">
								<h3 class="inner-name">
									<a
										href="https://kenh14.vn/nhan-duoc-giay-bao-do-dai-hoc-nam-sinh-di-hoc-duoc-1-thang-thi-nha-truong-thong-bao-chung-toi-chua-tung-nhan-em-215240924195921452.chn">Nhận
										được giấy báo đỗ đại học, nam sinh đi học được 1 tháng thì nhà
										trường thông báo: "Chúng tôi chưa từng nhận em"</a>
								</h3>
								<p class="inner-position">Sau khi nhập học, nam sinh đã đóng
									hết học phí thì mới ngỡ ngàng nghe tin mình vốn</p>
								<div class="comnet" style="display: flex;">
									<p>Ngày Đăng :25/02/2005</p>
									<p>Tác Giả : Phan Huy</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">

							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh6.jpg"
									alt="phanhuy">
								<h3 class="inner-name">
									<a
										href="https://kenh14.vn/bi-cao-truong-my-lan-ngay-nao-cung-co-nguoi-noi-chi-oi-thieu-tien-chi-oi-thieu-tai-san-215240924161445534.chn">Bị
										cáo Trương Mỹ Lan: 'Ngày nào cũng có người nói chị ơi thiếu
										tiền, chị ơi thiếu tài sản...'</a>
								</h3>
								<p class="inner-position">Trả lời xét hỏi tại phiên tòa, bà
									Trương Mỹ Lan nói không nhớ nhiều số liệu trong vụ án, tuy
									nhiên bà Lan cũng nói ...</p>
								<div class="comnet" style="display: flex;">
									<p>Ngày Đăng :25/02/2005</p>
									<p>Tác Giả : Phan Huy</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">

							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh5.jpg"
									alt="phanhuy">
								<h3 class="inner-name">
									<a
										href="https://kenh14.vn/thuong-hon-chu-thuong-anh-thoi-da-khoc-khi-chia-tay-cac-chien-si-roi-lang-nu-215240924215408639.chn">Thương
										hơn chữ thương: Anh Thới đã khóc khi chia tay các chiến sĩ rời
										Làng Nủ</a>
								</h3>
								<p class="inner-position">Những hình ảnh được ghi lại vào
									chiều ngày 24/9 tại Làng Nủ, xã Phúc Khánh, huyện Bảo Yên (Lào
									Cai) khiến nhiều người nghẹn ngào.</p>
								<div class="comnet" style="display: flex;">
									<p>Ngày Đăng :25/02/2005</p>
									<p>Tác Giả : Phan Huy</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">

							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh7.jpg"
									alt="phanhuy">
								<h3 class="inner-name">
									<a
										href="https://vnexpress.net/thu-tuong-phan-dau-hoan-thanh-san-bay-long-thanh-nam-2025-4796401.html">Thủ
										tướng: Phấn đấu hoàn thành sân bay Long Thành năm 2025</a>
								</h3>
								<p class="inner-position">Với tiềm lực và tiến độ như hiện
									nay, Thủ tướng yêu cầu hoàn thành sân bay Long Thành vào năm
									sau, vượt gần một năm so với kế hoạch ban đầu.</p>
								<div class="comnet" style="display: flex;">
									<p>Ngày Đăng :25/02/2005</p>
									<p>Tác Giả : Phan Huy</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">

							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh8.jpg"
									alt="phanhuy">
								<h3 class="inner-name">
									<a href="">Hà Nội và TP HCM dự kiến xây dựng 580 km đường
										sắt đô thị đến năm 2035</a>
								</h3>
								<p class="inner-position">Năm 2035, Hà Nội và TP HCM dự kiến
									hoàn thành các tuyến đường sắt đô thị theo quy hoạch, tổng
									chiều dài 580 km...</p>
								<div class="comnet" style="display: flex;">
									<p>Ngày Đăng :25/02/2005</p>
									<p>Tác Giả : Phan Huy</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-md-4 col-sm-6 col-12">
						<div class="inner-box">

							<div class="inner-info">
								<img src="/ASM_JAVA3_PD10267/views/assets/img/anh9.png"
									alt="phanhuy">

								<h3 class="inner-name">
									<a
										href="https://vnexpress.net/bi-quyet-thang-hang-mon-an-cua-vua-dau-bep-ngo-thanh-hoa-4793717.html?">Bí
										quyết 'thăng hạng' món ăn của vua đầu bếp Ngô Thanh Hòa</a>
								</h3>
								<p class="inner-position">Dầu ăn Neptune Light với công thức
									kết hợp ba thành phần: gạo lứt, hướng dương và đậu nành được
									đầu bếp Ngô Thanh Hòa gọi là bí quyết "thăng hạng món ăn".</p>
								<div class="comnet" style="display: flex;">
									<p>Ngày Đăng :25/02/2005</p>
									<p>Tác Giả : Phan Huy</p>
								</div>
							</div>
						</div>
					</div>


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
<style>
.me-2 {
	margin-right: 0.5rem !important;
	margin-top: -1px;
	padding: 12px 2px;
}
#primary_nav_wrap ul ul li a {

  background-color: #d5cece;
}
</style>

</html>