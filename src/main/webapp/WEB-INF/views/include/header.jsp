<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>宇宙魚缸·Univish-Bowl</title>
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
					<c:if test="${Auth == null}">
						<li><a href="${pageContext.request.contextPath}/user/member/join">JOIN</a></li>
						<li><a href="${pageContext.request.contextPath}/user/member/login">LOGIN</a></li>
					</c:if>
					<c:if test="${Auth != null}">
						<li class="onLogin id-area">${Auth}님 <small>on</small></li>
						<li class="onLogin"><a href="${pageContext.request.contextPath}/user/member/myPage">MY PAGE</a></li>
					</c:if>
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
					<li><a href="${pageContext.request.contextPath}/admin/notice/list">NOTICE</a></li>
					<li><a href="${pageContext.request.contextPath}/user/qna/list">QnA</a></li>
					<li><a href="#">ONLINE SHOP</a></li>
				</ul>
			</div>
		</div>
		
		<div id="section">
			<div class="inner-section">

