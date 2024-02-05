
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");

	stmt.executeUpdate("update es_user set failcnt = 0 where user_id='"+userId+"'");

%>


<script>
location.href="UserBoard.jsp" 
</script>
</body>
</html>