<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng ký mượn sách</title>
<style>
/* Đặt font chung */
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
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

#borrowId {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	margin-bottom: 10px;
}

.form-group label[for="borrowId"] {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
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
	background-color: #c0392b;
}

.container {
	max-width: 1000px;
	margin: 50px auto;
	padding: 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h2 {
	font-size: 24px;
	margin-bottom: 20px;
	color: #2c3e50;
	font-weight: 700;
}

.form-container {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.form-group {
	display: flex;
	flex-direction: column;
	gap: 5px;
}

.form-group label {
	font-size: 18px;
	color: #34495e;
	padding: 10px;
}

.form-group input {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

.form-group input:focus {
	outline: none;
	border-color: #3498db;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
}

table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
}

table th, table td {
	padding: 15px;
	border: 1px solid #ddd;
	text-align: center;
	font-size: 16px;
}

table th {
	background-color: #333;
	color: white;
}

table tr:hover {
	background-color: #f2f2f2;
}

.actions {
	text-align: center;
	margin-top: 30px;
}

.btn-submit {
	padding: 15px 30px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn-submit:hover {
	background-color: #2980b9;
}

/* Responsive */
@media ( max-width : 768px) {
	.search-bar {
		flex-direction: column;
	}
	.btn-search {
		width: 100%;
	}
	table th, table td {
		font-size: 14px;
	}
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
			<h1>Đăng ký mượn sách</h1>
			<a href="/deploy/TrangLuaChon.jsp" class="out">Đăng xuất</a>
		</div>
	</header>

	<div class="container">
		<div class="form-container">
			<h2>Thông tin sinh viên</h2>
			<form action="/deploy/MuonTra/quaTrinhMuonTra.jsp" method="post" accept-charset="UTF-8">
				<div class="form-group">
					<label for="MaMuon">Mã Mượn:</label> <input type="text" id="MaMuon"
						name="MaMuon" placeholder="Nhập mã mượn" required>
				</div>

				<div class="form-group">
					<label for="MaSV">Mã Sinh Viên:</label> <input type="text"
						id="MaSV" name="MaSV" placeholder="Nhập mã sinh viên" required>
				</div>

				<div class="form-group">
					<label for="TenSV">Tên Sinh Viên:</label> <input type="text"
						id="TenSV" name="TenSV" placeholder="Nhập tên sinh viên" required>
				</div>

				<div class="form-group">
					<label for="NgayMuon">Ngày Mượn:</label> <input type="date"
						id="NgayMuon" name="NgayMuon" required>
				</div>

				<div class="form-group">
					<label for="NgayTra">Ngày Trả:</label> <input type="date"
						id="NgayTra" name="NgayTra" required>
				</div>
				<h2>Sách đã chọn</h2>
				<table>
					<thead>
						<tr>
							<th>Mã sách</th>
							<th>Tên sách</th>
							<th>Tác giả</th>
							<th>Thể loại</th>
							<th>Số lượng còn</th>
						</tr>
					</thead>
					<tbody>
						<%
						String[] sachDaChon = request.getParameterValues("sachDaChon");
						if (sachDaChon != null) {
							request.getSession().setAttribute("sachDaChon", sachDaChon);
							for (String thongTinSach : sachDaChon) {
								String[] chiTietSach = thongTinSach.split(","); 
								String maSach = chiTietSach[0];
								String tenSach = chiTietSach[1];
								String tacGia = chiTietSach[2];
								String theLoai = chiTietSach[3];
								int soLuongCon = Integer.parseInt(chiTietSach[4]);
						%>
						<tr>
							<td><%=maSach%></td>
							<td><%=tenSach%></td>
							<td><%=tacGia%></td>
							<td><%=theLoai%></td>
							<td><%=soLuongCon%></td>
						</tr>
						<%
						}
						} else {
						out.println("Không nhận được dữ liệu sách đã chọn.<br>");
						}
						%>
					</tbody>
				</table>

				<div class="actions">
					<input type="submit" value="Đăng ký mượn sách" class="btn-submit">
				</div>
			</form>
		</div>
	</div>
	<footer>
		<a href="/deploy/ThuVien/thuVien.jsp" class="out">Home</a>
	</footer>
</body>
</html>
