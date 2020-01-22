<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/member.css" type="text/css" rel="stylesheet">
<style>
	.form-wrap { width: 37%; }
	.uni-notice { text-align: center; font-size: 12px; color: steelblue; }
	.error { display: block; color: red; font-size: 13px; text-align: center; }
</style>

<div class="section-title">
	<h1>UNIVERSE FISH-BOWL</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" action="loginPost" method="post" onsubmit="return validCheck()">
			<p>
				<label>ID</label>
				<input type="text" name="mId" value="mlmlml">
			</p>
			<p>
				<label>PASSWORD</label>
				<input type="password" name="mPw" value="mlml3434">
				<input type="submit" value="LOGIN">
			</p>
			<p class="mMenu-wrap">
				<a href="${pageContext.request.contextPath}/user/member/join">JOIN</a>
				<a href="${pageContext.request.contextPath}/user/member/findInfo">FIND ID/PW</a>
				<a href="${pageContext.request.contextPath}/user/member/findInfo">비회원 로그인</a>
			</p>
			<p class="uni-notice">우주어항 관계자들은 인트라넷 로그인을 이용해주세요!</p>
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