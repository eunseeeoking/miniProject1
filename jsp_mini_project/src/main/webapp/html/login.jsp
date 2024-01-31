<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="hader.jsp" %>
<form action="loginCheck.jsp" method="post">
    <label for="userId">User ID:</label>
    <input type="text" id="userId" name="userId" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <input type="submit" value="로그인">
</form>
</body>
</html>