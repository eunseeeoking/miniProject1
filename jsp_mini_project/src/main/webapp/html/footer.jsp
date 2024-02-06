<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <style>
        footer {
            height: 200px;
            background-color: rgba(7, 7, 7, 0.7);
            width: 100%;
            margin: 0;
            padding: 20px;
            padding-right: 0px;
            position: relative;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
        }

        .footer-column {
            flex: 1;
        }

        .footer-column h3 {
            font-size: 16px;
            margin-bottom: 10px;
            color: #fff;
        }

        .footer-column p {
            font-size: 14px;
            color: #fff;
            margin-bottom: 5px;
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-column ul li {
            margin-bottom: 5px;
        }

        .footer-column a {
            text-decoration: none;
            color: #fff;
        }

        .icon {
            display: inline-block;
            width: 20px;
            height: 20px;
            background-size: cover;
            margin-right: 5px;
        }

        #link {
            position: absolute;
            top: 0;
            right: 0;
        }

        #contact-info {
            font-size: 14px;
        }
    </style>
</head>
<body>

<footer>
  <div class="footer-content">
    <div class="footer-column">
      <h3>집에 가고싶습니다.</h3>
      <p>아마 저희 반 학우님들 대부분이 공감하고 계실꺼에요.</p>
      <h3>연락처</h3>
      <p id="contact-info">주소 : 인천 부평구 경원대로 1366 7층 더조은 게이밍 PC방</p>
      <p id="contact-info">전화 : 032-521-8889</p>
      <p id="contact-info">이메일 : kakkumok2009@gmail.com</p>
    </div>
    
    <div class="footer-column">
      <ul id="link">
        <li><span class="icon" style="background-image: url('img/sns-1.png');"></span><a href="https://github.com/eunseeeoking">GIT</a></li>
        <li><span class="icon" style="background-image: url('img/sns-2.png');"></span><a href="https://www.youtube.com/">YOUTUBE</a></li>
        <li><span class="icon" style="background-image: url('img/sns-3.png');"></span><a href="https://www.instagram.com/">INSTAGRAM</a></li>
      </ul>
    </div>
    
  </div>
</footer>

</body>
</html>