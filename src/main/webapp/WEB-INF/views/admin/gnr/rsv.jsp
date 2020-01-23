<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/program.css" type="text/css" rel="stylesheet">
<style>
	.list-title {
		width: 20%;
		text-align: center;
	}
</style>

<h2>예약 관리</h2>
<div class="content-wrap">
	<div class="cont-center">
		<table>
			<tr>
				<th>예약번호</th>
				<th>프로그램명</th>
				<th>예약자아이디</th>
				<th>상영날짜</th>
				<th>상영관</th>
				<th>금액</th>
				<th>예약날짜</th>
				<th>예약상태</th>
			</tr>
			
			<c:forEach var="rl" items="${list}">
				<tr class="added-tr">
					<td>${rl.rlRsvNo}</td>
					<td class="list-title"><a href="#">${rl.rlPgTitle}</a></td>
					<td>${rl.rlMid}</td>
					<td><fmt:formatDate value="${rl.rlOrgDate}" pattern="yyyy-MM-dd"/></td>
					<td>${rl.rlThNm} 관</td>
					<td><fmt:formatNumber value="${rl.rlRsvPrice}" pattern="###,###"/> 원</td>
					<td><fmt:formatDate value="${rl.rlRsvDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${rl.rlRsvState == 0? '결제완료': '취소'}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>


<%@ include file="../include/footer.jsp" %>

