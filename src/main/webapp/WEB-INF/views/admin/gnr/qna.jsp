<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/board.css" rel="stylesheet" type="text/css">

<h2>문의 관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<table id="main-list">
			<tr>
				<th>NO</th>
				<th>CATEGORY</th>
				<th>TITLE</th>
				<th>WRITER</th>
				<th>DATE</th>
				<th>STATE</th>
			</tr>
			<c:forEach var="qna" items="${list}">
				<tr class="show-sub" data-qnaNo="${qna.qnaNo}">
					<td style="width: 70px;">${qna.qnaNo}</td>
					<td style="width: 140px;">예약문의</td>
					<td>${qna.qnaTitle}</td>
					<td style="width: 180px;">${qna.qnaWriterId}</td>
					<td style="width: 180px;"><fmt:formatDate value="${qna.qnaRegDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td style="width: 140px;">답변완료</td>
				</tr>

				<tr class="req-sub">
					<td></td>
					<td colspan="2">
						<div class="req-cont">
							<h5>CONTENT</h5>
							<pre>${qna.qnaContent}</pre>
						</div>
						<div class="req-reply">
							<h5>QUICK REPLY</h5>
							<input type="hidden" name="qRpNo" value="0">
							<input type="hidden" name="writer" value="${Auth.authNo}">
							<textarea class="qRpContent"></textarea>
							<button class="btnAdd">REGIST</button>
							<button class="btnCancel">CANCEL</button>
						</div>
					</td>
					<td colspan="3">
						<div class="req-reply-list">
							<h5>REPLY LIST</h5>
							<ul class="rpList">
								<li class="added-li">
									<span class="replyer">
										<em>관리자</em><br>
										<b>작성일</b><i>2020-20-20 11:11:11</i>
										<b>수정일</b><i>2020-20-20 11:11:11</i>
									</span>
									<pre>어쩌구저쩌구asdfasdfasdfad<br>asdfasdfadf</pre>
									<span class="replyBtn">
										<a class="rBtnMod"></a>
										<a class="rBtnDel"></a>
									</span>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#each.}}
<li class="added-li" data-rpNo={{rpNo}}>
	<span class="replyer">
		<em data-mNo={{rpWriter}}>관리자</em><br>
		<b>작성일</b><i>{{prettifyDate rpRegDate}}</i>
		<c:if test="${{{rpModDate}} != null}">		
			<b>수정일</b><i>{{prettifyDate rpModDate}}</i>
		</c:if>
	</span>
	<pre>{{rpContent}}</pre>
	<span class="replyBtn">
		<a class="rBtnMod"></a>
		<a class="rBtnDel"></a>
	</span>
</li>
{{/each}}
</script>

<script>
	/* 핸들바즈 날짜변경 */
	Handlebars.registerHelper("prettifyDate", function(dd){
		var date = new Date(dd);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var d = date.getDate();
		var h = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();
		
		return year + "-" + zeroZeroDate(month) + "-" + zeroZeroDate(d) + " " + zeroZeroDate(h) + ":" + zeroZeroDate(min) + ":" + zeroZeroDate(sec);
	})
	
	function zeroZeroDate(val){
		if(val < 10) {
			val = "0" + val;
		}
		return val;
	}
	$(".show-sub").click(function(){
		var $qnaTr = $(this);
		var $sub = $(this).next(".req-sub");
		if($sub.css("display") == "none") {
			$(".req-sub").css("display", "none");
			getReplyList($qnaTr);
			$sub.show();
		} else {
			$sub.hide();
		}
	})
	
	/* 댓글 추가 */
	$(document).on("click", ".btnAdd", function(){
		var qnaTr = $(this).closest("tr").prev(".show-sub");
		var qnaNo = $(this).closest("tr").prev(".show-sub").attr("data-qnaNo");
		var content = $(this).prevAll(".qRpContent").val();
		var writer = $(this).prevAll("input[name='writer']").val();
		
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
				$(".qRpContent").val("");
				alert("등록되었습니다.");
				getReplyList(qnaTr);
			},
			error: function(e){
				console.log(e);
			}
		})
	})
	
	/* 댓글수정취소 */
	$(document).on("click", ".btnCancel", function(){
		$(".qRpContent").empty();
		$(this).prevAll("input[name='qRpNo']").val("0");							
		$(this).prevAll("input[name='writer']").val("${Auth.authNo}");	
		$(this).closest(".req-sub").find(".btnAdd").text("REGIST").removeClass().addClass("btnAdd"); //버튼변경
	})
	
	/* 댓글 수정 눌렀을때 수정쪽으로 쌰샤샥 */
	$(document).on("click", ".rBtnMod", function(){
		var dbCont = $(this).closest("li").find("pre").text();
		var rpNo = $(this).closest("li").attr("data-rpNo");
		var writer = $(this).closest("li").find("em").attr("data-mNo");
		
		$(this).closest(".req-sub").find(".btnAdd").text("MODIFY").removeClass().addClass("btnMod"); //버튼변경
		$(this).closest(".req-sub").find(".qRpContent").val(dbCont); //수정창에 내용 넣기
		$(this).closest(".req-sub").find("input[name='qRpNo']").val(rpNo); //리플번호 심기
		$(this).closest(".req-sub").find("input[name='writer']").val(writer); //작성자 정보 심기
	})
	
	/* 진짜 수정하자 */
	$(document).on("click", ".btnMod", function(){
		var qnaTr = $(this).closest("tr").prev(".show-sub");
		var rpNo = $(this).closest(".req-reply").find("input[name='qRpNo']").val();
		var content = $(this).prevAll(".qRpContent").val();
		
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
					getReplyList(qnaTr);
				}
			},
			error: function(e){
				console.log(e);
			}
		})
	})	
	
	
	/* 댓글삭제 */
	$(document).on("click", ".rBtnDel", function(){
		var qnaTr = $(this).closest("tr").prev(".show-sub");
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
						getReplyList(qnaTr);
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
	
	function getReplyList(obj){
		var $sub = $(obj).next(".req-sub");
		var qnaNo = $(obj).attr("data-qnaNo");
		
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/replies/"+qnaNo+"/",
			type: "get",
			dataType: "json",
			success: function(res){
				console.log(res);
				
				$(".added-li").remove();
				var source = $("#template").html();
				var func = Handlebars.compile(source);
				var str = func(res);
				
				//댓글 리스트 가져오기
				$sub.find(".rpList").append(str);
			},
			error: function(e){
				console.log(e);
			}
		})
	}
	
	
</script>

<%@ include file="../include/footer.jsp" %>