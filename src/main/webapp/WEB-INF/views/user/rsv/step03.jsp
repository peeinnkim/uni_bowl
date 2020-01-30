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
							<input type="hidden" name="mTel" value="${mem.mTel}">
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
									<option>월</option>
								<c:forEach var="vMonth" begin="1" end="12">
									<option>${vMonth}</option>
								</c:forEach>
							</select>
							<label>년</label>
							<select name="pyValidYear">
									<option>년</option>
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
						<td colspan="4">
							<ul>
								<li>구입하는 티켓은 변경이 불가합니다. 예약을 변경하시려면 취소 후 재구매 해주시기 바랍니다.</li>
								<li>입장 시 혼잡하여 착석까지 시간이 걸리는 경우가 있습니다. 감안하시어 상영 시간보다 빨리 도착해주시기 바랍니다.</li>
								<li>상영이 시작되면 안전을 위해 입장과 퇴장을 하실 수 없습니다.</li>
								<li>각종 할인 혜택을 이용하시는 고객님께서는 온라인 구매가 불가능하오니 번거로우시겠지만 티켓 카운터에서 티켓을 구매해주시기 바랍니다.</li>
							</ul>
							
							<div>
								<h3>NOTICE</h3>
								우주어항은 어른들을 대상으로 한 작품을 상영하고 있기 때문에, 다른 플라네타륨관에는 없는 독자적인 룰을 운영하고 있습니다.<br>
								기분 좋은 관람을 위하여 아래의 내용을 지켜주시기 바랍니다.<br><br>
								[상영 중 다음과 같은 행동을 하는 경우에는 스태프의 판단으로 퇴실조치 되는 점. 양해 부탁드립니다.]<br><br>
								- 큰 소리로 이야기하거나 우는 등 관람에 방해가 되는 소리를 내는 경우<br>
								(플라네타륨의 특성상 작은 소리라도 굉장히 크게 들립니다. 또 천체상영을 위해 상영관 안이 굉장히 어두워지고, 연출상 큰 소리가 납니다. 특히 어린 아이를 동반한 고객님께 주의 부탁드립니다.)<br>
								- 앞 좌석을 차는 경우<br>
								- 스마트폰이나 전자기계 등 빛이 새어나오는 물품을 사용하여 다른 고객님의 관람을 방해하는 경우<br><br>
								이 외에도 다른 고객님의 관람을 방해하는 모든 행위는 삼가주시기 바랍니다.
							</div>
						</td>
					</tr>
				</table>
			</div>	
		</div>
		<div class="btn-area">
			<a href="${pageContext.request.contextPath}/user/rsv/step01" id="btnCancel">취소</a>
			<a id="btnNext">다음</a>
		</div>
		</form>
	</div>

	<div class="rsv-right">
		<dl>
			<dt>프로그램명</dt>
			<dd>
				<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${tempOres.pg.pgThumb}"><br>
				${tempOres.pg.pgTitle}
			</dd>
			
			<dt>상영관</dt>
			<dd>${tempOres.th.thNm} 관</dd>

			<dt>상영날짜</dt>
			<dd><fmt:formatDate value="${tempOres.org.orgDate}" pattern="yyyy년 MM월 dd일"/></dd>

			<dt>상영시간</dt>
			<c:set var="h" value="${fn:split(tempOres.org.orgStime, ':')}"/>
			<c:set var="m" value="${fn:split(tempOres.org.orgEtime, ':')}"/>
			<dd>${h[0]}:${h[1]} ~ ${m[0]}:${m[1]}</dd>
			
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
	
	//submit 전 유효성 검사
	$("form").submit(function(){
		//이름
		var nameReg = /^[가-힣]{2,5}$/;
		var name = $("input[name='mNm']").val();
		
		if(name == "") {
			alert("이름을 입력하세요.");
			return false;
		} else if(nameReg.test(name) == false) {
			alert("입력된 이름이 형식에 맞지 않습니다. 다시 확인 바랍니다.");
			return false;
		}
		
		//휴대전화
		var tel1Reg = /^01[0|1|6-9]{1}$/;
		var tel2Reg = /^[0-9]{3,4}$/;
		var tel3Reg = /^[0-9]{3,4}$/;
		var tel1 = $("input[name='tel1']").val();
		var tel2 = $("input[name='tel2']").val();
		var tel3 = $("input[name='tel3']").val();
		
		if(tel1 == "" || tel2 == "" || tel3 == "") {
			alert("전화번호를 입력하세요.");
			return false;
		} else if(tel1Reg.test(tel1) == false || tel2Reg.test(tel2) == false || tel3Reg.test(tel3) == false){
			alert("입력된 전화번호가 형식에 맞지 않습니다. 다시 확인 바랍니다.");
			return false;
		}
		
		//이메일
		var mailReg = /^[a-z0-9]([-_.]?[0-9a-z])*@[0-9a-z]([-_.]?[0-9a-z])*.[a-z]{2,3}$/i;
		var mail = $("input[name='mMail']").val();
		
		if(mail == "") {
			alert("메일을 입력하세요.");
			return false;
		} else if(mailReg.test(mail) == false){ 
			alert("입력된 메일주소가 형식에 맞지 않습니다. 다시 확인 바랍니다.");
			return false;
		}
		
		//카드종류
		if($("select[name='pyType']").val() == "선택") {
			alert("카드종류를 선택해주세요.");
			return false;
		}
		
		//카드번호
		var cardReg = /^[0-9]{4}$/;
		var cardNum1 = $("input[name='num1']").val();
		var cardNum2 = $("input[name='num2']").val();
		var cardNum3 = $("input[name='num3']").val();
		var cardNum4 = $("input[name='num4']").val();
		
		if(cardNum1 == "" || cardNum2 == "" || cardNum3 == "" || cardNum4 == "") {
			alert("카드번호를 입력해주세요.");
			return false;
		}
		
		if(cardReg.test(cardNum1) == false || cardReg.test(cardNum2) == false
		|| cardReg.test(cardNum3) == false || cardReg.test(cardNum4) == false) {
			alert("입력된 카드번호가 형식에 맞지 않습니다. 다시 확인 바랍니다.");
			return false;
		}
		
		//카드 유효기간
		var selMonth = $("select[name='pyValidMonth']").val();
		var selYear = $("select[name='pyValidYear']").val();
		
		if(selMonth == "월" || selYear == "년") {
			alert("카드 유효기간을 입력해주세요.");
			return false;
		}
	});
	
</script>


<%@ include file="../../include/footer.jsp" %>

