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
			<tr>
				<td>35</td>
				<td class="qna-title"><a href="#">asdfasdfasdf</a></td>
				<td>asdfasdf</td>
				<td>1111-22-55</td>
				<td>353</td>
			</tr>
		
		<c:forEach var="qna" items="${qnas}">
			<tr>
				<td>${qna.qnaNo}</td>
				<td class="qna-title">${qna.qnaTitle}</td>
				<td>${qna.qnaWriter}</td>
				<td>${qna.qnaRegDate}</td>
				<td>${qna.qnaRegDate}</td>
			</tr>
		</c:forEach>
	</table>
	
	<ul id="pagination"></ul>
	<button>등록</button>
</div>	

<%@ include file="../../include/footer.jsp" %>

