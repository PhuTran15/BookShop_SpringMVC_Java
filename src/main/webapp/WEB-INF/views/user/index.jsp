<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!-- chuyển trang -->

<title>Trang chủ</title>
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
						<li class="active"><a href="<c:url value="/trang-chu"/>">Trang
								chủ </a></li>
						<li class=""><a href="<c:url value="/gioi-thieu"/>">Giới
								thiệu</a></li>
						<li class=""><a href="<c:url value="/product"/>">Sản phẩm</a></li>
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
	<!-- 
Body Section 
-->

	<%-- <c:if test="${ quanly != '0' }">
		<a href="#">${ showname }</a>
	</c:if>
	<c:if test="${ quanly == '0' }">
		<a href="#">Ko cso gì</a>
	</c:if> --%>
	
	<c:if test="${ adminpage==1 }">
		<a href="<c:url value="/trang-chu-admin"/>">Đi tới trang Admin</a>
	</c:if>
	


	<div class="row">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${ theloai }" varStatus="index">
						<li><a href="<c:url value="/product/${ item.idloai }"/>"><span
								class="icon-chevron-right"></span>${ item.tenloai }</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="#"><strong> Tổng
								đơn hàng: <span class="badge badge-warning pull-right"
								style="line-height: 18px;"><fmt:formatNumber type="number" groupingUsed="true" value="${ TotalPriceCart }"/>đ</span>
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
			<div class="well well-small">
				<a href="#"><img
					src="<c:url value="/assets/user/img/paypal.jpg"/>"
					alt="Thanh toán bằng thẻ"></a>
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
										class="pull-right">${ item.dongia } đ</span>
								</h4>
							</div>
						</div>
					</li>
					<li style="border: 0">&nbsp;</li>
				</c:forEach>
			</ul>

		</div>
		<div class="span9">
			<div class="well np">
				<div id="myCarousel" class="carousel slide homCar">
					<div class="carousel-inner">
						<c:forEach var="item" items="${ randsp3 }" varStatus="index">

							<div class="item">
								<img style="width: 100%"
									src="<c:url value="${ item.hinhanh }"/>" alt=${ item.tensach }>
								<div class="carousel-caption">
									<h4>Mang những giá trị đẹp cuộc sống</h4>
									<p>
										<span>Thay đổi cuộc đời bạn</span>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>
			</div>
			<!--
New Products
-->
			<div class="well well-small">
				<h3>Sản phẩm đa dạng</h3>
				<hr class="soften" />
				<div class="row-fluid mg-l">
					<div id="newProductCar" class="carousel slide">
						<div class="carousel-inner">
							<div class="item active">
								<ul class="thumbnails">
									<c:forEach var="item" items="${ randsp }" varStatus="index">
										<li class="span3">
											<div class="thumbnail">
												<a class="zoomTool"
													href="/BookShop/chi-tiet-san-pham/${ item.idbook }"
													title="xem nhanh"><span class="icon-search"></span> XEM
													NGAY</a> <a href="#" class="tag"></a> <a href="#"><img
													class="tesst" src="<c:url value="${ item.hinhanh }"/>"
													alt="sach3"></a>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="item">
								<ul class="thumbnails">
									<c:forEach var="item" items="${ randsp2 }" varStatus="index">
										<li class="span3">
											<div class="thumbnail">
												<a class="zoomTool"
													href="/BookShop/chi-tiet-san-pham/${ item.idbook }"
													title="xem nhanh"><span class="icon-search"></span> XEM
													NGAY</a> <a href="#" class="tag"></a> <a href="#"><img
													class="tesst" src="<c:url value="${ item.hinhanh }"/>"
													alt="sach3"></a>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<a class="left carousel-control" href="#newProductCar"
							data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
							href="#newProductCar" data-slide="next">&rsaquo;</a>
					</div>
				</div>
				<div class="row-fluid mg-l">
					<ul class="thumbnails">
						<c:forEach var="item" items="${ ranran }" varStatus="index">
							<li class="span4">
								<div class="thumbnail tbdr">
									<a class="zoomTool show${ item.idbook }"
										href="/BookShop/chi-tiet-san-pham/${ item.idbook }" title="Mua nhanh"><span
										class="icon-search"></span> XEM CHI TIẾT </a> <a href="#"><img
										class="dr" src="<c:url value="${ item.hinhanh }"/>" alt=""></a>
									<div class="caption cntr" style="height: 133px;">
										<p class="mama" style="color: red">${ item.tensach }</p>
										<p>
											<strong><u><fmt:formatNumber type="number" groupingUsed="true" value="${ item.dongia }"/>đ</u></strong>
										</p>

										<p class="bobo" align="center"
											style="margin-top: 20px; height: 100%">
											<a class="defaultBtn"
												href="/BookShop/chi-tiet-san-pham/${ item.idbook }"
												title="Xem chi tiết"><span class="icon-zoom-in"
												style="font-weight: bold"> Xem</span></a> <a class="shopBtn"
												href="<c:url value="/AddCart/${ item.idbook }"/>"
												title="Thêm vào giỏ hàng"><span class="icon-plus"
												style="font-weight: bold"> Thêm</span></a>

										</p>
										<br class="clr">
										<div></div>
							</li>

						</c:forEach>
					</ul>
				</div>
			</div>

			
		</div>
	</div>

	<%@include file="/WEB-INF/views/layouts/user/product_buy/sach1.jsp"%>
	<%@include file="/WEB-INF/views/layouts/user/product_buy/sach2.jsp"%>
	<%@include file="/WEB-INF/views/layouts/user/product_buy/sach3.jsp"%>


</body>

