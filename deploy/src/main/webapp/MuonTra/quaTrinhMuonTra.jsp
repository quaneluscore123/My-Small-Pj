<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<title>Quá Trình Mượn Trả</title>
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
	String MaSV = request.getParameter("MaSV");
	String TenSV = request.getParameter("TenSV");
	String MaMuon = request.getParameter("MaMuon");
	String[] sachDaChon = (String[]) request.getSession().getAttribute("sachDaChon");

	if (sachDaChon == null || sachDaChon.length == 0) {
		out.println("<div class='container'>");
		out.println("<h1>Không có sách nào được chọn</h1>");
		out.println("<a href='/deploy/ThuVien/thuVien.jsp'>Quay lại trang chính</a>");
		out.println("</div>");
		return; // Kết thúc nếu không có sách được chọn
	}

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/nguoiqlcsdl?useUnicode=true&characterEncoding=UTF-8", "root", "Quanopo123+");

		for (String thongTinSach : sachDaChon) {
			String[] moTaSach = thongTinSach.split(",");
			String maSach = moTaSach[0];

			ps = conn.prepareStatement("SELECT COUNT(*) FROM MuonTra WHERE MaSV = ? AND MaSach = ?");
			ps.setString(1, MaSV);
			ps.setString(2, maSach);
			rs = ps.executeQuery();

			if (rs.next() && rs.getInt(1) > 0) {
		out.println("<div class='container'>");
		out.println("<h1>Bạn đã mượn sách này trước đó</h1>");
		out.println("<a href='/deploy/ThuVien/thuVien.jsp'>Quay lại trang chính</a>");
		out.println("</div>");
		continue; // Bỏ qua sách này nếu đã mượn
			} else {
		String ngayMuonStr = request.getParameter("NgayMuon");
		String ngayTraStr = request.getParameter("NgayTra");

		if (ngayMuonStr == null || ngayTraStr == null || ngayMuonStr.isEmpty() || ngayTraStr.isEmpty()) {
			out.println("<div class='container'>");
			out.println("<h1>Ngày mượn hoặc ngày trả không hợp lệ</h1>");
			out.println("<a href='/deploy/ThuVien/thuVien.jsp'>Quay lại trang chính</a>");
			out.println("</div>");
			return;
		}

		LocalDate ngayMuon = LocalDate.parse(ngayMuonStr);
		LocalDate ngayTra = LocalDate.parse(ngayTraStr);

		if (ngayMuon.isAfter(ngayTra)) {
			out.println("<div class='container'>");
			out.println("<h1>Ngày trả phải trước ngày mượn</h1>");
			out.println("<a href='/deploy/ThuVien/thuVien.jsp'>Quay lại trang chính</a>");
			out.println("</div>");
			return;
		}

		// Thêm dữ liệu mượn sách vào bảng MuonTra
		String themVaoCSDL = "INSERT INTO MuonTra (MaMuon, MaSV, TenSV, MaSach, NgayMuon, NgayTra) VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement thucHien = conn.prepareStatement(themVaoCSDL);

		thucHien.setString(1, MaMuon); // Sử dụng mã mượn từ form
		thucHien.setInt(2, Integer.parseInt(MaSV));
		thucHien.setString(3, TenSV);
		thucHien.setString(4, maSach);
		thucHien.setDate(5, java.sql.Date.valueOf(ngayMuon));
		thucHien.setDate(6, java.sql.Date.valueOf(ngayTra));

		int dongThucHien = thucHien.executeUpdate();
		if (dongThucHien > 0) {
			out.println("<div class='container'>");
			out.println("<h1>Đã cập nhật danh sách mượn trả thành công</h1>");

			// Cập nhật số lượng sách
			String capNhatSach = "UPDATE Sach SET Soluongmuon = Soluongmuon + 1, Soluongcon = Soluongcon - 1 WHERE MaSach = ?";
			// Khởi tạo SQL để cập nhật sách 
			PreparedStatement khoiTao = conn.prepareStatement(capNhatSach);
			khoiTao.setString(1, maSach);
			int DongCapNhat = khoiTao.executeUpdate();

			if (DongCapNhat > 0) {
				out.println("<a href='/deploy/ThuVien/thuVien.jsp'>Quay lại trang chính</a>");
				out.println("</div>");
			} else {
				out.println("<div class='container'>");
				out.println("<h1>Không thể cập nhật số lượng cho mã sách: " +maSach +" </h1>");
				out.println("<a href='/deploy/ThuVien/thuVien.jsp'>Quay lại trang chính</a>");
				out.println("</div>");
			}

			khoiTao.close();
		}
		thucHien.close();
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.println("Lỗi xảy ra: " + e.getMessage());
	} finally {
		try {
			if (rs != null)
		rs.close();
			if (ps != null)
		ps.close();
			if (conn != null)
		conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	%>
</body>
</html>
