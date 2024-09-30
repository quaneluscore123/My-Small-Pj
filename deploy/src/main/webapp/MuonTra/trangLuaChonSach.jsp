<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng ký mượn sách</title>
<style>
/* Thiết lập chung cho trang */
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
	height: 800px;
}

/* Phần header */
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

/* Container chính */
.container {
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	max-width: 900px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	flex-grow: 1;
}

/* Thanh tìm kiếm */
.search-bar {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.search-input {
	width: 300px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.btn-search {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	margin-left: 10px;
	border-radius: 5px;
	cursor: pointer;
}

.btn-search:hover {
	background-color: #45a049;
}

/* Bảng danh sách sách */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #ddd;
}

table td input[type="checkbox"] {
	transform: scale(1.2); /* Tăng kích thước nút chọn */
	margin: 0;
}

/* Phong cách cho nút Đăng ký */
.actions {
	text-align: center;
	margin-top: 20px;
}

.actions .btn-submit {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

.actions .btn-submit:hover {
	background-color: #45a049;
}

/* Nút Home ở footer */
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
			<h1>Đăng ký mượn sách</h1>
			<a href="/deploy/TrangLuaChon.jsp" class="out">Đăng xuất</a>
		</div>
	</header>

	<div class="container">
		<div class="search-bar">
			<form method="get" action="/deploy/MuonTra/trangLuaChonSach.jsp">
				<input type="text" name="timKiem" placeholder="Tìm sách theo tên"
					class="search-input"
					value="<%=request.getParameter("timKiem") != null ? request.getParameter("timKiem") : ""%>">
				<button type="submit" class="btn-search">Tìm kiếm</button>
			</form>
		</div>

		<form action="/deploy/MuonTra/dangKyMuonSach.jsp" method="post">
			<table>
				<tr>
					<th>Chọn</th>
					<th>Mã sách</th>
					<th>Tên sách</th>
					<th>Tác giả</th>
					<th>Thể loại</th>
					<th>Tổng số lượng</th>
					<th>Số lượng mượn</th>
					<th>Số lượng còn</th>
				</tr>
				<%
				// Kết nối CSDL và lấy danh sách sách
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nguoiqlcsdl?useUnicode=true&characterEncoding=UTF-8", "root", "Quanopo123+");
					String searchQuery = "SELECT * FROM Sach";
					String searchParam = request.getParameter("timKiem");

					if (searchParam != null && !searchParam.trim().isEmpty()) {
						searchQuery += " WHERE TenSach LIKE ?";
						ps = conn.prepareStatement(searchQuery);
						ps.setString(1, "%" + searchParam + "%");
					} else {
						ps = conn.prepareStatement(searchQuery);
					}

					rs = ps.executeQuery();
					while (rs.next()) {
				%>
				<tr>
					<td><input type="checkbox" name="sachDaChon"
						value="<%=rs.getString("MaSach")%>,<%=rs.getString("TenSach")%>,<%=rs.getString("TacGia")%>,<%=rs.getString("TheLoai")%>,<%=rs.getInt("SoLuongCon")%>">
					</td>

					<td><%=rs.getString("MaSach")%></td>
					<td><%=rs.getString("TenSach")%></td>
					<td><%=rs.getString("TacGia")%></td>
					<td><%=rs.getString("TheLoai")%></td>
					<td><%=rs.getInt("SoLuongTong")%></td>
					<td><%=rs.getInt("SoLuongMuon")%></td>
					<td><%=rs.getInt("SoLuongCon")%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				} finally {
				if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				}
				%>
			</table>
			<div class="actions">
				<button type="submit" class="btn-submit">Đăng ký mượn sách</button>
			</div>
		</form>

	</div>

	<footer>
		<a href="/deploy/ThuVien/thuVien.jsp" class="out">Home</a>
	</footer>
</body>
</html>