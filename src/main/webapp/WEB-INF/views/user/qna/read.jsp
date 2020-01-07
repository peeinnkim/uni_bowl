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
			<a href="${pageContext.request.contextPath}/user/notice/list" class="btn btn-line">LIST</a>
			<div class="footer-link">
				<a href="${pageContext.request.contextPath}/user/notice/modify?ntNo=${qna.qnaNo}">MODIFY</a>
				<a href="${pageContext.request.contextPath}/user/notice/remove?ntNo=${qna.qnaNo}">REMOVE</a>
			</div>
		</div>
		
		<div class="modal-wrap"> <!-- 이미지 클릭시 나오는 모달창 -->
			<div class="modal-img"></div>
		</div>
		
		<div class="reply-wrap">
			<div class="reply-input">
				<textarea id="rpContent"></textarea>
				<a id="addReply">등록</a>
			</div>
			
			<div class="reply-list-wrap">
				<ul class="reply-list">
<!-- 					<li>
						<div>
							<span class="replyer">관리자</span>
							<dl>
								<dt>등록일</dt>
								<dd>
									2020-01-03 12:22:30
								</dd>
							</dl>
							<dl>
								<dt>수정일</dt>
								<dd>
									2020-01-03 12:22:30
								</dd>
							</dl>
						</div>
						
						<div class="reply-content">댓글<br>ㅁㄴㅇㄹ<br>ㅁㅇㄹㄴ</div>
						
						<div class="reply-btn">
							<a class="modReply">수정</a>
							<a class="delReply">삭제</a>
						</div>
					</li> -->
				</ul>
			</div>
		</div>
	</div>
</div>	


<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#list}}
<li data-rpNo={{rpNo}} class="reply-li">
	<div>
		<span class="replyer">관리자</span>
		<dl>
			<dt>등록일</dt>
			<dd>{{prettifyDate rpRegDate}}</dd>
		</dl>
		<dl>
			<dt>수정일</dt>
			<dd>
				<c:if test=${rpModDate != null}></c:if>
				{{prettifyDate rpModDate}}
			</dd>
		</dl>
	</div>
						
	<div class="reply-content"><pre>{{rpContent}}</pre></div>
						
	<div class="reply-btn">
		<a class="modReply">수정</a>
		<a class="delReply">삭제</a>
	</div>
</li>
{{/list}}
</script>
<script>
	/* 이미지 클릭 시 모달창에 원본사진 나오게 하기 */
	$(document).on("click", ".thumb-img", function(){
		var src = $(this).attr("data-src");
		var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/admin/notice/displayFile?fileName="+src);
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
	
	/* -------------- [ REPLY ] -------------- */
	/* 핸들바즈 날짜변경 */
	Handlebars.registerHelper("prettifyDate", function(dd){
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth();
		var d = date.getDate();
		var hour = date.getHours();
		var minute = date.getMinutes();
		var second = date.getSeconds();
		
		return year + "-" + month + "-" + d + " " + hour + ":" + minute + ":" + second;
	})
	
	function getReplyList(){
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/replies/${qna.qnaNo}/",
			type: "get",
			dataType: "json",
			success: function(res){
				console.log(res);
				
				$(".reply-li").remove();
				var source = $("#template").html();
				var func = Handlebars.compile(source);
				var str = func(res);
				
				//댓글 리스트 가져오기
				$(".reply-list").append(str);
			},
			error: function(e){
				console.log(e);
			}
		})
	}
	
	/* 댓글 리스트 달기 */
	getReplyList();
	
	/* 댓글 추가 */
	$("#addReply").click(function(){
		var qnaNo = "${qna.qnaNo}";
		var content = $("#rpContent").val();
		
		var data = JSON.stringify({
			qnaNo: qnaNo, 
			content: content
		});
		
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/replies/",
			type: "post",
			data: data,
			headers: {"Content-Type":"application/json"},
			dataType: "text",
			success: function(res){
				console.log(res);
				$("#rpContent").val("");
				alert("등록되었습니다.");
				getReplyList();
			},
			error: function(e){
				console.log(e);
			}
		})
	})
	
	/* 댓글수정 */
	$(document).on("click", ".modReply", function(){
		var rpNo = $(this).parents(".reply-li").attr("data-rpNo");
		var content = $("#rpContent").val();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/replies/" + rpNo,
			type: "put",
			data: JSON.stringify({rpContent: content}),
			dataType: "text",
			headers: {"Content-Type":"application/json"},
			success: function(res){
				console.log(res);
				
				if(res == "success") {
					alert("수정되었습니다.");
					getPageList(nPage);
				}
			},
			error: function(e){
				console.log(e);
			}
		})
	})	
	
	
	/* 댓글삭제 */
	$(document).on("click", ".delReply", function(){
		var rpNo = $(this).parents(".reply-li").attr("data-rpNo");
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result == true) {
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/replies/" + rpNo,
				type: "delete",
				dataType: "text",
				success: function(res){
					console.log(res);
					if(res == "success") {
						alert("삭제되었습니다.");
						getReplyList();
					}
				},
				error: function(e){
					console.log(e);
				}
			}) 
		} else {
			return false;
		}
	})	
	
	
</script>



<%@ include file="../../include/footer.jsp" %>

