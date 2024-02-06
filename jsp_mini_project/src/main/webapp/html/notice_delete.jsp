<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String postId = request.getParameter("post_id");
	stmt.executeUpdate("DELETE ES_NOTICE WHERE POST_ID='"+postId+"'");
%>
</body>
</html>
<script>
location.href="notice_list.jsp";
</script>