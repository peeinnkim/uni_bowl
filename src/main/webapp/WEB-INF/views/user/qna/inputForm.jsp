<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">
<style>
	input, textarea { background: #eaeaea !important; }
</style>
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>

<div class="section-title">
	<h1>QNA</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" ${qna.qnaNo == null? 'action="regist"': 'action="modify"'} method="post" enctype="multipart/form-data">
			<input type="hidden" name="qnaNo" value="${qna.qnaNo == null? '0': qna.qnaNo}">
			<input type="hidden" name="qnaWriter" value="${Auth.authNo}">
			<input type="hidden" name="qnaWriterId" value="${Auth.authId}">
			<p>
				<label>분류</label>
				<select id="state-sel">
					<option>분류 선택</option>
					<option value="1">예약문의</option>
					<option value="2">시설문의</option>
					<option value="3">기타문의</option>
					<option value="4">제안하기</option>
				</select>
				<input type="hidden" name="qnaCategory" value="${qna.qnaCategory}">
			</p>
			<p>
				<label>제목</label>
				<input type="text" name="qnaTitle" value="${qna.qnaTitle}">
			</p>
			<p>
				<textarea name="qnaContent">${qna.qnaContent}</textarea>
			</p>
			<p>
				<label>첨부파일</label>
				<input type="file" name="imageFiles" multiple="multiple">
			</p>
			<ul class="thumb-wrap"></ul>
			<ul class="add-wrap">
				<c:if test="${qna.qnaNo != null}"> <!-- 수정모드일때만 나오게 -->
	 				<c:forEach var="qa" items="${qna.files}">
						<li>
							<span class="thumb-img">
								<img src="${pageContext.request.contextPath}/user/qna/displayFile?fileName=${qa.qaThumb}">
								<span class="delX" data-src="${qa.qaThumb}"></span>
							</span>
						</li>
					</c:forEach> 
				</c:if>
			</ul>
			<p>
				<input type="submit" ${qna.qnaNo == null? 'value="REGIST"': 'value="MODIFY"'}>
				<input type="reset" value="CANCEL">
			</p>
		</form>
	</div>
</div>	


<script>
	$("#state-sel").change(function(){
		$("input[name='qnaCategory']").val($(this).val());
	})
</script>

<%@ include file="../../include/footer.jsp" %>

