<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Inquiry</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
PreparedStatement pstmt = null; // pstmt 정의
    try {
    	request.setCharacterEncoding("UTF-8");
        String inquiryType = request.getParameter("inquiryType");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String userId = (String)session.getAttribute("userId");
        String nickname = (String)session.getAttribute("nickname");

        // 쿼리 작성
        String sql = "INSERT INTO ES_SERVICE (POST_ID, INQUIRY_TYPE, TITLE, CONTENT, user_id,nickname) VALUES (SEQ_ES_SERVICE.NEXTVAL, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, inquiryType);
        pstmt.setString(2, title);
        pstmt.setString(3, content);
        pstmt.setString(4, userId);
        pstmt.setString(5, nickname);

        // 쿼리 실행
        int result = pstmt.executeUpdate();

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