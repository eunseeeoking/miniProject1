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
    <title>Notice List</title>
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
        }#red{
        background-color: red; 
        }
    </style>
</head>
<body>
<%@ include file="hader.jsp" %>
<div id="headerbox"></div>
<div class="container">
    <h2 class="mb-4">공지사항</h2>
    <%
    user_type = (String) session.getAttribute("user_type");
    if (user_type != null && user_type.equals("A")) { %>
    <input type="button" class="btn btn-primary" onclick="notice_write()" value="글쓰기">
<%} %>
    <%-- Fetch Notice List from Database --%>
    <%
        List<Map<String, Object>> noticeList = new ArrayList<>();
        try {
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String username = "system";
            String password = "test1234";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, username, password);

            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM ES_NOTICE ORDER BY POST_DATE DESC";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Map<String, Object> notice = new HashMap<>();
                notice.put("POST_ID", rs.getInt("POST_ID"));
                notice.put("TITLE", rs.getString("TITLE"));
                notice.put("CONTENT", rs.getString("CONTENT"));
                notice.put("USER_ID", rs.getString("USER_ID"));
                notice.put("POST_DATE", rs.getDate("POST_DATE"));
                notice.put("NICKNAME", rs.getString("NICKNAME"));
                noticeList.add(notice);
                
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>

    <%-- Display Notice List --%>
    <%
        for (Map<String, Object> notice : noticeList) {
        	String content = (String) notice.get("CONTENT");
            if (content.length() > 50) {
                content = content.substring(0, 50) + " ...중략";
            }
    %>
            <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><%= notice.get("TITLE") %></h5>
            </div>
            <div class="card-body">
                <p class="card-text"><%= content %></p>
                <p class="text-muted">작성자 <%= notice.get("USER_ID") %> (<%= notice.get("NICKNAME") %>)
                    on <%= notice.get("POST_DATE") %></p>
                <% 
                    
                    if (user_type != null && user_type.equals("A")) { 
                %>
                    <a href="notice_detail.jsp?post_id=<%= notice.get("POST_ID") %>" class="btn btn-primary">자세히보기</a>
                    <input type="button" onclick="postdelete('<%= notice.get("POST_ID") %>')" class="btn btn-primary" id="red" value="삭제하기">
                <% } else { %>
                    <a href="notice_detail.jsp?post_id=<%= notice.get("POST_ID") %>" class="btn btn-primary">자세히보기</a>
                <% } %>
            </div>
        </div>
<%
    }
%>
</div>
<!-- Bootstrap JS and dependencies (Add at the end of the document) -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
<%@ include file="footer.jsp" %>
<script>
	function notice_write() {
		location.href="notice_write.jsp";
	}
	function postdelete(POST_ID) {
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="notice_delete.jsp?post_id="+POST_ID;
		}
		
	}
</script>

