<%@page import="com.trungtamjava.model.User"%>
<%@page import="com.trungtamjava.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sua nguoi dung</title>
</head>
<body>
<% 
		String idStr = request.getParameter("id");
		UserService userService = new UserService();
		User user =userService.getUserById(Integer.valueOf(idStr));
%>

<h1>Sua nguoi dung</h1>
<form action="addUserPost.jsp" method="post">
	<input name ="full_name" type="text" placeholder="Ten nguoi dung" value="<%=user.getFull_name() %>"> <br/>
	<input name="age" type="text" placeholder="Tuoi" value="<%= user.getAge() %>"><br/>
	<textarea rows="3" cols="25" name="address" placeholder="Dia chi"><%=user.getAddress() %></textarea> <br/>
	<input name ="username" type="text" placeholder="Ten tai khoan" value="<%=user.getUsername() %>"> <br/>
	<input name ="password" type="password" placeholder="Mat khau nguoi dung" value="<%=user.getPassword() %>"> <br/>
	
	
	<input type="submit" value="Them">
</form>
</body>
</html>