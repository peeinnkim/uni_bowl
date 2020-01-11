<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/theater.css" type="text/css" rel="stylesheet">

<h2>상영관 추가</h2>

<div class="content-wrap">
	<div class="cont-center">
		<form id="set-wrap" action="regist" method="post">
			<table>
				<tr>
					<th>위치</th>
					<td><input type="text" name="thFloor" maxlength="2" class="ipNum"> 층</td>
					<th>수용인원</th>
					<td><input type="text" name="thSeatCnt" maxlength="3" class="ipNum"> 명</td>
					<th rowspan="2">
					<button id="crtStBtn" type="button">좌석생성</button>
					<input type="submit" value="등록">
					</th>
				</tr>
				<tr>
					<th>상영관명</th>
					<td><input type="text" name="thName"></td>
					<th>전체좌석<br>(복도포함)</th>
					<td>
						<input type="text" maxlength="3" id="rows" class="ipNum" placeholder="열"> X 
						<input type="text" maxlength="3" id="cols" class="ipNum" placeholder="행">
					</td>
				</tr>
			</table>
		</form>
		
		<div class="crt-seat-wrap">
			<div class="seat-div">
				<div>
					<dl>
						<dt class="seatEx seat-empty" data-cNm="seat-empty" onclick="getCName(this)"></dt>
						<dd>빈 좌석</dd>
					</dl>
					<dl>
						<dt class="seatEx premiumSingle-empty" data-cNm="premiumSingle-empty" onclick="getCName(this)"></dt>
						<dd>비싼 싱글석</dd>
					</dl>
					<dl>
						<dt class="seatEx premiumDouble-empty" data-cNm="premiumDouble-empty" onclick="getCName(this)"></dt>
						<dd>비싼 더블석</dd>
					</dl>
					<dl>
						<dt class="seatEx seat-none" data-cNm="seat-disabled" onclick="getCName(this)"></dt>
						<dd>좌석이 아닌 곳</dd>
					</dl>
				</div>
			</div>
			
			<div id="show-seat-wrap">
				<ul class="seat-row">
					<li><a class="seat seat-empty"></a></li>
					<li><a class="seat seat-empty"></a></li>
					<li><a class="seat seat-active"></a></li>
					<li><a class="seat seat-active"></a></li>
					<li><a class="seat seat-none"></a></li>
					<li><a class="seat seat-none"></a></li>
					<li><a class="seat seat-disabled"></a></li>
					<li><a class="seat seat-disabled"></a></li>
					<li><a class="seat seat-disabled"></a></li>
					<li><a class="seat seat-disabled"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumSingle-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
					<li><a class="seat premiumDouble-empty"></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>


<script>
	$("#crtStBtn").click(function(){
		$("#show-seat-wrap").empty();
		var rows = $("#rows").val(); //ul
		var cols = $("#cols").val(); //li
		var capa = $("input[name='thSeatCnt']").val();
		
		if((rows * cols) < capa) {
			alert("좌석은 수용인원과 같거나 많아야합니다.");
			return;
		}
		
		var code_saver = "";
		var idx;
		
		for(var i=0; i<rows; i++) {
			idx = 0;
			code_saver += "<ul class='seat-row'>";
			for(var j=0; j<cols; j++) {
				code_saver += "<li><a class='seat seat-empty'></a></li>";
			}
			code_saver += "</ul>";
		}
		
		$("#show-seat-wrap").html(code_saver);
	})
	
	var cDefault = "seat";
	var cName = "seat-empty";
	$(document).on("click", ".seat", function(){
		$(this).removeClass();
		$(this).addClass(cDefault + " " + cName);
	})
	
	function getCName(obj){
		cName = $(obj).attr("data-cNm");
	}
	
</script>

<%@ include file="../../include/footer.jsp" %>

