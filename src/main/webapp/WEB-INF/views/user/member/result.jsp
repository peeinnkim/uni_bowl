<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/user/member.css" type="text/css" rel="stylesheet">

<style>
	.form-wrap { text-align: center; }
</style>

<div class="section-title">
	<h1>UNIVERSE FISH-BOWL</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<c:if test="${title != '0'}">
			<h1>${title} 완료되었습니다.</h1>
		</c:if>
		
		<c:if test="${fObj != '0'}">
			<h1>ID/PW 찾기 결과</h1>
			<h3>${fObj}: ${result}</h3>
			<c:if test="${fObj == 'PW'}">
				<p>임시 비밀번호가 발급되었습니다. 로그인 후 꼭 변경해주세요!</p>
			</c:if>
		</c:if>
		<button id="btnMainPage" style="margin-left: 20px;">메인</button>
		<button id="btnLoginPage" style="margin-right: 20px;">로그인</button>
	</div>
</div>


<script>
	$("#btnMainPage").click(function(){
		location.href="${pageContext.request.contextPath}";
	})
	$("#btnLoginPage").click(function(){
		location.href="${pageContext.request.contextPath}/user/member/login";
	})
</script>

<%@ include file="../../include/footer.jsp" %>

