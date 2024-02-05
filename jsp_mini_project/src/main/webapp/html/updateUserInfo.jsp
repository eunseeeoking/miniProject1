<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<%@ include file="dbconn.jsp" %>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<%
String userId = (String)session.getAttribute("userId");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String nickname = request.getParameter("nickname");
String postAddr1 = request.getParameter("postAddr1");
String postAddr2 = request.getParameter("postAddr2");
String postAddr3 = request.getParameter("postAddr3");
String phonePrefix = request.getParameter("phonePrefix");
String phoneMiddle = request.getParameter("phoneMiddle");
String phoneEnd = request.getParameter("phoneEnd");
String birthDate = year + "-" + month + "-" + day;
String addr = postAddr1+" "+postAddr2+" "+postAddr3;
String phoneNumber = phonePrefix + phoneMiddle + phoneEnd;
//Update 쿼리 작성
String updateQuery = "UPDATE ES_USER SET BIRTH_DATE=?, GENDER=?, NICKNAME=?, ADDR=?, PHONE=? WHERE USER_ID=?";

// PreparedStatement 객체 생성
PreparedStatement pstmt = conn.prepareStatement(updateQuery);
// 각각의 파라미터 값 설정

pstmt.setString(1, birthDate);
pstmt.setString(2, gender);
pstmt.setString(3, nickname);
pstmt.setString(4, addr);
pstmt.setString(5, phoneNumber);
pstmt.setString(6, userId);

// 쿼리 실행
 int result = pstmt.executeUpdate();

if (result > 0) {
    out.println("<script>alert('회원 정보가 업데이트되었습니다.'); location.href='UserBoard.jsp';</script>");
} else {
    out.println("<script>alert('회원 정보 업데이트에 실패했습니다.'); history.go(-1);</script>");
} 
%>
<%out.println(gender);out.println(nickname); %>
</html>