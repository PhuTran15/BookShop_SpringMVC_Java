<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- chuyển trang -->

<title>Giới thiệu</title>
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
						<li class="active"><a href="<c:url value="gioi-thieu"/>">Giới
								thiệu</a></li>
						<li class=""><a href="<c:url value="/product"/>">Sản phẩm</a></li>
						<li class=""><a href="<c:url value="/news"/>">Tin tức</a></li>
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

	<%-- <div>
		<a href="#"><img
			src="<c:url value="/assets/user/img/introduce.png"/>" alt="introduce"></a>
	</div>
	<div class="introduce"></div> --%>
	
	<div id="both">
		<div class="demo-box">
			<div id="myflipper">
				<div class="flipper-page">
					<div class="flipper-page-padding-wrap">
						<p class="headline first">
							Chào mừng bạn đến với Bookshop<br>Trần Ngọc Phú
						</p>
					</div>
				</div>
				<div class="flipper-page">
					<div class="flipper-page-padding-wrap">
						<p class="left headline">
							<!-- With Flipper you can turn any piece of content into a beautiful
							and stylish book-like widget. It's light, it's fast, it's cool
							and your mobile users will love you for it.  -->
							Đến với BookShop, bạn sẽ được trải nghiệm những giây phút vui tươi, 
							giải trí sau những khó khăn mà cuộc sông xung quanh đã đến với bạn, 
							tận hưởng những cuốn sách tuyệt vời đi nào !!!
							<br /> <br />
							<!-- <a href="http://www.youtube.com/watch?v=AZ-fg1XtSBw">Watch
								the video!</a> -->
							Hãy mỉm cười vì mỗi ngày đều sẽ là một món quà.
						</p>
						<p class="right headline">
						<!-- Photos, image galleries, blogs, news
							- it all looks awesome! Flick again to see some examples. -->
							Mọi tài liệu, hình ảnh, tin tức từ BookShop sẽ mang đến một chất 
							lượng tuyệt vời nhất.
						</p>
					</div>
				</div>
				<div class="flipper-page">
					<div class="flipper-page-padding-wrap">
						<h2>Đa dạng về thể loại</h2>
						<div class="mag">
						<ul>
							<li>Rèn luyện nhân cách</li>
							<li>Kỹ năng sống</li>
							<li>Tiểu thuyết</li>
							<li>Tiểu thuyết ngôn tình</li>
							<li>Tiểu thuyết trinh thám</li>
						</ul>
						<ul>
							<li>Truyện ngắn</li>
							<li>Tâm lý</li>
							<li>Kinh tế</li>
							<li>Chính trị</li>
							<li>Quản trị - Lãnh đạo</li>
						</ul>
						</div>
						<p class="headline" style="margin-top: 40px;">Cố gắng nỗ lực trong 5 tháng, sẽ đi trước người khác 5 năm</p>
					</div>
				</div>
				<div class="flipper-page no-padding">
					<img src="<c:url value="/assets/user/img/sach11.jpg"/>" class="fullsize">
				</div>
				<div class="flipper-page no-padding">
					<img src="<c:url value="/assets/user/img/sach12.jpg"/>" class="fullsize">
				</div>
				<div class="flipper-page no-padding">
					<img src="<c:url value="/assets/user/img/sach13.jpg"/>" class="fullsize">
				</div>
				<div class="flipper-page">
					<p class="headline first">
						Hãy làm những gì mình muốn khi còn có thể<br />Cảm ơn đã ủng hộ BookShop.
					</p>
				</div>
				<%-- <div class="flipper-page">
					<img src="<c:url value="/assets/user/img/flipper/flipper.png"/>">
				</div> --%>
				<div class="flipper-page"">
					<h1 style="margin-top: 30px; font-style: bold; font-size: 50px; text-align: center">BOOKSHOP</h1>
				</div>
			</div>
			<!-- <script>
					$(document).ready(function() {
						$('#myflipper').flipper({
							'width' : 700,
							'height' : 400,
							"arrows" : true
						});
					});
			</script> -->
		</div>
	</div>
	
	<div class="caption cntrs"
		style="text-align: justify; line-height: 1.8;">
		<p>
			Kể từ lúc thành lập vào năm 2022, <i>BOOKSHOP</i> luôn được khách
			hàng đánh giá là một trong những trang web bán sách được tìm kiếm cao
			tại Việt Nam. Hiện tại, <i>BOOKSHOP</i> vẫn tiếp tục duy trì chất
			lượng dịch vụ và đào tạo tốt để gìn giữ sự hài lòng của khách hàng. <i>BOOKSHOP</i>
			luôn cập nhật mọi thể loại sách từ chuyên sâu đến giải trí, từ chuyên
			ngành đến phổ thông nhằm giúp người đọc có cái nhìn đa dạng hơn về
			sách và dễ dàng tìm thấy quyển sách mình cần tìm một cách nhanh chóng
			nhất.
		</p>
		<a href="#"><img class="img-center"
			src="<c:url value="/assets/user/img/sachbay.jpg"/>" alt="introduce"
			width=500></a>
		<p>Sách có một vai trò vô cùng quan trọng trong đời sống con người
			nên đọc sách là thói quen tốt cần duy trì và phát huy. Nhưng có phải
			sách nào cũng nên đọc không? Thực tế cho thấy là việc đọc sách cũng
			cần có sự lựa chọn kĩ càng. Đọc sách là để bồi dưỡng và nâng cao
			trình độ của bản thân. Đọc sách cũng là để bồi dưỡng và vun đắp những
			tình cảm tốt đẹp của con người. Nhưng những trí thức và tình cảm ấy
			cần phải có sự phù hợp với lứa tuổi. Khi còn học cấp một, chúng em
			còn nhỏ nên việc học toán bắt đầu từ những con số nhỏ trong phạm vi
			hàng nghìn, từ những phép tính cộng trừ nhân chia hai, ba chữ số.
			Việc học văn cũng bắt đầu từ những câu chuyện kể ngây ngô, những bài
			tiêu vụng về… Trong chương trình cấp hai, mức độ tư duy của chúng em
			đã cao hơn nên có thể học đến những phép nhân chia đa thức phức tạp,
			viết những bài văn dài đòi hỏi có sự quan sát tỉ mỉ, tinh tế. Vì vậy,
			việc lựa chọn sách đọc phải hợp với lứa tuổi cũng như lựa chọn nội
			dung học phải phù hợp nhận thức. Cấp một, cấp hai có thể đọc “Những
			câu chuyện vui về Hóa học / Văn học / Toán học….”, truyện cổ tích,
			đọc truyện Harry Potter… nhưng không nên đọc những truyện tâm lí tình
			cảm của người lớn. Đọc những cuốn sách không phù hợp với lứa tuổi,
			trình độ có thể tạo ra “hiệu ứng ngược” trong việc đọc sách. Có nghĩa
			là khiến người đọc sợ đọc hơn hoặc nảy sinh những tình cảm, suy nghĩ
			tiêu cực. Chẳng hạn, nếu một học sinh học lực bình thường mà đã phải
			đọc những cuốn sách nâng cao thì em sẽ thấy quá khó và sợ không dám
			học nữa. Hoặc mới lứa tuổi cấp hai đã đọc những cuốn tiểu thuyết tình
			cảm thì dễ yêu trước tuổi, không tập trung vào việc học tập được. Mặt
			khác, đọc sách cũng cần có chọn lọc bởi ngày nay, có rất nhiều loại
			sách có nội dung không lành mạnh trôi nổi trên thị trường, nếu không
			chọn lọc ta rất dễ bị “nhiễm độc”. Đó là những cuốn sách mang nội
			dung phản động, kích động lôi kéo tham gia các tổ chức , đảng phái,
			tôn giáo chính trị không lành mạnh. Đó là những cuốn sách “đen” mang
			nội dung đồi trụy xấu xa. Vậy là, bên cạnh những loại sách tốt có tác
			dụng tích cực đối với việc phát triển con người thì lại có những loại
			sách hạn chế sự phát triển ấy. Đối với loại sách này ta cần lên án,
			tố cáo và thiêu hủy. Sách đọc không đơn giản là một vật dụng bình
			thường, đó còn là một người thầy, một người bạn thân thiết. Trong
			cuộc sống, ta phải chọn thầy mà học, chọn bạn mà chơi vậy nên cũng
			cần chọn sách mà đọc.</p>
		<h4>
			<br>Cảm ơn mọi người đã lựa chọn cửa hàng!!!
		</h4>
		<br class="clr">
	</div>

	

</body>



