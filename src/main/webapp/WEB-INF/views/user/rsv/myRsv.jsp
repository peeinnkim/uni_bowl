<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

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
<!-- 		<div class="search-date">
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
		</div> -->
		
		<div class="search-category">
			<select>
				<option value="-1">예약전체</option>
				<option value="0">결제완료</option>
				<option value="1">취소</option>
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
			<tr class="added-tr ${rl.rlRsvState == 0? '': 'cancelTr'}" >
				<td>${rl.rlRsvNo}</td>
				<td class="list-title">
					<c:if test="${rl.rlRsvState == 0}">
						<a href="${pageContext.request.contextPath}/user/rsv/rsvDetail?rsvNo=${rl.rlRsvNo}">${rl.rlPgTitle}</a>
					</c:if>
					<c:if test="${rl.rlRsvState == 1}">
						${rl.rlPgTitle}
					</c:if>
				</td>
				<td>
					<c:set var="h" value="${fn:split(rl.rlRsvStime, ':')}"/>
					<fmt:formatDate value="${rl.rlOrgDate}" pattern="yyyy-MM-dd"/> ${h[0]}:${h[1]}
				</td>
				<td>${rl.rlThNm} 관</td>
				<td><fmt:formatNumber value="${rl.rlRsvPrice}" pattern="###,###"/> 원</td>
				<td><fmt:formatDate value="${rl.rlRsvDate}" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${rl.rlRsvState == 0? '결제완료': '취소'}</td>
				<td>
					<c:if test="${rl.rlRsvState == 0}">
						<a href="${pageContext.request.contextPath}/user/rsv/cancelRsv?rsvNo=${rl.rlRsvNo}" class="cancelRsvBtn"></a>
					</c:if>
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


<!-- SCRIPT -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="template0" type="text/x-handlebars-template">
	{{#list}}
		<tr class="added-tr" >
			<td>{{rlRsvNo}}</td>
			<td class="list-title">
				<a href="${pageContext.request.contextPath}/user/rsv/rsvDetail?rsvNo={{rlRsvNo}}">{{rlPgTitle}}</a>
			</td>
			<td>{{pDateT1me rlRsvDate}}{{pDateT1m3 rlRsvStime}}</td>
			<td>{{rlThNm}} 관</td>
			<td>{{mon rlRsvPrice}} 원</td>
			<td>{{pDateTime rlRsvDate}}</td>
			<td>결제완료</td>
			<td>
				<a href="${pageContext.request.contextPath}/user/rsv/cancelRsv?rsvNo={{rlRsvNo}}" class="cancelRsvBtn"></a>
			</td>
		</tr>
	{{/list}}
</script>
<script id="template1" type="text/x-handlebars-template">
	{{#list}}
		<tr class="added-tr cancelTr" >
			<td>{{rlRsvNo}}</td>
			<td class="list-title">
				{{rlPgTitle}}
			</td>
			<td>
				{{pDateT1me rlRsvDate}}{{pDateT1m3 rlRsvStime}}
			</td>
			<td>{{rlThNm}} 관</td>
			<td>{{mon rlRsvPrice}} 원</td>
			<td>{{pDateTime rlRsvDate}}</td>
			<td>취소</td>
			<td></td>
		</tr>
	{{/list}}
</script>

<script>
var nPage = 1;
	$(".cancelTr").click(function(){
		return false;		
	})

	$(".cancelRsvBtn").click(function(){
		var result = confirm("예약을 취소하시겠습니까?");
		
		if(result == false) { return false; }
	})
	
	$(".search-category > select").change(function(){
		var state = $(this).val();
		var data = {
				"state" : state , 
				"searchType" : null, 
				"keyword" : null, 
				"page" : 1, 
				"perPageNum" : 10
		};
		getListPage(data, state);
		
	})

	
		//동적 추가되는 테이블 날짜
	Handlebars.registerHelper("pDate", function(dd){
		if(dd == null) {
			return "-";
		}
		
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var d = date.getDate();
		
		return year + "-" + zeroZeroDate(month) + "-" + zeroZeroDate(d);
	})
	
	//동적 추가되는 테이블 날짜 & 시간
 	Handlebars.registerHelper("pDateTime", function(dd){
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var d = date.getDate();
		var h = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();
		
		return year + "-" + zeroZeroDate(month) + "-" + zeroZeroDate(d) + " " + zeroZeroDate(h) + ":" + zeroZeroDate(min);
	}) 

	Handlebars.registerHelper("pDateT1me", function(dd){
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var d = date.getDate();
		
		return year + "-" + zeroZeroDate(month) + "-" + zeroZeroDate(d);
	}) 

	Handlebars.registerHelper("pDateT1m3", function(dd){
		var hArr = dd.split(":");
		
		return " " + zeroZeroDate(hArr[0]) + ":" + zeroZeroDate(hArr[1]);
	}) 
                      
	//동적 추가되는 돈
 	Handlebars.registerHelper("mon", function(dd){
		return addComma(dd);
	}) 
	
	//페이지 누르면 페이지 정보 바뀌기
	$(document).on("click", $(".pagination > li"), function(){
		nPage = $(this).attr("data-page");
	})

	
		//콤마찍는 메소드
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}	
//10보다 작은애들 0 붙이기
function zeroZeroDate(val){
	if(val < 10) {
		val = "0" + val;
	}
	return val;
}
	
//리스트 뿌리기 최종판
function getListPage(data, state){
	$.ajax({
		url: "searchList",
		type: "post",
		data: data,
		dataType: "json",
		success: function(res){
			console.log(res);
			
			$(".added-tr").remove();

			if(state == 0) {
				var source = $("#template0").html();
				var func = Handlebars.compile(source);
				var str = func(res);
			} else if(state == 1) {
				var source = $("#template1").html();
				var func = Handlebars.compile(source);
				var str = func(res);
			}
			
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
}
	
	
	
</script>

<%@ include file="../../include/footer.jsp" %>