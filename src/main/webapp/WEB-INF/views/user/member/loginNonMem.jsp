<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/member.css" type="text/css" rel="stylesheet">
<style>
	.error {
		display: block;
		color: red;
		font-size: 13px;
		text-align: center;	
	}
</style>

<div class="section-title">
	<h1>UNIVERSE FISH-BOWL</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" action="loginPost" method="post" onsubmit="return validCheck()">
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
				<input type="hidden" name="mTel">
				<span class="error">[ERROR] 전화번호는 숫자만 입력 가능합니다</span>
				<br>				
			</p>
			<p>
				<label>PASSWORD</label>
				<input type="password" name="mPw" maxlength="20">
				<span class="regInfo">영어, 숫자, 특수문자(!@#$%^*-_) 8~20자</span>
				<span class="error">[ERROR] 입력하신 비밀번호가 형식에 맞지않습니다</span>
			</p>
			<p class="error">
				<c:if test="${error != null}">
					${error}
				</c:if>
			</p>
		</form>
	</div>
</div>

<script>
	function validCheck(){
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
	}
</script>

<% session.removeAttribute("error"); %>
<%@ include file="../../include/footer.jsp" %>