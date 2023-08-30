<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 


<!-- chuyển trang -->
s

<title>Liên hệ</title>
<html lang="vi" class="h-100">

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
					<a class="active" href="<c:url value="/trang-chu"/>"> <span
						class="icon-home"></span> Trang chủ <c:if
							test="${ empty showname }"></a> <a href="#"><span
						class="icon-user"></span> Tài khoản </a> <a
						href="<c:url value="/dang-ky"/>"><span class="icon-edit"></span>
						Đăng ký </a>
					</c:if>
					<c:if test="${ not empty showname }">
						</a>
						<a href="#"><span class="icon-user"></span> ${ sessionScope.showname }</a>
					</c:if>
					<a href="<c:url value="/gio-hang"/>"><span
						class="icon-shopping-cart"></span> ${ TotalQuantyCart } Sản
						phẩm(s) - <span class="badge badge-warning"><fmt:formatNumber type="number" groupingUsed="true" value="${ TotalPriceCart }"/>đ
					</span></a>
					<c:if test="${ not empty showname }">
						<a href="<c:url value="/dang-xuat"/>">Logout</a>
					</c:if>
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
						<li class=""><a href="<c:url value="/trang-chu"/>">Trang
								chủ </a></li>
						<li class=""><a href="<c:url value="/gioi-thieu"/>">Giới
								thiệu</a></li>
						<li class=""><a href="<c:url value="/product"/>">Sản phẩm</a></li>
						<li class=""><a href="<c:url value="/news"/>">Tin tức</a></li>
						<li class="active"><a href="<c:url value="/lien-he"/>">Liên
								hệ</a></li>
						<li class=""><a href="<c:url value="/gio-hang"/>">Giỏ hàng</a></li>
						<c:if test="${ not empty showname }">
						<c:if test="${ not empty kiemtradh }">
						<c:if test="${ not empty testvalue }">
							<li class=""><a href="<c:url value="/don-hang"/>">Đơn hàng đã đặt</a></li>
							</c:if>
						</c:if>
						</c:if>
					</ul>
					<!--<form action="#" class="navbar-search pull-left">
						<input type="text" placeholder="Search" class="search-query span2">
					</form>-->
					<ul class="nav pull-right">
						<c:if test="${ empty showname }">
							<li class="dropdown"><a data-toggle="dropdown"
								class="dropdown-toggle" href="#"><span class="icon-lock"></span>
									Đăng nhập <b class="caret"></b></a>
								<div class="dropdown-menu">
									<form:form class="form-horizontal loginFrm" action="dang-nhap"
										method="POST" modelAttribute="user">
										<div class="control-group">
											<form:input id="inputEmail" class="span2"
												title="Nhập Email của bạn" type="email" placeholder="Email"
												required="required" path="user" />
										</div>
										<div class="control-group">
											<form:input id="inputPassword" class="span2"
												title="Nhập mật khẩu của bạn" type="password"
												placeholder="Password" required="required" path="passwords" />
										</div>
										<div class="control-group">
											<!-- <label class="checkbox"> <input type="checkbox">
												Ghi nhớ
											</label> -->
											<button type="submit"
												style="border-radius: 5px; font-weight: bold">Đăng
												nhập</button>
										</div>
									</form:form>
								</div>
						</c:if>
						<c:if test="${ not empty showname }">
							<li class="dropdown"><a style="font-weight: bold"
								data-toggle="dropdown" class="dropdown-toggle" href="#"><span
									style="color: green" class="icon-ok"></span> Xin chào, ${ showname }</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<main role="main">

		<div class="container mt-2">
			<h2 class="text-left">Thông tin liên hệ</h2>
			<h1 style="color: blue" class="text-center">
				<b>Cửa hàng BOOKSHOP</b>
			</h1>
			<p class="text-center">
				<i>Địa chỉ: 130 - Đường Xô Viết Nghệ Tĩnh, P.An Hội, Q.Ninh
					Kiều, TP.Cần Thơ<br> Điện thoại: (08) 78 253 844<br> <b>Hotline:
						0947 28 39 29</b><br> Email: boostore@email.com
				</i>
			</p>
			<br>
			<br>
			<br>



			<div class="row">

				<div class="col col-md-6" style="float: left">
					<a href="#"><img
						src="<c:url value="/assets/user/img/lienhe.jpg"/>" alt="lienhe"
						width="500" height="500"></a>
				</div>
				<h2 style="color: brow"><i>Gửi lời nhắn đến cửa hàng !!!</i></h2>
				<div class="col col-md-6">
					<form:form action="lien-he" method="POST" modelAttribute="lienhe">
						<div class="control-group" style="text-align: center">
							<h4>Nhập Email</h4>
							<div class="controls">
								<form:input class="span3" type="email" placeholder="Email"
									path="email" />
							</div>
							<h4>Nhập tiêu đề</h4>
							<div class="controls">
								<form:input class="span3" type="text" placeholder="Tiêu đề"
									path="tieude" />
							</div>
							<h4>Nhập nội dung</h4>
							<div class="controls">
								<form:input class="span3" type="text" placeholder="Nội dung"
									path="noidung" />
							</div>
						</div>
						<div class="controls" style="text-align: center">
							<button type="submit" class="btn block">Gửi lời nhắn</button>
						</div>
					</form:form>



				</div>
				<div class="row mt-2" style="margin: 50px 0">
					<div class="col col-md-12">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.7235485722294!2d105.78061631523369!3d10.039656175103817!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a062a768a8090b%3A0x4756d383949cafbb!2zMTMwIFjDtCBWaeG6v3QgTmdo4buHIFTEqW5oLCBBbiBI4buZaSwgTmluaCBLaeG7gXUsIEPhuqduIFRoxqEsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1556697525436!5m2!1svi!2s"
							width="100%" height="450" frameborder="0" style="border: 0"
							allowfullscreen=""></iframe>
					</div>
				</div>
			</div>
</body>