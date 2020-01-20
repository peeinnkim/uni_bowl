<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/program.css" type="text/css" rel="stylesheet">
<style>
	.cont-center {
		width: 50% !important;
	}
	#state-sel {
		float: none;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>

<h2>상영 스케쥴 관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<form id="frm" ${ores.org.orgNo == null? 'action="regist"': 'action="modify"'} method="post">
			<p>
				<label>날짜</label>
				<fmt:formatDate var="calDate" value="${ores.org.orgDate == null? aTempDate.org.orgDate : ores.org.orgDate}" pattern="yyyy-MM-dd"/>
				<input type="text" id="tempDate"  value="${calDate}">
				<input type="text" name="strDate" value="${calDate} 10:00">
			</p>
			<p>
				<label>상영관 선택</label>
				<select name="orgThNo">
					<c:forEach var="th" items="${list}">
						<option value="${th.thNo}">${th.thNm}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>상영 시간</label>
				<input type="number" id="ipHour" value="10" min="10" max="22" maxlength="2">
				<input type="number" id="ipMinute" min="0" max="60" step="10" value="00" maxlength="2">
				<input type="text" name="tempStartTime" value="11:00">
				<input type="text" name="tempEndTime" value="00:00">
			</p>
			<p>
				<label>프로그램 선택</label>
				<span id="pgList" style="display:inline-block;"></span><button id="btnChoicePg" type="button">선택</button>
			</p>
			<p>
				<input type="submit" ${ores.orNo == null? 'value="REGIST"': 'value="MODIFY"'}>
				<input type="reset" value="CANCEL">
			</p>
		</form>
	</div>
</div>

<script>
	/* 시간입력(시) */
	$("#ipHour").change(function(){
		var hour = $("#ipHour").val();
		var minute = $("#ipMinute").val();
		
		$("input[name='tempStartTime']").val(hour + ":" + minute);
	})

	/* 시간입력(분) */
	$("#ipMinute").change(function(){
		var hour = $("#ipHour").val();
		var minute = $("#ipMinute").val();
		
		if(minute == 60) {
			hour++;
			minute = "00";
			$("#ipHour").val(hour);
			$("#ipMinute").val(minute);
		}
		
		$("input[name='tempStartTime']").val(hour + ":" + minute);
	})
	/* 프로그램 선택창 띄우기 */
	$("#btnChoicePg").click(function(){
		window.open("${pageContext.request.contextPath}/admin/intranet/program/pgChoice", 
					"프로그램 선택", 
					"width=480, height=520, left=600, top=200"); 
	})
	                  
	/* 새 창에서 보낸 값 받기 */
	function getReturnValue(returnValue) {
		$("#pgList").text("");
		$("#pgList").append(returnValue);
	}

	$("form").submit(function(){
		var dt = $("#tempDate").val();
		var tm = $("input[name='tempStartTime']").val();
		
		$("input[name='strDate']").val(dt + " " + tm + ":00");
	})
	
	/* 새 창에서 받아온 러닝타임 값으로 끝나는 시간 계산하기 */
	function getEndTime(){
		var startTime = $("input[name='tempStartTime']").val().split(":");
		var runningTime = $("#rtrt").attr("data-rt");
		var rntne = runningTime.replace("분", ""); 
		
		var min = Number(startTime[1])+Number(rntne);
		var h = startTime[0];
		
		if(min >= 60) {
			var aNum = Math.floor(min/60);
			var aMin = Math.floor(min%60);
			
			h = Number(startTime[0]) + Number(aNum);
			min = aMin;
		}
		
		$("input[name='orEndTime']").val(h+":"+min);
	}
	
</script>


<%@ include file="../../include/footer.jsp" %>

