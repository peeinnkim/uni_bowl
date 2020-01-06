<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/calendarView.css" type="text/css" rel="stylesheet">
<style>
	.cont-center {
		width: 80% !important;
	}
</style>

<script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>

<h2>상영스케쥴</h2>

<div class="content-wrap">
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
		
		<div class="addPg-wrap">
			<a href="${pageContext.request.contextPath}/admin/intranet/program/regist" id="addPg"></a>
		</div>
		
		<ul class="pg-list">
<%-- 			<c:forEach var="pg" items="${list}">
				<li>
					<div class="pgTime-wrap">
						<span class="pgTime hour"><em>29</em>시</span>
						<span class="pgTime minute"><em>60</em>분</span>			
					</div>
					<div class="pgTitle-wrap">
						<a href="${pageContext.request.contextPath}/admin/intranet/program/modify?pgNo=${pg.pgNo}">${pg.pgTitle}</a>
					</div>
					<div class="pgDel-wrap">
						<span class="delX"></span>
					</div>
				</li>
			</c:forEach> --%>
		</ul>
	</div> 
</div>



<%@ include file="../../include/footer.jsp" %>

