<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>    

<link href="${pageContext.request.contextPath}/resources/css/user/rsv.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>STEP01</h1>
</div>

<h2>상영스케쥴</h2>    
    
<div class="content-area">
	<div class="rsv-left">
		<div class="pay-area">
			<div class="pay-wrap">
				<table>
					<tr class="title-tr">
						<td colspan="4">예약정보</td>
					</tr>
					<tr>
						<th>예약자 이름</th>
						<td><input type="text"></td>
						<th>인원</th>
						<td>
							<label>성인</label>
							<select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
							<label>어린이</label>
							<select>
								<option>0</option>
								<option>1</option>
								<option>2</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" maxlength="4" class="pNum">
							<input type="text" maxlength="4" class="pNum">
							<input type="text" maxlength="4" class="pNum">
						</td>
						<th></th>
						<td></td>
					</tr>
					<tr class="title-tr">
						<td colspan="4">결제정보</td>
					</tr>
					<tr>
						<th>카드종류</th>
						<td><input type="text"></td>
						<th>카드번호</th>
						<td>
							<input type="text" maxlength="4" class="cNum">
							<input type="text" maxlength="4" class="cNum">
							<input type="text" maxlength="4" class="cNum">
							<input type="text" maxlength="4" class="cNum">
						</td>
					</tr>
					<tr>
						<th>유효번호</th>
						<td>
							<label>월</label>
							<select>
								<option>12</option>
							</select>
							<label>년</label>
							<select>
								<option>2020</option>
							</select>
						</td>
					</tr>
					<tr class="title-tr">
						<td colspan="4">결제공지</td>
					</tr>
					<tr>
						<td colspan="4">어쩌구저쩌구</td>
					</tr>
				</table>
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
			<dd>2020년 09월 24일 (목) 18:00~</dd>

			<dt>선택좌석</dt>
			<dd><span>2석</span> A-12 A-13</dd>
			
			<dt>인원</dt>
			<dd>
				성인 <span>2</span>명 / 어린이 <span>1</span>명
			</dd>

			<dt>총 금액</dt>
			<dd>
				<span>35,000원</span>
			</dd>
		</dl>
	</div>
</div>			

<%@ include file="../../include/footer.jsp" %>

