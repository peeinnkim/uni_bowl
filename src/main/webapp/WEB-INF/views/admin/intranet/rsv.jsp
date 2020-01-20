<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/program.css" type="text/css" rel="stylesheet">

<h2>예약 관리</h2>
<div class="content-wrap">
	<div class="cont-center">
		<table>
			<tr>
				<th>no</th>
				<th>예약자</th>
				<th>예약날짜</th>
				<th>프로그램</th>
				<th>상영관</th>
				<th>상영시간</th>
			</tr>
			
			<c:forEach var="rRes" items="${list}">
				<tr>
					<td>${rRes.rrRsvNo}</td>
					<td>${rRes.rrMem.memNm}</td>
					<td><fmt:formatDate value="${rRes.rrRsvDate}" pattern="yyyy-MM-dd"/></td>
					<td>${rRes.pg.pgTitle}</td>
					<td>${rRes.th.thNm}</td>
					<td>${rRes.th.thStime}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>


<%@ include file="../include/footer.jsp" %>

