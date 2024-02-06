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
       String query = "SELECT * FROM es_user WHERE user_id = ?";
       pstmt = conn.prepareStatement(query);
       pstmt.setString(1, id);
       ResultSet rs = pstmt.executeQuery();
		
       
       if (rs.next()) {
    	  /*  어드민 아이디로 접속할시 로그인 카운트를 세지 않을것. */
    	   if(rs.getString("user_type").equals("A")){
    		   pstmt.close();
        	   query = "SELECT * FROM es_user WHERE user_id = ? And pwd = ?";
        	   pstmt = conn.prepareStatement(query);
        	   pstmt.setString(1, id);
        	   pstmt.setString(2, password);
        	   rs = pstmt.executeQuery();
    	   	if(rs.next()){
    		// 로그인 성공 시 세션에 아이디 저장
               session.setAttribute("userId", id);
               session.setAttribute("nickname", rs.getString("nickname"));
               session.setAttribute("user_type", rs.getString("user_type"));
               String updateFailCntQuery = "UPDATE es_user SET failcnt = 0 WHERE user_id = ?";
   		   	   pstmt = conn.prepareStatement(updateFailCntQuery);
   		       pstmt.setString(1, id);
   		       pstmt.executeUpdate();
               response.sendRedirect("main.jsp");
    		   
    	   	}else{
     		   out.print("noPWD");
     	   }
    	   }
    	   if(rs.getInt("failcnt") >= 5) {
    	    	// failcnt가 5 이상인 경우
    	  		    out.print("cantlogin");
    	       }else{
    	   pstmt.close();
    	   query = "SELECT * FROM es_user WHERE user_id = ? And pwd = ?";
    	   pstmt = conn.prepareStatement(query);
    	   pstmt.setString(1, id);
    	   pstmt.setString(2, password);
    	   rs = pstmt.executeQuery();
    	   if(rs.next()){
    		// 로그인 성공 시 세션에 아이디 저장
               session.setAttribute("userId", id);
               session.setAttribute("nickname", rs.getString("nickname"));
               session.setAttribute("user_type", rs.getString("user_type"));
               String updateFailCntQuery = "UPDATE es_user SET failcnt = 0 WHERE user_id = ?";
   		   	   pstmt = conn.prepareStatement(updateFailCntQuery);
   		       pstmt.setString(1, id);
   		       pstmt.executeUpdate();
               response.sendRedirect("main.jsp");
    		   
    	   }
    	   else{
    		   out.print("noPWD");
    		   String updateFailCntQuery = "UPDATE es_user SET failcnt = failcnt + 1 WHERE user_id = ?";
    		    pstmt = conn.prepareStatement(updateFailCntQuery);
    		    pstmt.setString(1, id);
    		    pstmt.executeUpdate();
    	   }
    	       }
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