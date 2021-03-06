<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">
<style>
#tit {
    width: 60%;
    text-align: center;
    margin: 0 auto 40px;
    padding: 10px 0;
	border-bottom: 4px dashed #5271C4;
    color: #5271C4;
    letter-spacing: 0.5em;
    font-weight: bold;
    font-size: 1.7em;
}
</style>

<h1 id="tit">공지관리</h1>

<div class="content-area">
	<div class="read-wrap">
		<div class="read-title">
			<h1><span class="category">공지사항</span>${nt.ntTitle}</h1>
			<div class="title-footer">       
				<dl>
					<dt>등록일</dt>
					<dd><fmt:formatDate value="${nt.ntRegDate}" pattern="yyyy-MM-dd HH:mm"/></dd>
				</dl>
				<c:if test="${nt.ntModDate != null}">
				<dl>
					<dt>수정일</dt>
					<dd>
						<fmt:formatDate value="${nt.ntModDate}" pattern="yyyy-MM-dd HH:mm"/>
					</dd>
				</dl>
				</c:if>
				<dl>
					<dt>조회수</dt>
					<dd>${nt.ntViewCnt}</dd>
				</dl>
			</div>
		</div>
		
		<div class="read-content">
			<pre><c:out value="${nt.ntContent}" /></pre>
			
			<h5>첨부파일</h5>
			<ul class="imgFiles-wrap">
				<c:if test="${nt.files[0].naThumb != null}">
					<c:forEach var="na" items="${nt.files}">
						<li><!-- 섬네일 디스플레이 -->
							<span class="thumb-img" data-src="${na.naOrigin}">
								<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${na.naThumb}">
							</span>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
		
		<div class="read-footer">
			<a href="${pageContext.request.contextPath}/admin/notice/list" class="btn btn-line">LIST</a>
			<div class="footer-link">
				<a href="${pageContext.request.contextPath}/admin/notice/modify?ntNo=${nt.ntNo}">MODIFY</a>
				<a href="${pageContext.request.contextPath}/admin/notice/remove?ntNo=${nt.ntNo}">REMOVE</a>
			</div>
		</div>
		
		<div class="modal-wrap"> <!-- 이미지 클릭시 나오는 모달창 -->
			<div class="modal-img"></div>
		</div>
	</div>
</div>	

<script>
	/* 이미지 클릭 시 모달창에 원본사진 나오게 하기 */
	$(document).on("click", ".thumb-img", function(){
		var src = $(this).attr("data-src");
		var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/admin/displayFile?fileName="+src);
		var $modalX = $("<span>").addClass("modalX");
		
		$(".modal-img").empty();
		$(".modal-img").append($img).append($modalX);
		$(".modal-wrap").css("display", "block");
		$img.load(function(){
			$(".modal-img").css({"width":$(this).width(), "height":$(this).height()});
		})
	})
	
	/* 모달창에서 X 누르면 사라지기 */
	$(document).on("click", ".modalX", function(){
		$(".modal-wrap").css("display", "none");
	})
	
</script>


<%@ include file="../include/footer.jsp" %>

