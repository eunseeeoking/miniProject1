<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ page import="java.sql.*" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Write Notice</title>
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

        .form-group {
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }#headerbox{
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
    <h2 class="mb-4">공지 작성</h2>

    <form action="notice_save.jsp" method="post">
        <div class="form-group">
            <label for="title">제목:</label>
            <input type="text" class="form-control" id="title" name="title" maxlength="50" required>
        </div>

        <div class="form-group">
            <label for="content">내용:</label>
            <textarea class="form-control" id="content" name="content" rows="6" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">작성완료</button>
    </form>

    <div class="text-center mt-4">
        <a href="notice_list.jsp" class="btn btn-secondary">공지목록 돌아가기</a>
    </div>
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
