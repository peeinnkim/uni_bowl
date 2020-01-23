<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/member.css" type="text/css" rel="stylesheet">
<style>
	.form-wrap { width: 35%; }
	.error { display: block; }
</style>


<div class="section-title">
	<h1>UNIVERSE FISH-BOWL</h1>
</div>

<div class="content-area">
	<h2>${fPw != null? '비밀번호': '아이디'} 찾기</h2>
	<div class="form-wrap">
		<form id="frm" action="findIdPw" method="post" onsubmit="return validCk()">
			<c:if test="${fPw != null}">
				<p>
					<label>아이디</label>
					<input type="text" name="mId">
				</p>
			</c:if>
			<p>
				<label>이메일 주소</label>
				<input type="email" name="mMail">
				<input type="submit" value="FIND">
			</p>
			<p class="error">
				<c:if test="${MailNotExist != null}">
					입력하신 이메일을 찾을 수 없습니다.
				</c:if>
				<c:if test="${IdNotExist != null}">
					입력하신 아이디를 찾을 수 없습니다.
				</c:if>
			</p>
		</form>
	</div>
</div>

<script>
	function validCk(){
		if(frm.mId.value == "") {
			alert("아이디를 입력하세요");
			frm.mId.focus();
			return false;
		}
		if(frm.mMail.value == "") {
			alert("메일주소를 입력하세요");
			frm.mMail.focus();
			return false;
		}
	}
	
</script>


<%@ include file="../../include/footer.jsp" %>