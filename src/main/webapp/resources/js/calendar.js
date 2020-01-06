(function(win, $){
	$(function(){	
		//오늘 날짜
		var today = new Date();
			
		function calendar(){
			//객체 접근
			var title = document.getElementById("cal-title");
			var table = document.getElementById("cal-table");
			
			//연도, 달 
			var y = today.getFullYear();
			var m = today.getMonth();
			var todayDate = today.getDate();
			
			//타이틀 출력
			if(m <= 9) {
				title.innerHTML = y + ". 0" + (m+1) + ".";
			} else {
				title.innerHTML = y + ". " + (m+1) + ".";
			}
			
			
			//첫주 빈칸 갯수 구하기
			//빈칸 갯수 = getDay로 구한 요일의 값과 동일 (1일로 셋팅)
			var blank_day = new Date(y, m, 1);
			var blank = blank_day.getDay();
			
			//마지막 날짜 배열
			var lastDayArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			
			//요일 배열
			var dayArr = ["일", "월", "화", "수", "목", "금", "토"];
			
			//2월 예외 (윤년)
			//윤년 조건 : 4년주기. !100년주기. 400년주기.
			if(y%4 == 0 && y%100 != 0 && y%400 == 0){
				last_day[1] = 29;
			}
			
			//마지막 날짜 대입
			var lastDay = lastDayArr[m];
			
			/* 테이블 그리기 */
			//테이블을 그리는 코드를 저장할 변수 선언(innerHTML에 바로 더하는게 부하를 일으킬 우려가 있음)
			var code_saver = "";
			
			//행 구하기
			var row = Math.ceil((lastDay + blank) / 7);
			
			//다른달 달력 그리기 전에 초기화
			table.innerHTML = null;
			
			//요일 그리기
			code_saver += "<tr>";
			for(var i=0; i<7; i++){
				code_saver += "<th>" + dayArr[i] + "</th>";
			}
			code_saver += "</tr>";
			
			//날짜를 저장할 변수 선언(for문 안에서 선언되면 숫자가 계속 증가되지 않으므로 밖에 선언)
			var day_saver = 1;
			
			//날짜 그리기
	 		for(var i=0; i<row; i++){
				code_saver += "<tr>";
				for(var j=0; j<7; j++){
					if(i == 0 && j < blank || day_saver > lastDay){
						code_saver += "<td></td>";
					} else{
						if(day_saver == todayDate) {
							code_saver += "<td class='tOn'><a href='"+day_saver+"'>"+day_saver+"</a></td>";
						} else {
							code_saver += "<td><a href='"+day_saver+"'>"+day_saver+"</a></td>";
						}
						
						day_saver++;
					}
				}
				code_saver += "</tr>";
			} 
			
			//테이블 객체에 대입
			table.innerHTML += code_saver;		
		}

		setTimeout(calendar, 0);
		
		$("#prevBtn").click(function(){
			lastMonth();
		})

		$("#nextBtn").click(function(){
			nextMonth();
		})
		
		function lastMonth(){
			today.setMonth(today.getMonth()-1);
			calendar();
		}
		
		function nextMonth(){
			today.setMonth(today.getMonth()+1);
			calendar();
		}
	})
})(window, jQuery);
