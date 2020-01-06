<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>NOTICE</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" ${nt.ntNo == null? 'action="regist"': 'action="modify"'} method="post" enctype="multipart/form-data">
			<input type="hidden" name="ntNo" value="${nt.ntNo}">
			<p>
				<label>상단고정</label>
				<input type="checkbox" name="ntIsFixed" ${nt.ntIsFixed == null ? '' : (nt.ntIsFixed == 0? '': 'checked="checked"')}>
			</p>
			<p>
				<label>제목</label>
				<input type="text" name="ntTitle" value="${nt.ntTitle}">
			</p>
			<p>
				<textarea name="ntContent">${nt.ntContent}</textarea>
			</p>
			<p>
				<label>첨부파일</label>
				<input type="file" name="imageFiles" multiple="multiple">
			</p>
			<ul class="thumb-wrap">
				<c:forEach var="na" items="${nt.files}">
					<li>
						<span class="thumb-img">
							<img src="${pageContext.request.contextPath}/upload/displayFile?fileName=${na.naThumb}">
							<span class="delX" data-src="${na.naThumb}"></span>
						</span>
					</li>
				</c:forEach>
			</ul>
			<p>
				<input type="submit" ${nt.ntNo == null? 'value="REGIST"': 'value="MODIFY"'}>
				<input type="reset" value="CANCEL">
			</p>
		</form>
	</div>
</div>	

<script>
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
		$(".thumb-wrap").append($input);
		$(this).parent().remove();
	})
	
</script>


<%@ include file="../../../include/footer.jsp" %>

