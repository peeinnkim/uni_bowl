<%@page import="com.peeinn.domain.SeatGradeVO"%>
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
						<dt class="seatEx exActive"></dt>
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
				<input type="hidden" name="stThNo" value="${tempOres.org.orgThNo}">
				<c:if test="${list != null}">
					<c:set var="cName" value='<%=SeatGradeVO.getSgclassarr() %>'/>
					<c:forEach var="rowIdx" begin="0" end="${row-1}">
						<ul class="seat-row">
						 <c:forEach var="st" items="${list}" begin="${rowIdx*col}" end="${(rowIdx*col)+col-1}"> 
							<li>
								<a class='seat added-seat ${st.siOrg == tempOres.org.orgNo? cName[4]: cName[st.siSt.stSgNo]}' data-cNo='${st.siSt.stSgNo}' 
									data-stNo='${st.siSt.stNo}' onclick="getStInfo(this)">${st.siSt.stNm == '-'? '' : st.siSt.stNm}</a>
							</li> 
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
				<img src="${pageContext.request.contextPath}/admin/displayFile?fileName=${tempOres.pg.pgThumb}"><br>
				${tempOres.pg.pgTitle}
			</dd>
			
			<dt>상영관</dt>
			<dd>${tempOres.th.thNm} 관</dd>

			<dt>상영날짜</dt>
			<dd><fmt:formatDate value="${tempOres.org.orgDate}" pattern="yyyy년 MM월 dd일"/></dd>

			<dt>상영시간</dt>
			<c:set var="h" value="${fn:split(tempOres.org.orgStime, ':')}"/>
			<c:set var="m" value="${fn:split(tempOres.org.orgEtime, ':')}"/>
			<dd>${h[0]}:${h[1]} ~ ${m[0]}:${m[1]}</dd>
			
			<dt>선택좌석 <small>(총 <span id="cSeat-cnt">0</span>석 선택)</small></dt>
			<dd id="cSeat-box"></dd>

			<dt>금액</dt>
			<dd><span id="seat-price">0</span> 원</dd>
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
		if($("#cSeat-box").text() == "") { alert("좌석을 선택해주세요"); return;}
		var seatList = [];
		$(".seat-active").each(function(){
			seatList.push({
				"stNo" : $(this).attr("data-stNo"),
				"stNm" : $(this).text(),
				"stThNo" : $("input[name='stThNo']").val(),
				"stSgNo": $(this).attr("data-cNo")
			});
		})
		var price = removeComma($("#seat-price").text());
		
 		$.ajax({
			url: "${pageContext.request.contextPath}/user/rsv/step02",
			type: "post",
			data: JSON.stringify(seatList),
			headers: {"Content-Type":"application/json"},
			dataType: "text",
			success: function(res){
				console.log(res);
				
				if(res == "success") {
					location.href = "${pageContext.request.contextPath}/user/rsv/step03?pr="+price;
				}
			},
			error: function(e){
				console.log(e);
			}
		}) 
	})

</script>

<%@ include file="../../include/footer.jsp" %>

