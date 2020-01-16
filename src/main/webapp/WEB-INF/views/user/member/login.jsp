<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/member.css" type="text/css" rel="stylesheet">
<style>
	.error {display: block;}
</style>

<div class="section-title">
	<h1>UNIVERSE FISH-BOWL</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" action="loginPost" method="post">
			<p>
				<label>ID</label>
				<input type="text" name="mId" value="mlmlml">
			</p>
			<p>
				<label>PASSWORD</label>
				<input type="password" name="mPw" value="mlml3434">
				<input type="submit" value="LOGIN">
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/user/member/join">JOIN</a>
				<a href="#">FIND ID/PW</a>
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