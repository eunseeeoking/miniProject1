<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String userEmail = request.getParameter("email");
	ResultSet rs = stmt.executeQuery("select user_id from es_user where email='"+userEmail+"'");
	if(rs.next()){
		out.println("중복됩니다.<br>");
		out.print("현재 입력된 이메일: "+ userEmail);%>
		<div>
		<input type='text'placeholder='이메일' name="userEmail" value="<%=userEmail%>" id="userEmail">
		<input type="button" value="중복체크" onclick="IdCheck()">
		</div>
	<%}else{
		out.print("중복이 아니에요<br>");%>
		<input type="button" onclick="popClose('<%= userEmail %>')" value="사용하기">
	<%}


%>
</body>
</html>
<script>
function popClose(userId) {
	opener.document.getElementById('email').value = userId;
	opener.document.getElementById('emailCheck').value = true;
	opener.document.getElementById('email').disabled = true;
	window.close();
}
	
function IdCheck() {
	var userEmail = document.getElementById('userEmail').value;
	if(!isValidEmail(userEmail)) {
        alert("올바른 이메일 주소를 입력해주세요.");
        return;
      }
	location.href="userEmailCheckPop.jsp?email="+userEmail;
}
function isValidEmail(email) {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }
</script>