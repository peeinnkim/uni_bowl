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
<link href="${pageContext.request.contextPath}/resources/css/user/common.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="container">
		<div id="header-wrap">
			<div class="header logo">
				<a href="#">宇宙漁缸</a>
			</div>
			
			<div class="header mem-menu">
				<ul>
					<li><a href="${pageContext.request.contextPath}/user/member/join">JOIN</a></li>
					<li><a href="${pageContext.request.contextPath}/user/member/login">LOGIN</a></li>
				</ul>
			</div>
			
			<div class="header nav">
				<ul>
					<li><a href="#">HOME</a></li>
					<li>
						<a>ABOUT</a>
						<ul>
							<li><a href="#">UNIVERSE FISH-BOWL</a></li>
							<li><a href="#">THEATER</a></li>
							<li><a href="#">PROGRAM</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/user/board/notice/list">NOTICE</a></li>
					<li><a href="${pageContext.request.contextPath}/user/board/qna/list">QnA</a></li>
					<li><a href="#">ONLINE SHOP</a></li>
				</ul>
			</div>
		</div>
		
		<div id="section">
			<div class="inner-section">

