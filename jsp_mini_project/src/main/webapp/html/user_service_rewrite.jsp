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

        form {
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
<%
	String postId = request.getParameter("postId");
	ResultSet rs = stmt.executeQuery("select * from es_service where post_id='"+postId+"'");
	rs.next();
%>

<div id="headerbox"></div>
<form action="reWriteServlet.jsp" method="post">
<h2>글 수정</h2>
<label for="inquiryType">문의 종류:</label>
<select id="inquiryType" name="inquiryType">
    <option value="상품문의" <%= rs.getString("INQUIRY_TYPE").equals("상품문의") ? "selected" : "" %>>상품문의</option>
    <option value="주문/결제 문의" <%= rs.getString("INQUIRY_TYPE").equals("주문/결제 문의") ? "selected" : "" %>>주문/결제 문의</option>
    <option value="취소/반품/교환 문의" <%= rs.getString("INQUIRY_TYPE").equals("취소/반품/교환 문의") ? "selected" : "" %>>취소/반품/교환 문의</option>
</select>
<br>

<label for="title">제목:</label>
<input type="text" id="title" name="title" value="<%= rs.getString("TITLE") %>" required>
<br>

<label for="content">내용:</label>
<textarea id="content" name="content" rows="4" cols="50" required><%= rs.getString("CONTENT") %></textarea>
<br>

<input type="hidden" name="postId" value="<%= postId %>"> <!-- postId를 hidden으로 전달 -->
<input type="submit" value="글 수정">
</form>

</body>
</html>