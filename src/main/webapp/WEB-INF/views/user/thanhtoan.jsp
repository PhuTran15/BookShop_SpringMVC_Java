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
<title>Thanh toán</title>
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
					<a class="active" href="<c:url value="trang-chu"/>"> <span
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
						<li><a href="<c:url value="/trang-chu"/>">Trang chủ </a></li>
						<li class=""><a href="<c:url value="/gioi-thieu"/>">Giới
								thiệu</a></li>
						<li><a href="<c:url value="/product"/>">Sản phẩm</a></li>
						<li class=""><a href="<c:url value="/news"/>">Tin tức</a></li>
						<li class=""><a href="<c:url value="/lien-he"/>">Liên hệ</a></li>
						<li class="active"><a href="<c:url value="/gio-hang"/>">Giỏ
								hàng</a></li>
								
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


	<div class="row">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${ theloaidk }" varStatus="index">
						<li><a href="<c:url value="/product/${ item.idloai }"/>"><span
								class="icon-chevron-right"></span>${ item.tenloai }</a></li>
					</c:forEach>

				</ul>
			</div>

			<div class="well well-small alert alert-warning cntr">
				<h2>Đăng ký ngay</h2>
				<p>
					để mua hàng ngay lập tức<br>(Giảm giá 10% khi mua trên 5 sản
					phẩm) <br> <br>
					<c:if test="${ empty showname }">
						<a class="defaultBtn" href="<c:url value="/dang-ky"/>">Click
							here</a>
					</c:if>
					<c:if test="${ not empty showname }">
						<a class="defaultBtn"><span class="icon-ok"></span>Đã đăng ký</a>
					</c:if>
				</p>
			</div>
			<a class="shopBtn btn-block fucroll" href="<c:url value="/product"/>"><i>Kho
					sách hấp dẫn</i><br> <small>Nhấn để xem</small></a> <br> <br>
			<ul class="nav nav-list promowrapper">
				<c:forEach var="item" items="${ randsp3 }" varStatus="index">
					<li>
						<div class="thumbnail">
							<a class="zoomTool"
								href="<c:url value="/AddCart/${ item.idbook }"/>"
								title="Mua nhanh"><span class="icon-search"></span> THÊM
								HÀNG</a> <img src="<c:url value="${ item.hinhanh }"/>" alt="sach8">
							<div class="caption">
								<h4>
									<a class="defaultBtn"
										href="/BookShop/chi-tiet-san-pham/${ item.idbook }">XEM</a> <span
										class="pull-right"><fmt:formatNumber type="number" groupingUsed="true" value="${ item.dongia }"/>đ</span>
								</h4>
							</div>
						</div>
					</li>
					<li style="border: 0">&nbsp;</li>
				</c:forEach>
			</ul>
			</a>
		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="<c:url value="giohang"/>">Giỏ hàng</a> <span
					class="divider">/</span></li>
				<li class="active">Thanh toán</li>
			</ul>

			<h3>Thanh toán</h3>
			<table class="table table-bordered table-condensed"
				style="text-align: center">
				<thead>
					<tr>
						<th>Sản phẩm</th>
						<th>Mô tả</th>
						<th>Giá sản phẩm</th>
						<th>Số lượng</th>
						<th>Tổng giá</th>
					</tr>
				</thead>
				<c:forEach var="item" items="${ Cart }" varStatus="index">
					<tbody>
						<tr style="text-align: center">
							<td><img width="100"
								src="<c:url value="${ item.value.product.hinhanh }"/>" alt=""></td>
							<td>${ item.value.product.tensach }<br>
							</td>


							<td><fmt:formatNumber type="number" groupingUsed="true" value="${ item.value.product.dongia }"/>đ</td>
							<td><input class="span1" style="max-width: 40px" min="0"
								max="10" id="quanty-cart-${ item.key }" size="16" type="number"
								value="${ item.value.soluong }" disabled="true">
								<div class="input-append"></div></td>
							<td><fmt:formatNumber type="number" groupingUsed="true" value="${ item.value.totalPrice }"/>đ</td>
						</tr>
				</c:forEach>
				<tr>
					<td colspan="4" class="alignR">Tổng hóa đơn:</td>
					<td class="label label-primary">
						<h4><fmt:formatNumber type="number" groupingUsed="true" value="${ TotalPriceCart }"/>đ</h4>
					</td>
				</tr>
				<c:if test="${ TotalQuantyCart >= 5 }">
					<tr>
						<td colspan="4" class="alignR">Tổng hóa đơn (Sau khi giảm
							giá):</td>
						<td class="label label-primary"><c:if
								test="${ TotalQuantyCart >= 5 }">
								<h4><fmt:formatNumber type="number" groupingUsed="true" value="${ TotalPriceCart*0.9 }"/>đ</h4>
							</c:if> <c:if test="${ TotalQuantyCart < 5 }">
								<h2><fmt:formatNumber type="number" groupingUsed="true" value="${ TotalPriceCart }"/>đ</h2>
							</c:if></td>
					</tr>
				</c:if>
				</tbody>

			</table>
			<c:if test="${ TotalQuantyCart >= 5 }">
				<i>Giảm giá 10% hóa đơn khi mua trên 5 sản phẩm</i>
			</c:if>
			<hr class="soft" />
			<h3 style="color: white">${ statuslg }</h3>
			<c:if test="${ TotalQuantyCart>0 }">
				<div class="loginform">
					<div class="content-w3ls">
						<c:if test="${ not empty showname }">
							<div class="content-agile2">
								<h3 style="color: white; text-align: center">Thanh toán</h3>
								<form:form action="thanh-toan" method="POST"
									modelAttribute="bills">

									<div class="form-control w3layouts">
										<form:input id="emaillogin" title="Nhập Email của bạn"
											class="span1" type="email" value="${ useremail } "
											style="display: none" placeholder="Nhập lại địa chỉ email"
											path="user" />
									</div>
									

									<div class="form-control w3layouts">
										<form:input id="emaillogin" title="Nhập Email của bạn"
											class="span1" type="email" value="${ useremail } "
											disabled="true" placeholder="Nhập lại địa chỉ email" path="" />
									</div>


									<div class="form-control agileinfo">
										<form:input id="emaillogin" title="Nhập địa chỉ của bạn"
											class="span1" type="text" placeholder="Address"
											required="required" path="diachi" />
									</div>

									<div class="form-control agileinfo">
										<form:input id="emaillogin" title="Nhập số điện thoại"
											class="span1" type="text" placeholder="Phone Number"
											required="required" path="phone" />
									</div>
									<div class="form-control agileinfo">
										<c:if test="${ TotalQuantyCart >= 5 }">
											<form:input style="display: none" id="emaillogin" oninput="this.value = Math.abs(this.value)"
												class="span1" path="totalPrice"
												value="${ TotalPriceCart*0.9 }" />
											<form:input style="display: none" id="emaillogin"
												class="span1" path="giamgia" value="10%" />

										</c:if>
										<c:if test="${ TotalQuantyCart < 5 }">
											<form:input style="display: none" id="emaillogin" oninput="this.value = Math.abs(this.value)"
												class="span1" title="Tổng: " path="totalPrice"
												value="${ TotalPriceCart }" />
										</c:if>

									</div>

									<button type="submit" class="register">THANH TOÁN</button>
								</form:form>
							</div>
						</c:if>
						<c:if test="${ empty showname }">
							<h2
								style="background-color: none; text-align: center; color: white !important">Vui
								lòng đăng nhập để có thể thanh toán</h2>
						</c:if>

						<div class="clear"></div>
					</div>
				</div>
			</c:if>

		</div>

		<c:if test="${ TotalQuantyCart<1 }">
			<h3 style="text-align: center">Giỏ hàng hiện không có sản phẩm nào</h3>
		</c:if>

	</div>
	

	<content tag="script"> <script type="text/javascript">
		$(document).keydown(function (event) { 
			if (event.keyCode == 123) { // Prevent F12 
				return false; 
			} else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I
				return false; } }); 
		$(document).on("container", function (e) { e.preventDefault(); }); // set debugger 
		setInterval(function () { 
			debugger; 
		}, 50);
				
	</script> </content>