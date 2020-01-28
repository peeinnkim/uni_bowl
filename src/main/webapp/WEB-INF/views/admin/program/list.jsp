<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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
			<a href="${pageContext.request.contextPath}/admin/program/regist" id="addPg"></a>
		</div>
		
		
		<table>
			<tr>
				<th>no</th>
				<th>포스터</th>
				<th>프로그램명</th>
				<th>설명</th>
				<th>러닝타임</th>
				<th>상태</th>
				<th>삭제</th>
			</tr>
			
			<c:forEach var="pg" items="${list}">
				<tr class="${pg.pgIsRunning == 1? 'cancelTr': ''}">
					<td>${pg.pgNo}</td>
					<td class="poster-wrap">
						<c:if test="${pg.pgIsRunning == 0}">
							<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${pg.pgThumb}">
						</c:if>
						<c:if test="${pg.pgIsRunning == 1}">-</c:if>
					</td>
					<td class="title-wrap">
						<c:if test="${pg.pgIsRunning == 0}">
							<a href="${pageContext.request.contextPath}/admin/program/modify?pgNo=${pg.pgNo}">${pg.pgTitle}</a>
						</c:if>
						<c:if test="${pg.pgIsRunning == 1}">${pg.pgTitle}</c:if>
					</td>
					<td class="detail-wrap"><pre><c:out value="${pg.pgDetail}"/></pre></td>
					<td class="etc-wrap">${pg.pgTime}분</td>
					<td class="etc-wrap">${pg.pgIsRunning == 0? '상영중': '상영종료'}</td>
					<td class="del-wrap">
						<c:if test="${pg.pgIsRunning == 0}">
							<a href="${pageContext.request.contextPath}/admin/program/remove?pgNo=${pg.pgNo}" class="pgDel"></a>
						</c:if>
					</td>
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

<%@ include file="../include/footer.jsp" %>

