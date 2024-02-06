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
     body {
            margin: 0;
            padding: 0;
        }
    #main {
            width: 100vw;
            height: 100vh;
            background: url('img/test4.jpg') center/cover no-repeat; /* 이미지 경로 설정 */
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ffffff; /* 텍스트 색상 설정 */
            font-size: 2em;
            font-weight: bold;
            text-align: center;
        }
    
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
        background-color: rgba(97, 158, 207, 5);
        transition: 100ms;
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
        display: block;
        
    }
    
    #userBirth {
        display: none;
        
    }
    
    #userIdInfo {
        display: none;
        
        line-height: 80px;
    }
    
    
    
    #userIdInfo div span input {
        width: 200px;
        height: 50px;
        text-align: center;
    }
    
    #userNickName div span input {
        height: 50px;
        text-align: center;
        font-size: 25px;
    }
    
    #userNickName div span {
        line-height: 70px;
    }
    
    #userNickName {
        display: none;
    }

    .button-container input{
        background-color: rgba(97, 158, 207, 0.185);
        border-radius: 45px;
        width: 100px;
        height: 50px;
        right: 15px;
        position: absolute;
        bottom: 15px;
        cursor: pointer;
        font-size: 15px;

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
    #userEmailCheck{
    	position: absolute;
    	right: 20px;
    	top: 325px;
    }
    
    #phonetext{
    	display: inline-block;
    	 margin-bottom: 0;
    	 line-height: 35px;
    }
    .boxtxt{
    color : #fff;
    }
    
    .CheckBtn{
    color : #fff;
    background-color: rgba(97, 158, 207, 0.185);
   	 width: 80px;
    	height: 50px;
    	border-radius: 45px; 
    	border: 1px solid black;
    
    }
    input,select{
    border-radius: 45px; 
    border: 1px solid black;
    text-align: center;
    }
    #phonetext select{
    	width: 100px;
        height: 45px;
    }
    #nickname{
    width: 300px;
        height: 50px;
    }
    
    
    </style>
    </head>
    
    <body>
    <div id="main">
        <form action="join_save.jsp" name="join">
        <div class="login-pop" id="userNameInfo">
            <div class="boxtxt">회원가입</div>
            <div>
                <input class="userName" type="text" placeholder="이름을 입력해 주세요"
                    name="userName" id="userName">
            </div>
            <div>
                <span><input placeholder="닉네임을 입력해 주세요" type="text" id="nickname" name="nickname"></span>
            </div>
            <div class="button-container">
                
      <input class="nextbtn" onclick="next1()" type="button" value=" 다음 ▶">
    </div>
        </div>
        <div class="login-pop" id="userBirth">
            <div class="boxtxt">회원가입</div>
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
                 <select id="gender" name="gender">
                    <option value="남성">남성</option>
                    <option value="여성">여성</option>
                </select></div>
                <div id="phonetext">전화번호<br>
                <select id="areaCode" name="areaCode">
    <option value="010">010</option>
    <option value="011">011</option>
    <option value="016">016</option>
    <option value="017">017</option>
    <option value="019">019</option>
  </select>

  <label for="firstPart">-</label>
 
  <input type="text" id="firstPart" name="firstPart" maxlength="4" required>

  <label for="secondPart">-</label>
  <input type="text" id="secondPart" name="secondPart" maxlength="4" required>
                </div>
            
            <div class="button-container">
        <input class="prevbtn" onclick="prev1()" type="button" value="◀ 이전">
        <input class="nextbtn" onclick="next2()" type="button" value=" 다음 ▶">
      </div>
        </div>
        <div class="login-pop" id="userIdInfo">
            <div class="boxtxt">회원가입</div>
            <div>
                <span><input type="text" placeholder="아이디" id="userId"
                    name="userId" required></span>
                    <div id="userIdCheck">
                    <input type="text" value="false" id="idCheck" name="idChecking" hidden >
                     <input onclick="idCheckPop()" type="button" value="중복체크" class="CheckBtn">
                     
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
                    <div id="userEmailCheck">
                    <input type="text" value="false" id="emailCheck" name="emailChecking" hidden >
                     <input onclick="emailCheckPop()" type="button" class="CheckBtn" value="중복체크">
                     </div>
            </div>
            <div class="button-container">
        <input class="prevbtn" onclick="prev2()" type="button" value="◀ 이전">
        <input class="nextbtn" onclick="next3()" type="button" value=" 다음 ▶" name="nameEnd">
      </div>
        </div>
    
        <div class="login-pop" id="userNickName">
            <div class="boxtxt">회원가입</div>
            
            <input type="text" id="sample4_postcode" placeholder="우편번호" name="postAddr1">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="60" name="postAddr2"><br>
<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" placeholder="상세주소"  size="60"name="postAddr3"><br>

<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
<input type="text" id="addrCheck" value="false" id="addrCheck" hidden>
            
            <div class="button-container">
        <input class="prevbtn" onclick="prev3()" type="button" value="◀ 이전">
        <input class="nextbtn" onclick="submit1()" type="button" value="완료">
      </div>
    
        </div>

    </form>
    </div>
    </body>
    
    </html>
    
    <script>
    function showBlock(blockId) {
        var blocks = document.querySelectorAll('.login-pop');
        blocks.forEach(function (block) {
          if (block.id === blockId) {
            block.style.display = 'block';
            block.style.transition = 'opacity 500ms'; // 또는 다른 속성을 지정할 수 있습니다
            block.style.opacity = 1; // 원하는 초기 상태값 설정
          } else {
        	  block.style.transition = 'opacity 500ms'; // 또는 다른 속성을 지정할 수 있습니다.
              block.style.opacity = 0; // 원하는 초기 상태값 설정
              setTimeout(function () {
                block.style.display = 'none';
              }, 500); // transition 시간과 동일하게 설정
          }
        });
      }
    
    
      function next1() {
        var userName = document.getElementById('userName').value;
        var nickname = document.getElementById('nickname').value;
        
        // 값이 null 또는 빈 문자열인지 확인
        if (!userName) {
          alert('이름을 입력해주세요.');
          return;
        }
     // 이름에 특수문자가 포함되는지 확인
        if (/[^a-zA-Z가-힣]/.test(userName)) {
          alert('이름은 영어 또는 한글로만 입력해 주시기 바랍니다.');
          return;
        }
        
        
        // 값이 null 또는 빈 문자열인지 확인
        if (!nickname) {
          alert('닉네임을 입력해주세요.');
          return;
        }
    
        if (/[^a-zA-Z0-9가-힣]/.test(nickname)) {
            alert('닉네임에 특수문자는 사용할 수 없습니다.');
            return;
          }
    
        showBlock('userBirth');
      }
      function prev1() {
            // 이전 블록으로 이동
            showBlock('userNameInfo');
          }
      
   // 숫자 확인 함수
      function isNumeric(value) {
    	    return /^\d+$/.test(value);
    	  }
    
      function next2() {
        var year = document.getElementById('year').value;
        var month = document.getElementById('month').value;
        var day = document.getElementById('day').value;
        var areaCode = document.getElementById('areaCode').value;
        var firstPart = document.getElementById('firstPart').value;
        var secondPart = document.getElementById('secondPart').value;
        
        
        
        
    
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
        if (!firstPart || !secondPart) {
            alert('전화번호를 입력해 주세요');
            return;
          }
        
        if (!isNumeric(firstPart) || !isNumeric(secondPart)) {
            alert('전화번호는 숫자만 입력해주세요.');
            return;
          }
        if (firstPart.length <=3 || secondPart.length <=3) {
            alert('전화번호를 확인해 주세요');
            return;
          }
        
        
    
        showBlock('userIdInfo');
      }
      function prev2() {
            // 이전 블록으로 이동
            showBlock('userBirth');
          }
      
      function idCheckPop() {
  	    var userId = document.getElementById('userId').value;
  	    // 값이 null 또는 빈 문자열인지 확인
  	    if (!userId) {
  	        alert('아이디를 입력해주세요.');
  	        return;
  	    }
  	 	// 팝업 창 띄우기
  	    var popup = window.open("userIdCheckPop.jsp?userId=" + userId, 'userIdCheckPop', 'width=400,height=200');
    }
      
      function emailCheckPop() {
    	    var userEmail = document.getElementById('email').value;
    	    // 값이 null 또는 빈 문자열인지 확인
    	    if (!userEmail) {
    	        alert('이메일을 입력해주세요.');
    	        return;
    	    }
    	    if (!isValidEmail(userEmail)) {
    	          alert('올바른 이메일 주소를 입력해주세요.');
    	          return;
    	        }
    	 	// 팝업 창 띄우기
    	    var popup = window.open("userEmailCheckPop.jsp?email=" + userEmail, 'userIdCheckPop', 'width=400,height=200');
      }
      
      function next3() {
        var userId = document.getElementById('userId').value;
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirm-password').value;
        var email = document.getElementById('email').value;
        var idCheck = document.getElementById('idCheck').value;
        var emailCheck = document.getElementById('emailCheck').value;
    
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
        if(idCheck==='false'){
        	alert('아이디 중복검사를 실행해 주세요.');
        	return;
        }
        if(emailCheck==='false'){
        	alert('이메일 중복검사를 실행해 주세요.');
        	return;
        }
    
        showBlock('userNickName');
      }
      
      function prev3() {
            // 이전 블록으로 이동
            showBlock('userIdInfo');
          }
    
      function submit1() {
    	  
    	  var postAddr1 = document.getElementById("sample4_postcode").value;
          var postAddr2 = document.getElementById("sample4_roadAddress").value;
          var postAddr3 = document.getElementById("sample4_detailAddress").value;
          var addrCheck = document.getElementById("addrCheck").value
          if (!postAddr1 || !postAddr2) {
              alert("우편번호 및 도로명주소를 입력해주세요.");
              return;
          }
          
          if(addrCheck==='false'){
        	  alert("우편번호 찾기를 진행해 주세요.")
        	  return;
          }
          
          if (!postAddr3) {
              var proceed = confirm("상세주소가 비어있습니다. 그대로 진행하시겠습니까?");
              if (!proceed) {
                  // 사용자가 취소를 선택한 경우
                  return;
              }
          }
          
          document.getElementById('userId').disabled = false;
          document.getElementById('email').disabled = false;
          document.getElementById('sample4_postcode').disabled = false;
          document.getElementById('sample4_roadAddress').disabled = false;
          alert('회원가입이 완료되었습니다!');
          document.join.submit();
          return true;
        // 여기에 회원가입 완료 후의 동작을 추가하면 됩니다.
        
      }
    
      // 이메일 형식 확인 함수
      function isValidEmail(email) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
      }
      
      
      
    </script>
    
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                document.getElementById("addrCheck").value = 'true';
                document.getElementById("sample4_postcode").disabled ='true';
                document.getElementById("sample4_roadAddress").disabled ='true';
                
            }
        }).open();
    }
</script>
