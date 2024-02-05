<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information Set</title>
    <!-- 필요한 경우 추가적인 스타일이나 스크립트를 여기에 포함시킬 수 있습니다. -->
    <style>
    @font-face {
            font-family: 'HOHO';
            src: url('SDSamliphopangcheBasic.otf') format('truetype');
        }
        *{
        font-family: 'hoho';
        }
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input,
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="button"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #0056b3;
        }

        .address-group {
            display: flex;
            flex-wrap: wrap;
        }

        .address-group input {
            flex: 1;
            margin-right: 8px;
        }
        
        div {
        margin-bottom: 16px;
    }

    .birthdate-group,
    .phone-group {
        display: flex;
       flex-direction: row;
        align-items: center;
        gap: 8px;
    }
    .birthdate-group label,
    .phone-group label {
        text-align: left;
         width: 50px;
         margin-right: 8px;
    }

    .birthdate-group select,
    .birthdate-group input,
    .phone-group select,
    .phone-group input {
        flex: 1;
    }
    .birthdate-group div,
    .phone-group div {
        display: flex;
        flex-direction: column;
        flex: 1;
    }
    </style>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
    <% 
    	String userId = request.getParameter("userId");
    	String sql = "select * from es_user where user_id = '"+userId+"'";
    	ResultSet rs = stmt.executeQuery(sql);
    	rs.next();
    	String birthDate = rs.getString("Birth_date");
        String[] dateParts = birthDate.split("-");
        String year =  dateParts[0];
        String month= dateParts[1];
        String day= dateParts[2];
    	
    %>
    <form action="updateUserInfo.jsp"  name="updateInfo" method="post" accept-charset="utf-8">
    
    <div>
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName" value="<%= rs.getString("user_name") %>" disabled>
    </div>
    <div class="birthdate-group">
    <label>생일:</label>
    <input type="text" id="year" name="year" value="<%= year %>" placeholder="YYYY" maxlength="4">
    <select id="month" name="month">
        <% for (int i = 1; i <= 12; i++) { %>
            <option value="<%= String.format("%02d", i) %>" <%= month.equals(String.format("%02d", i)) ? "selected" : "" %>><%= String.format("%02d", i) %>월</option>
        <% } %>
    </select>
    <input type="text" id="day" name="day" value="<%= day %>" placeholder="DD" maxlength="2">
</div>
    <div>
        <label for="gender">성별:</label>
        <select id="gender" name="gender">
            <option value="남성" <%= rs.getString("gender").equals("남성") ? "selected" : "" %>>남성</option>
            <option value="여성" <%= rs.getString("gender").equals("여성") ? "selected" : "" %>>여성</option>
        </select>
    </div>
    <div>
        <label for="nickname">닉네임:</label>
        <input type="text" id="nickname" name="nickname" value="<%= rs.getString("nickname") %>">
    </div>
    <%String address = (String)session.getAttribute("address");%>
   
    <div>
        <label for="address">주소지:</label>
        <input type="text" id="sample4_postcode" name="postAddr1"  value="<%= rs.getString("POSTADDR1") != null ? rs.getString("POSTADDR1") : "" %>">
        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
        <input type="text" id="sample4_roadAddress" name="postAddr2" placeholder="도로명주소" size="60" value="<%= rs.getString("POSTADDR2") != null ? rs.getString("POSTADDR2") : "" %>">
        <input type="hidden" id="sample4_jibunAddress" name="sample4_jibunAddress" placeholder="지번주소" size="60">
        <span id="guide" style="color:#999;display:none"></span>
        <input type="text" id="sample4_detailAddress" name="postAddr3" placeholder="상세주소" size="60" value="<%= rs.getString("POSTADDR3") != null ? rs.getString("POSTADDR3") : "" %>"><br>
        <input type="hidden" id="sample4_extraAddress" name="sample4_extraAddress" placeholder="참고항목" size="60">
        <input type="hidden" id="sample4_engAddress" name="sample4_engAddress" placeholder="영문주소" size="60"><br>
    	<input type="text" id="addrCheck" value="false" id="addrCheck" hidden>
    </div>
    <div class="phone-group">
    <div><label for="phone">휴대폰번호 :</label></div>
    
    <%
        String phonePrefix = rs.getString("PHONENUM1");
        String phoneMiddle = rs.getString("PHONENUM2");
        String phoneEnd = rs.getString("PHONENUM3");
    %>

    <select id="phonePrefix" name="phonePrefix">
        <option value="010" <%= "010".equals(phonePrefix) ? "selected" : "" %>>010</option>
        <option value="011" <%= "011".equals(phonePrefix) ? "selected" : "" %>>011</option>
        <option value="016" <%= "016".equals(phonePrefix) ? "selected" : "" %>>016</option>
        <option value="017" <%= "017".equals(phonePrefix) ? "selected" : "" %>>017</option>
        <option value="019" <%= "019".equals(phonePrefix) ? "selected" : "" %>>019</option>
    </select>
    
    <input type="text" id="phoneMiddle" name="phoneMiddle" placeholder="0000" maxlength="4" value="<%= phoneMiddle %>">
    <input type="text" id="phoneEnd" name="phoneEnd" placeholder="0000" maxlength="4" value="<%= phoneEnd %>">
</div>

    <input type="button" value="Update" onclick="submitUpdate()">
    <input type="button" value="돌아가기" onclick="returnmain()">
</form>

</body>
</html> 

<script>
	function returnmain() {
		window.history.back();
	}

    function submitUpdate() {
        var userName = document.getElementById('userName').value;
        var nickname = document.getElementById('nickname').value;
        var year = document.getElementById('year').value;
        var month = document.getElementById('month').value;
        var day = document.getElementById('day').value;
        var postAddr1 = document.getElementById('sample4_postcode').value;
        var postAddr2 = document.getElementById('sample4_roadAddress').value;
        var postAddr3 = document.getElementById('sample4_detailAddress').value;
        var gender = document.getElementById('gender').value;
        var phonePrefix = document.getElementById('phonePrefix').value;
        var phoneMiddle = document.getElementById('phoneMiddle').value;
        var phoneEnd = document.getElementById('phoneEnd').value;

        // 유효성 검사
        if (!userName) {
            alert('이름을 입력해주세요.');
            return;
        }
        if (/[^a-zA-Z가-힣]/.test(userName)) {
            alert('이름은 영어 또는 한글로만 입력해 주세요.');
            return;
        }

        if (!nickname) {
            alert('닉네임을 입력해주세요.');
            return;
        }
        if (/[^a-zA-Z0-9가-힣]/.test(nickname)) {
            alert('닉네임에 특수문자는 사용할 수 없습니다.');
            return;
        }

        if (!year || !month || !day) {
            alert('생년월일을 모두 입력해주세요.');
            return;
        }

        if (year.length !== 4 || isNaN(year) || year < 1900 || year > 2024) {
            alert('올바른 연도를 입력해주세요 (1900 ~ 2024).');
            return;
        }

        if (isNaN(day) || day < 1 || day > 31) {
            alert('올바른 일을 입력해주세요 (1부터 31까지).');
            return;
        }

        if (!postAddr1 || !postAddr2) {
            alert('우편번호와 도로명주소를 입력해주세요.');
            return;
        }

        // 빈값에 대한 추가 유효성 검사
        
        if (!phoneMiddle || !phoneEnd) {
            alert('휴대폰 번호를 모두 입력해주세요.');
            return;
        }
        if (phoneMiddle.length !== 4 || phoneEnd.length !== 4) {
            alert('휴대폰 번호를 올바르게 입력해주세요 (4자리 숫자).');
            return;
        }
        if (!postAddr3) {
            var proceed = confirm('상세주소가 비어있습니다. 그대로 진행하시겠습니까?');
            if (!proceed) {
                return;
            }
        }
        // 추가적인 유효성 검사 및 포맷 확인 등을 진행할 수 있습니다.

        // 값이 모두 유효하다면, form을 submit합니다.
      	document.getElementById('sample4_postcode').disabled = false;
      	document.getElementById('sample4_roadAddress').disabled = false;
        document.updateInfo.submit();
    }
</script>
    

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById('sample4_roadAddress').value = roadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                document.getElementById('sample4_engAddress').value = data.addressEnglish;

                if (roadAddr !== '') {
                    document.getElementById('sample4_extraAddress').value = extraRoadAddr;
                } else {
                    document.getElementById('sample4_extraAddress').value = '';
                }

                var guideTextBox = document.getElementById('guide');
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                document.getElementById('addrCheck').value = 'true';
                document.getElementById('sample4_postcode').disabled = 'true';
                document.getElementById('sample4_roadAddress').disabled = 'true';
            }
        }).open();
    }
</script>