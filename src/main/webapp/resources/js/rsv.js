$(function(){	

})

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


