<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp" %>

<%
    // 선택된 사용자들의 ID 배열 받아오기
    String[] selectedUserIds = request.getParameterValues("selectedUsers");

    if (selectedUserIds != null && selectedUserIds.length > 0) {
        // 삭제 쿼리 실행
        try {
            for (String userId : selectedUserIds) {
                String deleteSql = "DELETE FROM ES_USER WHERE USER_ID = ?";
                PreparedStatement deleteStmt = conn.prepareStatement(deleteSql);
                deleteStmt.setString(1, userId);
                deleteStmt.executeUpdate();
            }
            out.println("<script>alert('선택된 사용자가 삭제되었습니다.');</script>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('삭제 중 오류가 발생했습니다.');</script>");
        } finally {
            // 리소스 해제
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        out.println("<script>alert('선택된 사용자가 없습니다.');</script>");
    }

    // 사용자 목록 페이지로 리다이렉트
    response.sendRedirect("UserBoard.jsp");
%>