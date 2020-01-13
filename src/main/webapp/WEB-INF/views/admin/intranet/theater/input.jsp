<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/theater.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/registTheater.js"></script>

<h2>상영관 추가</h2>
<input type="hidden" name="pName" value="${pageContext.request.contextPath}">

<div class="content-wrap">
	<div class="cont-center">
		<ul class="crt-th-wrap">
			<li>
				<label>상영관명</label>
				<span><input type="text" name="thName"></span>
			</li>
			<li>
				<label>수용인원</label>
				<span><input type="text" name="thSeatCnt" maxlength="3" class="ipNum"> 명</span>
			</li>
			<li>
				<label>위치</label>
				<span><input type="text" name="thFloor" maxlength="2" class="ipNum"> 층</span>
			</li>
			<li style="width: 100%; text-align: right;">
				<span>
					<button id="crtThBtn">저장</button>
				</span>
			</li>
		</ul>
		
		<div class="crted-th-wrap">
			<input type="text" id="cThNo" value="1">
			<p>
				<label>상영관명</label>
				<span><em id="cThName">어쩌구저쩌구</em> 관</span>
			</p>
			<p>
				<label>수용인원</label>
				<span><em id="cThCnt">5</em> 명</span>
			</p>
			<p>
				<label>위치</label>
				<span><em id="cThFloor">3</em> 층</span>
			</p>
		</div>
		
		<div class="crt-seat-pre">
			<h2>좌석 설정</h2>
			<label>전체좌석<br>(복도포함)</label>
			<span>
				<input type="text" maxlength="3" id="rows" class="ipNum" placeholder="열"> X 
				<input type="text" maxlength="3" id="cols" class="ipNum" placeholder="행">
				<button id="crtStBtn">좌석생성</button>
			</span>
		</div>
		
		<div class="crt-seat-wrap">
			<div class="seat-div">
				<h2>좌석 등급</h2>
				<div>
					<dl>
						<dt class="seatEx seat-empty" data-cNm="seat-empty" onclick="getCName(this)"></dt>
						<dd>일반석</dd>
					</dl>
					<dl>
						<dt class="seatEx premiumSingle-empty" data-cNm="premiumSingle-empty" onclick="getCName(this)"></dt>
						<dd>프리미엄 싱글석</dd>
					</dl>
					<dl>
						<dt class="seatEx premiumDouble-empty" data-cNm="premiumDouble-empty" onclick="getCName(this)"></dt>
						<dd>프리미엄 더블석</dd>
					</dl>
					<dl>
						<dt class="seatEx seat-none" data-cNm="seat-disabled" onclick="getCName(this)"></dt>
						<dd>비좌석</dd>
					</dl>
				</div>
			</div>
			
			<div class="seat-save-wrap">
				<button id="stSaveBtn">저장</button>
				<button id="reLabelBtn">라벨링</button>
			</div>
			<div id="show-seat-wrap">
				<div></div>
			</div>
			
		</div>
	</div>
</div>

<%@ include file="../../include/footer.jsp" %>

