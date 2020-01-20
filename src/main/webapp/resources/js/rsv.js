(function(win, $){
	$(function(){	
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
			if(y%4 == 0 && y%100 != 0 && y%400 == 0){
				last_day[1] = 29;
			}
			
			//마지막 날짜 대입
			var lastDay = lastDayArr[m];
			
			/* 테이블 그리기 */
			var code_saver = "";
			calBox.innerHTML = null;
			
			
			var idx = todayDate;
			
			for(var i=0; i<5; i++) {
				if(dayIdx == 7) {
					dayIdx = 0;
				}
				
				if(idx > lastDay) {
					m++;
					lastDay = lastDayArr[m];
					idx = 1;
					dataDate = y+"-"+zeroZeroDate(m+1)+"-"+zeroZeroDate(idx);
					if(idx == todayDate) {
						code_saver += "<li data-date='"+dataDate+"' class='dOn'>" + zeroZeroDate(m+1) + "/" + zeroZeroDate(idx++) + "<small data-dayIdx='"+dayIdx+"'>(" + dayArr[dayIdx++] + ")</small></li>"
					} else {
						code_saver += "<li data-date='"+dataDate+"'>" + zeroZeroDate(m+1) + "/" + zeroZeroDate(idx++) + "<small data-dayIdx='"+dayIdx+"'>(" + dayArr[dayIdx++] + ")</small></li>"
					}
				} else {
					dataDate = y+"-"+zeroZeroDate(m+1)+"-"+zeroZeroDate(idx);
					code_saver += "<li data-date='"+dataDate+"'>" + zeroZeroDate(m+1) + "/" + zeroZeroDate(idx++) + "<small data-dayIdx='"+dayIdx+"'>(" + dayArr[dayIdx++] + ")</small></li>"
				}
			}
			
				calBox.innerHTML += "<li id='datePrev'></li>" + code_saver + "<li id='dateNext'></li>";	
		}
		
		setTimeout(cal5days, 0);
		
		$(document).on("click", "#datePrev",function(){
			last5Days();
		})

		$(document).on("click", "#dateNext",function(){
			next5Days();
		})
		
		function last5Days(){
			today.setDate(today.getDate()-5);
			cal5days();
		}

		function next5Days(){
			today.setDate(today.getDate()+5);
			cal5days();
		}
		
		$(document).on("click", ".date-ul > li", function(){
			$(".date-ul > li").removeClass("dOn");
			$(this).addClass("dOn");
			
			var sd = $(this).attr("data-date").split("-");
			var dayIdx = $(this).children().attr("data-dayIdx");
			var $small = $("<small>").append("(" + dayArr[dayIdx] + ")");
			$("#orgDate > span").empty();
			$("#orgDate > span").append(sd[0]+"年 "+sd[1]+"月 "+sd[2]+"日").append($small);
		})
		

	})
})(window, jQuery);

var dClass = "seat added-seat";
var sgArr = ["", "seat-empty", "premiumSingle-empty", "premiumDouble-empty", "seat-none", "seat-disabled"];
var priceArr = [0, 16000, 21000, 42000, 0, 0];
var cSeat = [];
var cSeatIdx
var cSeatPrice = 0;

function getStInfo(obj) {
	var stNm = $(obj).text();
	var currentSgNo = $(obj).attr("data-cNo");

	if($(obj).hasClass("seat-disabled")) {
		return;
	}
	
	if($(obj).hasClass("seat-active")) { //active상태일때
		//아이콘변경
		$(obj).removeClass();
		$(obj).addClass(dClass + " " + sgArr[currentSgNo]);
		
		cSeat.splice(cSeat.indexOf(stNm), 1);
		$("#cSeat-box").empty();
		
		//금액 빼기
		if(cSeatPrice > 0) {
			cSeatPrice -= priceArr[currentSgNo];
		}
		
	} else{ //non-active상태일때
		//이미 선택된 좌석일때
		if($(obj).hasClass("seat-none")) {
			return;
		}
		//오른쪽에 선택된 좌석 표시
		if(cSeat.length == 5) {
			alert("좌석 선택은 5개 까지만 가능합니다.");
			return;
		} 
		
		cSeat.push(stNm);
		cSeat.sort();
		
		//금액 더하기
		cSeatPrice += priceArr[currentSgNo];

		//아이콘변경
		$(obj).removeClass();
		$(obj).addClass(dClass + " " + "seat-active");
	}
	
	$("#cSeat-box").empty();
	cSeatIdx = 0;
	cSeat.forEach(function(val){
		++cSeatIdx;
		$("#cSeat-box").append(val + " ");
	});
	$("#cSeat-cnt").text(cSeatIdx);
	
	$("#seat-price").text(addComma(cSeatPrice));
	
}

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



