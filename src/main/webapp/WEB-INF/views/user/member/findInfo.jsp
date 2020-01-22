<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/member.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>UNIVERSE FISH-BOWL</h1>
</div>

<div class="content-area">
	<h2>ID / PW 찾기</h2>
	<div class="form-wrap" style="background: none; text-align: center;">
		<div class="find-menu" style="margin-right: 80px;" id="findId">
			<span><small>FIND</small>ID</span>
			<h2>아이디 찾기</h2>
			<p>가입당시 입력한<br>이메일 주소로 아이디 찾기</p>
		</div>
		<div class="find-menu" style="margin-left: 80px;" id="findPw">
			<span><small>FIND</small>PW</span>
			<h2>비밀번호  찾기</h2>
			<p>가입당시 입력한 정보로<br>비밀번호 찾기</p>
		</div>
	</div>
</div>

<script>
	$(".find-menu").click(function(){
		location.href = "${pageContext.request.contextPath}/user/member/findIdPw?obj=" + $(this).attr("id");
	})
</script>


<%@ include file="../../include/footer.jsp" %>