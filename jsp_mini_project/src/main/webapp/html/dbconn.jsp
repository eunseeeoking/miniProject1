<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<%
	Connection conn;
	Statement stmt = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl?useUnicode=true&characterEncoding=UTF-8";
		String db_id = "system";
		String db_pw = "test1234";
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		stmt = conn.createStatement();
%>