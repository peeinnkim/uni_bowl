<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>宇宙魚缸·Uni-Bowl</title>
<link href="${pageContext.request.contextPath}/resources/css/user/common.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="container">
		<div id="header-wrap">
			<div class="header logo">
				<a href="${pageContext.request.contextPath}"></a>
			</div>
			
			<div class="header mem-menu">
				<ul>
					<c:if test="${Auth == null}">
						<li><a href="${pageContext.request.contextPath}/user/member/join">JOIN</a></li>
						<li><a href="${pageContext.request.contextPath}/user/member/login">LOGIN</a></li>
					</c:if>
					<c:if test="${Auth != null}">
						<li class="onLogin id-area">
							${Auth.authId}님 <small>on</small>
							<a href="${pageContext.request.contextPath}/user/member/logout" id="logoutBtn"></a>
						</li>
						<li class="onLogin"><a href="${pageContext.request.contextPath}/user/member/myPage">MY PAGE</a></li>
					</c:if>
				</ul>
			</div>
			
			<div class="qRsv">
				<div class="ribbon-wrapper">
					<div class="ribbon-front">
						<a href="${pageContext.request.contextPath}/user/rsv/step01">RESERVATION</a>
					</div>
					<div class="ribbon-edge-topleft"></div>
					<div class="ribbon-edge-topright"></div>
					<div class="ribbon-edge-bottomleft"></div>
					<div class="ribbon-edge-bottomright"></div>
					<div class="ribbon-back-left"></div>
				</div>
			</div>
			
			<div class="header nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/user/rsv/step01">TIME TABLE</a></li>
					<li><a href="${pageContext.request.contextPath}/user/pg">PROGRAM</a></li>
					<li><a href="${pageContext.request.contextPath}/user/th">THEATER</a></li>
				</ul>
			</div>
			
			<div class="sub-nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/user/qna/list">Q＆A</a></li>
					<li><a href="${pageContext.request.contextPath}/user/notice/list">NOTICE</a></li>
				</ul>
			</div>
			
			<!-- <span class="uni-info"><a href="#">UNI-BOWL?</a></span> -->
			
		</div>
		
		<div id="section">
			<div class="inner-section">

