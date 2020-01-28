<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/menu.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>PROGRAM</h1>
</div>

<div class="content-area">
	<div class="pg-list-wrap">
		<h1 style="text-align: center;">PROGRAM LIST</h1>
		<ul class="pg-list">
			<c:forEach var="pg" items="${list}">
				<c:if test="${pg.pgIsRunning == 0}">
					<li>
						<h2>${pg.pgTitle}</h2>
						<div class="pg-img" data-pgNo="${pg.pgNo}">
							<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${pg.pgPoster}">
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>	

<script>
	$(".pg-img").click(function(){
		var pgNo = $(this).attr("data-pgNo");
		
		location.href = "${pageContext.request.contextPath}/user/pgDetail?pgNo=" + pgNo;
	})
</script>


<%@ include file="../../include/footer.jsp" %>

