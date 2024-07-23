<%@page import="com.trungtamjava.model.User"%>
<%@page import="com.trungtamjava.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thong tin nguoi dung</title>
</head>
<body>
	<% 
		String idStr = request.getParameter("id");
		UserService userService = new UserService();
		User user =userService.getUserById(Integer.valueOf(idStr));
	
	%>

	<table>
		<tr>
			<td>Ten</td>
			<td><%=user.getFull_name() %></td>
		</tr>
		<tr>
			<td>User name</td>
			<td><%=user.getUsername() %></td>
		</tr>
		<tr>
			<td>Mat khau</td>
			<td><%=user.getPassword() %></td>
		</tr>
		<tr>
			<td>Tuoi</td>
			<td><%=user.getAge() %></td>
		</tr>
		<tr>
			<td>Dia chi</td>
			<td><%=user.getAddress() %></td>
		</tr>
		
	</table>

</body>
</html>