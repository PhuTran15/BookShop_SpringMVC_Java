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
<title>Giỏ hàng</title>
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
		<div class="span12">
			<ul class="breadcrumb">
				<li><a href="<c:url value="/trang-chu"/>">Trang chủ</a> <span
					class="divider">/</span></li>
				<li class="active">Giỏ hàng</li>
			</ul>
			<div class="well well-small">
				<h1>
					Giỏ hàng <small class="pull-right"> ${ TotalQuantyCart }
						sản phẩm trong giỏ hàng </small>
				</h1>
				<hr class="soften" />

				<table class="table table-bordered table-condensed"
					style="text-align: center">
					<thead>
						<tr>
							<th>Sản phẩm</th>
							<th>Mô tả</th>
							<th>Xóa</th>
							<th>Chỉnh sửa</th>
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
								<td>${ item.value.product.tensach }<br>Tác giả: ${ item.value.product.tacgia }<br>Nhà
									xuất bản: ${ item.value.product.tennxb }
								</td>
								<td><a href="<c:url value="/DeleteCart/${ item.key }"/>"
									class=" btn
									btn-mini btn-danger" type="button"">
										<span class="icon-remove"></span>
								</a></td>
								<td><button data-id="${ item.key }"
										class="btn btn-mini btn-danger icon-ok edit-cart"
										type="button"></button></td>
								<td><fmt:formatNumber type="number" groupingUsed="true" value="${ item.value.product.dongia }"/>đ</td>
								<td><input class="span1" style="max-width: 40px" min="0"
									max="10" id="quanty-cart-${ item.key }" size="16" type="number" oninput="this.value = Math.abs(this.value)"
									value="${ item.value.soluong }">
									<div class="input-append">
										<!-- <button class="btn btn-mini" type="button">-</button>
									<button class="btn btn-mini" type="button">+</button>
									<button class="btn btn-mini btn-danger" type="button">
										<span class="icon-remove"></span>
									</button> -->
									</div></td>
								<td><fmt:formatNumber type="number" groupingUsed="true" value="${ item.value.totalPrice }"/>đ</td>
							</tr>
					</c:forEach>

					<c:if test="${ TotalQuantyCart > 0 }">
						<tr>
							<td colspan="6" class="alignR">Total products:</td>
							<td class="label label-primary"><fmt:formatNumber type="number" groupingUsed="true" value="${ TotalPriceCart }"/>đ</td>
						</tr>
					</c:if>
					</tbody>

				</table>
				<br />


				<div>
					<c:if test="${ TotalQuantyCart >= 5 }">
						<i>Giảm giá 10% hóa đơn khi mua trên 5 sản phẩm</i>
					</c:if>
				</div>
				

				<a href="<c:url value="/product"/>" class="shopBtn btn-large"
					style="margin-top: 20px"><span class="icon-arrow-left"></span>
					Tiếp tục mua hàng </a> <a style="margin-top: 20px"
					href="<c:url value="/thanh-toan"/>"
					class="shopBtn btn-large pull-right"> Thanh toán <span
					class="icon-arrow-right"></span></a>

			</div>
		</div>
	</div>

	<content tag="script"> <script type="text/javascript">
		$(".edit-cart").on("click", function() {
			var id = $(this).data("id");
			var quanty = $("#quanty-cart-" + id).val();
			window.location = "EditCart/" + id + "/" + quanty;

		})
	</script> </content>