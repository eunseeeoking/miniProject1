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
	String userId = request.getParameter("userId");
	ResultSet rs = stmt.executeQuery("select user_id from es_user where user_id='"+userId+"'");
	if(rs.next()){
		out.println("중복됩니다.");%>
		<div>
		<input type='text'placeholder='아이디' name="userId" value="<%=userId%>" id="userId">
		<input type="button" value="중복체크" onclick="IdCheck()">
		</div>
	<%}else{
		out.print("중복이 아니에요");%>
		
		<input type="button" onclick="popClose('<%= userId %>')" value="닫기">
	<%}


%>
</body>
</html>
<script>
function popClose(userId) {
	opener.document.getElementById('userId').value = userId;
	window.close();
}
	
function IdCheck() {
	var userId = document.getElementById('userId').value;
	location.href="userIdCheckPop.jsp?userId="+userId;
}

</script>