<%@ include file="dbconn.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	String sql= "select * from es_user where user_Id ='"+userId+"'";
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()){
		sql += " and PWD = '"+password+"'";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			out.print("로그인 성공".trim());
		}else{
			out.print("비밀번호가 틀렸습니다.");
		}
	}else{
		out.print("아이디가 없습니다.");
	}
%>