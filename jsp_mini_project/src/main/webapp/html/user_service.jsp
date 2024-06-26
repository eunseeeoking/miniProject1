<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="dbconn.jsp" %>

<style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
        }

        #headerbox {
            width: 100%;
            height: 100px;
            background-color: black;
            
        }

        h2 {
            color: #333;
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: center;
        }

        th {
            background-color: #4285f4;
            color: black;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
	
		
        #title {
            color: green;
            text-decoration: none;
        }

        #title:hover {
        	
            text-decoration: underline;
        }

        input[type="button"] {
            padding: 10px;
            background-color: #2196F3;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="button"]:hover {
            background-color: #1565C0;
        }
       
        #deletebtn , #updateStatusBtn{
        	text-align: center;
        }
    </style>
    <%@ include file="hader.jsp" %>
<body>


    <div id="headerbox"></div>
    <h2>문의 목록</h2>
    
    <!-- 글쓰기 버튼을 input type=button으로 변경 -->
    <div class="filter-buttons">
        <button onclick="filterByStatus('처리전')">처리전</button>
        <button onclick="filterByStatus('처리완료')">처리완료</button>
        <button onclick="showAll()">모두 보기</button>
        <input type="button" value="글쓰기" onclick="goToWritePage()">
    </div>

   <%
        ResultSet rs = null;
        try {
            String sql = "SELECT POST_ID, S.NICKNAME, S.USER_ID, S.INQUIRY_TYPE, S.TITLE, S.POST_DATE, S.STATUS, USER_TYPE FROM ES_SERVICE S INNER JOIN ES_USER U ON S.USER_ID = U.USER_ID ORDER BY POST_ID ASC";
            rs = stmt.executeQuery(sql);
            user_type = (String) session.getAttribute("user_type");
            String userId = (String) session.getAttribute("userId");
           %>

    <table border="1">
        <thead>
            <tr>
                <th>글 번호</th>
                <th>작성자</th>
                <th>문의 종류</th>
                <th>제목</th>
                <th>작성일</th>
                <th>처리상태</th>
                <th>삭제하기</th>
                <th>수정하기</th>
                <%if (user_type.equals("A")){ %>
                <th>답변제출</th> <!-- 버튼을 위한 열 추가 -->
                <%}%>
            </tr>
        </thead>
        <tbody>
            <%
            while (rs.next()) {
                int postId = rs.getInt("POST_ID");
                String writer = rs.getString("nickname");
                String inquiryType = rs.getString("INQUIRY_TYPE");
                String title = rs.getString("TITLE");
                Date createDate = rs.getDate("POST_DATE");
                String status = rs.getString("status");

                // 사용자 유형이 'A'이거나 (또는) 사용자 유형이 'U'이고 사용자 ID가 게시글 작성자 ID와 일치할 때
                if (user_type.equals("A") || (user_type.equals("U") && userId.equals(rs.getString("USER_ID")))) {
    %>
    <tr class="post-row" data-status="<%= status %>">
        <td><%= postId %></td>
        <td><%= writer %></td>
        <td><%= inquiryType %></td>
        <td>
        <% if (status.equals("처리전")) { %>
        <a id="title" href="user_service_detail.jsp?postId=<%= postId %>"><%= title %></a>
    <% } else { %>
        <a id="title" href="user_service_detail.jsp?postId=<%= postId %>" style="color: red; text-decoration: line-through;"><%= title %></a>
    <% } %>
        </td>
        <td><%= createDate %></td>
        <td><%= status %></td>
        <td id="deletebtn"><input type="button" value="삭제하기" onclick="servicedelete('<%=postId %>')" id="servicedelete"></td>
        <td><input type="button" value="수정하기" onclick="rewrite('<%=postId %>')"></td>
            <%
                // 사용자 유형이 'A'이면서 게시글 상태가 '처리전'일 때 버튼 표시
                if (user_type.equals("A") && status.equals("처리전")) {
            %>
            <td id="updateStatusBtn">
            <input type="button" value="답변 제출" onclick="updateStatus('<%= postId %>')">
            </td> 
            <%
                }
            %>
            
       
    </tr>
            <%
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
        </tbody>
    </table>


</body>
<%@ include file="footer.jsp" %>
</html>
<script>
	function rewrite(postId){
		window.location.href = "user_service_rewrite.jsp?postId="+postId;
	}

    function goToWritePage() {
        window.location.href = "user_service_write.jsp";
    }
    
    function filterByStatus(status) {
        var rows = document.querySelectorAll('.post-row');
        rows.forEach(function(row) {
            var rowStatus = row.getAttribute('data-status');
            if (rowStatus === status) {
                row.style.display = 'table-row';
            } else {
                row.style.display = 'none';
            }
        });
    }
    function servicedelete(postId) {
    	if(confirm("정말 삭제 하시겠습니까?")){
    		
    		location.href="service_delete.jsp?postId="+postId;
    	}else{
    		return;
    	}
		
	}
    

    function showAll() {
        var rows = document.querySelectorAll('.post-row');
        rows.forEach(function(row) {
            row.style.display = 'table-row';
        });
    }
    function updateStatus(postId) {
        location.href="admin_coment.jsp?postId="+postId;

    }
</script>