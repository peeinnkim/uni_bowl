<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>NOTICE</h1>
</div>

<div class="content-area">
	<div class="search-wrap">
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
	
	<table id="main-tb">
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>DATE</th>
		</tr>
		<c:forEach var="nt" items="${list}">
			<tr class="added-tr ${nt.ntSort == 1? 'ntTop-tr': ''}">
				<td>${nt.ntSort == 1? '<span></span>': nt.ntNo}</td>
				<td class="list-title"><a href="${pageContext.request.contextPath}/user/notice/read?ntNo=${nt.ntNo}&page=${pageMaker.cri.page}">${nt.ntTitle}</a></td>
				<td>관리자</td>
				<td><fmt:formatDate value="${nt.ntRegDate}" pattern="yyyy-MM-dd HH:mm"/></td>
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
	<td>{{ntViewCnt}}</td>
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
		
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/notice/searchList",
			type: "post",
			data: data,
			dataType: "json",
			success: function(res){
				console.log(res);
				
				$(".added-tr").remove();
				
				var source = $("#template").html();
				var func = Handlebars.compile(source);
				var str = func(res);
				
				//댓글 리스트 가져오기
				$("#main-tb").append(str);
				
				//페이지네이션 지우기
				$(".pagination").empty();
				
				//make a page-maker
				var startPage = res.pageMaker.startPage;
				var endPage = res.pageMaker.endPage;
				
				for(var i=startPage; i<=endPage; i++) {
					var $li = $("<li>");
					var $a = $("<a>").attr("href", "#").attr("data-page", i).append(i);
					$li.append($a);
					
					if(i == nPage) {
						$li.addClass("on");
					}
					
					$(".pagination").append($li);
				}
				
				if(res.pageMaker.prev == true) {
					var $li = $("<li>").addClass("previous");
					var $a = $("<a>").attr("href", "#").attr("data-page", res.pageMaker.startPage-1).append("◀");
					$li.append($a);
					$(".pagination").prepend($li);
				}
				
				if(res.pageMaker.next == true) {
					var $li = $("<li>").addClass("next");
					var $a = $("<a>").attr("href", "#").attr("data-page", res.pageMaker.endPage+1).append("▶");
					$li.append($a);
					$(".pagination").append($li);
				}
			},
			error : function(e){
				console.log(e);
			}
		})
	})
</script>
<%@ include file="../../include/footer.jsp" %>

