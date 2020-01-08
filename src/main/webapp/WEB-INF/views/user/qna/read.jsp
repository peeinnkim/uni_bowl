<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">
<style>
	.modal-wrap{
		z-index: 1053203;
	}
</style>

<div class="section-title">
	<h1>QNA</h1>
</div>

<div class="content-area">
	<div class="read-wrap">
		<div class="read-title">
			<h1>
			<span class="category">
				<c:choose>
					<c:when test="${qna.qnaCategory == 1}">예약문의</c:when>
					<c:when test="${qna.qnaCategory == 2}">시설문의</c:when>
					<c:when test="${qna.qnaCategory == 3}">기타문의</c:when>
					<c:when test="${qna.qnaCategory == 4}">제안하기</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</span>
			${qna.qnaTitle}
			</h1>
			<div class="title-footer">       
				<dl>
					<dt>등록일</dt>
					<dd><fmt:formatDate value="${qna.qnaRegDate}" pattern="yyyy-MM-dd HH:mm:ss"/></dd>
				</dl>
				<c:if test="${qna.qnaModDate != null}">
				<dl>
					<dt>수정일</dt>
					<dd>
						<fmt:formatDate value="${qna.qnaModDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</dd>
				</dl>
				</c:if>
				<dl>
					<dt>조회수</dt>
					<dd>${qna.qnaViewCnt}</dd>
				</dl>
			</div>
		</div>
		
		<div class="read-content">
			<pre><c:out value="${qna.qnaContent}" /></pre>
			
			<h5>첨부파일</h5>
			<ul class="imgFiles-wrap">
				<c:if test="${qna.files[0].qaThumb != null}"> 
					<c:forEach var="qa" items="${qna.files}">
						<li><!-- 섬네일 디스플레이 -->
							<span class="thumb-img" data-src="${qa.qaOrigin}">
								<img src="${pageContext.request.contextPath}/user/qna/displayFile?fileName=${qa.qaThumb}">
							</span>
						</li>
					</c:forEach>
				</c:if> 
			</ul>
		</div>
		
		<div class="read-footer">
			<a href="${pageContext.request.contextPath}/user/qna/list" class="btn btn-line">LIST</a>
			<div class="footer-link">
				<a href="${pageContext.request.contextPath}/user/qna/modify?ntNo=${qna.qnaNo}">MODIFY</a>
				<a href="${pageContext.request.contextPath}/user/qna/remove?ntNo=${qna.qnaNo}">REMOVE</a>
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
{{#each.}}
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
				<c:if test="${rpModDate != null}"></c:if>
				{{prettifyDate rpModDate}}
			</dd>
		</dl>
		<span class="top-btn-wrap">
			<a class="modBtn"></a>
			<a class="delBtn"></a>
		</span>
	</div>
						
	<div class="reply-content">
		<pre>{{rpContent}}</pre>
		<textarea class="mod-txt">{{rpContent}}</textarea>
	</div>
	
						
	<div class="reply-btn">
		<a class="modReply">수정</a>
		<a class="modCancel">취소</a>
	</div>
</li>
{{/each}}
</script>
<script>
	/* 이미지 클릭 시 모달창에 원본사진 나오게 하기 */
	$(document).on("click", ".thumb-img", function(){
		var src = $(this).attr("data-src");
		var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/user/qna/displayFile?fileName="+src);
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
		var h = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();
		
		return year + "-" + month + "-" + d + " " + h + ":" + min + ":" + sec;
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
		var writer = 2;
		
		var data = JSON.stringify({
			qnaNo: qnaNo, 
			rpContent: content,
			rpWriter: writer
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
	
	/* 댓글수정창 */
	$(document).on("click", ".modBtn", function(){
		//필요한 창과 버튼 표시
		$(this).closest("li").find(".mod-txt").css("display", "block");
		$(this).closest("li").find(".reply-btn").css("display", "block");
		
		//필요없는 창과 버튼 감추기
		$(this).closest("li").find("pre").css("display", "none");
		$(this).closest("li").find(".top-btn-wrap").css("display", "none");
	})

	/* 댓글수정취소 */
	$(document).on("click", ".modCancel", function(){
		//필요한 창과 버튼 표시
		$(this).closest("li").find("pre").css("display", "block");
		$(this).closest("li").find(".top-btn-wrap").css("display", "block");

		//필요없는 창과 버튼 감추기
		$(this).closest("li").find(".mod-txt").css("display", "none");
		$(this).closest("li").find(".reply-btn").css("display", "none");
	})
	
	/* 댓글수정 */
	$(document).on("click", ".modReply", function(){
		var rpNo = $(this).closest("li").attr("data-rpNo");
		var content = $(this).closest("li").find(".mod-txt").val();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/replies/" + rpNo,
			type: "put",
			data: JSON.stringify({rpNo: rpNo, rpContent: content}),
			dataType: "text",
			headers: {"Content-Type":"application/json"},
			success: function(res){
				console.log(res);
				
				if(res == "success") {
					alert("수정되었습니다.");
					getReplyList();
				}
			},
			error: function(e){
				console.log(e);
			}
		})
	})	
	
	
	/* 댓글삭제 */
	$(document).on("click", ".delBtn", function(){
		var rpNo = $(this).closest("li").attr("data-rpNo");
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
