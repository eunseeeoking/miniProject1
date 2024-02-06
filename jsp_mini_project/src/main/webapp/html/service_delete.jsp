<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="dbconn.jsp" %>
<%
	String postId= request.getParameter("postId");
	stmt.executeUpdate("delete es_service where post_Id='"+postId+"'");
%>
</body>
</html>
<script>

	location.href="user_service.jsp"
</script>