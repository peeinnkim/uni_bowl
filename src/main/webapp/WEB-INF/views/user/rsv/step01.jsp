<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/rsv.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>STEP01</h1>
</div>

<div class="content-area">
	<div class="cont-top">
		<ul class="date-ul"></ul>
		<div class="date-box" id="orgDate"></div>
	</div>
	
	<div class="cont-bottom">
		<h2>PROGRAM LIST</h2>
		<input type="hidden" id="pName" value="${pageContext.request.contextPath}">
		<div class="main-list">
			<c:set var="sum" value="0" />
			<c:forEach var="rIdx" items="${rList}">
				<div class="list-box"> 
					<div class="list-info">
						<div class="info-img">
							<img src="${pageContext.request.contextPath}/admin/notice/displayFile?fileName=${list[sum].pg.pgThumb}">
						</div>
						<div class="info-txt">
							<h1>${list[sum].pg.pgTitle}</h1>
							<p>${list[sum].pg.pgDetail}</p>
						</div>
					</div>
					<div class="list-time">
						<c:forEach var="tm" begin="${sum}" end="${sum+rIdx-1}">
						<div class="time-box">
							<c:set var="h" value="${fn:split(list[tm].org.orgStime, ':')}"></c:set>
							<c:set var="m" value="${fn:split(list[tm].org.orgEtime, ':')}"></c:set>
							<b>${list[tm].th.thNm} 관</b>
							<h3 class="sTime">${h[0]}:${h[1]}</h3>
							<em class="eTime">~ ${m[0]}:${m[1]}</em>
							<p><span>10</span> / 30席</p>
							<input type="hidden" name="orgNo" value="${list[tm].org.orgNo}">
							<input type="hidden" name="orgPgNo" value="${list[tm].pg.pgNo}">
							<input type="hidden" name="orgThNo" value="${list[tm].th.thNo}">
						</div>
						</c:forEach>
					</div>
				</div>
				<c:set var="sum" value="${sum+rIdx}"/>
			</c:forEach>
		</div>
	</div>
</div>	


<script src="${pageContext.request.contextPath}/resources/js/rsvCal.js"></script>
<script>
	
	//ORGANIZAION 정보 넘기기 OrgVO(상영번호, 날짜, 프로그램번호, 상영관번호)
	$(document).on("click", ".time-box", function(){
		var orgNo = $(this).find($("input[name='orgNo']")).val();
		var orgDate = $(".dOn").attr("data-date") + " 00:00:00";
		var orgPgNo = $(this).find($("input[name='orgPgNo']")).val();
		var orgThNo = $(this).find($("input[name='orgThNo']")).val();
		var orgStime = $(this).find(".sTime").text() + ":00";
		var orgEtime = $(this).find(".eTime").text().substr(2) + ":00";
		
		var data = {
			orgNo : orgNo,
			orgDate: orgDate,
			orgPgNo: orgPgNo,
			orgThNo : orgThNo,
			orgStime: orgStime,
			orgEtime: orgEtime
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

