<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
	#piechart rect { fill: #eee; }
</style>

<h2>문의 관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<div id="piechart" style="width: 100%; height: 600px;"></div>
	</div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	$.ajax({
		url: "getReqData",
		type: "post",
		dataType: "json",
		success: function(res){
			console.log(res);
	
			if(res.result == "success") {
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				
				function drawChart() {
					var data = google.visualization.arrayToDataTable([
							['문의유형', '건 수'],
							['예약문의', res.list[0]],
							['시설문의', res.list[1]],
							['기타문의', res.list[2]],
							['제안하기', res.list[3]],
						]);
					var options = {
							title: '문의게시판 유형별 분류(단위: 건)'
					};
					var chart = new google.visualization.PieChart(document.getElementById('piechart'));
					chart.draw(data, options);
				}//drawChart 
			}
		},
		error: function(e){
			console.log(e);
		}
	});//ajax
</script>


<%@ include file="../include/footer.jsp" %>