(function(win, $){
	$(function(){	
		//데이트피커 컨트롤
		var dStart, dEnd;
		
		//날짜선택창
		$("#pick_start").datepicker({
			toggleSelected: false,
			clear: 'Clear',
			autoClose: true,
			firstDay: 0,
			onSelect: function(formattedDate, date, inst){
				dStart = date;
				
				$("#pick_end").datepicker({
					minDate: new Date(date)
				});
			}
		});
		
		$("#pick_end").datepicker({
			toggleSelected: false,
			clear: 'Clear',
			autoClose: true,
			onSelect: function(formattedDate, date, inst){
				dEnd = date;
			}
		});
	})
})(window, jQuery);