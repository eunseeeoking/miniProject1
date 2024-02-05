<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0px;
        }

        h2 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4285f4;
            color: #fff;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .checkbox-column {
            width: 30px;
            text-align: center;
        }
        .delete-button {
            margin-top: 10px;
            padding: 8px;
            background-color: #e53935;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .view-details-button {
            padding: 8px;
            background-color: #2196F3;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        #headerbox{
        width: 100%;
        height: 100px;
        background-color: black;
        
        
        }
        .view-details-button {
            padding: 8px;
            background-color: #2196F3;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="hader.jsp" %>
    

    <%-- 회원 목록을 가져오는 SQL 쿼리 실행 --%>
    <%@include file="dbconn.jsp" %>

    <%
        ResultSet rs = null;

        try {
            
            
            

           
    %>
    <div id="headerbox"></div>
    <h2>회원 목록</h2>
    <%-- 검색 폼 추가 --%>
    <form action="" method="get">
        <label for="search">ID : </label>
        <input type="text" name="search" id="search">
        <input type="submit" value="검색">
    </form>
    
<form action="userdelete.jsp" method="post" id="deleteForm">
    <table>
        <thead>
            <tr>
            <th class="checkbox-column"><input type="checkbox" id="selectAll" onclick="selectAllCheckboxes()"></th>
                <th>ID</th>
                <th>Name</th>
                <th>Birth Date</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Nickname</th>
                <th>Address</th>
                <th>Phone</th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <%String searchKeyword = request.getParameter("search");
            String sql = "SELECT * FROM ES_USER";

            // 검색어가 있을 경우 SQL 쿼리에 추가
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                sql += " WHERE USER_ID LIKE '%" + searchKeyword + "%' OR USER_NAME LIKE '%" + searchKeyword + "%'";
            }

            rs = stmt.executeQuery(sql);
                int rowNumber = 0;
                while (rs.next()) {
                    String userId = rs.getString("USER_ID");
                    String userName = rs.getString("USER_NAME");
                    String birthDate = rs.getString("BIRTH_DATE");
                    String gender = rs.getString("GENDER");
                    String email = rs.getString("EMAIL");
                    String nickname = rs.getString("NICKNAME");
                    String address = rs.getString("ADDR");
                    String phone = rs.getString("PHONE");

                    // 행 번호 증가
                    rowNumber++;
            %>

            <tr>
            <td class="checkbox-column"><input type="checkbox" name="selectedUsers" value="<%= userId %>"></td>
                <input type="hidden" name="selectedUserIds" id="selectedUserIds">
                <td><%= userId %></td>
                <td><%= userName %></td>
                <td><%= birthDate %></td>
                <td><%= gender %></td>
                <td><%= email %></td>
                <td><%= nickname %></td>
                <td><%= address %></td>
                <td><%= phone %></td>
                <td style="text-align: center;"><input type="button" class="view-details-button" value="유저 정보" onclick="viewDetails('<%= userId %>')"></td>
            </tr>

            <%
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
     <input type="button" class="delete-button" value="삭제하기" onclick="deleteSelectedUsers()">
    </form>

</body>
</html>

<script>
function selectAllCheckboxes() {
    var checkboxes = document.getElementsByName('selectedUsers');
    var selectAllCheckbox = document.getElementById('selectAll');

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = selectAllCheckbox.checked;
    }
}

function viewDetails(userId) {
    // userId 값을 userViewDetails.jsp로 전달하여 이동
    window.location.href = "userInfoSet.jsp?userId=" + userId;
}

function deleteSelectedUsers() {
    // 사용자에게 확인 다이얼로그 표시
    var confirmed = confirm("선택된 사용자를 삭제하시겠습니까?");

    // 확인이면 삭제 수행
    if (confirmed) {
        var selectedUserIds = getSelectedUserIds();
        // 선택된 사용자 ID들을 hidden 필드에 설정
        document.getElementById('selectedUserIds').value = selectedUserIds;
        // 폼 제출
        document.getElementById('deleteForm').submit();
    }
}

function getSelectedUserIds() {
    var checkboxes = document.getElementsByName('selectedUsers');
    var selectedUserIds = [];
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedUserIds.push(checkboxes[i].value);
        }
    }
    return selectedUserIds.join(",");
}

</script>
