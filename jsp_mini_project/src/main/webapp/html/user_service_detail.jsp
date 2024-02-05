<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <%@ include file="hader.jsp" %>
    <%@ include file="dbconn.jsp" %>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0px;
        }

        h2 {
            color: #333;
        }

        .post-content {
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
        }

        .post-content p {
            line-height: 1.6;
        }
        #headerbox{
        	width: 100%;
        	height: 100px;
        	background-color:black; 
        }
    </style>
</head>
<body>
<div id="headerbox"></div>
    <div class="post-content">
        <h2>게시글 상세보기</h2>

        <% 
            String postId = request.getParameter("postId");
            String sql = "SELECT * FROM ES_SERVICE WHERE POST_ID = '" + postId + "'";
            ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next()) {
                String writer = rs.getString("USER_ID");
                String inquiryType = rs.getString("INQUIRY_TYPE");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                Date createDate = rs.getDate("POST_DATE");
        %>

        <p><strong>작성자:</strong> <%= writer %></p>
        <p><strong>문의 종류:</strong> <%= inquiryType %></p>
        <p><strong>제목:</strong> <%= title %></p>
        <p><strong>작성일:</strong> <%= createDate %></p>
        
        <hr>
 <label><h2>문의 내용 : </h2></label>
        <div>
            <!-- 여기에 내용 표시 -->
           
            
            <%= content %>
        </div>

        <%
            }
        %>

    </div>

</body>
</html>