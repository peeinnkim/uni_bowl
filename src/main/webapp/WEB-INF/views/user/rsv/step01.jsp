<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/calendarView.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>
<style>
	.delX {
		background: url("${pageContext.request.contextPath}/resources/img/icon/next.png") no-repeat;
		background-size: contain;
	}
</style>


<div class="section-title">
	<h1>STEP01</h1>
</div>


<div class="content-area">
	<div class="cont-left">
		<div class="cal-wrap">
			<div class="cal-top">
				<span id="prevBtn"></span>
				<h1 id="cal-title"></h1>
				<span id="nextBtn"></span>
			</div>
	
			<table id="cal-table"></table>
		</div>
	</div>
	
	<div class="cont-right">
		<h3>PROGRAM LIST</h3>
		
		<ul class="pg-list">
			<c:forEach var="ores" items="${list}">
				<li>
					<div class="pgTime-wrap">
						<fmt:formatDate var="sdsd" value="${ores.org.orgDate}" pattern="HH:mm"/>
						<c:set var="sd" value="${fn:split(sdsd, ':')}"></c:set>
						<span class="pgTime hour"><em>${sd[0]}</em>시</span>
						<span class="pgTime minute"><em>${sd[1]}</em>분</span>			
					</div>
					<div class="pgTitle-wrap">
						<a href="#">${ores.pg.pgTitle}</a>  
					</div>
					<div class="pgDel-wrap">
						<span class="delX"></span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div> 
</div>

<%@ include file="../../include/footer.jsp" %>

