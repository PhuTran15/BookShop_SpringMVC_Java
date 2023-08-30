<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!-- chuyển trang -->

<title>Đơn hàng</title>
<body>

	<!-- 
Body 
-->
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
						<li class=""><a href="<c:url value="/trang-chu"/>">Trang
								chủ </a></li>
						<li class=""><a href="<c:url value="/gioi-thieu"/>">Giới
								thiệu</a></li>
						<li class=""><a href="<c:url value="/product"/>">Sản phẩm</a></li>
						<li><a href="<c:url value="/news"/>">Tin tức</a></li>
						<li class=""><a href="<c:url value="/lien-he"/>">Liên hệ</a></li>
						<li class=""><a href="<c:url value="/gio-hang"/>">Giỏ
								hàng</a></li>
						<li class="active"><a href="<c:url value="/don-hang"/>">Đơn
								hàng đã đặt</a></li>
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


	<table class="table table-bordered table-condensed"
		style="text-align: center">
		<thead>
			<tr>
				<th>Sản phẩm</th>
				<th>Mô tả</th>
				<th>Giá sản phẩm</th>
				<th>Số lượng</th>
				<th>Tổng giá</th>
				<th>Tình trạng</th>
			</tr>
		</thead>
		<c:forEach var="item" items="${ donhanguser }" varStatus="index">
			<tbody>
				<tr style="text-align: center">
					<td><img width="100" src="<c:url value="${ item.hinhanh }"/>"
						alt=""></td>
					<td>${ item.tensach }<br>
					</td>


					<td><fmt:formatNumber type="number" groupingUsed="true" value="${ item.dongia }"/>đ</td>
					<td><input class="span1" style="max-width: 40px" min="0"
						max="10" id="quanty-cart-${ item.idbook }" size="16" type="number"
						value="${ item.soluong }" disabled="true">
						<div class="input-append"></div></td>
					<td><fmt:formatNumber type="number" groupingUsed="true" value="${ item.dongia*item.soluong }"/>đ</td>
					<c:if test="${ item.tinhtrang==1 }">
						<td>Đang xử lý</td>
					</c:if>
					<c:if test="${ item.tinhtrang==2 }">
						<td>Đã xử lý</td>
					</c:if>
					
				</tr>
		</c:forEach>
		<c:if test="${ TotalQuantyCart >= 5 }">
			<tr>
				<td colspan="4" class="alignR">Tổng hóa đơn (Sau khi giảm giá):</td>
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


</body>

