<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/menu.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>PROGRAM</h1>
</div>

<div class="content-area">
	<div class="th-info-wrap">
		<div class="th-info">
			<h1>THEATER</h1>
			<iframe src="https://www.youtube.com/embed/XLAyCOoCQaY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 
		</div>
		
		<div class="st-info">
			<h1>SEAT</h1>
			<table>
				<tr>
					<td><img src="${pageContext.request.contextPath}/resources/img/seat/st01.png"></td>
					<td><img src="${pageContext.request.contextPath}/resources/img/seat/st02.png"></td>
					<td><img src="${pageContext.request.contextPath}/resources/img/seat/st03.png"></td>
				</tr>
				<tr>
					<td>일반석</td>
					<td>프리미엄 싱글석</td>
					<td>프리미엄 더블석</td>
				</tr>
			</table>
		</div>
		
		<div class="st-info">
			<h1>관람 주의사항</h1>
			
			<div class="st-notice">
				우주어항은 어른들을 대상으로 한 작품을 상영하고 있기 때문에, 다른 플라네타륨관에는 없는 독자적인 룰을 운영하고 있습니다.<br>
				기분 좋은 관람을 위하여 아래의 내용을 지켜주시기 바랍니다.<br><br>
				[상영 중 다음과 같은 행동을 하는 경우에는 스태프의 판단으로 퇴실조치 되는 점. 양해 부탁드립니다.]<br><br>
				- 큰 소리로 이야기하거나 우는 등 관람에 방해가 되는 소리를 내는 경우<br>
				(플라네타륨의 특성상 작은 소리라도 굉장히 크게 들립니다. 또 천체상영을 위해 상영관 안이 굉장히 어두워지고, <br>연출상 큰 소리가 납니다. 특히 어린 아이를 동반한 고객님께 주의 부탁드립니다.)<br>
				- 앞 좌석을 차는 경우<br>
				- 스마트폰이나 전자기계 등 빛이 새어나오는 물품을 사용하여 다른 고객님의 관람을 방해하는 경우<br><br>
				이 외에도 다른 고객님의 관람을 방해하는 모든 행위는 삼가주시기 바랍니다.
			</div>
		</div>
		
	</div>
</div>	

<script>
	$(".pg-img").click(function(){
		var pgNo = $(this).attr("data-pgNo");
		
		location.href = "${pageContext.request.contextPath}/user/pgDetail?pgNo=" + pgNo;
	})
</script>


<%@ include file="../../include/footer.jsp" %>

