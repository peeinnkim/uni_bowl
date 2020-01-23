<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/program.css" type="text/css" rel="stylesheet">
<style>
	.rsvCaution { width: 100%; color: red; font-size: 15px; text-align: center; }
</style>

<h2>상영관 관리</h2>
<div class="content-wrap">
	<div class="cont-center">
		<div class="menu-wrap">
			<a href="${pageContext.request.contextPath}/admin/theater/regist" id="addPg"></a>
		</div>
		
		<table>
			<tr>
				<th>no</th>
				<th>상영관이름</th>
				<th>수용인원</th>
				<th>위치</th>
				<th>상영표</th>
				<th>좌석관리</th>
				<th></th>
			</tr>
			
			<c:forEach var="th" items="${list}">
				<tr onclick="ck()">
					<td>${th.thNo}</td>
					<td><a href="${pageContext.request.contextPath}/admin/theater/modify?thNo=${th.thNo}">${th.thNm} 관</a></td>
					<td>${th.thSeatCnt} 석</td>
					<td>${th.thFloor} 층</td>
					<td><a href="#">상영표 보기</a></td>
					<td><a href="${pageContext.request.contextPath}/admin/theater/seat?thNo=${th.thNo}">좌석관리</a></td>
					<td><a href="${pageContext.request.contextPath}/admin/theater/remove?thNo=${th.thNo}" class="thDel"></a></td>
				</tr>
				<tr class="thImg-wrap">
					<td colspan="7">
						<img src="${pageContext.request.contextPath}/resources/img/mark-basarab-1OtUkD_8svc-unsplash.jpg">
					</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${hasRsvedSt != null}">
			<p class="rsvCaution">해당 상영관에 예약된 좌석이 있어 상영관 정보 수정 및 삭제가 불가능합니다.</p>
		</c:if>
	</div>
</div>

<script>
	$(".thDel").click(function(){
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result == true) {
			return true;
		} else {
			return false;
		}
	})
		
	function ck(){
/* 		var dd = document.getElementsByClassName("thImg-wrap")[0];		
	
		dd.style.display = "table-row"; */
	}
</script>

<%@ include file="../include/footer.jsp" %>

