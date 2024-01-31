<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        hader {
            width: 100%;
            height: 100px;
            background-color: rgba(219, 219, 219);
            position: fixed;
            top: 0;
            left: 0;
            border-bottom:1px solid black;

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
            top:10px;
            right: 0px;
        }
        #hader-top a:hover{
            background-color: rgb(219, 219, 219);
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
            color: #333333;
            font-family: 'hoho';
            font-size: 30px;
           
        }
        #line{
            border-right: 1px solid;
            width: 0.01px;
            height: 20px;
            position: absolute;
            right: 81px;
            top:0px
        }
        #logo{
            font-family: 'HOHO';
            font-size: 35px;
            margin-left: 30px;
            color: #1e644d;
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
            /* display: inline-block; */
            width: 150px;
            height: 60px;  
            text-align: center;      
            line-height: 60px;
            margin : 0;
            float: left;
            list-style: none;
        }
        #hader-bottom{
            display:block;
        }
        a:link, a:visited {
            color:black;
            text-decoration: none;
        }
        .menu, .sub-menu{
            background-color: rgb(219, 219, 219);
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
            transform: ;
        }
        
       #haderbox{
       	width: 100%;
       	height: 100px;
       }
        
        
    </style>
</head>
    <hader>
        <div id="hader-top">
            <div class="join">
             <a href="login.jsp">로그인</a>
                <div id="line"></div>
             <a href="join.jsp">회원가입</a>
            </div>

        </div>
        <div id="hader-bottom">
            <div id="logo"><a href="main.jsp">LoGo들어갈자리</a></div>
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
                    <a href="#">서비스</a>
                    <div class="menu">
                        <a>Menu 1</a>
                        <a>Menu 2</a>
                        <a>Menu 3</a>
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
                    <a href="#">메뉴4</a>
                    <div class="menu">
                        <a>Menu 1</a>
                        <a>Menu 2</a>
                        <a>Menu 3</a>
                    </div>
                </li>
            </ul>
        </div>
         
    </hader>
    <body>
    <div id="haderbox"></div>
    </body>
</html>
<script>
$(function(){
    $("body").on('mousewheel',function(e){ 
              var wheel = e.originalEvent.wheelDelta; 


              if(wheel>0){ 
                
                
                $("hader").slideDown(600);
           
                   
            
              } else { 
                
                $("hader").slideUp(600);
                  } 
         
            });


})



</script>