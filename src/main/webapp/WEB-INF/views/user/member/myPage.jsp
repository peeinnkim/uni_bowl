<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>

<style>
	.form-wrap {
		background: white;
		width: 90%;
		padding: 20px;
		margin: 0 auto;
	}
	.mp-top {
		overflow: hidden;
    	padding: 35px 30px;
    	border-top: 2px solid #000;
    	border-bottom: 1px solid #ccc;
	}
	.mp-top > h1 {
	    font-size: 35px;
    	font-weight: normal;
	}
	.mp-top > h1 > small {
		font-size: 20px;
	}
	#mod-info {
	    width: 27px;
	    height: 27px;
	    display: inline-block;
	    background: url(/uni_bowl/resources/img/settings.png) no-repeat center;
	    background-size: contain;
	    vertical-align: baseline;
	}
	.mp-bottom {
	    padding: 35px 30px;
    	border-bottom: 1px solid #ccc;
	}
	.mp-bottom > table {
		border-collapse: collapse;
		width: 100%;
		margin: 0 auto;
	}
	.mp-bottom > table td,
	.mp-bottom > table th  {
		border: 1px solid black;
		padding: 3px;
	}
</style>

<div class="section-title">
	<h1>MY PAGE</h1>
</div>

<div class="content-area">
	<div class="form-wrap">
		<div class="mp-top">
			<h1>김멤버<small> 님</small>
			<a href="${pageContext.request.contextPath}/user/member/modify" id="mod-info"></a>
			</h1>		
		</div>
		<div class="mp-bottom">
			<div class="rsv-info">
				진행중 예약: 3건
				<a href="#">전체보기</a>
			</div>
			<table>
				<tr>
					<th>예약번호</th>
					<th>프로그램명</th>
					<th>상영날짜</th>
					<th>취소하기</th>
				</tr>
				<tr>
					<td>1234</td>
					<td>어쩌구저쩌구 이런 프로그램</td>
					<td>2020-01-03 14:30</td>
					<td><button>취소</button></td>
				</tr>
			</table>
		</div>
	</div>
</div>	

<%@ include file="../../include/footer.jsp" %>
