<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
   String id = request.getParameter("id");
   String password = request.getParameter("password");

   Connection conn = null;
   PreparedStatement pstmt = null;

   try {
       Class.forName("oracle.jdbc.driver.OracleDriver");
       String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
       String db_id = "system";
       String db_pw = "test1234";
       conn = DriverManager.getConnection(db_url, db_id, db_pw);

       // PreparedStatement 사용
       String query = "SELECT * FROM es_user WHERE user_id = ? AND pwd = ?";
       pstmt = conn.prepareStatement(query);
       pstmt.setString(1, id);
       pstmt.setString(2, password);

       ResultSet rs = pstmt.executeQuery();

       if (rs.next()) {
           // 로그인 성공 시 세션에 아이디 저장
           session.setAttribute("userId", id);
           session.setAttribute("nickname", rs.getString("nickname"));
           response.sendRedirect("main.jsp");
       } else {
           out.print("failure");
       }
   } catch (Exception e) {
       e.printStackTrace();
   } finally {
       try {
           if (pstmt != null) pstmt.close();
           if (conn != null) conn.close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
   }
%>