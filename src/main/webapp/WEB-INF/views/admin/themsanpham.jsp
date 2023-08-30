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
									<form class="form-horizontal loginFrm">
										<div class="control-group">
											<input type="text" class="span2" id="inputEmail"
												placeholder="Email">
										</div>
										<div class="control-group">
											<input type="password" class="span2" id="inputPassword"
												placeholder="Password">
										</div>
										<div class="control-group">
											<label class="checkbox"> <input type="checkbox">
												Ghi nhớ
											</label>
											<button type="submit" class="shopBtn btn-block">Tùy
												Chọn</button>
										</div>
									</form>
								</div></li>
						</ul>
					</div>
				
			</div>

		</div>
		
	</div>
			<div class="row">
				 <div class="span4">
					<div class="well">
						<h5>Thêm sản phẩm mới</h5>
						<form:form action="themsanpham" method="POST" modelAttribute="addbooks">
							<div class="control-group">
								<div class="controls">
									<label class="control-label" for="inputTheLoai">Thể loại</label>
									<form:select path="idloai">
									<c:forEach var="item" items="${ theloai1 }" varStatus="">
										<form:option value="${item.idloai}" label="${item.theloai}" />
									</c:forEach>
									</form:select>
								</div>
								<label class="control-label" for="inputTenSach">Tên sách</label>
								<div class="controls">
									<form:input class="span3" placeholder="Tên sách" path="tensach" /> 
								</div>
								<label class="control-label" for="inputTacGia">Tác giả</label>
								<div class="controls">
									<form:input class="span3" type="text" placeholder="Tác giả" path="tacgia" />
								
								</div>
								<label class="control-label" for="inputNXB">Nhà Xuất Bản</label>
								<div class="controls">
									<form:input class="span3" type="text" placeholder="Nhà xuất Bản"
										path="tennxb" />
									
								</div>
								<label class="control-label" for="inputGT">Giới thiệu</label>
								<div class="controls">
									<form:input class="span3" type="text" placeholder="Giới thiệu sách"
										path="gioithieu" />
									
								</div>
								<label class="control-label" for="inputSL">Số lượng</label>
								<div class="controls">
									<form:input class="span3" type="number" min="0" oninput="this.value = Math.abs(this.value)"
										path="soluong" />
									
								</div>
								<label class="control-label" for="inputDG">Đơn Giá</label>
								<div class="controls">
									<form:input class="span3" type="text" oninput="this.value = Math.abs(this.value)"
										path="dongia" />
								</div>
							</div>
							<div class="controls">
								<button type="submit" class="btn block">Thêm sách</button></div>
						</form:form>
							</div>
					</div>
				</div>
</body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
<script>src="/BookShop/src/main/webapp/assets/admin/js/index.js"</script>