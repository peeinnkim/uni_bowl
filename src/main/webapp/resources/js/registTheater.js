/* SEAT 지정 */
var cDefault = "seat";
var cName = "seat-empty";

function getCName(obj){
	cName = $(obj).attr("data-cNm");
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
		var thName = $("input[name='thName']").val();
		var thSeatCnt = $("input[name='thSeatCnt']").val();
		var thFloor = $("input[name='thFloor']").val();
		
		var data = {
				"thName" : thName,
				"thSeatCnt": thSeatCnt,
				"thFloor" : thFloor
		};
		
		$.ajax({
			url: pName + "/admin/intranet/theater/regist",
			type: "post",
			data: data,
			dataType: "json",
			success: function(res){
				console.log(res);
				
				if(res.result == "success") {
					var addConfirm = confirm("좌석 설정을 하시겠습니까?");
					
					if(addConfirm == false) {
						location.href = pName + "/admin/intranet/theater/list";
						return;
					}
					
					$("#cThNo").val(res.no);
					$("#cThName").val(thName);
					$("#cThCnt").val(thSeatCnt);
					$("#cThFloor").val(thFloor);
					$(".crt-th-wrap").hide();
					$(".crted-th-wrap").show();
					
					$(".crt-seat-pre").show();
				}
			},
			error: function(e){
				console.log(e);
				}
			})
	})//$("#crtThBtn").click
	
		
	/* 좌석 설정하기 */
	//좌석 크기 설정
	$("#crtStBtn").click(function(){
		var al = confirm("저장 전에 좌석 크기를 다시 설정하면 작업 내용이 초기화되니 주의하시기 바랍니다.");
		
		if(al == false) {
			return false;
		}
		
		$("#show-seat-wrap > div").empty();
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
		
		for(var i=0; i<rows; i++) {
			rowStr = String.fromCharCode(97+i);
			idx = 0;
			code_saver += "<ul class='seat-row'>";
			for(var j=0; j<cols; j++) {
				code_saver += "<li><a title='"+rowStr+"-"+(++idx)+"' class='seat seat-empty added-seat'>"+rowStr+idx+"</a></li>";
			}
			code_saver += "</ul>";
		}
		
		$("#show-seat-wrap > div").width(24 * cols + "px");
		$("#show-seat-wrap > div").html(code_saver);
		$(".crt-seat-wrap").show();
	})
	
	/* SEAT 지정 */
	$(document).on("click", ".seat", function(){
		$(this).removeClass();
		$(this).addClass(cDefault + " " + cName);
	})
	
	
	var stArr = ["seat-empty", "premiumSingle-empty", "premiumDouble-empty", "seat-disabled"];
	$("#reLabelBtn").click(function(){
		var idx, rowStr;
		var ulLen = $(".seat-row").length;
		var liLen = $(".seat-row:eq(0) > li").length;
		$(".seat-row  a").text("");
		
		for(var i=0; i<ulLen; i++) {
			idx = 0;
			rowStr = String.fromCharCode(65+i);
			
			for(var j=0; j<liLen; j++) {
				if($(".seat-row:eq("+i+") > li:eq("+j+") > a").hasClass("seat-disabled")) {
					$(this).attr("data-sgNo", 4);
					continue;
				}
				
				$(".seat-row:eq("+i+") > li:eq("+j+") > a").text(rowStr + (++idx));
			}
		}
		
	})//$("#reLabelBtn").click
	

	
	$("#stSaveBtn").click(function(){
		var pName = $("input[name='pName']").val();
		var data = JSON.stringify({
			stNm: $(".added-seat").attr("title"), 
			stDnm: $(".added-seat").text(), 
			stThNo: $("#cThNo").val(),
			stSgNo: $(".added-seat")
		});
		
		$(".added-seat").each(function(){
			alert($(this).attr("title"));
		})
		
		
/*		$.ajax({
			url: pName + "/admin/intranet/seat/regist",
			type: "post",
			data: data,
			headers: {"Content-Type":"application/json"},
			dataType: "text",
			sueccess: function(res){
				console.log(res);
			},
			error: function(e){
				console.log(e);
			}
		})*/
	})
	
	
	
})

