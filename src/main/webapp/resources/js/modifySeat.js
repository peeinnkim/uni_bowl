/* SEAT 지정 */
var cDefault = "seat";
var cName = "seat-empty";
var cNo = "1";

function getCName(obj){
	cName = $(obj).attr("data-cNm");
	cNo = $(obj).attr("data-cNo");
}			

$(function(){	
	/*THEATER 생성하기*/
	$("#crtThBtn").click(function(){
		//Valid Check
		if($("input[name='thName']").val() == "") {
			alert("상영관명을 입력하세요");
			return false;
		}
		if($("input[name='thSeatCnt']").val() == "") {
			alert("수용인원을 입력하세요");
			return false;
		}
		if($("input[name='thFloor']").val() == "") {
			alert("층수를 입력하세요");
			return false;
		}
		
		//상영관 추가
		var pName = $("input[name='pName']").val();
		var thNo = $("input[name='thNo']").val();
		var thName = $("input[name='thName']").val();
		var thSeatCnt = $("input[name='thSeatCnt']").val();
		var thFloor = $("input[name='thFloor']").val();
		var seatCntSave = $("input[name='seatCntSave']").val();
		
		var data = {
				"thNo" : thNo,
				"thNm" : thName,
				"thSeatCnt": thSeatCnt,
				"thFloor" : thFloor
		};
		
		if(thNo == 0) { //thNo가 없으면 추가
			$.ajax({
				url: pName + "/admin/theater/regist",
				type: "post",
				data: data,
				dataType: "json",
				success: function(res){
					console.log(res);
					
					if(res.result == "success") {
						alert("좌석 설정을 진행합니다.");
						
						$("#cThNo").val(res.no);
						$("#cThName").text(thName);
						$("#cThCnt").text(thSeatCnt);
						$("#cThFloor").text(thFloor);
						$(".crt-th-wrap").hide();
						$(".crted-th-wrap").show();
						
						$(".crt-seat-pre").show();
					}
				},
				error: function(e){
					console.log(e);
					}
				})
				
		} else { //thNo가 있으면 수정
			var url;
			
			if(thSeatCnt == seatCntSave) {
				url = pName + "/admin/theater/modify/0";
			} else {
				url = pName + "/admin/theater/modify/1";
			}
			
			$.ajax({
				url: url,
				type: "post",
				data: data,
				dataType: "json",
				success: function(res){
					console.log(res);
					
					if(res.result == "success") {
						alert("수정되었습니다.");
						location.href = pName + "/admin/theater/list";
						
					} else if (res.result == "needStMod") {
						alert("수용인원이 변경되었습니다. 좌석변경이 필요합니다.");
						location.href = pName + "/admin/theater/seat?thNo="+thNo;
					}
				},
				error: function(e){
					console.log(e);
				}
			})
		}
	})//$("#crtThBtn").click
	
		
	/* 좌석 설정하기 */
	//수정 범위 설정
	var modType = 0; //0: 부분수정, 1: 전체수정
	
	//좌석 크기 설정
	$("#crtStBtn").click(function(){
		var al = confirm("저장 전에 좌석 크기를 다시 설정하면 작업 내용이 초기화되니 주의하시기 바랍니다.");
		
		if(al == false) {
			return false;
		}
		
		//전체수정모드
		modType = $("#cThNo").val();
		$("#show-seat-wrap > div").empty();
		
		//가로세로길이 받아오기
		var rows = $("#rows").val(); //ul
		var cols = $("#cols").val(); //li
		var capa = $("#cThCnt").text();
		
		if(capa == "") {
			alert("수용인원을 입력해주세요.");
			return;
		}
			
		if((rows * cols) < capa) {
			alert("좌석은 수용인원과 같거나 많아야합니다.");
			return;
		}
		
		var code_saver = "";
		var idx, rowStr;
		var thNo = $("#cThNo").val();
		
		for(var i=0; i<rows; i++) {
			rowStr = String.fromCharCode(97+i);
			idx = 0;
			code_saver += "<ul class='seat-row'>";
			for(var j=0; j<cols; j++) {
				code_saver += "<li>" +
							  "<a class='seat seat-empty added-seat' data-cNo='1' data-stNo='0'>"+rowStr+(++idx)+"</a>" +
							  "</li>";
			}
			code_saver += "</ul>";
		}
		
		$("#show-seat-wrap > div").width(24 * cols + "px");
		$("#show-seat-wrap > div").html(code_saver);
		$(".crt-seat-wrap").show();
	})
	
	/* SEAT 지정 */
	var stArr = [];
	$(document).on("click", ".seat", function(){
		$(this).removeClass();
		$(this).attr("data-cNo", cNo);
		$(this).addClass(cDefault + " " + cName + "  added-seat");
	})
	
	/* 설정완료 */
	$("#btnLabel").click(function(){
		var idx, rowStr;
		var ulLen = $(".seat-row").length;
		var liLen = $(".seat-row:eq(0) > li").length;
		$(".seat-row  a").text("");
		
		for(var i=0; i<ulLen; i++) {
			idx = 0;
			rowStr = String.fromCharCode(65+i);
			
			for(var j=0; j<liLen; j++) {
				if($(".seat-row:eq("+i+") > li:eq("+j+") > a").hasClass("seat-disabled")) {
					$(".seat-row:eq("+i+") > li:eq("+j+") > a").text("-");
				} else {
					$(".seat-row:eq("+i+") > li:eq("+j+") > a").text(rowStr + (++idx));
				}
			}
		}

		setTimeout(saveSeat, 500);
		
	})//$("#btnLabel").click
	
	
	/* 좌석 저장 */
	function saveSeat(){
		var result = confirm("좌석 설정이 완료되었습니다. 저장하시겠습니까?");
		
		if( result == false ) {
			return false;
		}
		
		var pName = $("input[name='pName']").val();
		var stObjArr = [];
		
		$(".added-seat").each(function(i, obj){
			stObjArr.push({
				stNo: $(obj).attr("data-stNo"),
				stNm: $(obj).text(), 
				stThNo: $("#cThNo").val(),
				stSgNo: $(obj).attr("data-cNo")
			});
		})
		
		if(modType == 0) { //부분수정
			$.ajax({
				url: pName + "/admin/theater/seat/modify/0",
				type: "post",
				data: JSON.stringify(stObjArr),
				dataType: "text",
				headers: {"Content-Type":"application/json"},
				success: function(res){
					console.log(res);
				
					if(res == "success") {
						location.href = pName + "/admin/theater/seat/modify/success";
					}
				},
				error: function(e){
					console.log(e);
				}
			})
			
		} else if(modType != 0) { //전체수정
			$.ajax({
				url: pName + "/admin/theater/seat/modify/" + $("#cThNo").val(),
				type: "post",
				data: JSON.stringify(stObjArr),
				dataType: "text",
				headers: {"Content-Type":"application/json"},
				success: function(res){
					console.log(res);
					
					if(res == "success") {
						location.href = pName + "/admin/theater/modifyRowAndCol?row=" + $("#rows").val() + "&col=" + $("#cols").val() + "&thNo=" + $("#cThNo").val();
					}
				},
				error: function(e){
					console.log(e);
				}
			})
		}//if
		

	}//저장함수
	
})

