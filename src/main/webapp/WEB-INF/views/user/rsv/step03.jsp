<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>    

<link href="${pageContext.request.contextPath}/resources/css/user/rsv.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>STEP03</h1>
</div>
    
<div class="content-area">
	<div class="rsv-left">
		<form action="step04" method="post">
		<div class="pay-area">
			<div class="pay-wrap">
				<table>
					<tr class="title-tr">
						<td colspan="4">예약정보</td>
					</tr>
					<tr>
						<th>예약자 이름</th>
						<td><input type="text" name="mNm" value="${mem.mNm}"></td>
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
								<option>3</option>
								<option>4</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:set var="p" value="${fn:split(mem.mTel, '-')}"></c:set>
							<input type="text" maxlength="4" class="pNum" value="${p[0]}" onchange="getTel()">
							<input type="text" maxlength="4" class="pNum" value="${p[1]}" onchange="getTel()">
							<input type="text" maxlength="4" class="pNum" value="${p[2]}" onchange="getTel()">
						</td>
						<th>이메일</th>
						<td>
							<input type="text" name="mMail" value="${mem.mMail}">
						</td>
					</tr>
					<tr class="title-tr">
						<td colspan="4">결제정보</td>
					</tr>
					<tr>
						<th>카드종류</th>
						<td>
							<select name="pyType">
								<option>SHINHAN CARD</option>
							</select>
						</td>
						<th>카드번호</th>
						<td>
							<input type="text" maxlength="4" class="cNum" onchange="getPyNum()">
							<input type="text" maxlength="4" class="cNum" onchange="getPyNum()">
							<input type="text" maxlength="4" class="cNum" onchange="getPyNum()">
							<input type="text" maxlength="4" class="cNum" onchange="getPyNum()">
							<input type="hidden" name="pyNum">
						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<th>유효번호</th>
						<td>
							<label>월</label>
							<select name="pyValidMonth">
								<c:forEach var="vMonth" begin="1" end="12">
									<option>${vMonth}</option>
								</c:forEach>
							</select>
							<label>년</label>
							<select name="pyValidYear">
								<c:forEach var="vYear" begin="2021" end="2030">
									<option>${vYear}</option>
								</c:forEach>
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
			<a id="btnCancel">취소</a>
			<a id="btnNext">다음</a>
		</div>
		</form>
	</div>

	<div class="rsv-right">
		<dl>
			<dt>프로그램명</dt>
			<dd>
				<img src="${pageContext.request.contextPath}/admin/intranet/displayFile?fileName=${tempOres.pg.pgThumb}"><br>
				${tempOres.pg.pgTitle}
			</dd>
			
			<dt>상영관</dt>
			<dd>${tempOres.th.thNm} 관</dd>

			<dt>상영날짜</dt>
			<dd><fmt:formatDate value="${tempOres.org.orgDate}" pattern="yyyy년 MM월 dd일"/></dd>

			<dt>상영시간</dt>
			<dd><fmt:formatDate value="${tempOres.org.orgDate}" pattern="HH:mm ~"/></dd>
			
			<dt>선택좌석 <small>(총 <span id="cSeat-cnt">0</span>석 선택)</small></dt>
			<dd id="cSeat-box">
				<c:forEach var="seat" items="${seatList}">
					${seat} 
				</c:forEach>
			</dd>
			
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

<script>
	$("#btnNext").click(function(){
		$("form").submit();
	})
</script>


<%@ include file="../../include/footer.jsp" %>

