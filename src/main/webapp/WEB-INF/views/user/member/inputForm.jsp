<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/member.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>UNIVERSE FISH-BOWL</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" ${mem.mNo == null? 'action="join"': 'action="modify"'} method="post" onsubmit="return validCk()">
			<input type="hidden" name="mNo" value="${mem.mNo == null? 0: mem.mNo}" > 
			<input type="hidden" name="mCode" value="0" > 
			<p>
				<label>ID</label>
				<input type="text" name="mId" value="${mem.mId}" maxlength="15">
				<c:if test="${mem.mNo != null}">
					<button type="button" id="btnDup" onclick="duplicateChk()" style="display:none;">중복확인</button>
				</c:if>
				<c:if test="${mem.mNo == null}">
					<button type="button" id="btnDup" onclick="duplicateChk()" >중복확인</button>
				
				<span class="regInfo">영어, 숫자 6~15자</span>
				<span class="error">[ERROR] 입력하신 아이디가 형식에 맞지않습니다</span>
				</c:if>
			</p>
			<p>
				<label>PASSWORD</label>
				<input type="password" name="mPw" maxlength="20">
				<span class="regInfo">영어, 숫자, 특수문자(!@#$%^*-_) 8~20자</span>
				<span class="error">[ERROR] 입력하신 비밀번호가 형식에 맞지않습니다</span>
			</p>
			<p>
				<label><small>CONFIRM</small></label>
				<input type="password" name="mPw2" maxlength="20">
				<span class="error">[ERROR] 비밀번호가 일치하지 않습니다</span>
			</p>
			<p>
				<label>NAME</label>
				<input type="text" name="mNm" value="${mem.mNm}" maxlength="6">
				<c:if test="${mem.mNo == null}">
				<span class="error">[ERROR] 입력하신 이름이 형식에 맞지않습니다</span>
				</c:if>
			</p>
			<p>
				<label>BIRTH-DAY</label>
				<input type="date" name="mBirth" value="${mem.mBirth == null? '1990-01-01': mem.mBirth}">
			</p>
			<p>
				<label>TEL</label>
				<c:set var="p" value="${fn:split(mem.mTel, '-')}"></c:set>
				<select name="tel1" onchange="getTel()">
					<option ${p[0] == "010"?'selected="selected"':''}>010</option>
					<option ${p[0] == "011"?'selected="selected"':''}>011</option>
					<option ${p[0] == "016"?'selected="selected"':''}>016</option>
					<option ${p[0] == "017"?'selected="selected"':''}>017</option>
					<option ${p[0] == "018"?'selected="selected"':''}>018</option>
					<option ${p[0] == "019"?'selected="selected"':''}>019</option>
				</select> 
				<input type="tel" name="tel2" onchange="getTel()" maxlength="4" value="${p[1]}">
				<input type="tel" name="tel3" onchange="getTel()" maxlength="4" value="${p[2]}">
				<input type="hidden" name="mTel" value="${mem.mTel}">
				<span class="error">[ERROR] 전화번호를 다시 확인해주세요</span>
				<br>				
			</p>
			<p>
				<label>E-MAIL</label>
				<input type="email" name="mMail" value="${mem.mMail == null? '': mem.mMail}">
				<span class="error">[ERROR] 입력하신 메일주소가 형식에 맞지않습니다</span>
			</p>
			<p>
				<input type="submit" ${mem.mNo == null? 'value="JOIN"': 'value="MODIFY"'}>
				<input type="reset" value="CANCEL">
				<c:if test="${mem.mNo != null}">
					<a href="${pageContext.request.contextPath}/user/member/secess" style="color: #666; font-size: 13px; font-weight: bold;">회원탈퇴</a>
				</c:if>
			</p>
		</form>
	</div>
</div>	


<script>
	$("input[type='reset']").click(function(){
		location.href="${pageContext.request.contextPath}/user/member/myPage";
	})
	//전화번호 조합하기
	function getTel(){
		var tel1 = frm.tel1.value;
		var tel2 = frm.tel2.value;
		var tel3 = frm.tel3.value;
		
		frm.mTel.value = tel1 + "-" + tel2 + "-" + tel3;
	}
	
	/* -------------- [ 중복체크 ] -------------- */
	//중복체크
	function duplicateChk(){
		$.ajax({
			url: "dupChk",
			type: "post",
			data: {"mId": $("input[name='mId']").val()},
			dataType: "text",
			success: function(res){
				console.log(res);
				
				if(res == "available") {
					alert("사용가능한 아이디입니다.");
					$("button[type='button']").css("display", "none");
					
				} else if(res == "duplicated"){
					alert("중복된 아이디입니다. 다른 아이디를 입력하세요.");
				}
			},
			error: function(e){
				console.log(e);
			}
			
		})
		return false;
	}
	
	/* -------------- [ 유효성 검사 ] -------------- */
	//id 유효성 검사
	$("input[name='mId']").blur(function(){
		var idReg = /^[a-z0-9]{6,15}$/;
		regTest($(this), idReg);
	})
	
	$("input[name='mId']").focus(function(){
		getFocus($(this));
		$("button[type='button']").css("display", "inline-block");
	})

	//pw 유효성 검사
	$("input[name='mPw']").blur(function(){
		var pwReg = /^[a-z0-9!@#$%^&*-_]{8,20}$/i;
		regTest($(this), pwReg);
	}) 
	$("input[name='mPw']").focus(function(){
		getFocus($(this));
	})
	
	//pw2 유효성 검사
	$("input[name='mPw2']").blur(function(){
		var pw = $("input[name='mPw']").val();
		if(pw != $(this).val()) {
			$(this).nextAll(".error").css("display", "inline-block");
			$(this).nextAll(".regInfo").css("display", "none");
		}
	}) 
	$("input[name='mPw2']").focus(function(){
		getFocus($(this));
	})
	
	//name 유효성 검사
	$("input[name='mNm']").blur(function(){
		var nmReg = /^[가-힣]{2,5}$/;
		regTest($(this), nmReg);
	}) 
	$("input[name='mNm']").focus(function(){
		getFocus($(this));
	})
	
	//mail 유효성 검사
	$("input[name='mMail']").blur(function(){
		var mailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		regTest($(this), mailReg);
	}) 
	$("input[name='mMail']").focus(function(){
		getFocus($(this));
	})
	
	//tel 유효성 검사
	$("input[name='tel2']").blur(function(){
		var telReg = /^\d{3,4}$/;
		regTest($(this), telReg);
	}) 
	$("input[name='tel3']").blur(function(){
		var telReg = /^\d{4}$/;
		regTest($(this), telReg);
	}) 
	$("input[name='tel2']").focus(function(){
		getFocus($(this));
	}) 
	$("input[name='tel3']").focus(function(){
		getFocus($(this));
	}) 
	
	
	//유효성 검사 메소드
	function regTest(obj, reg){
		if(reg.test($(obj).val()) == false){
			$(obj).nextAll(".error").css("display", "inline-block");
			$(obj).nextAll(".regInfo").css("display", "none");
		}
	}
	
	//포커스 메소드
	function getFocus(obj){
		$(obj).nextAll(".error").css("display", "none");
		$(obj).nextAll(".regInfo").css("display", "inline-block");
	}
	
	/* -------------- [ submit전 유효성 검사 ] -------------- */
	function validCk(){
		if(frm.mId.value == "") {
			alert("아이디를 입력하세요");
			frm.mId.focus();
			return false;
		}
		if(frm.mPw.value == "") {
			alert("비밀번호를 입력하세요");
			frm.mPw.focus();
			return false;
		}
		if(frm.mPw2.value == "") {
			alert("비밀번호 확인을 입력하세요");
			frm.mPw2.focus();
			return false;
		}
		if(frm.mNm.value == "") {
			alert("이름를 입력하세요");
			frm.mNm.focus();
			return false;
		}
		if(frm.mTel.value == "") {
			alert("전화번호를 입력하세요");
			frm.mTel.focus();
			return false;
		}
		if(frm.mMail.value == "") {
			alert("메일주소를 입력하세요");
			frm.mMail.focus();
			return false;
		}
		if($("#btnDup").css("display") != "none") {
			alert("아이디 중복확인을 해주세요");
			return false;
		}

		var er = 0;
		$(".error").each(function(i, obj){
			if($(obj).css("display") != "none") {
				er++;
			}
		})
		
		if(er > 0) {
			alert("잘못된 입력이 존재합니다. 수정 바랍니다.");
			return false;
		}
	}
	
	

</script>

<%@ include file="../../include/footer.jsp" %>

