<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- chuyển trang -->

<title>Tin tức</title>
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
						phẩm(s) - <span class="badge badge-warning"><fmt:formatNumber
								type="number" groupingUsed="true" value="${ TotalPriceCart }" />đ
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
						<li class="active"><a href="<c:url value="/news"/>">Tin
								tức</a></li>
						<li class=""><a href="<c:url value="/lien-he"/>">Liên hệ</a></li>
						<li class=""><a href="<c:url value="/gio-hang"/>">Giỏ
								hàng</a></li>
						<c:if test="${ not empty showname }">
							<c:if test="${ not empty kiemtradh }">
								<c:if test="${ not empty testvalue }">
									<li class=""><a href="<c:url value="/don-hang"/>">Đơn
											hàng đã đặt</a></li>
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
					<c:forEach var="item" items="${ theloai }" varStatus="index">
						<li><a href="<c:url value="/product/${ item.idloai }"/>"><span
								class="icon-chevron-right"></span>${ item.tenloai }</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="#"><strong> Tổng
								tiền: <span class="badge badge-warning pull-right"
								style="line-height: 18px;"><fmt:formatNumber
										type="number" groupingUsed="true" value="${ TotalPriceCart }" />đ</span>
						</strong></a></li>
				</ul>
			</div>

			<div class="well well-small alert alert-warning cntr">
				<h2>Đăng ký ngay</h2>
				<p>
					để mua hàng ngay lập tức <br> <br> <a class="defaultBtn"
						href="#">Click here</a>
				</p>
			</div>
			<div class="well well-small">
				<a href="#"><img
					src="<c:url value="/assets/user/img/paypal.jpg"/>"
					alt="Thanh toán bằng thẻ"></a>
			</div>

			<a class="shopBtn btn-block" href="#">Sản phẩm sắp ra<br> <small>Nhấn
					để xem</small></a> <br> <br>
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
										class="pull-right"><fmt:formatNumber type="number"
											groupingUsed="true" value="${ item.dongia }" />đ</span>
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

			<!--Sự kiện-->
			<div class="well well-small">
				<h3>SỰ KIỆN SẮP RA MẮT</h3>
				<hr class="soften" />
				<div class="row-fluid">
					<ul class="thumbnails" style="width: 100%;">
						<li class="span4">
							<div class="thumbnail ddds">

								<a class="zoomTool"
									href="https://thanhnien.vn/sieu-thi-dua-nhau-khuyen-mai-mua-tuu-truong-post490761.html"
									title="add to cart"><span class="icon-search"></span> XEM
									NGAY</a> <a href="#"><img
									src="<c:url value="/assets/user/img/tuutruong.jpg"/>" alt=""></a>
								<div class="caption cntr" style="height: 300px;">
									<p>
										<b>"Đón mùa tựu trường - hội tựu khuyến mãi"</b>
									</p>
									<p>
										BOOKSTORE sẽ cùng chào đón mùa tựu trường cùng các bé với
										những voucher quà tặng và giảm giá đến bất ngờ.<br> -Giảm
										giá lên đến 50% hơn 5000 tựa sách.<br> -Nhận ngay voucher
										mua sắm 50.000đ với hóa đơn 800.000đ.<br> ...Và nhiều ưu
										đãi khác sẽ diễn ra tại BOOKSTOTE. Mọi người ùng theo dõi
										nhé!!!
									</p>
									<br class="clr">
								</div>
							</div>
						</li>
						<li class="span4">
							<div class="thumbnail ddds">
								<a class="zoomTool"
									href="http://congvienhotay.vn/tin-tuc-khuyen-mai/quot-mung-ngay-nha-giao-viet-nam-20-11-quot-giam-40-gia-ve-tron-goi-cong-vien-mat-troi-426.html"
									title="add to cart"><span class="icon-search"></span> XEM
									NGAY</a> <a href="#"><img
									src="<c:url value="/assets/user/img/2011.jpg"/>" alt=""></a>
								<div class="caption cntr" style="height: 230px;">
									<p>
										<b>"Cùng BOOKSTORE chào đón ngày nhà giáo Việt Nam 20/11"</b>
									</p>
									<p>
										Cùng chào đón ngày tri ân thầy cô, BOOKSTORE áp dụng chương
										trình siêu ưu đãi dành cho quý thầy cô <br> -Giảm giá 50%
										cho quý thầy cô mua sách tại Website<br> -Nhận ngay
										voucher mua sắm lên đến 500.000đ
									</p>
									<br class="clr">
								</div>
							</div>
						</li>

						<li class="span4">
							<div class="thumbnail ddds">

								<a class="zoomTool"
									href="https://thanhnien.vn/sieu-thi-dua-nhau-khuyen-mai-mua-tuu-truong-post490761.html"
									title="add to cart"><span class="icon-search"></span> XEM
									NGAY</a> <a href="#"><img
									src="<c:url value="/assets/user/img/tuutruong.jpg"/>" alt=""></a>
								<div class="caption cntr" style="height: 300px;">
									<p>
										<b>"Đón mùa tựu trường - hội tựu khuyến mãi"</b>
									</p>
									<p>
										BOOKSTORE sẽ cùng chào đón mùa tựu trường cùng các bé với
										những voucher quà tặng và giảm giá đến bất ngờ.<br> -Giảm
										giá lên đến 50% hơn 5000 tựa sách.<br> -Nhận ngay voucher
										mua sắm 50.000đ với hóa đơn 800.000đ.<br> ...Và nhiều ưu
										đãi khác sẽ diễn ra tại BOOKSTOTE. Mọi người ùng theo dõi
										nhé!!!
									</p>
									<br class="clr">
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!--
	Tin tức
	-->
			<div class="well well-small">
				<h3>
					<!-- <a class="btn btn-mini pull-right" href="#"
						title="View more">Xem thêm<span class="icon-plus"></span></a>-->
					TIN MỚI
				</h3>
				<hr class="soften" />
				<div class="row-fluid">
					<ul class="thumbnails" style="width: 100%;">
						<li class="span4">
							<div class="thumbnail dds">
								<a class="zoomTool"
									href="https://lib.uel.edu.vn/tin-tuc-hoat-dong-725/top-10-cuon-sach-hay-nhat-moi-thoi-dai"
									title="add to cart"><span class="icon-search"></span> XEM
									NGAY</a> <a href="#"><img class="image"
									src="<c:url value="/assets/user/img/sachhay.jpg"/>" alt=""></a>
								<div class="caption cntr" style="height: 330px;">
									<p>
										<b>Những quyển sách vừa được bình chọn là sách hay nhất mà
											bạn đọc nên xem</b>
									</p>
									<p style="text-align: justify">Những cuốn sách hay nên đọc
										khi còn trẻ được định nghĩa là là những cuốn sách kinh điển
										nhất mọi thời đại. Sách được viết bởi những tác giả trẻ, những
										bộ óc văn học vĩ đại nhất, họ có những chủ đề, nhân vật, kinh
										nghiệm, cảm xúc và quan điểm sống luôn liên quan đến mỗi người
										chúng ta. Một số trong số họ là nguồn cảm hứng mà từ đó toàn
										bộ thể loại tiểu thuyết hay đã nảy sinh từ đó.</p>
									<br class="clr">
								</div>
							</div>
						</li>
						<li class="span4">
							<div class="thumbnail dds">
								<a class="zoomTool"
									href="https://www.tramdoc.vn/tin-tuc/35-cuon-sach-hay-nen-doc-trong-doi-ndAnW.html"
									title="add to cart"><span class="icon-search"></span> XEM
									NGAY</a> <a href="#"><img class="image"
									src="<c:url value="/assets/user/img/sachbay.jpg"/>" alt=""></a>
								<div class="caption cntr" style="height: 330px;">
									<p>
										<b>Top 35 cuốn sách hay nên đọc ít nhất một lần trong đời
											do Business Insider giới thiệu lại từ Reddit.</b>
									</p>
									<p style="text-align: justify">Có rất nhiều các Top sách
										hay nên đọc được các tờ báo, trang web nổi tiếng trên thế giới
										giới thiệu. Tuy nhiên, tôi ấn tượng nhất với Top 35 cuốn sách
										hay nên đọc ít nhất một lần trong đời do Business Insider giới
										thiệu lại từ Reddit. Đây là những cuốn sách mà bút lực của
										người viết đã vượt qua được giới hạn thể loại và đối tượng độc
										giả ban đầu họ muốn nhắm đến,...</p>
									<br class="clr">
								</div>
							</div>
						</li>
						<li class="span4">
							<div class="thumbnail dds">
								<a class="zoomTool"
									href="https://ghiensach.com/sach-kinh-te-hay-nhat-moi-thoi-dai/"
									title="add to cart"><span class="icon-search"></span> XEM
									NGAY</a> <a href="#"><img class="image"
									src="<c:url value="/assets/user/img/sach-kinh-te.jpg"/>" alt=""></a>
								<div class="caption cntr" style="height: 330px;">
									<p>
										<b>TOP 21 Quyển Sách Kinh Tế Hay Nhất Mọi Thời Đại</b>
									</p>
									<p style="text-align: justify">Kinh tế học là lĩnh vực bạn
										nên biết bởi nó sẽ giúp bạn hiểu cách thế giới vận hành như
										thế nào. Danh sách về những cuốn sách kinh tế hay nhất mọi
										thời đại dưới đây chứa sự kết hợp của các tác phẩm cổ điển và
										đương đại sẽ cung cấp cho bạn hiểu biết lịch sử về kinh tế học
										cũng như ý tưởng về cách kinh tế học hiện đại được áp dụng
										ngày nay..</p>
									<br class="clr">
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>


</body>

