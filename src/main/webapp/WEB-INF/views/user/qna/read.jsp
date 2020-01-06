<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>QNA</h1>
</div>

<div class="content-area">
	<div class="read-wrap">
		<div class="read-title">
			<h1><span class="category">${qna.qnaCategory}</span>${qna.qnaTitle}</h1>
			<div class="title-footer">       
				<dl>
					<dt>등록일</dt>
					<dd><fmt:formatDate value="${qna.ntRegDate}" pattern="yyyy-MM-dd HH:mm"/></dd>
				</dl>
				<c:if test="${nt.ntModDate != null}">
				<dl>
					<dt>수정일</dt>
					<dd>
						<fmt:formatDate value="${qna.ntModDate}" pattern="yyyy-MM-dd HH:mm"/>
					</dd>
				</dl>
				</c:if>
				<dl>
					<dt>조회수</dt>
					<dd>${qna.ntViewCnt}</dd>
				</dl>
			</div>
		</div>
		
		<div class="read-content">
			<pre>
				<c:out value="${qna.qnaContent}" />
			</pre>
			
			<h5>첨부파일</h5>
			<ul class="imgFiles-wrap">
				<c:forEach var="rp" items="${qna.files}">
					<li><!-- 섬네일 디스플레이 -->
						<span class="thumb-img" data-src="${rp.rpOrigin}">
							<img src="${pageContext.request.contextPath}/upload/displayFile?fileName=${rp.rpThumb}">
						</span>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="read-footer">
			<a href="#" class="btn btn-line">LIST</a>
			<div class="footer-link">
				<a href="${pageContext.request.contextPath}/user/notice/modify?ntNo=${qna.qnaNo}">MODIFY</a>
				<a href="${pageContext.request.contextPath}/user/notice/remove?ntNo=${qna.qnaNo}">REMOVE</a>
				<a href="${pageContext.request.contextPath}/user/notice/list">LIST</a>
			</div>
		</div>
		
		<div class="modal-wrap"> <!-- 이미지 클릭시 나오는 모달창 -->
			<div class="modal-img"></div>
		</div>
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
	 			//var $spanNm = $("<span>").addClass("thumb-nm").append(e.target.id + "/" + e.target);  //파일명 넣고싶습니다..
				var $li = $("<li>").append($spanImg).append($spanNm);
				
				$(".thumb-wrap").append($li);
			}
		}
		
	})
</script>


<%@ include file="../../include/footer.jsp" %>

