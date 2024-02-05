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
                    	$("#idcheck").css("display", "block").addClass("shake");

                        // 1초 후에 애니메이션 클래스를 제거
                        setTimeout(function() {
                            $("#idcheck").removeClass("shake").css("display", "none");
                        }, 1000);
                    } else if (response.trim() === "noPWD") {
                    	$("#pwcheck").css("display", "block").addClass("shake");

                        // 1초 후에 애니메이션 클래스를 제거
                        setTimeout(function() {
                            $("#pwcheck").removeClass("shake").css("display", "none");
                        }, 1000);
                    } else if (response.trim() === "cantlogin") {
                    	$("#cantlogin").css("display", "block").addClass("shake");
                        setTimeout(function() {
                            $("#cantlogin").removeClass("shake");
                        }, 1000);
                    }
                    else {
                        // 로그인 성공 시 리다이렉트
                        window.location.href = "main.jsp";
                    }
                }
            });
        });

        // input 요소에 focus 이벤트 추가
        $("#id").focus(function() {
            $("#idcheck").css("display", "none");
            $("#cantlogin").css("display", "none");
        });
        $("#password").focus(function() {
            $("#pwcheck").css("display", "none");
            $("#cantlogin").css("display", "none");
        });
    });
    </script>
    <style>
    @keyframes shake {
    0%, 100% { transform: rotate(5deg); }
    25%, 75% { transform: rotate(-5deg); }
    50% { transform: rotate(5deg); }
}
	#cantlogin{
	display: none;
        color: red;
        animation: shake 0.5s ease-in-out; /* 흔들림 효과 적용 */
        transform-origin: 50% 50%; /* 중심을 기준으로 효과 적용 */
        position: absolute;
        top: 350px;
        left: 110px;
        height: 50px;
        line-height: 20px;
        cursor: default;
        font-weight: lighter;
	}
    #idcheck {
        display: none;
        color: red;
        animation: shake 0.5s ease-in-out; /* 흔들림 효과 적용 */
        transform-origin: 50% 50%; /* 중심을 기준으로 효과 적용 */
        position: absolute;
        top: 250px;
        left: 120px;
        height: 50px;
        line-height: 0;
        cursor: default;
        font-weight: lighter;
        
    }
    #pwcheck{
    	display: none;
        color: red;
        animation: shake 0.5s ease-in-out; /* 흔들림 효과 적용 */
        transform-origin: 50% 50%; /* 중심을 기준으로 효과 적용 */
        position: absolute;
        top: 350px;
        left: 110px;
        height: 50px;
        line-height: 0;
        cursor: default;
        font-weight: lighter;
    }
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
        #loginButton{
        	width: 150px;
        	height: 30px;
        	border-radius: 45px;
        	border: 1px solid black;
        	cursor: pointer;
        }
        #loginButton:hover{
        	background-color: rgba(77, 77, 77,0.5);
        	transition: 500ms;
        }#joinButton:hover{
        background-color: rgba(77, 77, 77,0.5);
        	transition: 500ms;
        	cursor: pointer;
        }
    </style>
</head>
<body>
   <div id="main">
    <form>
     <h2>customer care WEB😋</h2>
        아이디: <input type="text" id="id"><br>
        <div id="idcheck">아이디를 확인해 주세요</div>
        비밀번호: <input type="password" id="password"><br>
        <div id="pwcheck">비밀번호를 확인해 주세요</div>
        <div id="cantlogin">비밀번호를 5회 이상 틀리셨습니다. <br>관리자에게 문의하세요</div>
        <button type="button" id="loginButton">로그인</button><br>
        <input type="button" id="joinButton" onclick="joinbtn()" value="회원가입">
    </form>
    </div>
</body>
</html>
<script>

	function joinbtn() {
		location.href="join.jsp";
	}
</script>