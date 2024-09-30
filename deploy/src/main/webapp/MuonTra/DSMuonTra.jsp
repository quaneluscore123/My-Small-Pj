<%@ page import="java.util.List"%>
<%@ page import="com.finalproj.mau.MuonTra"%>
<%@ page import="com.finalproj.tai.MuonTraDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách mượn trả</title>
<style>
/* Đặt kiểu chung */
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	height: 800px;
	background-color: #f0f0f0;
}

.header {
	background-color: #333;
	color: white;
	position: relative;
	/* Đặt để các phần tử bên trong có thể định vị tương đối */
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
	background-color: #ff1a1a;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	text-decoration: none;
}

.out:hover {
	background-color: #ff1a1a;
}

/* Container */
.container {
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 1000px;
	text-align: center;
}

h2 {
	margin-bottom: 20px;
}

/* Phong cách cho bảng */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #333;
	color: white;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

.btn-add {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
}

.btn-add:hover {
	background-color: #45a049;
}

.btn {
	background-color: #008CBA;
	color: white;
	padding: 5px 10px;
	text-decoration: none;
	border-radius: 3px;
}

.btn:hover {
	background-color: #007bb5;
}

.back-link {
	display: inline-block;
	margin-top: 20px;
	color: #333;
	text-decoration: none;
}

.back-link:hover {
	text-decoration: underline;
}

footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	text-align: center;
	padding: 10px;
	box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
}

footer .out {
	background-color: #333;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
}

footer .out:hover {
	background-color: #555;
}
</style>
</head>
<body>
	<header>
		<div class="header">
			<h1>Hệ thống quản lý mượn trả sách</h1>
			<a href="/deploy/TrangLuaChon.jsp" class="out" aria-label="Đăng xuất">Đăng xuất</a>
		</div>
	</header>

	<div class="container">
		<h2>Danh sách mượn trả sách</h2>

		<table>
			<thead>
				<tr>
					<th>Mã sinh viên</th>
					<th>Tên sinh viên</th>
					<th>Mã sách</th>
					<th>Ngày mượn</th>
					<th>Ngày trả</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<%
				MuonTraDao muonTraDao = new MuonTraDao();
				List<MuonTra> danhSachMuonTra = muonTraDao.layTatCaSV();
				for (MuonTra muonTra : danhSachMuonTra) {
				%>
				<tr>
					<td><%=muonTra.getMaSV()%></td>
					<td><%=muonTra.getTenSV()%></td>
					<td><%=muonTra.getMaSach()%></td>
					<td><%=muonTra.getNgayMuon()%></td>
					<td><%=muonTra.getNgayTra()%></td>
					<td><a
						href="/deploy/XoaMuonTraServlet?MaMuon=<%=muonTra.getMaMuon()%>"
						class="btn" aria-label="Xóa">Xóa</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<footer>
		<a href="/deploy/ThuVien/thuVien.jsp" class="out"
			aria-label="Trang chủ">Home</a>
	</footer>
</body>
</html>