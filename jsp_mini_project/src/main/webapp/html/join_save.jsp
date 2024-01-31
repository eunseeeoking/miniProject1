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
	String userName = request.getParameter("userName");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String gender = request.getParameter("gender");
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");

	// year, month, day를 합쳐서 birth_date 생성
	String birthDate = year + "-" + month + "-" + day;
	 String sql = "INSERT INTO ES_USER (user_name, birth_date, gender, user_id, PWD, email, nickname) VALUES (?, ?, ?, ?, ?, ?, ?)";
	 PreparedStatement pstmt = conn.prepareStatement(sql);
	 pstmt.setString(1, userName);
	 pstmt.setString(2, birthDate);
	 pstmt.setString(3, gender);
	 pstmt.setString(4, userId);
	 pstmt.setString(5, password);
     pstmt.setString(6, email);
     pstmt.setString(7, nickname);
     pstmt.executeQuery();
	
	
	%>
	<div>
	저장완료
	</div>
</body>
</html>
<script>
location.href="main.jsp"
</script>