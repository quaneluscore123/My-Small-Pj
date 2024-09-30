<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
String tenNguoiDungQuanLy = (String) session.getAttribute("TenNguoiDungQuanLy");

if (tenNguoiDungQuanLy == null) {
	response.sendRedirect("DangNhap.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản Lý Thư Viện</title>
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
		padding: 20px;
		text-align: center;
	}

	.header h1 {
		margin: 0;
		font-size: 44px;
	}

	.out {
		position: absolute;
		bottom: 0;
		right: 20px;
		background-color: #ff4d4d;
		color: white;
		padding: 10px 20px;
		border-radius: 5px;
		text-decoration: none;
	}

	.out:hover {
		background-color: #ff1a1a;
	}

	.container {
		margin: 20px auto;
		padding: 20px;
		background-color: white;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		max-width: 900px; /* Điều chỉnh lại chiều rộng container */
		text-align: center;
	}

	h2 {
		margin-bottom: 20px;
	}

	p {
		margin-bottom: 40px;
	}

	.dashboard {
		display: flex;
		flex-direction: column; 
		align-items: center; 
	}

	.card {
		background-color: #fff;
		border: 1px solid #ddd;
		border-radius: 8px;
		padding: 20px;
		width: 80%;
		margin-bottom: 20px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		transition: box-shadow 0.3s ease;
	}

	.card:hover {
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	}

	.card-link {
		text-decoration: none;
		color: #333;
	}

	.card h3 {
		margin: 0 0 10px;
		font-size: 20px;
	}

	.card p {
		margin: 0;
		color: #666;
	}
</style>
</head>
<body>
	<header>
		<div class="header">
			<h1>Hệ thống quản lý thư viện</h1>
			<a href="/deploy/TrangLuaChon.jsp" class="out">Đăng xuất</a>
		</div>
	</header>

	<div class="container">
		<h2>Chào mừng bạn đến với hệ thống quản lý thư viện</h2>
		<p>Chọn một chức năng bên dưới để tiếp tục:</p>
		<div class="dashboard">
			<div class="card">
				<a href="/deploy/ThuVien/TatCaSach.jsp" class="card-link">
					<h3>Quản lý sách</h3>
					<p>Thêm, chỉnh sửa, xóa sách trong hệ thống.</p>
				</a>
			</div>

			<div class="card">
				<a href="/deploy/MuonTra/trangLuaChonSach.jsp" class="card-link">
					<h3>Quản lý mượn, trả sách</h3>
					<p>Xem danh sách mượn, trả, đăng ký mượn sách.</p>
				</a>
			</div>

			<div class="card">
				<a href="/deploy/MuonTra/DSMuonTra.jsp" class="card-link">
					<h3>Danh sách người dùng</h3>
					<p>Quản lý thông tin người dùng và người mượn sách.</p>
				</a>
			</div>
		</div>
	</div>
</body>
</html>
