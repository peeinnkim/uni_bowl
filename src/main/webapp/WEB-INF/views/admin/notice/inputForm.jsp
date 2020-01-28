<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">
<style>
	input, textarea {
		background: #eaeaea !important;
	}
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
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>

<h1 id="tit">공지관리</h1>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" ${nt.ntNo == null? 'action="regist"': 'action="modify"'} method="post" enctype="multipart/form-data">
			<input type="hidden" name="ntNo" value="${nt.ntNo == null? '0': nt.ntNo}">
			<input type="hidden" name="ntWriter" value="${Auth.authNo}">
			<p>
				<label>상단고정</label>
				<input type="checkbox" ${nt.ntIsFixed == null ? '' : (nt.ntIsFixed == 0? '': 'checked="checked"')}>
				<input type="hidden" name="ntIsFixed" value="0">
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
			<ul class="thumb-wrap"></ul>
			<ul class="add-wrap">
				<c:if test="${nt.ntNo != null}"> <!-- 수정모드일때만 나오게 -->
					<c:if test="${nt.files[0].naThumb != null}">
	 				<c:forEach var="na" items="${nt.files}">
						<li>
							<span class="thumb-img">
								<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${na.naThumb}">
								<span class="delX" data-src="${na.naThumb}"></span>
							</span>
						</li>
					</c:forEach> 
					</c:if>
				</c:if>
			</ul>
			<p>
				<input type="submit" ${nt.ntNo == null? 'value="REGIST"': 'value="MODIFY"'}>
				<input type="reset" value="CANCEL">
			</p>
		</form>
	</div>
</div>	

<script>
	$("input[type='checkbox']").change(function(){
		if($(this).is(":checked")) {
			$("input[name='ntIsFixed']").val("1");
		} else {
			$("input[name='ntIsFixed']").val("0");
		}
	})
	
	$("input[type='reset']").click(function(){
		location.href = "${pageContext.request.contextPath}/admin/notice/list";
	})
</script>

<%@ include file="../include/footer.jsp" %>

