<%@page import="com.trungtamjava.model.User"%>
<%@page import="com.trungtamjava.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<% String full_name = request.getParameter("full_name");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String ageStr = request.getParameter("age");
	String address = request.getParameter("address");
	
	int age = 0;
    try {
        age = Integer.parseInt(ageStr);
    } catch (NumberFormatException e) {
        age = 0; 
    }
	
	UserService userService = new UserService();
	User user = new User();
	user.setFull_name(full_name);
	user.setUsername(username);
	user.setPassword(password);
	user.setAge(age);
	user.setAddress(address);
	
	userService.addUser(user);
	
	response.sendRedirect("/FormRegister/user/listUser.jsp");
%>