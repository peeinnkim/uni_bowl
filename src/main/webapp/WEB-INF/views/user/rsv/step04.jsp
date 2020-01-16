<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/resources/css/user/rsv.css" type="text/css" rel="stylesheet">

<div class="section-title">
	<h1>STEP04</h1>
</div>

<div class="content-area">
	<div class="rsv-cpl-wrap">
		<div class="rsv-cpl-top">
			<h1>예약이 완료되었습니다</h1>
			<h2>예약번호: ${rRes.rrRsv.rsvNo}</h2>
		</div>
		<div class="rsv-cpl-bottom">
			<div class="cpl-info-wrap">
				<div class="cpl-info">
					<h3>예약 정보</h3>
					<ul>
						<li>
							<label>예약자</label>
							<span>${rRes.rrMem.mNm}</span>
						</li>
						<li>
							<label>연락처</label>
							<span>${rRes.rrMem.mTel}</span>
						</li>
						<li>
							<label>이메일</label>
							<span>${rRes.rrMem.mMail}</span>
						</li>
					</ul>
				</div>
				
				<div class="cpl-info">
					<h3>상영 정보</h3>
					<ul>
						<li>
							<label>프로그램명</label>
							<span>${rRes.rrOres.pg.pgTitle}</span>
						</li>
						<li>
							<label>상영관</label>
							<span>${rRes.rrOres.th.thNm} 관 (${rRes.rrOres.th.thFloor} 층)</span>
						</li>
						<li>
							<label>상영일시</label>
							<span><fmt:formatDate value="${rRes.rrOres.org.orgDate}" pattern="yyyy-MM-dd HH:mm"/></span>
						</li>
						<li>
							<label>좌석</label>
							<span>
								<c:forEach var="rSt" items="${rRes.rrRsv.rsvSeatList}">
									${rSt.stNm} 
								</c:forEach>
							</span>
						</li>
					</ul>
				</div>
				
				<div class="cpl-info">
					<h3>결제 정보</h3>
					<ul>
						<li>
							<label>결제금액</label>
							<span><fmt:formatNumber value="${rRes.rrPay.pyPrice}" pattern="###,###" /> 원</span>
						</li>
						<li>
							<label>카드종류</label>
							<span>${rRes.rrPay.pyType}</span>
						</li>
						<li>
							<label>카드번호</label>
							<c:set var="num" value="${fn:split(rRes.rrPay.pyNum, '-')}"></c:set>
							<span>${num[0]}-****-****-${num[3]}</span>
						</li>
						<li>
							<label>결제일시</label>
							<span><fmt:formatDate value="${rRes.rrPay.pyDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="comm-wrap">
			<div>어쩌구저쩌고 홍보홍보</div>
		</div>
	</div>
	<div class="btn-area">
		<a href="#" id="btnCancel">홈</a>
		<a href="#" id="btnNext">예약리스트</a>
	</div>
</div>		

<%@ include file="../../include/footer.jsp" %>

