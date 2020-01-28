<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/program.css" type="text/css" rel="stylesheet">
<style>
	.cont-center > div:first-child {
		width: 90%;
		margin: 0 auto;
		overflow: hidden;
	}
	.cont-center > div:first-child > ul {
		float: left;
	}	
	.cont-center > div:first-child > ul > li {
	    float: left;
	    width: 80px;
	    height: 28px;
	    border-bottom: none;
	    letter-spacing: 0.05em;
	    text-align: center;
	    border-radius: 10px 10px 0 0;
	    margin-right: 1px;
	    padding: 5px;
	}
	.cont-center > div:first-child > ul > li > a {
	    font-size: 14px;
	    display: block;
	    line-height: 28px;
	    font-weight: bold;
	}
	.on {
		background: #5271C4;
	}
	.on > a {
		color: #eee;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/getSearchList.js"></script>

<h2>회원관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<div>
			<input type="hidden" value="${cri.code}" id="codee">
			<ul id="mem-sel">
				<li><a href="${pageContext.request.contextPath}/admin/gnr/member?code=0">회원</a></li>
				<%-- <li><a href="${pageContext.request.contextPath}/admin/gnr/member?code=1">비회원</a></li> --%>
				<li><a href="${pageContext.request.contextPath}/admin/gnr/member?code=2">관리자</a></li>
			</ul>
			
			<div class="search-keyword">
				<select id="searchType">
					<option value="">검색</option>
					<option value="mNo" ${cri.searchType == 'mNo'? 'selected': ''}>회원번호</option>
					<option value="mId" ${cri.searchType == 'mId'? 'selected': ''}>아이디</option>
					<option value="mNm" ${cri.searchType == 'mNm'? 'selected': ''}>이름</option>
					<option value="mTl" ${cri.searchType == 'mTl'? 'selected': ''}>전화번호</option>
					<option value="mMl" ${cri.searchType == 'mMl'? 'selected': ''}>이메일</option>
				</select>
				
				<input type="text" id="keyword" value="${cri.keyword}">
				<button id="btnSearch"></button>
			</div>
				
			<c:if test="${cri.code != 1}">
				<select id="state-sel">
					<option value="0" selected="selected">전체회원</option>
					<option value="1">탈퇴회원</option>
				</select>
			</c:if>				
		</div>
		
		
		<table id="main-tb">
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>탈퇴일</th>
			</tr>
			
			<c:forEach var="mem" items="${list}">
				<tr class="added-tr ${mem.mQuitDate == null? '': 'cancelTr'}">
					<td>${mem.mNo}</td>
					<td>${mem.mId}</td>
					<td>${mem.mNm}</td>
					<td>${mem.mBirth}</td>
					<td>${mem.mTel}</td>
					<td>${mem.mMail}</td>
					<td>
						<fmt:formatDate value="${mem.mRegDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${mem.mQuitDate != null}">
								<span><fmt:formatDate value="${mem.mQuitDate}" pattern="yyyy-MM-dd"/></span>
							</c:when>
							<c:otherwise>
								- 
							</c:otherwise>
						</c:choose>
					</td>
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
</div>



<!-- HandleBars -->
<script id="template" type="text/x-handlebars-template">
	{{#list}}
	<tr class="added-tr">
		<td>{{mNo}}</td>
		<td>{{mId}}</td>
		<td>{{mNm}}</td>
		<td>{{mBirth}}</td>
		<td>{{mTel}}</td>
		<td>{{mMail}}</td>
		<td>{{prettifyDate mRegDate}}</td>
		<td>{{prettifyDate mQuitDate}}</td>
	</tr>
	{{/list}}
</script>
<script>
	var nPage = 1;
	
	//페이지 누르면 페이지 정보 바뀌기
	$(document).on("click", $(".pagination > li"), function(){
		nPage = $(this).attr("data-page");
	})
	
	//탭에 따라 클래스 바꾸기
	setOnClass();
	function setOnClass(){
		$("#mem-sel > li").removeClass("on");
		switch($("#codee").val()) {
		case "0": $("#mem-sel > li:eq(0)").addClass("on"); break;
		case "2": $("#mem-sel > li:eq(1)").addClass("on"); break;
		}
	}

	//동적 추가되는 테이블 날짜
	Handlebars.registerHelper("prettifyDate", function(dd){
		if(dd == null) {
			return "-";
		}
		
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var d = date.getDate();
		
		return year + "-" + zeroZeroDate(month) + "-" + zeroZeroDate(d);;
	})
	
	function zeroZeroDate(val){
		if(val < 10) {
			val = "0" + val;
		}
		return val;
	}
	
	//변경되는 상태에 따라 리스트 뿌리기
	$("#state-sel").change(function(){
		var data = {"code" : ${cri.code} , 
					"state" : $("#state-sel").val() , 
					"searchType" : $("#searchType").val(), 
					"keyword" : $("#keyword").val(), 
					"page" : 1, 
					"perPageNum" : 10};
		
		getListPage(data);
	}) 
	
	
	//키워드 검색에 따라 리스트 뿌리기
	$("#btnSearch").click(function(){
		var data = {"code" : ${cri.code} , 
				"state" : $("#state-sel").val() , 
				"searchType" : $("#searchType").val(), 
				"keyword" : $("#keyword").val(), 
				"page" : 1, 
				"perPageNum" : 10};
	
		getListPage(data);
	})
	
</script>


<%@ include file="../include/footer.jsp" %>

