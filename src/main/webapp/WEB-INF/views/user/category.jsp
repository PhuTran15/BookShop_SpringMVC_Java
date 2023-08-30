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
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle" href="#"><span class="icon-lock"></span>
								Đăng nhập <b class="caret"></b></a>
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
										<button type="submit" class="shopBtn btn-block">Đăng
											nhập</button>
									</div>
								</form>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>


	<div class="rowty mb testab">
		<div class="boxtrai mr">
			<div class="rowty">
				<div class="banner">
					<img src="<c:url value="/assets/user/img/banner.jpg"/>" alt="">
				</div>
			</div>

			<div class="rowty" style="margin-top: 20px">

				<c:forEach var="item" items="${ idCategory }" varStatus="index">
					<h3 style="position: absolute">${ item.tenloai }(${ idCategory.size() })</h3>
					<div class="boxsp mr" style="margin-top: 50px">
						<div class="rowty img">
							<img src="<c:url value="${ item.hinhanh }"/>" alt="">
						</div>

						<span>Giá: <fmt:formatNumber type="number" groupingUsed="true" value="${ item.dongia }"/>đ</span><br> <a
							href="/BookShop/chi-tiet-san-pham/${ item.idbook }">${ item.tensach }</a><br>
						<br>
						<!-- <input
							type="number" name="soluong" min="1" max="10" value="1"> -->
						<p align="center">
							<%-- <a href="/BookShop/chi-tiet-san-pham/${ item.idbook }"><button
									class="pull-left">Xem chi tiết</button></a> <a
								href="<c:url value="/AddCart/${ item.idbook }"/>"><button
									class="pull-right">Đặt hàng</button></a> --%>

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
						<c:forEach var="item" items="${ theloaiall }" varStatus="index">
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
							<img src="<c:url value="${ item.hinhanh }"/>"
								alt="${ item.tensach }"> <a
								href="/BookShop/chi-tiet-san-pham/${ item.idbook }">${ item.tensach }</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>