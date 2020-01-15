<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/rsv.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>STEP02</h1>
</div>

<div class="content-area">
	<div class="rsv-left">
		<div class="seat-area">
			<div class="seat-notice">
				어쩌구저쩌구 공지사항
			</div>
			
			<div class="seat-div">
				<h2>좌석 등급</h2>
				<div>
					<dl>
						<dt class="seatEx seat-empty"></dt>
						<dd>예약가능</dd>
					</dl>
					<dl>
						<dt class="seatEx premiumSingle-empty"></dt>
						<dd>프리미엄 싱글</dd>
					</dl>
					<dl>
						<dt class="seatEx premiumDouble-empty"></dt>
						<dd>프리미엄 더블</dd>
					</dl>
					<dl>
						<dt class="seatEx seat-active"></dt>
						<dd>현재 선택한 좌석</dd>
					</dl>
					<dl>
						<dt class="seatEx seat-none"></dt>
						<dd>예약불가</dd>
					</dl>
				</div>
			</div>
			
			<div class="seat-img" style="width:${col * 24}px;"></div>
			<div class="seat-icons" style="width:${col * 24}px;">
				<input type="hidden" name="stThNo">
				<c:if test="${list != null}">
					<c:set var="cName" value='<%=new String[]{"", "seat-empty", "premiumSingle-empty", "premiumDouble-empty", "seat-none", "seat-disabled"} %>'/>
						<c:forEach var="rowIdx" begin="0" end="${row-1}">
						<ul class="seat-row">
						 <c:forEach var="st" items="${list}" begin="${rowIdx*col}" end="${(rowIdx*col)+col-1}"> 
							<li><a class='seat ${cName[st.stSgNo]} added-seat' data-cNo='${st.stSgNo}' onclick="getStInfo(this)">${st.stNm == '-'? '' : st.stNm}</a></li> 
						 </c:forEach> 
						</ul>
					</c:forEach> 
				</c:if>
			</div>
		</div>
		
		<div class="btn-area">
			<a id="btnCancel">취소</a>
			<a id="btnNext">다음</a>
		</div>
	</div>

	<div class="rsv-right">
		<dl>
			<dt>프로그램명</dt>
			<dd>
				<img src="${pageContext.request.contextPath}/admin/intranet/displayFile?fileName=${tempOres.pg.pgThumb}"><br>
				${tempOres.pg.pgTitle}
			</dd>
			
			<dt>상영관</dt>
			<dd>${tempOres.th.thNm} 관</dd>

			<dt>상영날짜</dt>
			<dd><fmt:formatDate value="${tempOres.org.orgDate}" pattern="yyyy년 MM월 dd일"/></dd>

			<dt>상영시간</dt>
			<dd><fmt:formatDate value="${tempOres.org.orgDate}" pattern="HH:mm ~"/></dd>
			
			<dt>선택좌석 <small>(총 <span id="cSeat-cnt">0</span>석 선택)</small></dt>
			<dd id="cSeat-box"></dd>
		</dl>
		<fmt:formatDate var="sDateSaver" value="${tempOres.org.orgDate}" pattern="yyyy-MM-dd"/>
	</div>
</div>	

<script src="${pageContext.request.contextPath}/resources/js/rsv.js"></script>
<script>
	$("#btnCancel").click(function(){
		location.href = "${pageContext.request.contextPath}/user/rsv/step01?sDate=${sDateSaver}";
	})
	
	$("#btnNext").click(function(){
		var seatList = $("#cSeat-box").text().split(" ");
		
 		$.ajax({
			url: "${pageContext.request.contextPath}/user/rsv/step02",
			type: "post",
			data: JSON.stringify(seatList),
			headers: {"Content-Type":"application/json"},
			dataType: "text",
			success: function(res){
				console.log(res);
				
				if(res == "success") {
					location.href = "${pageContext.request.contextPath}/user/rsv/step03";
				}
			},
			error: function(e){
				console.log(e);
			}
		}) 
	})

</script>

<%@ include file="../../include/footer.jsp" %>
