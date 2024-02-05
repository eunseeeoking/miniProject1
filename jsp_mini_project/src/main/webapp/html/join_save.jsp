<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
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
	String addr1 = request.getParameter("postAddr1");
	String addr2 = request.getParameter("postAddr2");
	String addr3 = request.getParameter("postAddr3");
	String addr = addr1 + " " + addr2 + " " + addr3;

	String areaCode = request.getParameter("areaCode");
	String firstPart = request.getParameter("firstPart");
	String secondPart = request.getParameter("secondPart");

	String phoneNumber = areaCode + firstPart + secondPart;

	// year, month, day를 합쳐서 birth_date 생성
	String birthDate = year + "-" + month + "-" + day;
	String sql = "INSERT INTO ES_USER (user_name, birth_date, gender, user_id, PWD, email, nickname, addr, phone, postAddr1, postAddr2, postAddr3,phonenum1,phonenum2,phonenum3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userName);
	pstmt.setString(2, birthDate);
	pstmt.setString(3, gender);
	pstmt.setString(4, userId);
	pstmt.setString(5, password);
	pstmt.setString(6, email);
	pstmt.setString(7, nickname);
	pstmt.setString(8, addr);
	pstmt.setString(9, phoneNumber);
	pstmt.setString(10, addr1);
	pstmt.setString(11, addr2);
	pstmt.setString(12, addr3);
	pstmt.setString(13, areaCode);
	pstmt.setString(14, firstPart);
	pstmt.setString(15, secondPart);
	pstmt.executeQuery();
	%>

	<div></div>
</body>
</html>
<script>
	location.href = "main.jsp"
</script>