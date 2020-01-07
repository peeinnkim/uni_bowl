<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>QNA</h1>
</div>

<div class="content-area">
	<div class="search-wrap">
		<div class="search-category">
			<select>
				<option>분류</option>
			</select>
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
			<th>WRITER</th>
			<th>DATE</th>
			<th>CNT</th>
		</tr>
		
		<c:forEach var="qna" items="${list}">
			<tr>
				<td>${qna.qnaNo}</td>
				<td class="qna-title">${qna.qnaTitle}</td>
				<td>${qna.qnaWriter}</td>
				<td><fmt:formatDate value="${qna.qnaRegDate}" pattern="yyyy-MM-dd"/></td>
				<td>${qna.qnaViewCnt}</td>
			</tr>
		</c:forEach>
	</table>
	
	<ul id="pagination"></ul>
	<a href="${pageContext.request.contextPath}/user/qna/regist">등록</a>
</div>	

<%@ include file="../../include/footer.jsp" %>

