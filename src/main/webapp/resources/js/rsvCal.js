(function(win, $){
	$(function(){
		
		var clickCnt = 0;
		var pName = $("#pName").val();
		//오늘 날짜
		var today = new Date();
		var dayArr = ["日", "月", "火", "水", "木", "金", "土"];
		
		function cal5days(){
			var calBox = document.getElementsByClassName("date-ul")[0];
			var dateBox = document.getElementsByClassName("date-box")[0];
			
			//연도, 달, 요일 
			var y = today.getFullYear();
			var m = today.getMonth();
			var todayDate = today.getDate();
			var dayIdx = today.getDay();
	
			
			var dataDate = y+"-"+zeroZeroDate(m+1)+"-"+zeroZeroDate(todayDate);
			
			//타이틀 출력
			dateBox.innerHTML = null;
			dateBox.innerHTML = "<span data-date='"+dataDate+"'>"+y+"年 "+zeroZeroDate(m+1)+"月 "+zeroZeroDate(todayDate)+"日<small>("+dayArr[dayIdx]+")</small></span>";
			
			//마지막 날짜 배열
			var lastDayArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			
			//윤년
			if( (y%4 == 0 && y%100 != 0) || y%400 == 0 ){
				lastDayArr[1] = 29;
			}
			
			//마지막 날짜 대입
			var lastDay = lastDayArr[m];
			
			/* 테이블 그리기 */
			var code_saver = "";
			calBox.innerHTML = null;
			
			var idx = todayDate;
			if(idx <= 1) { 
				m--; 
				if(m == 1) {
					if( (y%4 == 0 && y%100 != 0) || y%400 == 0 ){
						lastDayArr[m] = 29;
					}
				}
				idx = lastDayArr[m]+1;
			};
			
			if(dayIdx == 0) { dayIdx = 7; }
			calBox.innerHTML += code_saver + "<li id='datePrev' data-date='"+(y+"-"+zeroZeroDate(m+1)+"-"+zeroZeroDate(idx-1))+"'><input type='hidden' data-dayIdx='"+(dayIdx-1)+"'></li>";	
			
			for(var i=0; i<5; i++) {
				if(dayIdx == 7) { dayIdx = 0; }
				
				if(idx > lastDay) {
					m++;
					lastDay = lastDayArr[m];
					idx = 1;
					dataDate = y+"-"+zeroZeroDate(m+1)+"-"+zeroZeroDate(idx);
					code_saver += "<li data-date='"+dataDate+"'>" + zeroZeroDate(m+1) + "/" + zeroZeroDate(idx++) + "<small data-dayIdx='"+dayIdx+"'>(" + dayArr[dayIdx++] + ")</small></li>"
				} else {
					dataDate = y+"-"+zeroZeroDate(m+1)+"-"+zeroZeroDate(idx);
					if(idx == todayDate) {
						code_saver += "<li data-date='"+dataDate+"' class='dOn'>" + zeroZeroDate(m+1) + "/" + zeroZeroDate(idx++) + "<small data-dayIdx='"+dayIdx+"'>(" + dayArr[dayIdx++] + ")</small></li>"
					} else {
						code_saver += "<li data-date='"+dataDate+"'>" + zeroZeroDate(m+1) + "/" + zeroZeroDate(idx++) + "<small data-dayIdx='"+dayIdx+"'>(" + dayArr[dayIdx++] + ")</small></li>"
					}
				}
			}
			
				if(idx > lastDay) { m++; lastDay = lastDayArr[m]; idx = 1; };
				if(dayIdx == 7) { dayIdx = 0; }
				calBox.innerHTML += code_saver + "<li id='dateNext' data-date='"+(y+"-"+zeroZeroDate(m+1)+"-"+zeroZeroDate(idx))+"'><input type='hidden' data-dayIdx='"+dayIdx+"'></li>";	
		}
		
		cal5days();
		
/*		$(document).on("click", "#datePrev",function(){
			last5Days();
		})

		$(document).on("click", "#dateNext",function(){
			next5Days();
		})*/
		
		function last5Days(){
//			var tSec = new Date();
//			tSec.setHours(00, 00, 00);
//			var wDay = new Date(today.setDate(today.getDate()-5));
//			wDay.setHours(00, 00, 00);
//			
//			if(wDay.getTime() < tSec.getTime()) {
//				today = new Date();
//				return false;
//			} else {
//				cal5days()
//				return true;
//			}
			
			if(--clickCnt < 0) {
				alert("현재 날짜보다 이전 날짜는 예약할 수 없습니다.");
				clickCnt = 0;
				return false;
			}
			
			today.setDate(today.getDate()-5)
			cal5days();
			return true;
		}

		function next5Days(){
			if(++clickCnt == 5) {
				clickCnt = 4;
				alert("현재 날짜로부터 4주 간의 예약만 가능합니다.");
				return false;
			}
			
			today.setDate(today.getDate()+5);
			cal5days();
			return true;
		}
		
		$(document).on("click", ".date-ul > li", function(){
			/* 날짜 선택시 날짜부분 변경 */
			$(".date-ul > li").removeClass("dOn");
			if($(this).attr("id") == "datePrev") {
				if(last5Days() == false) {
					$(".date-ul > li:eq(1)").addClass("dOn");
					return;
				}
				$(".date-ul > li:eq(5)").addClass("dOn");
			} else if($(this).attr("id") == "dateNext") { 
				if(next5Days() == false) {
					$(".date-ul > li:eq(5)").addClass("dOn");
					$(this).attr("data-date", $(".date-ul > li:eq(5)").attr("data-date"))
					$(this).children().attr("data-dayIdx", $(".date-ul > li:eq(5)").children().attr("data-dayIdx"));
				} else {
					$(".date-ul > li:eq(1)").addClass("dOn");
				}
			} else {
				$(this).addClass("dOn");
			}
			
			var sd = $(this).attr("data-date")
			var sdArr = sd.split("-");
			var dayIdx = $(this).children().attr("data-dayIdx");
			var $small = $("<small>").append("(" + dayArr[dayIdx] + ")");
			$("#orgDate > span").empty();
			$("#orgDate > span").append(sdArr[0]+"年 "+sdArr[1]+"月 "+sdArr[2]+"日").append($small);
			
			
			$.ajax({
				url: "listByDate",
				type: "get",
				data: {sDate: sd},
				dataType: "json",
				success: function(res){
					console.log(res);
					$(".list-box").remove();
					var sum = 0;
					
					for(var i=0; i<res.repeatList.length; i++) {
						/* 프로그램 소개부분 */
						var $pTxt = $("<p>");
						var $h1Txt = $("<h1>");
						var $infoImg = $("<img>");
						var $divTxt = $("<div>").addClass("info-txt");
						var $divImg = $("<div>").addClass("info-img");
						var $divInfo = $("<div>").addClass("list-info");
						var $divTime = $("<div>").addClass("list-time");
						var $divListBox = $("<div>").addClass("list-box");
						
						$infoImg.attr("src", pName+"/admin/displayFile?fileName="+res.list[sum].pg.pgThumb);
						$divImg.append($infoImg);
						$h1Txt.append(res.list[sum].pg.pgTitle);
						$pTxt.append(res.list[sum].pg.pgDetail);
						$divTxt.append($h1Txt).append($pTxt);
						
						$divInfo.append($divImg).append($divTxt);
						$divListBox.append($divInfo);
						
						for(var j=sum; j<sum+res.repeatList[i]; j++) {
							/* 시간정보 부분 */
							var $timeB = $("<b>");
							var $timeH3 = $("<h3>").addClass("sTime");
							var $timeEm = $("<em>").addClass("eTime");
							var $timeP = $("<p>");
							var $ipOrgNo = $("<input>").attr({"type":"hidden", "name": "orgNo"});
							var $ipOrgPgNo = $("<input>").attr({"type":"hidden", "name": "orgPgNo"});
							var $ipOrgThNo = $("<input>").attr({"type":"hidden", "name": "orgThNo"});
							var $divTimeBox = $("<div>").addClass("time-box");
							
							var h = res.list[j].org.orgStime.split(":");
							var m = res.list[j].org.orgEtime.split(":");
							
							$timeB.append(res.list[j].th.thNm + " 관");
							$timeH3.append(h[0] + ":" + h[1]);
							$timeEm.append("~ " + m[0] + ":" + m[1]);
							$timeP.append("<span>13</span> / 30席");
							         
							$ipOrgNo.val(res.list[j].org.orgNo);
							$ipOrgPgNo.val(res.list[j].pg.pgNo);
							$ipOrgThNo.val(res.list[j].th.thNo); 
							
							$divTimeBox.append($timeB).append($timeH3).append($timeEm).append($timeP);
							$divTimeBox.append($ipOrgNo).append($ipOrgPgNo).append($ipOrgThNo);
							$divTime.append($divTimeBox);
						}
						$divListBox.append($divTime);
						sum = sum + res.repeatList[i];
						$(".main-list").append($divListBox);
					}
					
					
				},
				error: function(e){
					console.log(e);
				}
			})
			
			
			
		})
		

	})
})(window, jQuery);

//콤마 추가
function addComma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
//콤마 제거
function removeComma(str){
	n = parseInt(str.replace(/,/g,""));
	return n;
}
//10보다 작은애들 0 붙이기
function zeroZeroDate(val){
	if(val < 10) {
		val = "0" + val;
	}
	return val;
}



