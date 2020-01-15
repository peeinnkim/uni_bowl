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
				<input type="hidden" id="sDate" value="${sDate}">
				<span id="prevBtn"></span>
				<h1 id="cal-title"></h1>
				<span id="nextBtn"></span>
			</div>
	
			<table id="cal-table"></table>
		</div>
	</div>
	
	<div class="cont-right">
		<h3>PROGRAM LIST</h3>
		
		<ul class="main-list">
			<c:forEach var="ores" items="${list}">
				<li>
					<div class="pgTime-wrap">
						<fmt:formatDate var="sdsd" value="${ores.org.orgDate}" pattern="HH:mm"/>
						<c:set var="sd" value="${fn:split(sdsd, ':')}"></c:set>
						<span class="pgTime hour"><em>${sd[0]}</em>시</span>
						<span class="pgTime minute"><em>${sd[1]}</em>분</span>
						<fmt:formatDate var="oDate" value="${ores.org.orgDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<input type="hidden" name="orgDate" value="${oDate}">	
					</div>
					<div class="pgTitle-wrap">
						<a class="fSubmit">${ores.pg.pgTitle}</a>  
						<input type="hidden" name="orgPgNo" value="${ores.pg.pgNo}">
					</div>
					<div class="pgDel-wrap">
						<input type="hidden" name="orgThNo" value="${ores.th.thNo}">
						<span class="delX fSubmit"></span>
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
		<input type="hidden" name="orgDate" value="{{pDateTime org.orgDate}}">				
	</div>
	<div class="pgTitle-wrap">
		<a class="fSubmit">{{pg.pgTitle}}</a>  
		<input type="hidden" name="orgPgNo" value="{{pg.pgNo}}">
	</div>
	<div class="pgDel-wrap">
		<input type="hidden" name="orgThNo" value="{{th.thNo}}">
		<span class="delX fSubmit"></span>
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
 	Handlebars.registerHelper("pDateTime", function(dd){
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var d = date.getDate();
		var h = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();
		
		return year + "-" + zeroZeroDate(month) + "-" + zeroZeroDate(d) + " " + zeroZeroDate(h) + ":" + zeroZeroDate(min) + ":00";
	}) 
	
	
	$(document).on("click", ".fSubmit", function(){
		var orgDate = $(this).closest("li").find("input[name='orgDate']").val();
		var orgPgNo = $(this).closest("li").find("input[name='orgPgNo']").val();
		var orgThNo = $(this).closest("li").find("input[name='orgThNo']").val();
		var data = {
			orgDate: orgDate,
			orgPgNo: orgPgNo,
			orgThNo : orgThNo
		};
		
		$.ajax({
			url: "step01",
			type: "post",
			data: JSON.stringify(data),
			dataType: "text",
			headers: {"Content-Type":"application/json"},
			success: function(res){
				console.log(res);
				
				if(res == "success") {
					location.href = "${pageContext.request.contextPath}/user/rsv/step02";
				}
			},
			error: function(e){
				console.log(e);
			}
		})
		
		
		
		
	})
</script>


<%@ include file="../../include/footer.jsp" %>

