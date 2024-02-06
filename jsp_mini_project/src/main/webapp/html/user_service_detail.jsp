<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <%@ include file="hader.jsp" %>
    <%@ include file="dbconn.jsp" %>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0px;
        }

        h2 {
            color: #333;
        }

        .post-content {
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            
        }

        .post-content p {
            line-height: 1.6;
        }
        #headerbox{
        	width: 100%;
        	height: 100px;
        	background-color:black; 
        }
        #turnbackbtn {
            width: 100px;
            height: 60px;
            font-size: 25px;
            cursor: pointer;
            margin: 10px;
            margin-bottom: 0;
            border-radius: 45px;
            
        }#turnbackbtn:hover{
        	background-color: rgba(7,7,7,0.5);
        	transition: all 300ms;
        }
    </style>
</head>
<body>
<div id="headerbox"></div>
<input type="button" onclick="turnback()" value="돌아가기" id="turnbackbtn">
    <div class="post-content">
        <h2>게시글 상세보기</h2>

        <% 
            String postId = request.getParameter("postId");
            String sql = "SELECT * FROM ES_SERVICE WHERE POST_ID = '" + postId + "'";
            ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next()) {
                String writer = rs.getString("USER_ID");
                String nickname = rs.getString("nickname");
                String inquiryType = rs.getString("INQUIRY_TYPE");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                Date createDate = rs.getDate("POST_DATE");
                String status = rs.getString("STATUS");
        %>

        <p><strong>작성자 아이디:</strong> <%= writer %></p>
        <p><strong>작성자 닉네임:</strong> <%= nickname %></p>
        <p><strong>문의 종류:</strong> <%= inquiryType %></p>
        <p><strong>제목:</strong> <%= title %></p>
        <p><strong>작성일:</strong> <%= createDate %></p>
        
        <hr>
 <label><h2>문의 내용 : </h2></label>
        <div>
            <!-- 여기에 내용 표시 -->
           
            
            <%= content %>
        </div>

        
    </div>
    <%
            if(status.equals("처리완료")){
                sql = "SELECT * FROM ES_COMMENT WHERE POST_ID='" + postId + "'";
                rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    String cmtWriter = rs.getString("USER_ID");
                    String cmtNickname = rs.getString("NICKNAME");
                    String cmtTitle = rs.getString("TITLE");
                    String cmtContent = rs.getString("CONTENT");
                    Timestamp cmtCreateDate = rs.getTimestamp("POST_DATE");
        %>
        <div class="post-content">
        
        <p><strong>상담사 아이디:</strong> <%= cmtWriter %></p>
        <p><strong>상담사 닉네임:</strong> <%= cmtNickname %></p>
        <p><strong>제목:</strong> <%= cmtTitle %></p>
        <p><strong>작성일:</strong> <%= cmtCreateDate %></p>
        
        <hr>
        <label><h2>답변 내용 : </h2></label>
        <div>
            <%= cmtContent %>
        </div>
		</div>
        <%
                }
            }
        }
        %>
    
    
    	
    
    

</body>
</html>
<script>
	function turnback() {
location.href="user_service.jsp"
}
</script>