<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finalproj.dichvu.DichVuNguoiQuanLy" %>
<%@ page import="com.finalproj.mau.NguoiQuanLy" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng kí</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background-color: #fff;
	padding: 40px;
	text-align: center;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 500px;
	width: 100%;
}

h1 {
	font-size: 24px;
	color: #2c3e50;
	margin-bottom: 20px;
}

p {
	font-size: 16px;
	color: #7f8c8d;
	margin-bottom: 30px;
}

a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #3498db;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

a:hover {
	background-color: #2980b9;
}
</style>
</head>
<body>
	<%
	String maQuanLy = request.getParameter("MaQuanLy");
	String hoTen = request.getParameter("HoTenNguoiQL");
	LocalDate namSinh = LocalDate.parse(request.getParameter("NamSinh"));
	String email = request.getParameter("email");
	String gioiTinh = request.getParameter("GioiTinh");
	String tenTaiKhoan = request.getParameter("TenNguoiDung");
	String matKhau = request.getParameter("Matkhau");

	NguoiQuanLy quanLyMoi = new NguoiQuanLy();
	quanLyMoi.setMaQuanLy(maQuanLy);
	quanLyMoi.setHoTenNguoiQL(hoTen);
	quanLyMoi.setNamSinh(namSinh);
	quanLyMoi.setEmail(email);
	quanLyMoi.setGioiTinh(gioiTinh);
	quanLyMoi.setTenNguoiDung(tenTaiKhoan);
	quanLyMoi.setMatkhau(matKhau);

	DichVuNguoiQuanLy dichVuNguoiQuanLy = new DichVuNguoiQuanLy();
	dichVuNguoiQuanLy.themNguoiQuanLy(quanLyMoi);
	%>

	<div class="container">
		<h1>Bạn đã đăng kí thành công!</h1>
		<p>Vui lòng quay lại để đăng nhập vào dịch vụ của chúng tôi.</p>
		<a href="/deploy/TrangLuaChon.jsp">Trở về</a>
	</div>
</body>
</html>
