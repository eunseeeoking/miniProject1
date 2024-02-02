<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="hader.jsp" %>
<head>
    <title>Login Page</title>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#loginButton").click(function() {
                var id = $("#id").val();
                var password = $("#password").val();

                $.ajax({
                    type: "POST",
                    url: "loginProcess.jsp",
                    data: {id: id, password: password},
                    success: function(response) {
                        if (response.trim() === "failure") {
                            alert("로그인 실패!");
                        } else {
                            // 로그인 성공 시 리다이렉트
                            window.location.href = "main.jsp";
                        }
                    }
                });
            });
        });
    </script>
    <style>
    form{
    	width: 500px;
        height: 500px;
        border-radius: 5%;
        text-align: center;
        color: #000000;
        font-weight: bold;
        line-height: 100px;
        font-size: 25px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        border: 1px solid;
        background-color: rgba(255,255,255,0.3);
    }
    body {
            margin: 0;
            padding: 0;
        }

        #main {
            width: 100vw;
            height: 100vh;
            background: url('img/test5.jpg') center/cover no-repeat; /* 이미지 경로 설정 */
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ffffff; /* 텍스트 색상 설정 */
            font-size: 2em;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
   <div id="main">
    <form>
     <h2>로그인</h2>
        아이디: <input type="text" id="id"><br>
        비밀번호: <input type="password" id="password"><br>
        <button type="button" id="loginButton">Login</button>
    </form>
    </div>
</body>
</html>