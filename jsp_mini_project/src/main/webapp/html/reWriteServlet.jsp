<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
    // 요청 파라미터에서 제목, 내용, 게시글 ID, 문의 종류를 받아옵니다.
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String postId = request.getParameter("postId");
    String inquiryType = request.getParameter("inquiryType");

    try {
        // 게시글을 업데이트하는 SQL 쿼리를 작성합니다.
        String updateQuery = "UPDATE es_service SET TITLE=?, CONTENT=?, INQUIRY_TYPE=? WHERE POST_ID=?";
        // PreparedStatement를 사용하여 쿼리를 실행하기 위해 준비합니다.
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        // 쿼리에 필요한 파라미터를 설정합니다.
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, inquiryType);
        pstmt.setString(4, postId);
        // 쿼리를 실행합니다.
        pstmt.executeUpdate();
        // PreparedStatement를 닫습니다.
        pstmt.close();
        // DB 연결을 닫습니다.
        conn.close();

        // 수정이 완료되었으므로 사용자를 이전 페이지로 다시 리다이렉트합니다.
        response.sendRedirect("user_service.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        // 오류 발생 시 에러 메시지를 출력하고 이전 페이지로 돌아갑니다.
        response.sendRedirect("이전페이지.jsp?error=1");
    }
%>