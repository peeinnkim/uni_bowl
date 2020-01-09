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
		<form id="frm" ${ores.orNo == null? 'action="regist"': 'action="modify"'} method="post" enctype="multipart/form-data">
			<input type="hidden" name="pgNo" value="${ores.orNo == null? '0': ores.orNo}">
			<p>
				<label>상영관 선택</label>
				<select name="orThNo">
					<c:forEach var="th" items="${list}">
						<option value="${th.thNo}">${th.thNm}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>상영 시간</label>
				<input type="number" id="ipHour" value="10" min="10" max="22" maxlength="2">
				<input type="number" id="ipMinute" min="0" max="60" step="10" value="00" maxlength="2">
				<input type="text" name="orStartTime" value="10:00">
				<input type="text" name="orEndTime"><input type="button" value="ㅁㄻㅇㄹ" id="btbtbt">
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
	$("#ipHour").change(function(){
		var hour = $("#ipHour").val();
		var minute = $("#ipMinute").val();
		
		$("input[name='orStartTime']").val(hour + ":" + minute);
	})

	$("#ipMinute").change(function(){
		var hour = $("#ipHour").val();
		var minute = $("#ipMinute").val();
		
		if(minute == 60) {
			hour++;
			minute = "00";
			$("#ipHour").val(hour);
			$("#ipMinute").val(minute);
		}
		
		$("input[name='orStartTime']").val(hour + ":" + minute);
	})
	
	function getStartTime(){
		var hour = $("#ipHour").val();
		var minute = $("#ipMinute").val();
		
		if(hour < 10) {
			hour = "0" + hour;
			$("#ipHour").val(hour);
			
		} else if (minute < 10) {
			minute = "0" + minute;
			$("#ipMinute").val("0" + minute);
		}
	}
	
	$("#btnChoicePg").click(function(){
		window.open("${pageContext.request.contextPath}/admin/intranet/program/pgChoice", 
					"프로그램 선택", 
					"width=400, height=400, left=600, top=200"); 
	})
	
	function getReturnValue(returnValue) {
		$("#pgList").text("");
		$("#pgList").append(returnValue);
	}
	
	$("#btbtbt").click(function(){
		getEndTime();
	})
	
	function getEndTime(){
		var startTime = $("input[name='orStartTime']").val().split(":");
		var runningTime = $("#rtrt").attr("data-rt");
		var rntne = runningTime.replace("분", ""); 
		
		var min = Number(startTime[1])+Number(rntne);
		var h = startTime[0];
		
		if(min >= 60) {
			var aNum = Math.floor(min/60);
			var aMin = min%60;
			
			h = Number(startTime[0]) + Number(aNum);
			min = aMin;
		}
		
		$("input[name='orEndTime']").val(h+":"+min);
	}
</script>


<%@ include file="../../include/footer.jsp" %>

