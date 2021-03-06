<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">
<style>
#viewAll {
    font-weight: bold;
    font-size: 15px;
    display: inline-block;
}
#tit {
    width: 60%;
    text-align: center;
    margin: 0 auto 40px;
    padding: 10px 0;
	border-bottom: 4px dashed #5271C4;
    color: #5271C4;
    letter-spacing: 0.5em;
    font-weight: bold;
    font-size: 1.7em;
}
</style>

<h1 id="tit">공지관리</h1>

<div class="content-area">
	<div class="search-wrap">
		<a href="${pageContext.request.contextPath}/admin/notice/list" id="viewAll">전체보기</a>
		<div class="search-keyword">
			<select id="searchType">
				<option>- - - - - - - -  TYPE  - - - - - - - -</option>
				<option value="t" ${cri.searchType == 't'? 'selected': ''}>Title</option>
				<option value="c" ${cri.searchType == 'c'? 'selected': ''}>Content</option>  
				<option value="tc" ${cri.searchType == 'tc'? 'selected': ''}>Title or Content</option>
			</select>
			<input type="text" id="keyword" value="${cri.keyword}">
			<button id="btnSearch"></button>
		</div>
	</div>  
	
	<table id="main-tb">
		<caption>
			<a href="${pageContext.request.contextPath}/admin/notice/regist">등록</a>
		</caption>
	
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>DATE</th>
		</tr>
		<c:forEach var="nt" items="${list}">
			<tr class="added-tr ${nt.ntSort == 1? 'ntTop-tr': ''}">
				<td>${nt.ntSort == 1? '<span></span>': nt.ntNo}</td>
				<td class="list-title"><a href="${pageContext.request.contextPath}/admin/notice/read?ntNo=${nt.ntNo}&page=${pageMaker.cri.page}">${nt.ntTitle}</a></td>
				<td>관리자</td>
				<td><fmt:formatDate value="${nt.ntRegDate}" pattern="yyyy-MM-dd HH:mm"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="paging-wrap">
		<ul class="pagination">
			<c:if test="${pageMaker.prev == true}">
				<li class="prev-li">
					<a href="${pageContext.request.contextPath}/admin/notice/list?page=${pageMaker.startPage}&searchType=${cri.searchType}&keyword=${cri.keyword}">
						◀
					</a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li ${idx == pageMaker.cri.page? 'class=active': ''}>
					<a href="${pageContext.request.contextPath}/admin/notice/list?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">
						${idx}
					</a>									
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next == true}">
				<li class="next-li">
					<a href="${pageContext.request.contextPath}/admin/notice/list?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&keyword=${cri.keyword}">
						▶
					</a>
				</li>
			</c:if>
		</ul>
		<p>${pageMaker.cri.page} / ${pageMaker.totalPager} <small>페이지</small></p>
	</div>
	
	
</div>	


<script src="${pageContext.request.contextPath}/resources/js/getSearchList.js"></script>
<!-- HandleBars -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#list}}
<tr class="added-tr">
	<td>{{ntNo}}</td>
	<td class="list-title"><a href="${pageContext.request.contextPath}/admin/notice/read?ntNo={{ntNo}}">{{ntTitle}}</a></td>
	<td>관리자</td>
	<td>{{pDateTime ntRegDate}}</td>
</tr>
{{/list}}
</script>	<!-- &page={{pageMaker.cri.page}} -->

<script>	
	//키워드 검색에 따라 리스트 뿌리기
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
<%@ include file="../include/footer.jsp" %>

