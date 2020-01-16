<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>    

<link href="${pageContext.request.contextPath}/resources/css/user/rsv.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>STEP03</h1>
</div>
    
<div class="content-area">
	<div class="rsv-left">
		<form id="frm" action="step03" method="post">
		<div class="pay-area">
			<div class="pay-wrap">
				<table>
					<tr class="title-tr">
						<td colspan="4">예약정보</td>
					</tr>
					<tr>
						<th>예약자 이름</th>
						<td><input type="text" name="mNm" value="${mem.mNm == null? '비회원': mem.mNm}"></td>
						<th></th>
						<td>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:set var="p" value="${fn:split(mem.mTel, '-')}"></c:set>
							<input type="text" maxlength="4" name="tel1" class="pNum" value="${p[0]}" onchange="getTel()">
							<input type="text" maxlength="4" name="tel2" class="pNum" value="${p[1]}" onchange="getTel()">
							<input type="text" maxlength="4" name="tel3" class="pNum" value="${p[2]}" onchange="getTel()">
							<input type="hidden" name="mTel">
						</td>
						<th>이메일(선택)</th>
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
								<option selected="selected">선택</option>
								<option>AMEX CARD</option>
								<option>BC CARD</option>
								<option>CITIBANK CARD</option>
								<option>DINERS CARD</option>
								<option>HYUNDAI CARD</option>
								<option>JCB CARD</option>
								<option>KEB CARD</option>
								<option>KOOKMIN CARD</option>
								<option>LOTTE CARD</option>
								<option>MASTER OVERSEAS</option>
								<option>SHINHAN CARD</option>
								<option>SAMSUNG CARD</option>
								<option>VISA OVERSEAS</option>
								<option>UNION PAY</option>
							</select>
						</td>
						<th>카드번호</th>
						<td>
							<input type="text" maxlength="4" name="num1" class="cNum" onchange="getPyNum()">
							<input type="text" maxlength="4" name="num2" class="cNum" onchange="getPyNum()">
							<input type="text" maxlength="4" name="num3" class="cNum" onchange="getPyNum()">
							<input type="text" maxlength="4" name="num4" class="cNum" onchange="getPyNum()">
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
			
			<dt>선택좌석 <small>(총 <span id="cSeat-cnt"></span>석 선택)</small></dt>
			<dd id="cSeat-box">
				
				<c:set var="sum" value="0"/>
				<c:forEach var="st" items="${seatList}">
					${st.stNm} 
				</c:forEach>
			</dd>

			<dt>총 금액</dt>
			<dd>
				<span><fmt:formatNumber value="${tempPay.pyPrice}" pattern="###,###" /> 원</span>
			</dd>
		</dl>
	</div>
</div>			

<script>
	$("#btnNext").click(function(){
		$("form").submit();
	})
	
	//전화번호 조합하기
	function getTel(){
		var tel1 = frm.tel1.value;
		var tel2 = frm.tel2.value;
		var tel3 = frm.tel3.value;
		
		frm.mTel.value = tel1 + "-" + tel2 + "-" + tel3;
	}

	//전화번호 조합하기
	function getPyNum(){
		var num1 = frm.num1.value;
		var num2 = frm.num2.value;
		var num3 = frm.num3.value;
		var num4 = frm.num4.value;
		
		frm.pyNum.value = num1 + "-" + num2 + "-" + num3 + "-" + num4;
	}
</script>


<%@ include file="../../include/footer.jsp" %>

