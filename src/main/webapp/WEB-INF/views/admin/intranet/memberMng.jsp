<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<h2>회원관리</h2>

<div class="content-wrap">
	<div class="cont-center">
		<div>
			<select>
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
		</table>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>

