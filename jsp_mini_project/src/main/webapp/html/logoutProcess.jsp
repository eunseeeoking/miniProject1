<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 세션 무효화
    session.invalidate();
    out.print("success");
    response.sendRedirect("main.jsp");
%>