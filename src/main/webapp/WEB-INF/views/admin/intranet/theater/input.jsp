<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<style>
table{
	border-collapse: collapse;
}
td {
	border: 1px solid black;
}
#tb-wrap {
	overflow:hidden;
}
.row-ul {
	width: 100%;
	margin: 10px auto;
	clear: both;
}
.row-ul > li {
	width: 20px;
	height: 20px;
	float: left;
	text-align: center;
	border: 1px solid black;
	border-radius: 50px 50px 50px 50px;
	margin: 5px;
}
</style>

<h2>상영관 추가</h2>
<div class="content-wrap">
	<div class="cont-center">
		<div id="set-wrap">
			<table>
				<tr>
					<td>상영관명</td>
					<td><input type="text"></td>
					<td>수용인원</td>
					<td><input type="text" id="capacity"></td>
					<td rowspan="2"><button>dfsd</button></td>
				</tr>
				<tr>
					<td>전체좌석<br>(복도포함)</td>
					<td colspan="3"><input type="text" id="rows"> X <input type="text" id="cols"></td>
				</tr>
			</table>
		</div>
		
		<div id="tb-wrap"></div>
		
	</div>
</div>

<script>
	$("button").click(function(){
		$("#tb-wrap").empty();
		var rows = $("#rows").val(); //ul
		var cols = $("#cols").val(); //li
		var capa = $("#capacity").val();
		
		if((rows * cols) < capa) {
			alert("좌석은 수용인원과 같거나 많아야합니다.");
			return;
		}
		
		var code_saver = "";
		var idx;
		
		for(var i=0; i<rows; i++) {
			idx = 0;
			code_saver += "<ul class='row-ul'>";
			for(var j=0; j<cols; j++) {
				code_saver += "<li><a>"+(++idx)+"</a></li>";
			}
			code_saver += "</ul>";
		}
		
		$("#tb-wrap").html(code_saver);
		
		
	})
</script>

<%@ include file="../../include/footer.jsp" %>

