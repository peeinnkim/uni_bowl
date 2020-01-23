<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/admin/member.css" rel="stylesheet" type="text/css">
<style>
	.content-area { text-align: center; }
	.content-area > h1 { margin-bottom: 40px; }
	.content-area > h3 { width: 50%; margin: 0 auto 50px; border: 4px solid steelblue; padding: 40px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="container">
		<div class="header">
			<h1>INTRANET</h1>
		</div>
		
		<div class="intra-content">
			<div class="content-area">
				<h2>ID / PW 찾기</h2>
				<c:if test="${title != '0'}">
					<h1>${title} 완료되었습니다.</h1>
				</c:if>
				
				<c:if test="${fObj != '0'}">
					<h1>ID/PW 찾기 결과</h1>
					<h3>${fObj}: ${result}</h3>
				</c:if>
				<button id="btnMainPage" style="margin-left: 20px;">메인</button>
				<button id="btnLoginPage" style="margin-right: 20px;">로그인</button>
			</div>

<script>
	$("#btnMainPage").click(function(){
		location.href="${pageContext.request.contextPath}";
	})
	$("#btnLoginPage").click(function(){
		location.href="${pageContext.request.contextPath}/user/member/login";
	})
</script>

		</div>
	</div>
</body>
</html>
