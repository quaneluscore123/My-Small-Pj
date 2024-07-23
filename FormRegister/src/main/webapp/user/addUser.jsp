<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Them nguoi dung moi</h1>
<form action="addUserPost.jsp" method="post">
	<input name ="full_name" type="text" placeholder="Ten nguoi dung"> <br/>
	<input name="age" type="text" placeholder="Tuoi"> <br/>
	<textarea rows="3" cols="25" name="address" placeholder="Dia chi"></textarea> <br/>
	<input name ="username" type="text" placeholder="Ten tai khoan"> <br/>
	<input name ="password" type="password" placeholder="Mat khau nguoi dung"> <br/>
	
	
	<input type="submit" value="Them">
</form>

</body>
</html>