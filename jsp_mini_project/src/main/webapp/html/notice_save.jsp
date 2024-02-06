<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String userId = (String)session.getAttribute("userId");
    String nickname = (String)session.getAttribute("nickname");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // JDBC 연결 코드 (드라이버 로딩, 커넥션 생성)
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String dbUser = "system";
        String dbPassword = "test1234";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // SQL 쿼리 작성
        String sql = "INSERT INTO ES_NOTICE (POST_ID, TITLE, CONTENT, USER_ID, NICKNAME) VALUES (SEQ_ES_NOTICE.NEXTVAL, ?, ?, ?, ?)";
        
        // PreparedStatement 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, userId);
        pstmt.setString(4, nickname);

        // 쿼리 실행
        int result = pstmt.executeUpdate();

        if (result > 0) {
            // 공지사항 작성 성공
            response.sendRedirect("notice_list.jsp");
        } else {
            // 공지사항 작성 실패
            response.getWriter().println("<script>alert('공지사항 작성에 실패했습니다.');</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        // 예외 처리
        response.getWriter().println("<script>alert('공지사항 작성 중 오류가 발생했습니다.');</script>");
    } finally {
        // 리소스 해제
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>