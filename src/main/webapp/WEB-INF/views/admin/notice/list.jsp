<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>NOTICE</h1>
</div>

<div class="content-area">
	<div class="search-wrap">
		<div class="search-category">
			<button>등록</button>
		</div>
		
		<div class="search-keyword">
			<select>
				<option>제목</option>
			</select>
			<input type="text">
			<button>검색</button>
		</div>
	</div>
	
	<table>
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>DATE</th>
			<th>CNT</th>
		</tr>
		<c:forEach var="nt" items="${list}">
			<tr>
				<td>${nt.ntNo}</td>
				<td class="list-title"><a href="${pageContext.request.contextPath}/admin/notice/read?ntNo=${nt.ntNo}">${nt.ntTitle}</a></td>
				<td><fmt:formatDate value="${nt.ntRegDate}" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${nt.ntViewCnt}</td>
			</tr>
		</c:forEach>
	</table>
	
	<ul id="pagination"></ul>
</div>	


<%@ include file="../../include/footer.jsp" %>

