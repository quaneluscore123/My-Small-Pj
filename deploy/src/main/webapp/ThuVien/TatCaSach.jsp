<%@ page import="java.util.List"%>
<%@ page import="com.finalproj.mau.Sach"%>
<%@ page import="com.finalproj.dichvu.DichVuSach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý Sách</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	height: 8000px;
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

.container {
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 1200px;
}

h1 {
	text-align: center;
}

.head {
	display: flex;
	justify-content: space-between;
}

.btn2 {
	display: inline-block;
	padding: 10px 20px;
	background-color: #333;
	color: white;
	text-align: center;
	border-radius: 5px;
	text-decoration: none;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 12px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #333;
	color: white;
	text-align: center;
	border-radius: 5px;
	text-decoration: none;
	cursor: pointer;
}

.btn:hover {
	background-color: #555;
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

footer .btn:hover {
	background-color: #555;
}
</style>
</head>
<body>
	<header>
		<div class="header">
			<h1>Quản lý sách</h1>
			<a href="/deploy/TrangLuaChon.jsp" class="out">Đăng xuất</a>
		</div>
	</header>

	<div class="container">
		<div class="head">
			<h2>Danh sách sách</h2>
			<h3>
				<a href="/deploy/ThuVien/themSach.jsp" class="btn2">Thêm sách mới</a>
			</h3>
		</div>

		<%
		DichVuSach dichVuSach = new DichVuSach();
		List<Sach> danhSachSach = dichVuSach.layTatCaSach();
		String hanhDong = request.getParameter("hanhDong");
		String maSach = request.getParameter("maSach");

		if ("delete".equals(hanhDong) && maSach != null) {
			dichVuSach.xoaSach(maSach);
			response.sendRedirect("TatCaSach.jsp");
		}
		if (danhSachSach != null && !danhSachSach.isEmpty()) {
		%>
		<table>
			<tr>
				<th>Mã Sách</th>
				<th>Tên Sách</th>
				<th>Tác giả</th>
				<th>Thể loại</th>
				<th>Số Lượng Tổng</th>
				<th>Số Lượng Mượn</th>
				<th>Số Lượng Còn</th>
				<th>Hành động</th>
			</tr>
			<%
			for (Sach sach : danhSachSach) {
			%>
			<tr>
				<td><%=sach.getMaSach()%></td>
				<td><%=sach.getTenSach()%></td>
				<td><%=sach.getTacGia()%></td>
				<td><%=sach.getTheLoai()%></td>
				<td><%=sach.getSoluongtong()%></td>
				<td><%=sach.getSoluongmuon()%></td>
				<td><%=sach.getSoluongcon()%></td>
				<td>
					<form action="TatCaSach.jsp" method="get" style="display: inline;">
						<input type="hidden" name="maSach" value="<%=sach.getMaSach()%>">
						<input type="hidden" name="hanhDong" value="delete"> <input
							type="submit" value="Xóa" class="btn">
					</form> <a
					href="/deploy/ThuVien/suaSach.jsp?maSach=<%=sach.getMaSach()%>"
					class="btn">Sửa</a>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		} else {
		out.println("<p>Không có sách nào trong hệ thống.</p>");
		}
		%>

	</div>

	<footer>
		<a href="/deploy/ThuVien/thuVien.jsp" class="out">Home</a>
	</footer>

</body>
</html>
