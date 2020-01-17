<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<div class="content-area">
	<div class="form-wrap">
		<h1>${title} 완료되었습니다.</h1>
		<h3>3초 후에 메인화면으로 돌아갑니다</h3>
		<button>로그인 화면으로</button>
	</div>
</div>


<script>
	$("button").click(function(){
		location.href="${pageContext.request.contextPath}";
	})
</script>

<%@ include file="../../include/footer.jsp" %>

