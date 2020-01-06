<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/board.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>

<div class="section-title">
	<h1>NOTICE</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<form id="frm" ${nt.ntNo == null? 'action="regist"': 'action="modify"'} method="post" enctype="multipart/form-data">
			<input type="text" name="ntNo" value="${nt.ntNo == null? '0': 'nt.ntNo'}">
			<p>
				<label>상단고정</label>
				<input type="checkbox" ${nt.ntIsFixed == null ? '' : (nt.ntIsFixed == 0? '': 'checked="checked"')}>
				<input type="text" name="ntIsFixed" value="0">
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
 				<c:forEach var="na" items="${nt.files}">
					<li>
						<span class="thumb-img">
							<img src="${pageContext.request.contextPath}/user/notice/displayFile?fileName=${na.naThumb}">
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
	$("input[type='checkbox']").change(function(){
		if($(this).is(":checked")) {
			$("input[name='ntIsFixed']").val("1");
		} else {
			$("input[name='ntIsFixed']").val("0");
		}
	})
</script>

<%@ include file="../../include/footer.jsp" %>

