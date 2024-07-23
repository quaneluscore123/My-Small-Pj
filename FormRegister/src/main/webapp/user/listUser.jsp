<%@page import="com.trungtamjava.service.UserService"%>
<%@page import="com.trungtamjava.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách người dùng</title>
</head>
<body>
<h1>Danh sách người dùng</h1>
<%
    UserService userService = new UserService();
    List<User> users = userService.getAllUser();
%>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Ten</th>
        <th>Tai khoan</th>
        <th>Chọn</th>
    </tr>
    
    <%
        for(User user : users){
    %>
    <tr>
        <td><%=user.getId() %></td>
        <td><%=user.getFull_name() %></td>
        <td><%=user.getUsername() %></td>
        <td><a href="editUser.jsp?id=<%=user.getId()%>">Sua</a> | <a href="deleteUser.jsp?id=<%=user.getId()%>">Xoa</a></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
