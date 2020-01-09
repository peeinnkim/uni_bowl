(function(win, $){
	$(function(){	
		var nPage = 1;
		
		//동적 추가되는 테이블 
		Handlebars.registerHelper("prettifyDate", function(dd){
			if(dd == null) {
				return "-";
			}
			
			var date = new Date(dd);
			var year = date.getFullYear();
			var month = date.getMonth()+1;
			var d = date.getDate();
			
			if(month < 10) {
				month = "0" + month;
			}
			if(d < 10) {
				d = "0" + d;
			}
			
			return year + "-" + month + "-" + d;
		})
		
		
		//페이지 누르면 페이지 정보 바뀌기
		$(document).on("click", $(".pagination > li"), function(){
			nPage = $(this).attr("data-page");
		})
		
	
		
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
					$("#mem-tb").append(str);
					
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
		}
		
		
		
		
	})
})(window, jQuery);