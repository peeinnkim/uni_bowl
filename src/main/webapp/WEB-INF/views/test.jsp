<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>

<div class="content-area">
	<div id="test-area"></div>	
	<button>테스트</button>
	
	
</div>	


<script>
	$("button").click(function(){
		var text = "<c:set var='cName' value='3'/>";
		var text2 = "<c:out value='${cName}'/>";
		
		$("#test-area").text(text + text2);
	})
</script>


<%@ include file="include/footer.jsp" %>

