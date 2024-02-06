<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0px;
        }

        h2 {
            color: #333;
        }

        form ,#service{
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        select, input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            padding: 12px;
            background-color: #2196F3;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1565C0;
        }
        #headerbox{
        	width: 100%;
        	height: 100px;
        	background-color:black; 
        }
    </style>
</head>
</head>
<%@ include file="hader.jsp" %>
<%@ include file="dbconn.jsp" %>
<body>


<div id="headerbox"></div>
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
		<div id="service">
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


<form action="admin_coment_save.jsp" method="post">
<h2>답변 작성</h2>
    <label for="title">	제목:</label>
    <input type="text" id="title" name="title" required>
    <br>
	<input type="text" value="<%=postId%>" name ="postId" hidden>
    <label for="content">내용:</label>
    <textarea id="content" name="content" rows="4" cols="50" required></textarea>
    <br>
    <input type="submit" value="글 작성">
</form>

</body>
</html>