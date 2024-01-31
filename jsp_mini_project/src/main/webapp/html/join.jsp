<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="hader.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    .login-pop {
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
    }
    
    .userName {
        height: 50px;
        font-size: 25px;
        margin-top: 100px;
        text-align: center;
    }
    
    #userBirth input {
        width: 100px;
        height: 45px;
        font-size: 25px;
        text-align: center;
    }
    
    
    
    
    .nextbtn:hover, .prevbtn:hover{
        background-color: rgb(121, 141, 255);
        transition: 1s;
    }
    
    .gender-select {
        padding: 10px;
        border-radius: 5px;
    }
    
    .gender-select select {
        width: 100px;
        padding: 8px;
        font-size: 16px;
        outline: none;
    }
    
    #month {
        width: 100px;
        text-align: center;
        height: 50px;
        font-size: 25px;
    }
    
    #userNameInfo {
        display: none;
        
    }
    
    #userBirth {
        display: none;
    }
    
    #userIdInfo {
        display: block;
        line-height: 80px;
    }
    
    
    
    #userIdInfo div span input {
        width: 200px;
        height: 50px;
        text-align: center;
    }
    
    #userNickName div span input {
        height: 150px;
        text-align: center;
        font-size: 25px;
    }
    
    #userNickName div span {
        line-height: 250px;
    }
    
    #userNickName {
        display: none;
    }

    .button-container input{
        background-color: rgb(167, 167, 255);
        border-radius: 45px;
        width: 100px;
        height: 50px;
        right: 15px;
        position: absolute;
        bottom: 15px;

    }
    .button-container .prevbtn{
        bottom: 15px;
        right: 120px;
    }
    #userIdCheck{
    	position: absolute;
    	right: 20px;
    	top: 80px;
    }
    #userIdCheck button{
    	width: 80px;
    	height: 50px;
    	background-color: blue;
    	border-radius: 45px; 
    }
    </style>
    </head>
    
    <body>
        <form action="join_save.jsp" name="join">
        <div class="login-pop" id="userNameInfo">
            <div>logo 자리 회원가입</div>
            <div>
                <input class="userName" type="text" placeholder="이름을 입력해 주세요"
                    name="userName" id="userName">
            </div>
            <div class="button-container">
                
      <input class="nextbtn" onclick="next1()" type="button" value=" 다음 ▶">
    </div>
        </div>
        <div class="login-pop" id="userBirth">
            <div>logo 자리 회원가입</div>
            <div>
                <input type="text" placeholder="연(1990)" name="year" maxlength='4'
                    id="year"> <select id="month" name="month">
                    <option value="01">1월</option>
                    <option value="02">2월</option>
                    <option value="03">3월</option>
                    <option value="04">4월</option>
                    <option value="05">5월</option>
                    <option value="06">6월</option>
                    <option value="07">7월</option>
                    <option value="08">8월</option>
                    <option value="09">9월</option>
                    <option value="10">10월</option>
                    <option value="11">11월</option>
                    <option value="12">12월</option>
                </select> <input type="text" placeholder="일(07)" name="day" maxlength='2'
                    id="day">
            </div>
            <div class="gender-select">
                <label for="gender">성별:</label> <select id="gender" name="gender">
                    <option value="남성">남성</option>
                    <option value="여성">여성</option>
                </select>
            </div>
            <div class="button-container">
        <input class="prevbtn" onclick="prev1()" type="button" value="◀ 이전">
        <input class="nextbtn" onclick="next2()" type="button" value=" 다음 ▶">
      </div>
        </div>
        <div class="login-pop" id="userIdInfo">
            <div>logo 자리 회원가입</div>
            <div>
                <span><input type="text" placeholder="아이디" id="userId"
                    name="userId" required></span>
                    <div id="userIdCheck">
                     <button onclick="openDuplicateCheckPopup()">중복 체크</button>
                     </div>
            </div>
            <div>
                <span><input type="password" placeholder="비밀번호" id="password"
                    name="password" required></span>
            </div>
            <div>
                <span><input type="password" placeholder="비밀번호 확인"
                    id="confirm-password" name="confirm-password" required></span>
            </div>
            <div>
                <span><input type="email" placeholder="이메일 주소" id="email"
                    name="email" required></span>
            </div>
            <div class="button-container">
        <input class="prevbtn" onclick="prev2()" type="button" value="◀ 이전">
        <input class="nextbtn" onclick="next3()" type="button" value=" 다음 ▶" name="nameEnd">
      </div>
        </div>
    
        <div class="login-pop" id="userNickName">
            <div>logo 자리 회원가입</div>
            <div>
                <span><input placeholder="닉네임" type="text" id="nickname" name="nickname"></span>
            </div>
            
            <div class="button-container">
        <input class="prevbtn" onclick="prev3()" type="button" value="◀ 이전">
        <input class="nextbtn" onclick="submit1()" type="button" value="완료">
      </div>
    
        </div>

    </form>
    </body>
    
    </html>
    
    <script>
    function showBlock(blockId) {
        var blocks = document.querySelectorAll('.login-pop');
        blocks.forEach(function (block) {
          if (block.id === blockId) {
            block.style.display = 'block';
          } else {
            block.style.display = 'none';
          }
        });
      }
    
    
      function next1() {
        var userName = document.getElementById('userName').value;
    
        // 값이 null 또는 빈 문자열인지 확인
        if (!userName) {
          alert('이름을 입력해주세요.');
          return;
        }
     // 이름에 특수문자가 포함되는지 확인
        if (/[^a-zA-Z가-힣]/.test(userName)) {
          alert('이름에 특수문자는 사용할 수 없습니다.');
          return;
        }
    
        showBlock('userBirth');
      }
      function prev1() {
            // 이전 블록으로 이동
            showBlock('userNameInfo');
          }
    
      function next2() {
        var year = document.getElementById('year').value;
        var month = document.getElementById('month').value;
        var day = document.getElementById('day').value;
    
        // 값이 null 또는 빈 문자열인지 확인
        if (!year || !month || !day) {
          alert('생년월일을 모두 입력해주세요.');
          return;
        }
    
        // "연"의 길이가 4글자인지 확인
        if (year.length !== 4 || isNaN(year)) {
          alert('연도는 4글자의 숫자로 입력해주세요.');
          return;
        }
        if(year <1900 || year >2024){
        	alert('1900 ~ 2024년 사이의 값을 입력해주세요')
        	return;
        }
    
        // "일"의 값이 1부터 31 사이의 값인지 확인
        if (isNaN(day) || day < 1 || day > 31) {
          alert('일은 1부터 31 사이의 숫자로 입력해주세요.');
          return;
        }
    
        showBlock('userIdInfo');
      }
      function prev2() {
            // 이전 블록으로 이동
            showBlock('userBirth');
          }
      
      function openDuplicateCheckPopup() {
  	    var userId = document.getElementById('userId').value;

  	    // 값이 null 또는 빈 문자열인지 확인
  	    if (!userId) {
  	        alert('아이디를 입력해주세요.');
  	        return;
  	    }
  	    

  	 	// 팝업 창 띄우기
  	    var popup = window.open('userIdCheckPop.jsp?userId=' + userId, 'userIdCheckPop', 'width=400,height=200');
    }
      
      
      var isDuplicateChecked = false;

      
      
      function next3() {
        var userId = document.getElementById('userId').value;
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirm-password').value;
        var email = document.getElementById('email').value;
        
        
    
        // 값이 null 또는 빈 문자열인지 확인
        if (!userId || !password || !confirmPassword || !email) {
          alert('모든 정보를 입력해주세요.');
          return;
        }
    
        
        
        // 아이디에 특수문자 제어
        if (/[^a-zA-Z0-9]/.test(userId)) {
          alert('아이디에 특수문자는 사용할 수 없습니다.');
          return;
        }
    
        // 비밀번호 길이 제어
        if (password.length > 25) {
          alert('비밀번호는 25글자 이내로 입력해주세요.');
          return;
        }
    
        // 비밀번호 확인 값과 일치 여부 제어
        if (password !== confirmPassword) {
          alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
          return;
        }
    
        // 이메일 형식 확인
        if (!isValidEmail(email)) {
          alert('올바른 이메일 주소를 입력해주세요.');
          return;
        }
    
        showBlock('userNickName');
      }
      
      function prev3() {
            // 이전 블록으로 이동
            showBlock('userIdInfo');
          }
    
      function submit1() {
        var nickname = document.getElementById('nickname').value;
    
        // 값이 null 또는 빈 문자열인지 확인
        if (!nickname) {
          alert('닉네임을 입력해주세요.');
          return;
        }
    
        if (/[^a-zA-Z0-9가-힣]/.test(nickname)) {
            alert('닉네임에 특수문자는 사용할 수 없습니다.');
            return;
          }
    
        // 여기에 회원가입 완료 후의 동작을 추가하면 됩니다.
        alert('회원가입이 완료되었습니다!');
        document.join.submit();
      }
    
      // 이메일 형식 확인 함수
      function isValidEmail(email) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
      }
      
      
      
    </script>
