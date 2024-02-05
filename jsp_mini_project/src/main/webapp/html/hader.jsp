<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
     <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @font-face {
            font-family: 'HOHO';
            src: url('SDSamliphopangcheBasic.otf') format('truetype');
        }
      
        #header {
            width: 100%;
            height: 100px;
            background-color: rgba(219, 219, 219,0.1);
            position: absolute;
            top: 0;
            left: 0;
            display:block;
            color : #fff;
            z-index: 999;
        }

        #hader-top {
            width: 1000px;
            height: 40px;
            margin: 0 auto;
            position: relative;
        }

        .join a {
            text-decoration: none;
            color: black;
            font-weight: bold;
            margin: 0px 10px 0px 0px;
            text-align: center;
            right: 0px;
            display: inline-block;
        }
        .join a:hover{
            background-color: black;
        }

        #hader-top .join {
            position: absolute;
            top: 10px;
            right: 0px;
        }
        #hader-top a:hover{
            background-color: rgba(219, 219, 219,0.1);
        }

        #hader-bottom {
            width: 1000px;
            height: 60px;
            margin: 0 auto;
            line-height: 60px;
            position: relative;
        }
        #hader-bottom a{
            text-decoration: none;
           
            font-family: 'hoho';
            font-size: 30px;
        }
        #line{
            border-right: 1px solid;
            width: 0.01px;
            height: 20px;
            position: absolute;
            right: 81px;
            top: 0px
        }
        #logo{
            font-family: 'HOHO';
            font-size: 35px;
            margin-left: 30px;
            
            cursor: pointer;
            display: inline-block;
        }
        ul{
            position: absolute;
            top: 0;
            margin: 0;
            right: 0;
        }
        li {
            width: 150px;
            height: 60px;  
            text-align: center;      
            line-height: 60px;
            margin : 0;
            float: left;
            list-style: none;
        }
        .hader-bottom{
            display: block;
        }
        a:link, a:visited {
            color: #fff;
            text-decoration: none;
        }
        .menu, .sub-menu{
            background-color: rgba(219, 219, 219,0.1);
            width: 150px;
            box-shadow: 1px 3px 8px 3px #e7e3e3;
            display: none;
        }
        .menu a, .sub-menu a{
            display: block;
            padding : 10px;
            cursor: pointer;
        }
        .sub-top-menu {
            position: relative;
        }
        .sub-menu {
            position: absolute;
            top: 0px;
            left : 150px;
        }
        .top-menu:hover .menu, .sub-top-menu:hover .sub-menu{
            display: block;
        }
        .menu a:hover, .sub-menu a:hover {
            background-color: #ccc;
            transition: 500ms;
        }
        .top-menu:hover {
            background-color: #ccc;
            transition: 500ms;
        }
        #hader-top a:hover{
            background-color: #ccc;
            transition: 700ms;
        }
        
        #haderbox{
            width: 100%;
            height: 100px;
        }
    </style>
</head>
<body>
<%String user_type = (String)session.getAttribute("user_type"); %>
    <div id="header">
        <div id="hader-top">
            <div class="join">
                <!-- 세션에 아이디가 없을 때 -->
                <% if(session.getAttribute("userId") == null) { %>
                    <a href="login.jsp">로그인</a>
                    <div id="line"></div>
                    <a href="join.jsp">회원가입</a>
                <% } else { %>
                    <!-- 세션에 아이디가 있을 때 -->
                    <% out.print("<a href='userInfoSet.jsp?userId="+session.getAttribute("userId")+"'>"+session.getAttribute("nickname")+"</a>님 환영합니다");%>
                    <a href="logoutProcess.jsp">로그아웃</a>
                <% } %>
            </div>
        </div>
        <div id="hader-bottom">
            <div id="logo"><a href="main.jsp">고객관리(❁´◡`❁)</a></div>
            <ul>
                <li class="top-menu">
                    <a href="#">주문관리</a>
                    <div class="menu">
                        <div class="sub-top-menu">
                            <a>Menu 1</a>
                            <div class="sub-menu">
                                <a>Sub 1</a>
                                <a>Sub 2</a>
                            </div>
                        </div>
                        <div class="sub-top-menu">
                            <a>Menu 2</a>
                            <div class="sub-menu">
                                <a>Sub 1</a>
                                <a>Sub 2</a>
                                <a>Sub 3</a>
                            </div>
                        </div>
                        <div class="sub-top-menu">
                            <a>Menu 3</a>
                            <div class="sub-menu">
                                <a>Sub 1</a>
                                <a>Sub 2</a>
                                <a>Sub 3</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="top-menu">
                    <a href="#">회사소개</a>
                    <div class="menu">
                        <a>Menu 1</a>
                        <a>Menu 2</a>
                        <a>Menu 3</a>
                    </div>
                </li>
                <li class="top-menu">
    <%
        
        if(user_type != null && user_type.equals("U") || user_type != null && user_type.equals("A")) {
    %>
    <a href="user_service.jsp" onclick="return checkUserType()">고객센터</a>
    <script>
        function checkUserType() {
            var user_type = '<%= user_type %>';
            if (user_type === 'U' || user_type ==='A') {
                return true; // 유저 타입이 'U'거나 'A'면 링크 이동 허용
            }
            else {
                alert('로그인 후 열람 가능합니다.'); // 경고창 표시
                return false; // 링크 이동 차단
            }
        }
    </script>
    <% } else { %>
    <a href="#" onclick="alert('로그인 후 열람 가능합니다.');">고객센터</a>
    <% } %>
    <div class="menu">
        <a>Menu 1</a>
        <a>Menu 2</a>
        <a>Menu 3</a>
    </div>
</li>
                <% 
        
        if(user_type != null && user_type.equals("A")) {
    %>
    <li class="top-menu">
        <a href="UserBoard.jsp">회원관리</a>
        <div class="menu">
            <a>Menu 1</a>
            <a>Menu 2</a>
            <a>Menu 3</a>
        </div>
    </li>
    <% } %>
                
                
                
            </ul>
        </div>
    </div>
</body>
<script>
    jQuery(function(){
        jQuery("body").on('mousewheel',function(e){ 
            var wheel = e.originalEvent.wheelDelta; 
            if(wheel > 0) { 
                jQuery("#header").slideDown(600);
            } else { 
                jQuery("#header").slideUp(600);
            } 
        });
    });
</script>
</html>