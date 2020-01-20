<%@page import="java.util.Date"%>
<%@page import="com.peeinn.domain.org.OrgResultVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/calendarView.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>

<h2>상영스케쥴 관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<div class="cal-wrap">
			<div class="title-wrap">
				<span id="prevBtn"></span>
				<div id="cal-title"></div>
				<span id="nextBtn"></span>
			</div>
			
			<table id="cal-table"></table>
			
			<div class="sel-wrap">
				<label>상영관 선택</label>
				<select id="sel-th">
					<c:forEach var="selTh" items="${thList}">
						<option value="${selTh.thNo}">${selTh.thNm}관</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="list-wrap">
			<h3>시간표</h3>
			<ul class="main-list"></ul>
		</div>
		
		<div class="input-wrap">
			<h3>상영 스케쥴 등록</h3>
			<span class="addBtn"></span>
			<div class="input-form">
				<input type="hidden" id="ipOrgNo" value="0">
				<p>
					<label>상영관</label>
					<input type="text" id="selectedTh" readonly="readonly">
				</p>
				<p>
					<label>날짜</label>
					<fmt:formatDate var="tday" value="<%=new Date() %>" pattern="yyyy-MM-dd"/>
					<input type="text" id="tempDate" value="${tday}" readonly="readonly">
				</p>
				<p>
					<label>상영 시간</label>
					<select id="ipHour">
						<c:forEach var="h" begin="11" end="21">
							<option>${h}</option>
						</c:forEach>
					</select>
					<select id="ipMinute">
							<option>00</option>
						<c:forEach var="m" begin="10" end="60" step="10">
							<option>${m}</option>
						</c:forEach>
					</select>
					<input type="hidden" name="tempStartTime" value="11:00">
					<input type="hidden" name="tempEndTime">
				</p>
				<p>
					<label>프로그램</label>
					<button id="btnChoicePg" type="button">선택</button>
					<span id="pgList">버튼을 눌러 프로그램을 선택하세요</span>
				</p>
				<p class="input-btn-area">
					<input type="button" id="btnSubmit" value="REGIST">
					<input type="button" id="btnCancel" value="CANCEL">
				</p>
			</div>
		</div>
		
		
	</div>
</div>


<!-- HandleBars -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#each.}}
<li>
	<div class="list-time">
		<span class="sTime">{{pTime org.orgStime}}</span>
		<span class="eTime">~ {{pTime org.orgEtime}}</span>
	</div>
	<div class="list-title" data-no="{{org.orgNo}}">
		<span data-pNo="{{pg.pgNo}}" data-rTime="{{pg.pgTime}}">{{pg.pgTitle}}</span>
	</div>
	<a href="${pageContext.request.contextPath}/admin/intranet/org/remove?orgNo={{org.orgNo}}" class="delX"></a>
</li>
{{/each}}
</script>

<script>
	listByDate($("#tempDate").val());
	$("#selectedTh").val($("#sel-th option:selected").text());

	Handlebars.registerHelper("pTime", function(dd){
		var time = dd.split(":");
		
		return zeroZeroDate(time[0]) + ":" + time[1];
	})
	
	/* 상영관 선택 */
	$("#sel-th").change(function(){
		var sDate = $(".tOn").attr("data-date");
		var thNm = $("#sel-th option:selected").text();
		
		$("#selectedTh").val(thNm);
		listByDate(sDate);
	})
	
	/* 시간입력(시) */
	$("#ipHour").change(function(){
		changeTime();
	})
	
	/* 시간입력(분) */
	$("#ipMinute").change(function(){
		changeTime();
	})
	
	function changeTime(){
		var hour = $("#ipHour").val();
		var minute = $("#ipMinute").val();
		
		$("input[name='tempStartTime']").val(hour + ":" + minute);
	}

	/* 삭제버튼 */
	$(document).on("click", ".delX", function(){
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result == true) {
			return true;
		} else {
			return false;
		}
	})
	
	/* 프로그램 선택창 띄우기 */
	$("#btnChoicePg").click(function(){
		window.open("${pageContext.request.contextPath}/admin/intranet/program/pgChoice", 
					"프로그램 선택", 
					"width=450, height=500, left=600, top=200"); 
	})
	
	/* 새 창에서 보낸 값 받기 */
	function getReturnValue(returnValue) {
		$("#pgList").text("");
		$("#pgList").append(returnValue);
	}

	/* 새 창에서 받아온 러닝타임 값으로 끝나는 시간 계산하기 */
	function getEndTime(){
		var startTime = $("input[name='tempStartTime']").val().split(":");
		var runningTime = $("#rtrt").attr("data-rt");
		
		var min = Number(startTime[1])+Number(runningTime);
		var h = startTime[0];
		
		if(min >= 60) {
			var aNum = Math.floor(min/60);
			var aMin = Math.floor(min%60);
			
			h = Number(startTime[0]) + Number(aNum);
			min = aMin;
		}
		
		$("input[name='tempEndTime']").val(h+":"+min);
	}
	
	/* 취소버튼 */
	$("#btnCancel").click(function(){
		var tday = $(".tOn").attr("data-date");
		$("#tempDate").val(tday);
		$("#ipHour").val("11");
		$("#ipMinute").val("00");
		$("input[name='tempStartTime']").val("11:00");
		$("input[name='tempEndTime']").val("");
		$("#pgList").text("버튼을 눌러 프로그램을 선택하세요");
	})

	
	/* 등록버튼 */
	$("#btnSubmit").click(function(){
		if($("#pgList").text() == "버튼을 눌러 프로그램을 선택하세요") {
			alert("프로그램을 선택하세요");
			return false;
		}
		getEndTime();
		
		var action;
		var orgNo = $("#ipOrgNo").val();
		if(orgNo == "0") {
			action = "regist";
		} else {
			action = "modify";
		}
		
		var tempDate = $("#tempDate").val() + " 00:00:00"; 
		var sTime = $("input[name='tempStartTime']").val();
		var eTime = $("input[name='tempEndTime']").val();
		var orgThNo = $("#sel-th").val();
		var orgPgNo = $("input[name='orgPgNo']").val();
		
		var data = {
				orgNo: orgNo,
				orgDate: tempDate,
				orgStime: sTime,
				orgEtime: eTime,
				orgThNo: orgThNo,
				orgPgNo: orgPgNo
		};
		
		$.ajax({
			url: action,
			type: "post",
			data: JSON.stringify(data),
			headers: {"Content-Type":"application/json"},
			dataType: "text",
			success: function(res){
				console.log(res);
			
				if(res == "success") {
					if(action == "regist"){
						alert("등록되었습니다.");
					} else if(action == "modify") {
						alert("수정되었습니다.");
					}
				}
				
				listByDate(tempDate);
				$("#btnCancel").click();
				$(".input-wrap > h3").text("상영 스케쥴 등록");
				$("#ipOrgNo").val("0");
				$("#btnSubmit").val("REGIST");
			},
			error: function(e){
				console.log(e);
			}
		})
	})

	/* 플러스 클릭시 입력모드로 */
	$(".addBtn").click(function(){
		var result = confirm("현재 입력한 정보는 저장되지 않습니다. 등록모드로 전환하시겠습니까?");
		
		if(result == true) {
			$(".btnCancel").click();
			$(".input-wrap > h3").text("상영 스케쥴 등록");
			$("#ipOrgNo").val("0");
			$("#btnSubmit").val("REGIST");
		}
	})
	
	/* 제목 클릭시 수정모드로 */
	$(document).on("click", ".list-title", function(){
		var title = $(this).closest("li").find(".list-title").children().text();
		var pgNo = $(this).children().attr("data-pNo");
		var rTime = $(this).children().attr("data-rTime");
		var str = "<input type='hidden' name='orgPgNo' value='"+pgNo+"'>"
		+ "<span id='rtrt' data-rt='"+rTime+"'>"+title+"</span>";

		//제목넣기
		$("#pgList").empty();
		$("#pgList").html(str);
		
		//시간넣기
		var sTime = $(this).closest("li").find(".sTime").text().split(":");
		$("#ipHour").val(sTime[0]);
		$("#ipMinute").val(sTime[1]);

		//수정모드 전환
		var orgNo = $(this).attr("data-no");
		$("#ipOrgNo").val(orgNo);
		$(".input-wrap > h3").text("상영 스케쥴 수정");
		$("#btnSubmit").val("MODIFY");
		
	})
	
	
</script>

<%@ include file="../../include/footer.jsp" %>

