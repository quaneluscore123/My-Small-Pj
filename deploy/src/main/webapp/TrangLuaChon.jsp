<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng nhập/Đăng kí</title>
<style>
	body {
		font-family: Arial, Helvetica, sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f0f0f0;
	}

	.header {
		background-color: #333;
		color: white;
		position: relative;
		text-align: center;
		padding: 20px 0;
	}

	.header h1 {
		margin: 0;
		font-size: 44px;
	}

	.container {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 80vh;
	}

	.menu {
		background-color: white;
		padding: 40px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		border-radius: 8px;
		text-align: center;
	}

	.menu h2 {
		margin-bottom: 30px;
		color: #333;
	}

	.menu a {
		display: block;
		text-decoration: none;
		margin: 10px 0;
		padding: 15px 25px;
		background-color: #4876FF;
		color: white;
		border-radius: 5px;
		transition: background-color 0.3s;
	}

	.menu a:hover {
		background-color: #4169E1;
	}
</style>
</head>
<body>
  	<div class="header">
    	<h1>Hệ thống quản lý thư viện</h1>
  	</div>
  	<div class="container">
    	<div class="menu">
      		<h2>Chọn chức năng</h2>
      		<a href="/deploy/NguoiQuanLy/DangNhap.jsp">Đăng nhập</a>
      		<a href="/deploy/NguoiQuanLy/DangKy.jsp">Đăng kí</a>
    	</div>
  	</div>
</body>
</html>

