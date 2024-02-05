<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">


<%@ include file="dbconn.jsp"%>
<%
	String postId = request.getParameter("postId");
	String sql = "UPDATE ES_SERVICE SET STATUS ='처리완료' WHERE POST_ID ='"+postId+"'";
	stmt.executeUpdate(sql);
	response.sendRedirect("user_service.jsp");
%>