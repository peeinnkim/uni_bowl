<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/program.css" type="text/css" rel="stylesheet">

<h2>프로그램 관리</h2>
<div class="content-wrap">
	<div class="cont-center">
		<div class="menu-wrap">
			<select id="pgstate-sel">
				<option value="-1">전체</option>
				<option value="1">상영중</option>
				<option value="0">종료</option>
			</select>
			<a href="${pageContext.request.contextPath}/admin/intranet/program/regist" id="addPg"></a>
		</div>
		
		
		<table>
			<tr>
				<th>no</th>
				<th>포스터</th>
				<th>프로그램명</th>
				<th>설명</th>
				<th>러닝타임</th>
				<th>상태</th>
				<th></th>
			</tr>
			
			<c:forEach var="pg" items="${list}">
				<tr>
					<td>${pg.pgNo}</td>
					<td><img src="${pageContext.request.contextPath}/admin/intranet/displayFile?fileName=${pg.pgThumb}"></td>
					<td class="title-wrap"><a href="${pageContext.request.contextPath}/admin/intranet/program/modify?pgNo=${pg.pgNo}">${pg.pgTitle}</a></td>
					<td class="detail-wrap">${pg.pgDetail}</td>
					<td class="etc-wrap">${pg.pgTime}분</td>
					<td class="etc-wrap">${pg.pgIsRunning == 1? '상영중': '상영대기'}</td>
					<td class="del-wrap"><a href="${pageContext.request.contextPath}/admin/intranet/program/remove?pgNo=${pg.pgNo}" class="pgDel"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<script>
	$(".pgDel").click(function(){
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result == true) {
			return true;
		} else {
			return false;
		}
	})
</script>

<%@ include file="../../include/footer.jsp" %>

