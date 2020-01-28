<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<h2>매출 관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<div class="intra-sales-chart">
			<h1 style="text-align:center;"><span id="yr">2020</span>년도 매출현황</h1>
			<div>
				<select id="year-sel">
					<option>2020</option>
					<option>2019</option>
					<option>2018</option>
				</select>	
			</div>
			
			<div id="chart"></div>
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script type="text/javascript">
	getChart();
	$("#year-sel").change(function(){
		$("#yr").text($(this).val());
		$("#chart").empty();
		getChart();
	})

	function getChart() {
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/gnr/payChart",
			type: "post",
			data: {"year": $("#year-sel").val()},
			dataType: "json",
			success: function(res){
				console.log(res);
				
				if(res.result == "success") {
					
					if(res.list.length == 0) {
						alert("데이터가 존재하지 않습니다.");
						$("#year-sel > option:eq(0)").prop("selected", true);
						$("#yr").text($("#year-sel > option:eq(0)").val());
						getChart();
						return;
					}
					
					var data = [];
					for(var i=0; i<12; i++) {
						if(res.list[i] == null) {
							data.push(0);
						} else {
							data.push(res.list[i]);
						}
					}
					
					var options = {
							  series: [{
							  name: 'SALES',
							  data: data
							}],
							
							  chart: {
							  height: 350,
							  type: 'bar',
							},
							
							plotOptions: {
							  bar: {
							    dataLabels: {
							      position: 'top', // top, center, bottom
							    },
							  }
							},
							
							dataLabels: {
							  enabled: true,
							  formatter: function (val) {
							    return val + "KRW";
							  },
							  offsetY: -20,
							  style: {
							    fontSize: '12px',
							    colors: ["#5271C4"]
							  }
							},
	
							xaxis: {
							  categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
							  position: 'top',
							  labels: {
							    offsetY: -18,
	
							  },
							  
							  axisBorder: {
							    show: false
							  },
							  
							  axisTicks: {
							    show: false
							  },
							  
							  crosshairs: {
							    fill: {
							      type: 'gradient',
							      gradient: {
							        colorFrom: '#a8c8ff',
							        colorTo: '#ffbaec',
							        stops: [0, 100],
							        opacityFrom: 0.4,
							        opacityTo: 0.5,
							      }
							    }
							  },
							  tooltip: {
							    enabled: true,
							    offsetY: -35,
							  }
							},
							
							fill: {
							  gradient: {
							    shade: 'light',
							    type: "horizontal",
							    shadeIntensity: 0.25,
							    gradientToColors: undefined,
							    inverseColors: true,
							    opacityFrom: 1,
							    opacityTo: 1,
							    stops: [50, 0, 100, 100]
							  },
							},
							
							yaxis: {
							  axisBorder: {
							    show: false
							  },
							  axisTicks: {
							    show: false,
							  },
							  labels: {
							    show: false,
							    formatter: function (val) {
							      return val + "KRW";
							    }
							  }
	
							},
							
							title: {
							  text: 'MONTHLY SALES CHARTS',
							  floating: true,
							  offsetY: 320,
							  align: 'center',
							  style: {
							    color: '#444'
							  }
							}
							
							};
	
							var chart = new ApexCharts(document.querySelector("#chart"), options);
							chart.render();
					
				}
				
			},
			error: function(e){
				console.log(e);
			}
		})
	}
	
</script>



<%@ include file="../include/footer.jsp" %>

