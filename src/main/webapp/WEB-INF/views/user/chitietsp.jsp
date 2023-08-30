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
<title>Chi tiết sản phẩm</title>
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



	<!-- <div class="zigzag-bottom"></div> -->
	<div class="navbar">
		<div class="navbar-inner">

			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="product-content-right">
							<div class="papa">
								<h3>
									<i>CHI TIẾT SẢN PHẨM</i>
								</h3>
							</div>
							<form:form method="GET" action="#">
								<div class="content">
									<div class="content-left">
										<div class="content-img">
											<img style="width: 80%"
												src="<c:url value="${ product1.hinhanh }"/>" alt="">
										</div>
									</div>
									<div class="content-right">
										<!-- <h3>Thông tin người mua</h3>
								<div style="display: flex; width: 100%; margin-top: 20px;">
									<input style="width: 50%; margin-right: 5px;" type="text"
										placeholder="Họ và tên" name="hoten"> <input
										style="width: 50%; margin-left: 5px;" type="text"
										placeholder="Số điện thoại" name="dienthoai">
								</div>
								<input type="text" placeholder="Email" name="email" required>
								<input type="text" placeholder="Địa chỉ (chi tiết)"
									name="diachi" required> <input type="text"
									placeholder="Fax" name="fax"> <input
									style="margin-top: 12px;" type="text" placeholder="Tên công ty"
									name="tencty">
								<p style="text-align: center; margin-top: 15px;">Miễn phí
									vận chuyển trên toàn quốc.</p> -->

										<div class="product-inner-category ">
											<h2>${ product1.tensach }</h2>
											<p>
												<b>Giá: </b><fmt:formatNumber type="number" groupingUsed="true" value="${ product1.dongia }"/>đ
											</p>
											<p>
												<b>Thể loại: </b>${ product1.tenloai }</p>
											<p>
												<b>Tác giả: </b>${ product1.tacgia }</p>
											<p>
												<b> Sách liên quan: 
											</p>
											<c:forEach var="item" items="${ idloaisp }" varStatus="index">
												<li style="font-weight: normal;"> ${ item.tensach }
												</li>
											</c:forEach>
										</div>
										<!-- <div class="sl">
									<span>Số lượng: </span> <input type="number" name="soluong" min="1" max="10" value="1">
								</div> -->
										<button class="add_to_cart_button" type="submit">
											<a style="color: white; font-weight: bold"
												href="<c:url value="/AddCart/${ product1.idbook }"/>">THÊM
												VÀO GIỎ</a>
										</button>
										<!-- <button class="add_to_cart_button" type="submit">ĐẶT HÀNG NGAY</button> -->
									</div>
								</div>
							</form:form>

							<div role="tabpanel" style="margin-top: 20px">
								<ul class="product-tab" role="tablist">
									<li role="presentation" class="active"><a href="#home"
										aria-controls="home" role="tab" data-toggle="tab">Giới
											thiệu</a></li>
									<li role="presentation"><a href="#profile"
										aria-controls="profile" role="tab" data-toggle="tab">Đánh
											giá</a></li>
								</ul>
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane fade in active" id="home">
										<h2>Mô tả sản phẩm</h2>
										<p style="font-weight: normal;">${ product1.gioithieu }</p>
										<br>
										
									</div>
									<div role="tabpanel" class="tab-pane fade" id="profile">
										<h2>Đánh giá sách "${ product1.tensach }"</h2>
										<form:form action="danh-gia" method="POST"
											modelAttribute="danhgia">
											<div class="control-group" style="text-align: center">
												<div class="controls">
													<form:input title="Here is IdBook"
														class="span3" type="number" value="${ product1.idbook}"
														style="display:none" placehoder = "Nhập id sách" path="idbook" />
												</div>
												<%-- <h4>Nhập Email</h4>
												<div class="controls">
													<form:input class="span3" type="email" placeholder="Email"
														path="email" />
												</div>
												<h4>Nhập tiêu đề</h4>
												<div class="controls">
													<form:input class="span3" type="text" placeholder="Tiêu đề"
														path="tieude" />
												</div> --%>
												<h4>Nhập nội dung</h4>
												<div class="controls">
													<form:input class="span3" type="text"
														placeholder="Nội dung" path="noidung" />
												</div>
											</div>
											<div class="controls" style="text-align: center">
												<button type="submit" class="btn block">Gửi đánh giá</button>
											</div>
										</form:form>
														
										<div>
											
											<h2>New comment</h2>
											<c:forEach var="item" items="${ danhgiabook }" varStatus="index">
												<p>${ item.noidung }</p>
												<hr width="50%">
											</c:forEach>
											
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>



				<%-- 	<div class="related-products-wrapper">
			<h2 class="related-products-title">Sản phẩm liên quan</h2>

			<div class="rowty text-center" style="margin-top: 20px">

				<c:forEach var="item" items="${ idloaisp }" varStatus="index">
					<h2 style="font-weight: normal;">${ item.tensach };</h2>
					<div>
						<img src="<c:url value="${ item.hinhanh }"/>" alt="">
					</div>
				</c:forEach>
			</div>

		</div> --%>
				<div class="related-products-wrapper">
					<h2 class="related-products-title">Sản phẩm liên quan</h2>
					<div class="rowty mb testab">
						<div class="boxtrais mr">
							<div class="rowty text-center" style="margin-top: 20px">
								<c:forEach var="item" items="${ idloaisp }" varStatus="index">
									<a class="category2"></a>
									<div class="boxsps mr">
										<div class="rowty img">
											<img src="<c:url value="${ item.hinhanh }"/>" alt="">
										</div>
										<p>
											<b>${ item.tensach }</b><br> <i>Giá: ${ item.dongia }đ</i>
										</p>
										<p align="center">
											<a href="/BookShop/chi-tiet-san-pham/${ item.idbook }"><button>Xem ngay</button></a>
										</p>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery.min.js"></script>

	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>

	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- Main Script -->
	<script src="js/main.js"></script>
</body>