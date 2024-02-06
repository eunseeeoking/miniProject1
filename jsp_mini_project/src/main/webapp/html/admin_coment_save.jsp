<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
    String postId = request.getParameter("postId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String userId = (String)session.getAttribute("userId");
    String nickname = (String)session.getAttribute("nickname");
	
	PreparedStatement pstmt = null;
    // Insert 쿼리 실행
    String sql = "INSERT INTO ES_COMMENT (CMT_ID, POST_ID, TITLE, CONTENT, USER_ID, NICKNAME, POST_DATE, LAST_MODIFIED_DATE) VALUES (es_comment_seq.nextval, ?, ?, ?, ?, ?, SYSDATE, SYSDATE)";
    try {
    	pstmt = conn.prepareStatement(sql); 
    			pstmt.setString(1, postId);
    			pstmt.setString(2, title);
    			pstmt.setString(3, content);
    			pstmt.setString(4, userId);
    			pstmt.setString(5, nickname);
    			int result = pstmt.executeUpdate();
    		stmt.executeUpdate("UPDATE ES_SERVICE SET STATUS ='처리완료' WHERE POST_ID = '"+postId+"'");
    			if (result > 0) {
    	            // 글 작성 성공
    				response.sendRedirect("user_service.jsp");
    	        } else {
    	            // 글 작성 실패
    	            response.getWriter().println("<script>alert('글 작성에 실패했습니다.');</script>");
    	        }
    		} catch (SQLException e) {
    	        e.printStackTrace();
    	        // 예외 처리
    	        response.getWriter().println("<script>alert('글 작성 중 오류가 발생했습니다.');</script>");
    	    } finally {
    	        // 리소스 해제
    	        try {
    	            if (pstmt != null) pstmt.close();
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	        }
    	    }
%>
</body>
</html>