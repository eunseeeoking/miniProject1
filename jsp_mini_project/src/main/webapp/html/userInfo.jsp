<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<%@include file="dbconn.jsp" %>

<%
	String userId = request.getParameter("userId");
	ResultSet rs = stmt.executeQuery("select * from es_user where user_id = '"+userId+"'");
	if(rs.next()){
		session.setAttribute("userId", rs.getString("user_id"));
        session.setAttribute("userName", rs.getString("user_name"));
        
        // Birth_date를 -로 나누어 년, 월, 일로 나누어 세션에 저장
        String birthDate = rs.getString("Birth_date");
        String[] dateParts = birthDate.split("-");
        session.setAttribute("year", dateParts[0]);
        session.setAttribute("month", dateParts[1]);
        session.setAttribute("day", dateParts[2]);
        
        session.setAttribute("gender", rs.getString("gender"));
        // 비밀번호는 보안상의 이유로 세션에 저장하지 않음
        // session.setAttribute("password", rs.getString("PWD"));
        session.setAttribute("email", rs.getString("EMAIL"));
        session.setAttribute("nickname", rs.getString("NICKNAME"));
        session.setAttribute("POSTADDR1", rs.getString("POSTADDR1"));
        session.setAttribute("POSTADDR2", rs.getString("POSTADDR2"));
        session.setAttribute("POSTADDR3", rs.getString("POSTADDR3"));
        session.setAttribute("PHONENUM1", rs.getString("PHONENUM1"));
        session.setAttribute("PHONENUM2", rs.getString("PHONENUM2"));
        session.setAttribute("PHONENUM3", rs.getString("PHONENUM3"));
        
        response.sendRedirect("userInfoSet.jsp");
	}
	
%> --%>