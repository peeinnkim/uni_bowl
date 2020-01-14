<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">
<style>
	.list-title {
		width: 43%;
	}
</style>

<div class="section-title">
	<h1>QNA</h1>
</div>

<div class="content-area">
	<div class="search-wrap">
		<div class="search-category">
			<select>
				<option>분류</option>
				<option value="1">예약문의</option>
				<option value="2">시설문의</option>
				<option value="3">기타문의</option>
				<option value="4">제안하기</option>
			</select>
		</div>
		
		<div class="search-keyword">
			<select id="searchType">
				<option>- - - - - - - -  All  - - - - - - - -</option>
				<option value="t" ${cri.searchType == 't'? 'selected': ''}>Title</option>
				<option value="c" ${cri.searchType == 'c'? 'selected': ''}>Content</option>  
				<option value="w" ${cri.searchType == 'w'? 'selected': ''}>Writer</option>
				<option value="tc" ${cri.searchType == 'tc'? 'selected': ''}>Title or Content</option>
				<option value="tw" ${cri.searchType == 'tw'? 'selected': ''}>Content or Writer</option>
				<option value="tcw" ${cri.searchType == 'tcw'? 'selected': ''}>Title or Content or Writer</option>
			</select>
			<input type="text" id="keyword" value="${cri.keyword}">
			<button id="btnSearch"></button>
		</div>
	</div>
	
	<table id="main-tb">
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>DATE</th>
			<th>CNT</th>
		</tr>
		
		<c:forEach var="qna" items="${list}">
			<tr class="added-tr">
				<td>${qna.qnaNo}</td>
				<td class="qna-title"><a href="${pageContext.request.contextPath}/user/qna/read?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></td>
				<td>${qna.qnaWriterId}</td>
				<td><fmt:formatDate value="${qna.qnaRegDate}" pattern="yyyy-MM-dd"/></td>
				<td>${qna.qnaViewCnt}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="paging-wrap">
		<ul class="pagination">
			<c:if test="${pageMaker.prev == true}">
				<li class="prev-li">
					<a href="listPage?page=${pageMaker.startPage}&searchType=${cri.searchType}&keyword=${cri.keyword}">
						◀
					</a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li ${idx == pageMaker.cri.page? 'class=active': ''}>
					<a href="listPage?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">
						${idx}
					</a>									
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next == true}">
				<li class="next-li">
					<a href="listPage?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&keyword=${cri.keyword}">
						▶
					</a>
				</li>
			</c:if>
		</ul>
		<p>${pageMaker.cri.page} / ${pageMaker.totalPager} <small>페이지</small></p>
	</div>
	
	<a href="${pageContext.request.contextPath}/user/qna/regist">등록</a>
</div>	


<script src="${pageContext.request.contextPath}/resources/js/getSearchList.js"></script>
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#list}}
<tr class="added-tr">
	<td>{{qnaNo}}</td>
	<td class="qna-title"><a href="${pageContext.request.contextPath}/user/qna/read?qnaNo={{qnaNo}}">{{qnaTitle}}</a></td>
	<td>{{qnaWriterId}}</td>
	<td>{{pDate qnaRegDate}}</td>
	<td>{{qnaViewCnt}}</td>
</tr>
{{/list}}
</script>
<script>
	$("#btnSearch").click(function(){
		var data = { 
				"searchType": $("#searchType").val(), 
				"keyword": $("#keyword").val(), 
				"page": 1, 
				"perPageNum": 10
			};
		
		getListPage(data);
	})
</script>

<%@ include file="../../include/footer.jsp" %>

