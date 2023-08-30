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
<title>Sản phẩm</title>
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
						href="<c:url value="dang-ky"/>"><span class="icon-edit"></span>
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
						<li class="active"><a href="<c:url value="/product"/>">Sản
								phẩm</a></li>
						<li class=""><a href="<c:url value="/news"/>">Tin tức</a></li>
						<li class=""><a href="<c:url value="/lien-he"/>">Liên hệ</a></li>
						<li class=""><a href="<c:url value="/gio-hang"/>">Giỏ
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

	<!--<c:forEach var="item" items="${ books0 }" varStatus="index">
		<p>${ item.dongia }</p>
	</c:forEach>
	<c:forEach var="item" items="${ books2 }" varStatus="index">
		<p>${ item.dongia }</p>
	</c:forEach>-->


	<div>
		<a href="<c:url value="/gio-hang"/>"> <svg
				xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
            <path
					d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
        </svg> <span id="countsp">${ TotalQuantyCart }</span></a>
	</div>

	<div class="rowty mb testab">
		<div class="boxtrai mr">
			<div class="rowty">
				<div class="banner">
					<img src="<c:url value="/assets/user/img/banner.jpg"/>" alt="">
				</div>
			</div>

			<div class="rowty" style="margin-top: 20px">

				<!-- <div class="well well-small">
					<h4>Sản phẩm phổ biến</h4>
				</div> -->
				<h3>Tất cả sản phẩm</h3>

				<c:forEach var="item" items="${ product_all }" varStatus="index">
					<a calss="category2"></a>
					<div class="boxsp mr">
						<div class="rowty img">
							<img src="<c:url value="${ item.hinhanh }"/>" alt="">
						</div>

						<span>Giá: <fmt:formatNumber type="number" groupingUsed="true" value="${ item.dongia }"/>đ</span><br> <a
							href="/BookShop/chi-tiet-san-pham/${ item.idbook }">${ item.tensach }</a><br>
						<br>
						<!-- <input
							type="number" name="soluong" min="1" max="10" value="1"> -->
						<p align="center" class="bobos">
							<%-- <a href="/BookShop/chi-tiet-san-pham/${ item.idbook }"><button>Đặt
									hàng</button></a> --%>
							<a class="defaultBtn"
								href="/BookShop/chi-tiet-san-pham/${ item.idbook }"
								title="Xem chi tiết"><span class="icon-zoom-in"
								style="font-weight: bold"> Xem</span></a> <a class="shopBtn"
								href="<c:url value="/AddCart/${ item.idbook }"/>"
								title="Thêm vào giỏ hàng"><span class="icon-plus"
								style="font-weight: bold"> Thêm</span></a>
						</p>
					</div>
				</c:forEach>
				
			</div>
		</div>

		<div class="boxphai">
			<div class="rowty mb">
				<div class="boxtitle">THỂ LOẠI</div>
				<div class="boxcontent2 menudoc">
					<ul>
						<c:forEach var="item" items="${ theloaisp }" varStatus="index">
							<li><a class="category2"
								href="/BookShop/product/${ item.idloai }">${ item.tenloai }</a></li>
						</c:forEach>
						<ul class="nav nav-list promowrapper">
							</li>
						</ul>
				</div>
			</div>
			<div class="rowty mb">
				<div class="boxtitle">SẢN PHẨM MỚI</div>
				<div class="rowty boxcontent">
					<c:forEach var="item" items="${ newproduct }" varStatus="index">
						<div class="row mb10 top10">
							<img src="<c:url value="${ item.hinhanh }"/>" alt="${ item.tensach }">
							<a href="/BookShop/chi-tiet-san-pham/${ item.idbook }">${ item.tensach }</a>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>

</body>
</html>