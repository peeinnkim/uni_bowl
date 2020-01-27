<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/admin/member.css" rel="stylesheet" type="text/css">
<style>
	.content-wrap { width: 25%; }
	.error { display: block; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="container">
		<div class="header">
			<h1>INTRANET</h1>
		</div>
	
		<div class="intra-content">
			<div class="content-wrap">
				<h2>인트라넷 로그인</h2>
				<div class="cont-center">
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
							<a href="${pageContext.request.contextPath}/admin/intranet/member/join">JOIN</a>
							<a href="${pageContext.request.contextPath}/user/member/findInfo">FIND ID/PW</a>
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
			
			
		</div>
	</div>
</body>
</html>

