<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/admin/common.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
</head>
<body>
	<div id="container">
		<div class="header">
			<h1>INTRANET</h1>
		</div>
	
		<div class="intra-nav">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/intranet/sales">매출관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/intranet/sales">예약관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/intranet/program/list">프로그램관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/intranet/theater/list">상영관관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/intranet/member?memCode=0">회원관리</a></li>
			</ul>
		</div>
		
		<div class="intra-content">