<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="resources/css/user/main.css" type="text/css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<div class="content-area">
	<div class="main-wrap">
		<div class="slider">
			<div><img src="resources/img/mark-basarab-1OtUkD_8svc-unsplash.jpg"></div>
		</div>
		
		<div class="pg-wrap">
			<div>
				<h2>NEW PROGRAM</h2>
				<ul class="pg-list">
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div>
				<h2>BEST PROGRAM</h2>
				<ul class="pg-list">
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
		
	</div>
</div>	


<script>
	$('.slider').bxSlider({
		  auto: true,
		  autoControls: true,
		  stopAutoOnClick: true,
		  pager: true,
		  slideWidth: 700
	});
</script>




<%@ include file="include/footer.jsp" %>

