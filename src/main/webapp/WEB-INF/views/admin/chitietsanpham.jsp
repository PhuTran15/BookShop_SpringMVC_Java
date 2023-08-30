<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- chuyển trang -->
<head>
	<link rel = "stylessheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" >
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
</head>
<title>Admin</title>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
						<a href="#"><span class="icon-twitter"></span></a> <a href="#"><span
							class="icon-facebook"></span></a> <a href="#"><span
							class="icon-youtube"></span></a> <a href="#"><span
							class="icon-tumblr"></span></a>
					</div>
						<a href="trang-chu"><span class="icon-user"></span> Admin</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a data-target=".nav-collapse" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="active"><a href="<c:url value="/trang-chu-admin"/>">Danh mục sách </a></li>
						<li class=""><a href="<c:url value="/theloai"/>">Danh mục thể loại </a></li>
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle"><span class=""></span> Danh Sách Đơn
								Hàng <b class="caret"></b></a>
							<div class="dropdown-menu">
								<form class="form-horizontal loginFrm">
									<li><a href="<c:url value="/donhang"/>">Tất cả đơn hàng</a></li>
									<li><a href="<c:url value="/donhang/1"/>">Đơn hàng chưa xác nhận</a></li>
									<li><a href="<c:url value="/donhang/2"/>">Đơn hàng đã xác nhận </a></li>
									<li><a href="<c:url value="/donhang/0"/>">Đơn hàng đã hủy </a></li>
								</form>
							</div></li>
						<li class=""><a href="<c:url value="/users"	/>">User</a></li>
						<li class=""><a href="<c:url value="/lienhe"/>">Liên hệ người dùng</a></li>
						<li class=""><a href="<c:url value="danhgia"/>">Đánh giá sách</a></li>
					</ul>
					<!--<form action="#" class="navbar-search pull-left">
						<input type="text" placeholder="Search" class="search-query span2">
					</form>-->
					<ul class="nav pull-right">
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle" href="#"><span class="icon-lock"></span>
								Tùy chọn <b class="caret"></b></a>
							<div class="dropdown-menu">
								<div class="control-group">
									<button type="submit" class="shopBtn btn-block">Đổi
										mật Khẩu</button>
								</div>

								<div class="control-group">
									<button type="submit" class="shopBtn btn-block">Đăng
										xuẩt</button>
								</div>
							</div></li>
					</ul>
				</div>
				
			</div>

		</div>
		
	</div>

	<c:forEach var="item" items="${ books1 }" varStatus="index">
		<div class="col-sm-6">
			<div class="product-inner">
				<h2 class="product-name">${item.tensach}</h2>
				<h4 class="product-name">Tác giả: ${item.tacgia}</h4>
				<h5 class="product-name">Nhà xuất bản: ${item.tennxb}</h5>
				<div class="product-inner-price">
				<p>Giá: ${item.dongia}</p>
				<p>Số Lượng: ${item.soluong}</p>
				<p>Thể loại: ${item.tenloai}</p>
				</div>
					<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="home">
						<h4>Giới thiệu</h4>
						<p>${item.gioithieu}</p>
						<h3>Hình ảnh:</h3>
						<a href="#"><img src="<c:url value="${item.hinhanh}"/>"
							alt="payment"></a>
					</div>

				</div>
				</div>

			</div>
	</c:forEach>
</body>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
<script>src="/BookShop/src/main/webapp/assets/admin/js/index.js"</script>