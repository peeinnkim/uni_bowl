<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<div class="section-title">
	<h1>STEP01</h1>
</div>

<h2>상영스케쥴</h2> 

<div class="content-area">
	<div class="rsv-cpl-wrap">
		<div class="rsv-cpl-top">
			<h1>예약이 완료되었습니다</h1>
			<h2>예약번호: 20200111-000001</h2>
		</div>
		<div class="rsv-cpl-bottom">
			<div class="cpl-info">
				<h3>예약 정보</h3>
				<ul>
					<li>
						<label>예약자</label>
						<span>김믜믜</span>
					</li>
					<li>
						<label>에약인원</label>
						<span>성인 2명 / 어린이 2명</span>
					</li>
					<li>
						<label>연락처</label>
						<span>010-1234-1234</span>
					</li>
					<li>
						<label>이메일</label>
						<span>asdf@asdf.asdf</span>
					</li>
				</ul>
			</div>
			
			<div class="cpl-info">
				<h3>프로그램 정보</h3>
				<ul>
					<li>
						<label>프로그램명</label>
						<span>Finding Aurora</span>
					</li>
					<li>
						<label>상영관</label>
						<span>왕관 (2층)</span>
					</li>
					<li>
						<label>상영일시</label>
						<span>2022-03-03 13:00</span>
					</li>
					<li>
						<label>좌석</label>
						<span>총 2석 A-21 A-22</span>
					</li>
				</ul>
			</div>
			
			<div class="cpl-info">
				<h3>결제 정보</h3>
				<ul>
					<li>
						<label>결제금액</label>
						<span>100,000원</span>
					</li>
					<li>
						<label>카드종류</label>
						<span>SHINHAN CARD</span>
					</li>
					<li>
						<label>카드번호</label>
						<span>1234-****-****-1234</span>
					</li>
					<li>
						<label>결제일시</label>
						<span>2020-01-11 13:23:24</span>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="comm-wrap">
			<div>어쩌구저쩌고 홍보홍보</div>
		</div>
	</div>
	<div class="btn-area">
		<a href="#" id="btnCancel">홈</a>
		<a href="#" id="btnNext">예약리스트</a>
	</div>
</div>		

<%@ include file="../../include/footer.jsp" %>

