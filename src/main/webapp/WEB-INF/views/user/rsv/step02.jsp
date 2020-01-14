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
			<div class="seat-div">
				<dl>
					<dt class="seat seat-empty"></dt>
					<dd>빈 좌석</dd>
				</dl>

				<dl>
					<dt class="seat premiumSingle-empty"></dt>
					<dd>프리미엄 싱글석</dd>
				</dl>
				<dl>
					<dt class="seat premiumDouble-empty"></dt>
					<dd>프리미엄 더블석</dd>
				</dl>
				<dl>
					<dt class="seat seat-active"></dt>
					<dd>현재 선택한 좌석</dd>
				</dl>
				<dl>
					<dt class="seat seat-none"></dt>
					<dd>이미 예약된 좌석</dd>
				</dl>
			</div>
			
			<div class="seat-img"></div>
			<div class="seat-icons" style="width:${col * 24}px;">
				<input type="hidden" name="stThNo">
				<c:if test="${list != null}">
					<c:set var="cName" value='<%=new String[]{"", "seat-empty", "premiumSingle-empty", "premiumDouble-empty", "seat-none", "seat-disabled"} %>'/>
						<c:forEach var="rowIdx" begin="0" end="${row-1}">
						<ul class="seat-row">
						 <c:forEach var="st" items="${list}" begin="${rowIdx*col}" end="${(rowIdx*col)+col-1}"> 
							<li><a class='seat ${cName[st.stSgNo]} added-seat' data-cNo='${st.stSgNo}'>${st.stNm}</a></li> 
						 </c:forEach> 
						</ul>
					</c:forEach> 
				</c:if>
			</div>
			
			
		</div>
		<div class="btn-area">
			<a href="#" id="btnCancel">취소</a>
			<a href="#" id="btnNext">다음</a>
		</div>
	</div>

	<div class="rsv-right">
		<dl>
			<dt>프로그램명</dt>
			<dd>Finding Aurora</dd>
			
			<dt>상영관</dt>
			<dd>DOME 2</dd>

			<dt>상영날짜</dt>
			<dd>2020년 09월 24일 (목)</dd>

			<dt>상영시간</dt>
			<dd>18:00~</dd>
		</dl>
	</div>
</div>	


<%@ include file="../../include/footer.jsp" %>

