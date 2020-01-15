$(function(){	

})

var dClass = "seat added-seat";
var sgArr = ["", "seat-empty", "premiumSingle-empty", "premiumDouble-empty", "seat-none", "seat-disabled"];
var cSeat = [];
var cSeatIdx;

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
		
		cSeatIdx = 0;
		cSeat.forEach(function(val){
			++cSeatIdx;
			$("#cSeat-box").append(val + " ");
		});
		$("#cSeat-cnt").text(cSeatIdx);
		
	} else{ //non-active상태일때
		//오른쪽에 선택된 좌석 표시
		if(cSeat.length == 5) {
			alert("좌석 선택은 5개 까지만 가능합니다.");
			return;
		} 

		$("#cSeat-box").empty();
		cSeat.push(stNm);
		cSeat.sort();
		
		cSeatIdx = 0;
		cSeat.forEach(function(val){
			++cSeatIdx;
			$("#cSeat-box").append(val + " ");
		});
		$("#cSeat-cnt").text(cSeatIdx);

		//아이콘변경
		$(obj).removeClass();
		$(obj).addClass(dClass + " " + "seat-active");
	}
	
}


