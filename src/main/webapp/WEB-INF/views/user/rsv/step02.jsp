<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/rsv.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>STEP02</h1>
</div>

<div class="content-area">
	<div class="rsv-left">
		<div class="seat-area">
			<div class="seat-div">
				<dl>
					<dt class="seat seat-empty"></dt>
					<dd>빈 좌석</dd>
				</dl>
				<dl>
					<dt class="seat seat-active"></dt>
					<dd>선택한 좌석</dd>
				</dl>
				<dl>
					<dt class="seat seat-disabled"></dt>
					<dd>이미 예약된 좌석</dd>
				</dl>
				<dl>
					<dt class="seat premiumSingle-empty"></dt>
					<dd>비싼 싱글석</dd>
				</dl>
				<dl>
					<dt class="seat premiumDouble-empty"></dt>
					<dd>비싼 더블석</dd>
				</dl>
			</div>
			<div class="seat-img"></div>
			<div class="seat-icons">
				<ul class="seat-row">
					<li><a class="seat seat-empty"></a></li>
					<li><a class="seat seat-empty"></a></li>
					<li><a class="seat seat-active"></a></li>
					<li><a class="seat seat-active"></a></li>
					<li><a class="seat seat-none"></a></li>
					<li><a class="seat seat-none"></a></li>
					<li><a class="seat seat-disabled"></a></li>
					<li><a class="seat seat-disabled"></a></li>
					<li><a class="seat seat-disabled"></a></li>
					<li><a class="seat seat-disabled"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
				</ul>
			</div>
		</div>
		<div class="btn-area">
			<a href="#" id="btnCancel">취소</a>
			<a href="#" id="btnNext">다음</a>
		</div>
	</div>

	<div class="rsv-right">
		<dl>
			<dt>프로그램명</dt>
			<dd>Finding Aurora</dd>
			
			<dt>상영관</dt>
			<dd>DOME 2</dd>

			<dt>상영날짜</dt>
			<dd>2020년 09월 24일 (목)</dd>

			<dt>상영시간</dt>
			<dd>18:00~</dd>
		</dl>
	</div>
</div>	


<%@ include file="../../include/footer.jsp" %>

