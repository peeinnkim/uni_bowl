<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/util/datepicker.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">

<style>
.search-wrap {
	margin-bottom: 5px;
	overflow: hidden;
}
.search-date {
	float: left;
}
.search-category {
	float: right;
}
.mp-bottom > table td {
	padding: 20px 5px;
	text-align: center;
	border: 1px solid black;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	font-size: 15px;
}
.mp-bottom > table th {
	font-size: 15px;
	padding: 10px 5px;
	text-align: center;
	border-top: 2px solid black;
	border-bottom: 1px dotted grey;
}
.payInfo-wrap {
	border-top: none !important;
}
.list-title {
	width: 35%;
}
.cancelRsvBtn{
	width: 27px;
    height: 27px;
    display: block;
    margin: 0 auto;
    background: url("${pageContext.request.contextPath}/resources/img/icon/cancel.png") no-repeat;
    background-size: contain;
    cursor: pointer;
}
.pay-info {
	text-align: left;
	font-size: 13px;
}
</style>


<div class="section-title">
	<h1>MY RESERVATION</h1>
</div>

<div class="content-area">
	<div class="search-wrap">
		<div class="search-date">
			<select>
				<option>예약날짜</option>
				<option>상영날짜</option>
			</select>
			<input type="text" name="rsvDate" class="datepicker-here" data-position="bottom center" data-date-format="yyyy-mm-dd"
					data-language="en" id="pick_start" placeholder="시작날짜"/>
			<span id="anfruf">　∼　</span>
			<input type="text" name="rsvDate" class="datepicker-here" data-position="bottom center" data-date-format="yyyy-mm-dd"
					data-language="en" id="pick_end"  placeholder="종료날짜"/>
			<button id="btnDateSearch">검색</button>
		</div>
		
		<div class="search-category">
			<select>
				<option>예약전체</option>
				<option value="1">진행중</option>
				<option value="2">종료</option>
				<option value="3">취소</option>
			</select>
		</div>
	</div>
	
	<table id="main-tb">
		<caption>총 <span id="cur-rsvCnt">${fn:length(list)}</span>건</caption>
		<tr>
			<th>예약번호</th>
			<th>프로그램명</th>
			<th>상영날짜</th>
			<th>상영관</th>
			<th>금액</th>
			<th>예약날짜</th>
			<th>예약상태</th>
			<th>예약취소</th>
		</tr>
		<c:forEach var="rl" items="${list}">
			<tr class="added-tr">
				<td>${rl.rlRsvNo}</td>
				<td class="list-title"><a href="${pageContext.request.contextPath}/user/rsv/rsvDetail?rsvNo=${rl.rlRsvNo}">${rl.rlPgTitle}</a></td>
				<td><fmt:formatDate value="${rl.rlOrgDate}" pattern="yyyy-MM-dd"/></td>
				<td>${rl.rlThNm} 관</td>
				<td><fmt:formatNumber value="${rl.rlRsvPrice}" pattern="###,###"/> 원</td>
				<td><fmt:formatDate value="${rl.rlRsvDate}" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${rl.rlRsvState == 0? '결제완료': '취소'}</td>
				<td><a href="${pageContext.request.contextPath}/user/rsv/cancelRsv?rsvNo=${rl.rlRsvNo}" class="cancelRsvBtn"></a></td>
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


<!-- SCRIPT -->
<script src="${pageContext.request.contextPath}/resources/js/util/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util/datepicker.en.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dateSearch.js"></script>

<script>
	$(".cancelRsvBtn").click(function(){
		
	})
</script>

<%@ include file="../../include/footer.jsp" %>