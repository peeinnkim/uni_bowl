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
				<tr class="added-tr ${rl.rlRsvState == 0? '': 'cancelTr'}">
					<td>${rl.rlRsvNo}</td>
					<td class="list-title">${rl.rlPgTitle}</td>
					<td>${rl.rlMid}</td>
					<td>
						<c:set var="h" value="${fn:split(rl.rlRsvStime, ':')}"/>
						<fmt:formatDate value="${rl.rlOrgDate}" pattern="yyyy-MM-dd"/> ${h[0]}:${h[1]}
					</td>
					<td>${rl.rlThNm} 관</td>
					<td><fmt:formatNumber value="${rl.rlRsvPrice}" pattern="###,###"/> 원</td>
					<td><fmt:formatDate value="${rl.rlRsvDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${rl.rlRsvState == 0? '결제완료': '취소'}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="paging-wrap">
			<ul class="pagination">
				<c:if test="${pageMaker.prev == true}">
					<li class="prev-li">
						<a href="${pageContext.request.contextPath}/admin/gnr/rsv?page=${pageMaker.startPage}">
							◀
						</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li ${idx == pageMaker.cri.page? 'class=active': ''}>
						<a href="${pageContext.request.contextPath}/admin/gnr/rsv?page=${idx}">
							${idx}
						</a>									
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next == true}">
					<li class="next-li">
						<a href="${pageContext.request.contextPath}/admin/gnr/rsv?page=${pageMaker.endPage+1}">
							▶
						</a>
					</li>
				</c:if>
			</ul>
			<p id="pageIndex">${pageMaker.cri.page} / ${pageMaker.totalPager} <small>페이지</small></p>
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp" %>

