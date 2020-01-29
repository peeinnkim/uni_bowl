<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/myPage.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>MY PAGE</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<div class="mp-top">
			<h1>김멤버<small> 님</small>
			<a href="${pageContext.request.contextPath}/user/member/modify" id="mod-info"></a>
			</h1>		
		</div>
		<div class="mp-bottom">
			<div class="rsv-info">
				<h2><a href="${pageContext.request.contextPath}/user/rsv/myRsv">나의예약</a></h2>
				<span>진행중 예약: <span id="cur-rsvCnt">${fn:length(list)}</span>건</span>
				<a href="${pageContext.request.contextPath}/user/rsv/myRsv" id="show-allRsv">전체보기</a>
			</div>
			<table id="main-tb">
				<tr>
					<th>예약번호</th>
					<th>프로그램명</th>
					<th>상영날짜</th>
					<th>상영관</th>
					<th>예약상태</th>
				</tr>
				<c:forEach var="mRsv" items="${list}">
					<tr class="added-tr">
						<td>${mRsv.rrRsvNo}</td>
						<td class="list-title"><a href="#">${mRsv.pg.pgTitle}</a></td>
						<c:set var="h" value="${fn:split(mRsv.org.orgStime, ':')}" />
						<td><fmt:formatDate value="${mRsv.org.orgDate}" pattern="yyyy-MM-dd"/> ${h[0]}:${h[1]}</td>
						<td>${mRsv.th.thNm} 관</td>
						<td>${mRsv.rrPay.pyState == 0? '결제완료': '취소'}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>	

<%@ include file="../../include/footer.jsp" %>
