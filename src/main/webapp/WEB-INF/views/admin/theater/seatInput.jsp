<%@page import="java.util.HashMap"%>
<%@page import="com.peeinn.domain.SeatGradeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/admin/theater.css" type="text/css" rel="stylesheet">
<style>
	.error {
		margin-top: 14px;
	    color: yellow;
	    font-size: 14px;
    }
</style>
<script src="${pageContext.request.contextPath}/resources/js/modifySeat.js"></script>

<h2>상영관 추가</h2>
<input type="hidden" name="pName" value="${pageContext.request.contextPath}">

<div class="content-wrap">
	<div class="cont-center">
		<div class="crted-th-wrap" style="display:block;">
			<input type="hidden" id="cThNo" value="${th.thNo}">
			<p>
				<label>상영관명</label>
				<span><em id="cThName">${th.thNm}</em> 관</span>
			</p>
			<p>
				<label>수용인원</label>
				<span><em id="cThCnt">${th.thSeatCnt}</em> 명</span>
			</p>
			<p>
				<label>위치</label>
				<span><em id="cThFloor">${th.thFloor}</em> 층</span>
			</p>
		</div>
		
		<div class="crt-seat-pre" style="display:block;">
			<h2>좌석 설정</h2>
			<label>전체좌석<br>(복도포함)</label>
			<span>
				<input type="text" name="thRow" maxlength="3" id="rows" class="ipNum" placeholder="열"> X 
				<input type="text" name="thCol" maxlength="3" id="cols" class="ipNum" placeholder="행">
				<button id="crtStBtn" type="button">좌석생성</button>
			</span>
		</div>
		
		<div class="crt-seat-wrap" style="display:block;">
			<div class="seat-div">
				<h2>좌석 등급</h2>
				<div>
					<dl>
						<dt class="seatEx seat-empty" data-cNm="seat-empty" data-cNo="1" onclick="getCName(this)"></dt>
						<dd>일반석</dd>
					</dl>
					<dl>
						<dt class="seatEx premiumSingle-empty" data-cNm="premiumSingle-empty" data-cNo="2" onclick="getCName(this)"></dt>
						<dd>프리미엄 싱글석</dd>
					</dl>
					<dl>
						<dt class="seatEx premiumDouble-empty" data-cNm="premiumDouble-empty" data-cNo="3" onclick="getCName(this)"></dt>
						<dd>프리미엄 더블석</dd>
					</dl>
					<dl>
						<dt class="seatEx seat-disabled" data-cNm="seat-disabled" data-cNo="5" onclick="getCName(this)"></dt>
						<dd>비좌석</dd>
					</dl>
				</div>
			</div>
			
			<div class="seat-save-wrap">
				<div class="ss-cnt-wrap">
					<input type="hidden" value="${col * row}" id="curTotalSeatCnt">
					현재 좌석 수 : <span id='curSeatCnt'>${th.thSeatCnt}</span> 석
				</div>
				<span>FRONT</span>
				<div class="ss-btn-wrap">
					<c:if test="${rsved == null}">
						<button id="btnLabel" type="button">설정 완료</button>
					</c:if>
					<c:if test="${rsved != null}">
						<p class="error">해당 상영관에 예약된 좌석이 있어 수정, 삭제가 불가능합니다.</p>
					</c:if>
				</div>
			</div>
			
			<div id="show-seat-wrap">
				<input type="hidden" name="stThNo">
				<div style="width:${col * 24}px;">
				<c:if test="${list != null}">
					<c:set var="cName" value='<%=SeatGradeVO.getSgclassarr() %>'/>
						<c:forEach var="rowIdx" begin="0" end="${row-1}">
						<ul class="seat-row">
						 <c:forEach var="st" items="${list}" begin="${rowIdx*col}" end="${(rowIdx*col)+col-1}"> 
							<li><a class='seat added-seat ${cName[st.stSgNo]}' data-cNo='${st.stSgNo}' data-stNo='${st.stNo}'>${st.stNm}</a></li> 
						 </c:forEach> 
						</ul>
					</c:forEach> 
				</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>

