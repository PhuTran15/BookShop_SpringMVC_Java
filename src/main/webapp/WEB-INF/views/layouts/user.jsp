<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title><decorator:title default="Master-layout" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="<c:url value="/assets/user/css/bootstrap.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/assets/user/style.css"/>" rel="stylesheet" />
<link href="<c:url value="/assets/user/stylelogin.css"/>" rel="stylesheet" />
<link href="<c:url value="/assets/user/style11.css"/>" rel="stylesheet" />
<link href="<c:url value="/assets/user/style1.css"/>" rel="stylesheet" />
<link href="<c:url value="/assets/user/demopage.css"/>" rel="stylesheet" />
<link href="<c:url value="/assets/user/flipper.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/assets/user/css/owl.carousel.css"/>" rel="stylesheet" />
<link href="<c:url value="/assets/user/css/responsive.css"/>" rel="stylesheet" />


<!-- Lat sach  -->

<link rel="stylesheet" href="<c:url value="/assets/user/demos/flipper/flipper.min.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="/assets/user/demos/flipper/demopage.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="/assets/user/style-buom.css"/>" type="text/css" media="screen" />


<link
	href="<c:url value="/assets/user/font-awesome/css/font-awesome.css"/>"
	rel="stylesheet">
<!--[if IE 7]>
			<link href="<c:url value="/assets/user/font-awesome/css/font-awesome-ie7.min.css"/>" rel="stylesheet">
		<![endif]-->

<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

<!-- Favicons -->
<link rel="shortcut icon"
	href="<c:url value="/assets/user/img/sach_title.png"/>">
</head>
<body>
	<!-- 
	Upper Header Section 
-->
	<!-- <div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
						<a href="#"><span class="icon-twitter"></span></a> <a href="#"><span
							class="icon-facebook"></span></a> <a href="#"><span
							class="icon-youtube"></span></a> <a href="#"><span
							class="icon-tumblr"></span></a>
					</div>
					<a class="active" href="<c:url value="trang-chu"/>"> <span class="icon-home"></span>
						Trang chủ
					</a> <a href="#"><span class="icon-user"></span> Tài khoản</a> <a
						href="<c:url value="dang-ky"/>"><span class="icon-edit"></span> Đăng ký </a> <a href="contact.html"><span class="icon-envelope"></span>
						Liên hệ</a> <a href="cart.html"><span
						class="icon-shopping-cart"></span> 0 Sản phẩm(s) - <span
						class="badge badge-warning"> $00.00</span></a>
				</div>
			</div>
		</div>
	</div>
	-->

	<!--
Lower Header Section 
-->
	<div class="container">
		<div id="gototop"></div>

		<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>
		
		<decorator:body />
		<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>

	</div>
	
	<!-- /container -->

	<div class="copyright">
		<div class="container">
			<p class="pull-right">
				<a href="#"><img
					src="<c:url value="/assets/user/img/maestro.png"/>" alt="payment"></a>
				<a href="#"><img src="<c:url value="/assets/user/img/mc.png"/>"
					alt="payment"></a> <a href="#"><img
					src="<c:url value="/assets/user/img/pp.png"/>" alt="payment"></a>
				<a href="#"><img
					src="<c:url value="/assets/user/img/visa.png"/>" alt="payment"></a>
				<a href="#"><img
					src="<c:url value="/assets/user/img/disc.png"/>" alt="payment"></a>
			</p>
			<span>Copyright &copy; 2022<br> Sản phẩm Spring MVC đầu tay của nhóm 03
			</span>
		</div>
	</div>
	<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/assets/user/js/jquery.js"/>"></script>
	<script src="<c:url value="/assets/user/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/jquery.easing-1.3.min.js"/>"></script>
	<!-- <script src="<c:url value="/assets/user/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/flipper.min.js"/>"></script> -->
	
	<script
		src="<c:url value="/assets/user/js/jquery.scrollTo-1.4.3.1-min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/shop.js"/>"></script>
	<!-- Lat sach -->
	
	<%-- <script src="<c:url value="/assets/user/js/jquery.min.js"/>"></script> --%>
	<script src="<c:url value="/assets/user/demos/flipper/flipper.min.js"/>"></script>
	
	<script src="<c:url value="/assets/user/js/site.js"/>"></script>
	
	<decorator:getProperty property="page.script"></decorator:getProperty>
</body>
</html>

