<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/program.css" type="text/css" rel="stylesheet">
<style>
	.cont-center {
		width: 50% !important;
	}
	#state-sel {
		float: none;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>

<h2>프로그램 관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<form id="frm" ${pg.pgNo == null? 'action="regist"': 'action="modify"'} method="post" enctype="multipart/form-data">
			<input type="hidden" name="pgNo" value="${pg.pgNo == null? '0': pg.pgNo}">
			<p>
				<label>제목</label>
				<input type="text" name="pgTitle" value="${pg.pgTitle}">
			</p>
			<p>
				<label>상영길이</label>
				<input type="text" name="pgTime" value="${pg.pgTime}" maxlength="3">분
			</p>
			<p>
				<input type="hidden" name="pgIsRunning" value="0">
				<label>설명</label>
				<textarea name="pgDetail">${pg.pgDetail}</textarea>
			</p>
			<p>
				<label>포스터</label>
				<input type="file" name="imageFiles">
			</p>
			<ul class="thumb-wrap"></ul>
			<ul class="add-wrap">
				<c:if test="${pg.pgNo != null}">
					<li>
						<span class="thumb-img">
							<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${pg.pgThumb}">
							<span class="delX" data-src="${pg.pgThumb}"></span>
						</span>
					</li>
				</c:if>
			</ul>
			<p>
				<input type="submit" ${pg.pgNo == null? 'value="REGIST"': 'value="MODIFY"'}>
				<input type="reset" value="CANCEL">
			</p>
		</form>
	</div>
</div>

<script>
	$("input[type='file']").change(function(){
		$(".delX").click();
	})

	$("#state-sel").change(function(){
		$("input[name='pgIsRunning']").val($(this).val());
	})
	$("input[type='reset']").click(function(){
		location.href = "${pageContext.request.contextPath}/admin/program/list";
	})
	
</script>

<%@ include file="../include/footer.jsp" %>

