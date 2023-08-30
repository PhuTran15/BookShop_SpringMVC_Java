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

	<div>
		||<a href="<c:url value="/themsanpham"	/>">Thêm Sản Phẩm</a>
		||<a href="<c:url value="/chinhsua"/>">Chỉnh sửa</a>||
		<br>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">ID BOOK</th>
					<th scope="col">Tên Sách</th>
					<th scope="col">Số Lượng</th>
					<th scope="col">Đơn Giá</th>
					<th scope="col">Tùy chọn</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
			
					<c:forEach var="item" items="${ books }" varStatus="index">
						<tr id="idbook" value="${item.idbook}">
							<th scope="row">${ item.idbook }</th>
							<td>${ item.tensach }</td>
							<td>${ item.soluong }</td>
							<td>${ item.dongia }</td>						
							<td><a href="<c:url value="/chitietsanpham/${item.idbook}"/>">Chi Tiết</a></td>
							<td><a href="<c:url value="/xoabook/${item.idbook}"/>">Xóa</a>
						</tr>
					</c:forEach> 
			</tbody>
		</table>
	</div>
</body>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
<script>src="/BookShop/src/main/webapp/assets/admin/js/index.js"</script>