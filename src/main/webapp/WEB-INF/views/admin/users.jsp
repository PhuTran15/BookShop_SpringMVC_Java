<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- chuyển trang -->

<title>Users</title>
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
						<li class=""><a href="<c:url value="/trang-chu-admin"/>">Danh mục sách </a></li>
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
						<li class="active"><a href="<c:url value="/users"	/>">User</a></li>
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
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Mail</th>
						<th scope="col">Username</th>
						<th scope="col">Địa Chỉ</th>
						<th scope="col">Quyền</th>
						<th scope="col">Tùy Chỉnh</th>
						<th scope="col"></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${ users1 }" varStatus="index">
						<tr>
							<th scope="${ item.user }">${ item.user }</th>
							<td>${ item.showname}</td>
							<td>${ item.diachi }</td>
							<td>${ item.quyen }</td>
							<td><a href="<c:url value="/thaydoiquyen/${item.user}"/>">Thêm quyền admin</a></td>
							<td><a href="<c:url value="/huyquyen/${item.user}"/>">Hủy quyền user</a></td>
							<td><a href="<c:url value="/xoausers/${item.user}"/>">Xóa</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>



</body>

