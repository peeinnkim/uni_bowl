<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/menu.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>PROGRAM</h1>
</div>

<div class="content-area">
	<div class="pg-detail-wrap">
		<h1>Mundo Misterioso</h1>
		<div class="pgDetail-img">
			<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${pg.pgPoster}">
		</div>
		
		<div class="pgDetail-info">
			<div class="btn-area">
				<a href="${pageContext.request.contextPath}/user/rsv/step01" class="btnA">예약하기</a>
				<a href="${pageContext.request.contextPath}/user/qna/list" class="btnA">문의하기</a>
			</div>
			<div class="pgDetail-box">
				<p>
					<label>상영시간</label>
					<span>${pg.pgTime} 분</span>
				</p>
				<p>
					<label>설명</label>
					<span>${pg.pgDetail}</span>
				</p>
			</div>
		</div>
		
		<div class="pg-common">
			<h2>상영요금 안내</h2>
			<table>
				<tr>
					<th>구분</th>
					<th>좌석</th>
					<th>금액</th>
				</tr>
				<tr>
					<td rowspan="3">일반<br><small>(6세 이상)</small></td>
					<td>일반석</td>
					<td>18,000원</td>
				</tr>
				<tr>
					<td>프리미엄 싱글석</td>
					<td>18,000원</td>
				</tr>
				<tr>
					<td>프리미엄 더블석</td>
					<td>18,000원</td>
				</tr>
			</table>
			
			<ul>
				<li>※ 할인혜택을 이용하시는 고객님은 온라인으로 티켓 구매가 불가능합니다. 티켓 카운터를 이용해주세요.<br>티켓 카운터에서 상영을 원하는 날짜 2주 전부터 구매 가능합니다.</li>
				<li>※ 당일권은 티켓 카운터에서 10시 30분부터 구매 가능합니다.</li>
				<li>※ 상영 도중에는 입퇴장이 불가능합니다. 양해 부탁드립니다.</li>
				<li>※ 5세 미만의 어린이 고객님도 자리가 필요하시면 티켓을 구매해주세요.</li>
			</ul>
		</div>
		
	</div>
</div>	

<%@ include file="../../include/footer.jsp" %>

