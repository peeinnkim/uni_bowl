<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/program.css" type="text/css" rel="stylesheet">

<h2>상영관 관리</h2>
<div class="content-wrap">
	<div class="cont-center">
		<div class="menu-wrap">
			<a href="${pageContext.request.contextPath}/admin/intranet/theater/regist" id="addPg"></a>
		</div>
		
		<table>
			<tr>
				<th>no</th>
				<th>상영관이름</th>
				<th>수용인원</th>
				<th>위치</th>
				<th>스케쥴</th>
				<th></th>
			</tr>
			
			<tr>
				<td>3</td>
				<td>어쩌구저쩌구관</td>
				<td>30석</td>
				<td>3층</td>
				<td><a href="#">스케쥴</a></td>
				<td><a href="#" class="thDel">삭제</a></td>
			</tr>
			<tr class="thImg-wrap">
				<td colspan="6">
					<img src="${pageContext.request.contextPath}/resources/img/mark-basarab-1OtUkD_8svc-unsplash.jpg">
				</td>
			</tr>
			
			<c:forEach var="th" items="${list}">
				<tr onclick="ck()">
					<td>${th.thNo}</td>
					<td><a href="#">${th.thNm}</a></td>
					<td>${th.thSeatCnt}</td>
					<td>${th.thFloor}</td>
					<td><a href="#">스케쥴</a></td>
					<td><a href="#" class="thDel">삭제</a></td>
				</tr>
				<tr class="thImg-wrap">
					<td colspan="6">
						<img src="${pageContext.request.contextPath}/resources/img/mark-basarab-1OtUkD_8svc-unsplash.jpg">
					</td>
				</tr>
			</c:forEach>
		</table>
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
		var dd = document.getElementsByClassName("thImg-wrap")[0];		
	
		dd.style.display = "table-row";
	}
</script>

<%@ include file="../../include/footer.jsp" %>

