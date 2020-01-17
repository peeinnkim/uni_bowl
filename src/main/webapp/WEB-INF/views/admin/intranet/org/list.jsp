<%@page import="com.peeinn.domain.org.OrgResultVO"%>
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
			<a id="addPg" style="cursor:pointer;"></a>
		</div>
		
		<ul class="main-list">
			<c:forEach var="ores" items="${list}">
				<li>
					<div class="pgTime-wrap">
						<fmt:formatDate var="sdsd" value="${ores.org.orgDate}" pattern="HH:mm"/>
						<c:set var="sd" value="${fn:split(sdsd, ':')}"></c:set>
						<span class="pgTime hour"><em>${sd[0]}</em>시</span>
						<span class="pgTime minute"><em>${sd[1]}</em>분</span>			
					</div>
					<div class="pgTitle-wrap">
						${ores.th.thNm} 관
						<a href="#">${ores.pg.pgTitle}</a>  
					</div>
					<div class="pgDel-wrap">
						<a href="${pageContext.request.contextPath}/admin/intranet/org/remove?orgNo=${ores.org.orgNo}" class="delX"></a>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div> 
</div>


<!-- HandleBars -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#each.}}
<li>
	<div class="pgTime-wrap">
		<span class="pgTime hour"><em>{{pHour org.orgDate}}</em>시</span>
		<span class="pgTime minute"><em>{{pMinute org.orgDate}}</em>분</span>			
	</div>
	<div class="pgTitle-wrap">
		<a href="#">{{pg.pgTitle}}</a>  
	</div>
	<div class="pgDel-wrap">
		<span class="delX"></span>
	</div>
</li>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("pHour", function(dd){
		var date = new Date(dd);
		var hour = date.getHours();
		return zeroZeroDate(hour);
	})
	Handlebars.registerHelper("pMinute", function(dd){
		var date = new Date(dd);
		var minute = date.getMinutes();
		return zeroZeroDate(minute);
	})

	$("#addPg").click(function(){
		var d = $(".tOn").attr("data-date");
		var tempDate = d + " 00:00:00";
		
		location.href = "${pageContext.request.contextPath}/admin/intranet/org/regist?tempDate=" + tempDate;
	})
	
	$(".delX").click(function(){
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result == true) {
			return true;
		} else {
			return false;
		}
	})
</script>

<%@ include file="../../include/footer.jsp" %>

