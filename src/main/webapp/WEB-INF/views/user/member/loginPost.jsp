<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.removeAttribute("dest");
	System.out.println("세션삭제완료");
	System.out.println(session.getAttribute("Auth"));
%>
