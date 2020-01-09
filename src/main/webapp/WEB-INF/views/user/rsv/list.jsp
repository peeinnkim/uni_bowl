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
.list-title {
	width: 43%;
}
.cancelRsvBtn {
	width: 45px;
	height: 20px;
	padding: 5px;
    display: block;
    margin: 0 auto;
    cursor: pointer;
    background: pink;
    font-size: 14px;
    border-radius: 5px 5px;
    box-shadow: 0px 1px 2px grey;
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
		<tr>
			<th>예약번호</th>
			<th>프로그램명</th>
			<th>상영날짜</th>
			<th>상영관</th>
			<th>예약상태</th>
			<th>프린트</th>
			<th></th>
		</tr>
		<tr class="added-tr">
			<td>1234</td>
			<td class="list-title"><a href="#">어쩌구저쩌구 이런 프로그램</a></td>
			<td>2020-01-03 14:30</td>
			<td>어쩌구관</td>
			<td>결제완료</td>
			<td>○</td>
			<td><a href="#" class="cancelRsvBtn">취소</a></td>
		</tr>
		<tr class="added-tr">
			<td colspan="4"></td>
			<td colspan="3" class="pay-info">
				[결젱봉조]<br>
				결제번호: 12341234<br>
				결제일: 2020-01-01 09:23<br>
				결제카드: SHINHAN 1234-****-****-1234
			</td>
		</tr>
		
<%-- 		<c:forEach var="qna" items="${list}">
			<tr>
				<td>${qna.qnaNo}</td>
				<td class="qna-title"><a href="${pageContext.request.contextPath}/user/qna/read?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></td>
				<td>${qna.qnaWriterId}</td>
				<td><fmt:formatDate value="${qna.qnaRegDate}" pattern="yyyy-MM-dd"/></td>
				<td>${qna.qnaViewCnt}</td>
			</tr>
		</c:forEach> --%>
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

<%@ include file="../../include/footer.jsp" %>