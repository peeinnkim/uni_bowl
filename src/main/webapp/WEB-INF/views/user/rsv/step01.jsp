<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/calendarView.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/rsv.js"></script>
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
	<div class="cont-top">
		<ul class="date-ul">
			<li id="datePrev"></li>
			<li>01/11 <small>(月)</small></li>
			<li>01/12 <small>(火)</small></li>
			<li>01/13 <small>(水)</small></li>
			<li>01/14 <small>(木)</small></li>
			<li>01/15 <small>(金)</small></li>
			<li id="dateNext"></li>
		</ul>
		<div>
			2020年 01月 11日  (月)
		</div>
	</div>
	
	<div class="cont-bottom">
		<h2>PROGRAM LIST</h2>
		<div class="main-list">
			<div class="list-box"> 
				<div class="list-info">
					<div class="info-img"></div>
					<div class="info-txt">
						<h1>${ores.pg.pgTitle}</h1>
						<p>어쩌구저쩌구 설명설명</p>
					</div>
				</div>
				<div class="list-time">
					<div class="time-box">
						<fmt:formatDate var="sdsd" value="${ores.org.orgDate}" pattern="HH:mm"/>
						<h3>${sdsd}</h3>
						<em>상영관 1</em>
						<p><span>10</span> / 30席</p>
					</div>
					<div class="time-box">
						<h3>03:00</h3>
						<em>상영관 1</em>
						<p><span>10</span> / 30席</p>
					</div>
					<div class="time-box">
						<h3>03:00</h3>
						<em>상영관 1</em>
						<p><span>10</span> / 30席</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

<div class="content-area">
	
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
						<input type="hidden" name="orgNo" value="${ores.org.orgNo}">
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
		<input type="hidden" name="orgNo" value="{{org.orgNo}}">		
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
	
	
	//ORGANIZAION 정보 넘기기 OrgVO(상영번호, 날짜, 프로그램번호, 상영관번호)
	$(document).on("click", ".fSubmit", function(){
		var orgNo = $(this).closest("li").find("input[name='orgNo']").val();
		var orgDate = $(this).closest("li").find("input[name='orgDate']").val();
		var orgPgNo = $(this).closest("li").find("input[name='orgPgNo']").val();
		var orgThNo = $(this).closest("li").find("input[name='orgThNo']").val();
		
		var data = {
			orgNo : orgNo,
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

