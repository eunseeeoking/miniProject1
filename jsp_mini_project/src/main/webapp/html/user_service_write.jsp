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


<div id="headerbox"></div>
<form action="WriteServlet.jsp" method="post">
<h2>문의 작성</h2>
    <label for="inquiryType">문의 종류:</label>
    <select id="inquiryType" name="inquiryType">
        <!-- 여기에 문의 종류 옵션들 추가 -->
        <option value="상품문의">상품문의</option>
        <option value="주문/결제 문의">주문/결제 문의</option>
        <option value="취소/반품/교환 문의">취소/반품/교환 문의</option>
    </select>
    <br>

    <label for="title">제목:</label>
    <input type="text" id="title" name="title" required>
    <br>

    <label for="content">내용:</label>
    <textarea id="content" name="content" rows="4" cols="50" required></textarea>
    <br>

    <input type="submit" value="글 작성">
</form>

</body>
</html>