<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!-- chuyển trang -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
</head>
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
					<a href="<c:url value="/trang-chu"/>"> <span
						class="icon-home"></span> Trang chủ <c:if
							test="${ empty showname }"></a> <a href="#"><span
						class="icon-user"></span> Tài khoản </a> <a class="active"
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

	<div class="row">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${ theloaidk }" varStatus="index">
						<li><a href="<c:url value="/product/${ item.idloai }"/>"><span
								class="icon-chevron-right"></span>${ item.tenloai }</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="cart.html"><strong>
								Tổng đơn hàng: <span class="badge badge-warning pull-right"
								style="line-height: 18px;">${ TotalPriceCart }$</span>
						</strong></a></li>
				</ul>
			</div>

			<div class="well well-small alert alert-warning cntr">
				<h2>Đăng ký ngay</h2>
				<p>
					để mua hàng ngay lập tức<br>(Giảm giá 10% khi mua trên 5 sản phẩm) <br> <br>
					<c:if test="${ empty showname }">
						<a class="defaultBtn" href="<c:url value="/dang-ky"/>">Click
							here</a>
					</c:if>
					<c:if test="${ not empty showname }">
						<a class="defaultBtn"><span class="icon-ok"></span>Đã đăng ký</a>
					</c:if>
				</p>
			</div>

		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="<c:url value="trang-chu"/>">Trang chủ</a> <span
					class="divider">/</span></li>
				<li class="active">Đăng nhập</li>
			</ul>
			<h3>Đăng ký / Đăng nhập</h3>
			<hr class="soft" />
			<c:if test="${ not empty statuslg }">
				<h3 style="color: red">${ statuslg }</h3>
			</c:if>
			<c:if test="${ not empty statuslg2 }">
				<h3 style="color: red">${ statuslg2 }</h3>
			</c:if>

			<div class="loginform">
				<div class="content-w3ls">
					<div class="content-agile2">
						<h3 style="color: white; text-align: center">Đăng ký</h3>
						<form:form action="dang-ky" method="POST" modelAttribute="user">
							<div class="form-control w3layouts">
								<form:input id="emaillogin" title="Nhập Email"
									class="span3" type="email" placeholder="mail@example.com"
									required="required" path="user" />
							</div>

							<div class="form-control w3layouts">
								<form:input id="password1" title="Nhập mật khẩu"
									class="span3" type="password" placeholder="Password"
									required="required" path="passwords" />
							</div>

							<div class="form-control w3layouts">
								<form:input id="password2" title="Nhập lại mật khẩu"
									class="span3" type="password" placeholder="Confirm Password"
									required="required" path="" />
							</div>

							<div class="form-control agileinfo">
								<form:input id="emaillogin" title="Nhập tên người dùng"
									class="span3" type="text" placeholder="Usename"
									required="required" path="showname" />
							</div>

							<div class="form-control agileinfo">
								<form:input id="emaillogin" title="Nhập địa chỉ"
									class="span3" type="text" placeholder="Address"
									required="required" path="diachi" />
							</div>
							
							<div class="form-control agileinfo">
								<form:input id="emaillogin" title="Nhập số điện thoại"
									class="span3" type="text" placeholder="Phone Number"
									required="required" path="sodienthoai" />
							</div>

							<!-- <input type="submit" class="register" value="Register">  -->
							<button type="submit" class="register">Tạo tài khoản</button>
						</form:form>
					</div>
					<div class="content-agile1">
						<h3 style="color: white; text-align: center">Đăng nhập</h3>
						<form:form action="dang-nhap" method="POST" modelAttribute="user">
							<form:input id="firstname" class="span3"
								title="Nhập Email của bạn" type="email"
								placeholder="mail@example.com" required="required" path="user" />
							<form:input id="emaillogin" class="span3"
								title="Nhập mật khẩu của bạn" type="password"
								placeholder="Password" required="required" path="passwords" />

							<button type="submit" class="register">Đăng nhập</button>

						</form:form>
					</div>
					<div class="clear"></div>
				</div>
			</div>


		</div>
	</div>

	<script type="text/javascript">
		window.onload = function() {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}
		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity(
						"Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>

</body>
</html>