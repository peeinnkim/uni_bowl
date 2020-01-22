<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
		<h1>400 에러가 발생하였습니다.</h1>
	</c:if>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 403}">
		<h1>403 에러가 발생했습니다.</h1>
	</c:if>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
		<h1>404 에러가 발생했습니다.</h1>
	</c:if>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
		<h1>405 에러가 발생했습니다.</h1>
	</c:if>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
		<h1>500 에러가 발생했습니다.</h1>
	</c:if>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
		<h1>503 에러가 발생했습니다.</h1>
	</c:if>
</body>
</html>