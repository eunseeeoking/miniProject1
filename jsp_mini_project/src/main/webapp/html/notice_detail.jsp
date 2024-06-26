<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Notice Detail</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
        }

        .card-body {
            padding: 20px;
        }
        #headerbox{
        	width: 100%;
        	height: 100px;
        	background-color:black; 
        }
    </style>
</head>
<body>
<%@ include file="hader.jsp" %>
<div id="headerbox"></div>
<div class="container">
    <h2 class="mb-4">공지 상세</h2>

    <%-- Fetch Notice Detail from Database --%>
    <%
        int postId = Integer.parseInt(request.getParameter("post_id"));
        Map<String, Object> notice = new HashMap<>();

        try {
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String username = "system";
            String password = "test1234";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "SELECT * FROM ES_NOTICE WHERE POST_ID = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, postId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    notice.put("POST_ID", rs.getInt("POST_ID"));
                    notice.put("TITLE", rs.getString("TITLE"));
                    notice.put("CONTENT", rs.getString("CONTENT"));
                    notice.put("USER_ID", rs.getString("USER_ID"));
                    notice.put("POST_DATE", rs.getDate("POST_DATE"));
                    notice.put("NICKNAME", rs.getString("NICKNAME"));
                } else {
                    // 해당 post_id에 대한 게시물이 없을 경우 처리
                    response.sendRedirect("error.jsp");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // 예외 처리
            response.sendRedirect("error.jsp");
        }
    %>

    <%-- Display Notice Detail --%>
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0"><%= notice.get("TITLE") %></h5>
        </div>
        <div class="card-body">
            <p class="card-text"><%= notice.get("CONTENT") %></p>
            <p class="text-muted">Posted by <%= notice.get("USER_ID") %> (<%= notice.get("NICKNAME") %>)
                on <%= notice.get("POST_DATE") %></p>
        </div>
    </div>

    <div class="text-center">
        <a href="notice_list.jsp" class="btn btn-primary">공지사항 목록으로 돌아가기</a>
    </div>
</div>

<!-- Bootstrap JS and dependencies (Add at the end of the document) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>
</html>
