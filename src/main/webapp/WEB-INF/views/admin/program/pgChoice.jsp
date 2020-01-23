<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container { width: 450px; padding: 15px;}
	table { width: 100%; border-collapse: collapse; }
	th { padding: 10px 0; border-bottom: 1px solid black; font-size: 15px; }
	td { padding: 15px 0; font-size: 14px; text-align: center; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="container">
		<table>
			<tr>
				<th>선택</th>
				<th>포스터</th>
				<th>프로그램명</th>
				<th>러닝타임</th>
			</tr>
			
			<c:forEach var="pg" items="${list}">
				<tr>
					<td><input type="radio" name="pgCk" data-val="${pg.pgNo}"></td>
					<td class="poster-wrap"><img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${pg.pgThumb}"></td>
					<td class="title-wrap">${pg.pgTitle}</td>
					<td class="etc-wrap">${pg.pgTime}분</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5">
					<button id="btnAdd">선택</button>
					<button id="btnCancel">취소</button>
				</td>
			</tr>
		</table>
	</div>

<script>
	$("#btnAdd").click(function(){
		var no = $("input[type='radio']:checked").attr("data-val");
		var title = $("input[type='radio']:checked").closest("tr").find(".title-wrap").text();
		var runningTime = $("input[type='radio']:checked").closest("tr").find(".etc-wrap").text().replace("분", "");
		var str = "<input type='hidden' name='orgPgNo' value='"+no+"'>"
				+ "<span id='rtrt' data-rt='"+runningTime+"'>"+title+"</span>";
		
 		window.opener.getReturnValue(str);
		window.close(); 
	})
	$("#btnCancel").click(function(){
		window.close();
	})
	
</script>
</body>
</html>