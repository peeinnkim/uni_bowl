<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<h2>회원관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<div>
			<ul id="mem-sel">
				<li><a href="#" class="on">회원</a></li>
				<li><a href="#">비회원</a></li>
			</ul>
		</div>
		
		<div>
			<select id="state-sel">
				<option>전체회원</option>
				<option>탈퇴회원</option>
			</select>
			
		</div>
		
		<table>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>탈퇴일</th>
			</tr>
			
			<c:forEach var="mem" items="${list}">
				<tr>
					<td>${mem.mNo}</td>
					<td>${mem.mId}</td>
					<td>${mem.mNm}</td>
					<td>${mem.mBirth}</td>
					<td>${mem.mTel}</td>
					<td>${mem.mMail}</td>
					<td>${mem.mRegDate}</td>
					<td>${mem.mQuitDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>


<script>
	$("#mem-sel > li > a").click(function(){
		
		$.ajax({
			url: 	
		})	
		
		
	})
	
	
</script>


<%@ include file="../include/footer.jsp" %>

