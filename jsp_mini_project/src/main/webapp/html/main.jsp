<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- jQuery 1.12.4 버전 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        #main {
            width: 100vw;
            height: 100vh;
            background: url('img/test3.jpg') center/cover no-repeat; /* 이미지 경로 설정 */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #ffffff; /* 텍스트 색상 설정 */
            font-size: 2em;
            font-weight: bold;
            text-align: center;
        }

        #logoutButton {
            margin-top: 20px;
            padding: 10px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<%@ include file="hader.jsp" %>
<body>
    <div id="main">
        <!-- 세션에서 아이디를 가져와 출력 -->
        <% 
            String nickname = (String)session.getAttribute("nickname");
            if(nickname != null) {
                out.println("<p>Welcome, " + nickname + "!</p>");
            }
        %>
        <!-- 내용을 추가하려면 이곳에 내용을 입력하세요. -->
        홈페이지 내용을 이곳에 추가하세요.
    </div>

    <!-- jQuery 1.12.4 버전 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <script>
        $(document).ready(function() {
            // Logout 버튼 클릭 시 세션 삭제
            $("#logoutButton").click(function() {
                $.ajax({
                    type: "POST",
                    url: "logoutProcess.jsp",
                    success: function(response) {
                        if (response.trim() === "success") {
                            alert("로그아웃 성공!");
                            window.location.replace("login.jsp");
                        } else {
                            alert("로그아웃 실패!");
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>