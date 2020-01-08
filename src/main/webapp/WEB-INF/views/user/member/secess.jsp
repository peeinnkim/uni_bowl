<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/member.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>UNIVERSE FISH-BOWL</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" action="secess" method="post">
			<h2>본인 확인을 위해 비밀번호를 한 번 더 입력해주세요</h2>
			<h3>※ 진행중 예약이 있을 경우 탈퇴가 불가능합니다</h3>
			<input type="hidden" name="mNo" value="${Auth.authNo}">
			<p>
				<label>PASSWORD</label>
				<input type="password" name="mPw">
			</p>
			<p>
				<input type="submit" value="SECESS">
				<input type="reset" value="CANCEL">
			</p>
		</form>
	</div>
</div>

<script>
	function validCheck(){
		if(frm.mPw.value == "") {
			alert("비밀번호를 입력하세요");
			frm.mPw.focus();
			return false;
		}
	}
</script>

<%@ include file="../../include/footer.jsp" %>