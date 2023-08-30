$(document).ready(function() {
	$("body").fadeIn(400);

	$('#myCarousel').carousel()
	$('#newProductCar').carousel()

	/* Home page item price animation */
	$('.thumbnail').mouseenter(function() {
		$(this).children('.zoomTool').fadeIn();
	});

	$('.thumbnail').mouseleave(function() {
		$(this).children('.zoomTool').fadeOut();
	});

	// Show/Hide Sticky "Go to top" button
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$(".gotop").fadeIn(200);
		} else {
			$(".gotop").fadeOut(200);
		}
	});
	// Scroll Page to Top when clicked on "go to top" button
	// $(".gotop").click(function(event){
	// event.preventDefault();
	//
	// $.scrollTo('#gototop', 1500, {
	// easing: 'easeOutCubic'
	// });
	// });

	$(".gotop").click(function() {
		$('html, body').animate({
			scrollTop : $("#header").offset().top
		}, 700);
	});

	$(".fucroll").click(function() {
		$('html, body').animate({
			scrollTop : $(".fucroll1").offset().top
		}, 700);
	});

	$(".show1").click(function() {
		var loginBox1 = $(".show1").attr("href");
		$(loginBox1).fadeIn(300);
		$("body").prepend("<div id='over'>");
		$("#over").fadeIn(300);
		$('html, body').animate({
			scrollTop : $("#header").offset().top
		}, 1000);
		return false;
	});

	$(".show2").click(function() {
		var loginBox2 = $(".show2").attr("href");
		$(loginBox2).fadeIn(300);
		$("body").prepend("<div id='over'>");
		$("#over").fadeIn(300);
		$('html, body').animate({
			scrollTop : $("#header").offset().top
		}, 1000);
		return false;
	});

	$(".show3").click(function() {
		var loginBox3 = $(".show3").attr("href");
		$(loginBox3).fadeIn(300);
		$("body").prepend("<div id='over'>");
		$("#over").fadeIn(300);
		$('html, body').animate({
			scrollTop : $("#header").offset().top
		}, 1000);
		return false;
	});

	$(document).on("click", "a.close, #over", function() {
		$("#over, .login, .login2, .login3").fadeOut(300, function() {
			$("#over").remove();
		});
		return false;
	});

	(function($, undefined) {
		$(document).ready(function() {
			$('#myflipper').flipper({
				'width' : 700,
				'height' : 400,
				"arrows" : true,
				'imagesPath' : '/assets/user/img/flipper/'
			});
		});
	}(jQuery));
	
	$(".category1").click(function() {
		$('html, body').animate({
			scrollTop : $(".category1").offset().top
		}, 700);
	});
	
	$(".category2").click(function() {
		$('html, body').animate({
			scrollTop : $(".category2").offset().top
		}, 700);
	});
	
	$(".category3").click(function() {
		$('html, body').animate({
			scrollTop : $(".category3").offset().top
		}, 700);
	});
	
	$(".category4").click(function() {
		$('html, body').animate({
			scrollTop : $(".category4").offset().top
		}, 700);
	});
	
	$(".category5").click(function() {
		$('html, body').animate({
			scrollTop : $(".category5").offset().top
		}, 700);
	});
	
	$(".category6").click(function() {
		$('html, body').animate({
			scrollTop : $(".category6").offset().top
		}, 700);
	});
	
	$(".category7").click(function() {
		$('html, body').animate({
			scrollTop : $(".category7").offset().top
		}, 700);
	});
	
	$(".category8").click(function() {
		$('html, body').animate({
			scrollTop : $(".category8").offset().top
		}, 700);
	});
	
	$(".category9").click(function() {
		$('html, body').animate({
			scrollTop : $(".category9").offset().top
		}, 700);
	});
	
	$(".category10").click(function() {
		$('html, body').animate({
			scrollTop : $(".category10").offset().top
		}, 700);
	});

});
