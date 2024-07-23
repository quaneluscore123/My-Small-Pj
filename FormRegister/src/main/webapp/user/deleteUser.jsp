<%@page import="com.trungtamjava.service.UserService"%>
<%@page import="com.trungtamjava.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
		String idStr = request.getParameter("id");
		UserService userService = new UserService();
		userService.deleteUser(Integer.valueOf(idStr));
		
		response.sendRedirect("/FormRegister/user/listUser.jsp");
%>