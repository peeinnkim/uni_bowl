
var nPage = 1;

$(function(){	
	
	//동적 추가되는 테이블 날짜
	Handlebars.registerHelper("pDate", function(dd){
		if(dd == null) {
			return "-";
		}
		
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var d = date.getDate();
		
		return year + "-" + zeroZeroDate(month) + "-" + zeroZeroDate(d);
	})
	
	//동적 추가되는 테이블 날짜 & 시간
 	Handlebars.registerHelper("pDateTime", function(dd){
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var d = date.getDate();
		var h = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();
		
		return year + "-" + zeroZeroDate(month) + "-" + zeroZeroDate(d) + " " + zeroZeroDate(h) + ":" + zeroZeroDate(min);
	}) 
	
	//페이지 누르면 페이지 정보 바뀌기
	$(document).on("click", $(".pagination > li"), function(){
		nPage = $(this).attr("data-page");
	})
	
})//$

//10보다 작은애들 0 붙이기
function zeroZeroDate(val){
	if(val < 10) {
		val = "0" + val;
	}
	return val;
}

//리스트 뿌리기 최종판
function getListPage(data){
	$.ajax({
		url: "searchList",
		type: "post",
		data: data,
		dataType: "json",
		success: function(res){
			console.log(res);
			
			$(".added-tr").remove();
			
			var source = $("#template").html();
			var func = Handlebars.compile(source);
			var str = func(res);
			
			//댓글 리스트 가져오기
			$("#main-tb").append(str);
			
			//페이지네이션 지우기
			$(".pagination").empty();
			
			//make a page-maker
			var startPage = res.pageMaker.startPage;
			var endPage = res.pageMaker.endPage;
			
			for(var i=startPage; i<=endPage; i++) {
				var $li = $("<li>");
				var $a = $("<a>").attr("href", "#").attr("data-page", i).append(i);
				$li.append($a);
				
				if(i == nPage) {
					$li.addClass("on");
				}
				
				$(".pagination").append($li);
			}
			
			if(res.pageMaker.prev == true) {
				var $li = $("<li>").addClass("previous");
				var $a = $("<a>").attr("href", "#").attr("data-page", res.pageMaker.startPage-1).append("◀");
				$li.append($a);
				$(".pagination").prepend($li);
			}
			
			if(res.pageMaker.next == true) {
				var $li = $("<li>").addClass("next");
				var $a = $("<a>").attr("href", "#").attr("data-page", res.pageMaker.endPage+1).append("▶");
				$li.append($a);
				$(".pagination").append($li);
			}
		},
		error : function(e){
			console.log(e);
		}
	})
}//func getPage









