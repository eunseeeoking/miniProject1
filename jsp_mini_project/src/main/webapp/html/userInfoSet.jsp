<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information Set</title>
    <!-- 필요한 경우 추가적인 스타일이나 스크립트를 여기에 포함시킬 수 있습니다. -->
</head>
<body>

    <h2>User Information Set</h2>

    <%-- 세션에서 받은 값들을 각각의 input 요소로 표시 --%>
    <form action="updateUserInfo.jsp" method="post" name="updateInfo">
    <div>
        <label for="userName">User Name:</label>
        <input type="text" id="userName" name="userName" value="<%= session.getAttribute("userName") %>">
    </div>
    <div>
        <label>Birth Date:</label>
        <input type="text" id="year" name="year" value="<%= session.getAttribute("year") %>" placeholder="YYYY" maxlength="4">
        <select id="month" name="month">
            <% for (int i = 1; i <= 12; i++) { %>
                <option value="<%= String.format("%02d", i) %>" <%= session.getAttribute("month").equals(String.format("%02d", i)) ? "selected" : "" %>><%= String.format("%02d", i) %>월</option>
            <% } %>
        </select>
        <input type="text" id="day" name="day" value="<%= session.getAttribute("day") %>" placeholder="DD" maxlength="2">
    </div>
    <div>
        <label for="gender">Gender:</label>
        <select id="gender" name="gender">
            <option value="남성" <%= session.getAttribute("gender").equals("남성") ? "selected" : "" %>>남성</option>
            <option value="여성" <%= session.getAttribute("gender").equals("여성") ? "selected" : "" %>>여성</option>
        </select>
    </div>
    <div>
        <label for="nickname">Nickname:</label>
        <input type="text" id="nickname" name="nickname" value="<%= session.getAttribute("nickname") %>">
    </div>
    <div>
        <label for="address">Address:</label>
        <input type="text" id="sample4_postcode" name="postAddr1" readonly>
        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
        <input type="text" id="sample4_roadAddress" name="postAddr2" placeholder="도로명주소" size="60">
        <input type="hidden" id="sample4_jibunAddress" name="sample4_jibunAddress" placeholder="지번주소" size="60">
        <span id="guide" style="color:#999;display:none"></span>
        <input type="text" id="sample4_detailAddress" name="postAddr3" placeholder="상세주소" size="60"><br>
        <input type="hidden" id="sample4_extraAddress" name="sample4_extraAddress" placeholder="참고항목" size="60">
        <input type="hidden" id="sample4_engAddress" name="sample4_engAddress" placeholder="영문주소" size="60"><br>
    	<input type="text" id="addrCheck" value="false" id="addrCheck" hidden>
    </div>
    <div>
    <label for="phone">Phone:</label>

    <!-- 앞 3자리 옵션 박스 -->
    <select id="phonePrefix" name="phonePrefix">
        <option value="010">010</option>
        <option value="011">011</option>
        <option value="016">016</option>
        <option value="017">017</option>
        <option value="019">019</option>
    </select>

    <!-- 중간 4자리 입력 -->
    <input type="text" id="phoneMiddle" name="phoneMiddle" placeholder="0000" maxlength="4">

    <!-- 뒤 4자리 입력 -->
    <input type="text" id="phoneEnd" name="phoneEnd" placeholder="0000" maxlength="4">
</div>

    <input type="button" value="Update" onclick="submitUpdate()">
</form>

</body>
</html>

<script>
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