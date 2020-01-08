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
			<a href="${pageContext.request.contextPath}/admin/notice/regist">등록</a>
		</div>
		
		<div class="search-keyword">
			<select id="searchType">
				<option>- - - - - - - -  All  - - - - - - - -</option>
				<option value="t" ${cri.searchType == 't'? 'selected': ''}>Title</option>
				<option value="c" ${cri.searchType == 'c'? 'selected': ''}>Content</option>  
				<option value="tc" ${cri.searchType == 'tc'? 'selected': ''}>Title or Content</option>
			</select>
			<input type="text" id="keyword" value="${cri.keyword}">
			<button id="btnSearch"></button>
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
		<c:forEach var="nt" items="${list}">
			<tr>
				<td>${nt.ntNo}</td>
				<td class="list-title"><a href="${pageContext.request.contextPath}/admin/notice/read?ntNo=${nt.ntNo}&page=${pageMaker.cri.page}">${nt.ntTitle}</a></td>
				<td>관리자</td>
				<td><fmt:formatDate value="${nt.ntRegDate}" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${nt.ntViewCnt}</td>
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
	
	
</div>	

<script>
	$("#btnSearch").click(function(){
		var sType = $("#searchType").val();
		var sKey = $("#keyword").val();
		
		location.href = "list?searchType=" + sType + "&keyword=" + sKey;
		
	})
</script>

<%@ include file="../../include/footer.jsp" %>

