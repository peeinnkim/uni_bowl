(function(win, $){
	$(function(){	
		
		 $.ajax({
			 url: "salesMonthlyRoom.do",
			 type:"post",
			 dataType: "json",
			 success: function(res){
				 console.log(res);
				 
				 var salesChartDrow = {
							chartDrow : function() {
								var chartData = '';

								function drawDashboard() {

									var data = new google.visualization.DataTable();
									// 그래프에 표시할 컬럼 추가
									data.addColumn('date', '월');
									data.addColumn('number', '스탠다드');
									data.addColumn('number', '디럭스');
									data.addColumn('number', '테라스');
									data.addColumn('number', '프리미어');
									data.addColumn('number', '프리미어 테라스');
									data.addColumn('number', '퍼시픽 디럭스');
									data.addColumn('number', '로열 스위트');
									data.addColumn('number', '프레지덴셜 스위트');

									// 그래프에 표시할 데이터
									var dataRow = [];
									var mon = [];
									var rm1, rm2, rm3, rm4, rm5, rm6, rm7, rm8 = [];

									for(var i=0; i<12; i++) {
										mon = new Date("2019", i, "01");
										rm1 = res.list[0][i];
										rm2 = res.list[1][i];
										rm3 = res.list[2][i];
										rm4 = res.list[3][i];
										rm5 = res.list[4][i];
										rm6 = res.list[5][i];
										rm7 = res.list[6][i];
										rm8 = res.list[7][i];

										dataRow = [ mon, rm1, rm2, rm3, rm4, rm5, rm6, rm7, rm8 ];
										data.addRow(dataRow);
									}
									
									var chart = new google.visualization.ChartWrapper({
										chartType : 'ColumnChart',
										containerId : 'sales-chart', // 라인 차트 생성할 영역
										options : {
											focusTarget : 'category',
											height : 500,
											width : '100%',
											legend : {
												position : "top",
												textStyle : {
													fontSize : 13
												}
											},
											pointSize : 5,
											tooltip : {
												textStyle : {
													fontSize : 12
												},
												showColorCode : true,
												trigger : 'both'
											},
											hAxis : {
												format : "yyyy년 MM월 dd일",
												gridlines : {
													count : 12,
													units : {
														years : {
															format : [ 'yyyy년' ]
														},
														months : {
															format : [ 'MM월' ]
														},
														days : {
															format : [ 'dd일' ]
														},
														hours : {
															format : [ 'HH시' ]
														}
													}
												},
												textStyle : {
													fontSize : 12
												}
											},
											vAxis : {
												minValue : 100,
												viewWindow : {
													min : 0
												},
												gridlines : {
													count : -1
												},
												textStyle : {
													fontSize : 12
												}
											},
											animation : {
												startup : true,
												duration : 1000,
												easing : 'in'
											},
											annotations : {
												pattern : "yyyy년 MM월 dd일",
												textStyle : {
													fontSize : 15,
													bold : true,
													italic : true,
													color : '#871b47',
													auraColor : '#d799ae',
													opacity : 0.8,
													pattern : "yyyy년 MM월"
												}
											}
										}
									});

									var control = new google.visualization.ControlWrapper({
										controlType : 'ChartRangeFilter',
										containerId : 'sales-chart-control', // control bar를
																				// 생성할 영역
										options : {
											ui : {
												chartType : 'ColumnChart',
												chartOptions : {
													chartArea : {
														'width' : '60%',
														'height' : 80
													},
													hAxis : {
														'baselineColor' : 'none',
														format : "yyyy년 MM월 dd일",
														textStyle : {
															fontSize : 12
														},
														gridlines : {
															count : 12,
															units : {
																years : {
																	format : [ 'yyyy년' ]
																},
																months : {
																	format : [ 'MM월' ]
																},
																days : {
																	format : [ 'dd일' ]
																},
																hours : {
																	format : [ 'HH시' ]
																}
															}
														}
													}
												}
											},
											filterColumnIndex : 0
										}
									});

									var date_formatter = new google.visualization.DateFormat({
										pattern : "yyyy년 MM월 dd일"
									});
									date_formatter.format(data, 0);

									var dashboard = new google.visualization.Dashboard(document
											.getElementById('sales-chart-control'));

									window.addEventListener('resize', function() {
										dashboard.draw(data);
									}, false); // 화면 크기에 따라 그래프 크기 변경
									dashboard.bind([ control ], [ chart ]);
									dashboard.draw(data);

								}
								google.charts.setOnLoadCallback(drawDashboard);

							}
						}
				 
					google.charts.load('current', {
						'packages' : [ 'bar', 'controls' ]
					});
				 	salesChartDrow.chartDrow();
				 
			 	}//success
						
			 });//ajax
		
		
			
		
		
	})
})(window, jQuery);
