<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="resources/css/user/main.css" type="text/css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<div class="content-area">
	<div class="main-wrap">
		<div class="slider">
			<div><img src="resources/img/banner/bi01.png"></div>
			<div><img src="resources/img/banner/bi02.png"></div>
		</div>
		
		<div class="pg-wrap">
			<div>
				<h2>NEW PROGRAM</h2>
				<ul class="pg-list">
					<c:forEach var="n3" items="${n3List}">
						<li>
							<a href="${pageContext.request.contextPath}/user/pgDetail?pgNo=${n3.pgNo}">
								<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${n3.pgThumb}">
								<span>${n3.pgTitle}</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<h2>BEST PROGRAM</h2>
				<ul class="pg-list">
					<c:forEach var="b3" items="${bestList}">
						<li>
							<a href="${pageContext.request.contextPath}/user/pgDetail?pgNo=${b3.pgNo}">
								<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${b3.pgThumb}">
								<span>${b3.pgTitle}</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="comm-wrap">
			<div>
				<h1>COMING SOON</h1>
				<h2>우주어항 굿즈샵 오픈 예정</h2>
				<small>(날짜미정)</small>
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

