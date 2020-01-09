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
				<h2>나으예약</h2>
				<span>진행중 예약: <span id="cur-rsvCnt">3</span>건</span>
				<a href="${pageContext.request.contextPath}/user/rsv/list" id="show-allRsv">전체보기</a>
			</div>
			<table id="main-tb">
				<tr>
					<th>예약번호</th>
					<th>프로그램명</th>
					<th>상영날짜</th>
					<th>상영관</th>
					<th>예약상태</th>
					<th>예약취소</th>
				</tr>
				<tr class="added-tr">
					<td>1234</td>
					<td class="list-title"><a href="#">어쩌구저쩌구 이런 프로그램</a></td>
					<td>2020-01-03 14:30</td>
					<td>어쩌구관</td>
					<td>결제완료</td>
					<td><a href="#" class="cancelRsvBtn"></a></td>
				</tr>
				<tr class="added-tr">
					<td>1234</td>
					<td class="list-title"><a href="#">어쩌구저쩌구 이런 프로그램</a></td>
					<td>2020-01-03 14:30</td>
					<td>어쩌구관</td>
					<td>결제완료</td>
					<td><a href="#" class="cancelRsvBtn"></a></td>
				</tr>
				<tr class="added-tr">
					<td>1234</td>
					<td class="list-title"><a href="#">어쩌구저쩌구 이런 프로그램</a></td>
					<td>2020-01-03 14:30</td>
					<td>어쩌구관</td>
					<td>결제완료</td>
					<td><a href="#" class="cancelRsvBtn"></a></td>
				</tr>
			</table>
		</div>
	</div>
</div>	

<%@ include file="../../include/footer.jsp" %>
