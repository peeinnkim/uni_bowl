<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>QNA</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<p>
			<label>분류</label>
			<input type="text" name="qnaCategory" value="${qna.qnaCategory}">
		</p>
		<p>
			<label>제목</label>
			<input type="text" name="qnaTitle" value="${qna.qnaTitle}">
		</p>
		<p>
			<textarea name="qnaContent">${qna.qnaContent}</textarea>
		</p>
		<ul class="thumb-wrap">
			<li>
				<span class="thumb-img">
					<img src="${pageContext.request.contextPath}/resources/img/mark-basarab-1OtUkD_8svc-unsplash.jpg">
				</span>
				<span class="thumb-nm">djfidjfiadfasdfadfafdasdfadfadfds.jpg</span>
			</li>
			<li>
				<span class="thumb-img">
					<img src="${pageContext.request.contextPath}/resources/img/mark-basarab-1OtUkD_8svc-unsplash.jpg">
				</span>
				<span class="thumb-nm">djfidjfids.jpg</span>
			</li>
		</ul>
	</div>
	<a href="#">수정</a>
	<a href="#">삭제</a>
	<a href="#">리스트로</a>
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
	 			//var $spanNm = $("<span>").addClass("thumb-nm").append(e.target.id + "/" + e.target);  //파일명 넣고싶습니다..
				var $li = $("<li>").append($spanImg).append($spanNm);
				
				$(".thumb-wrap").append($li);
			}
		}
		
	})
</script>


<%@ include file="../../../include/footer.jsp" %>

