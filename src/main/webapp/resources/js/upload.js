(function(win, $){
	$(function(){	
		$("input[type='file']").change(function(){
			$(".thumb-wrap").empty();
			
			var file = $(this)[0].files;
			var reader = null;
			
			for(var i=0; i<file.length; i++) {
				reader = new FileReader();	
				reader.readAsDataURL(file[i]);
				reader.onload = function(e){
					var $img = $("<img>").attr("src", e.target.result); 
					var $spanImg = $("<span>").addClass("thumb-img").append($img);
					var $li = $("<li>").append($spanImg);
					
					$(".thumb-wrap").append($li);
				}
			}
		})
		
		$(".delX").click(function(){
			var fileName = $(this).attr("data-src");
			var $input = $("<input>").attr("type", "hidden").attr("name", "delFiles").val(fileName);
			$(".add-wrap").append($input);
			$(this).parent().remove();
		})
		
		
		
	})
})(window, jQuery);
