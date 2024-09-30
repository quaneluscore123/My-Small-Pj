<%@ page import="com.finalproj.mau.Sach"%>
<%@ page import="com.finalproj.dichvu.DichVuSach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật sách</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #555;
        }

        a {
            padding: 10px;
            text-decoration: none;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f4f4f4;
            text-align: center;
            font-size: 16px;
            margin-top: 10px;
            display: block;
        }

        a:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
                        // Lấy mã sách từ request để load dữ liệu
                        String maSach = request.getParameter("maSach");

                        DichVuSach dichVuSach = new DichVuSach();
                        Sach sach = dichVuSach.laySachTheoMaSach(maSach);

                        if (sach != null) {
        %>
        <h2>Cập nhật sách</h2>
        <form action="quaTrinhSuaSach.jsp" method="post">
            <input type="hidden" name="maSach" value="<%= sach.getMaSach() %>" />
            
            <label for="tenSach">Tên Sách:</label>
            <input type="text" name="tenSach" value="<%= sach.getTenSach() %>" required /><br>
            
            <label for="tacGia">Tác giả:</label>
            <input type="text" name="tacGia" value="<%= sach.getTacGia() %>" required /><br>
            
            <label for="theLoai">Thể loại:</label>
            <input type="text" name="theLoai" value="<%= sach.getTheLoai() %>" required /><br>
            
            <label for="soLuongTong">Số Lượng Tổng:</label>
            <input type="number" name="soLuongTong" value="<%= sach.getSoluongtong() %>" required /><br>

            <input type="hidden" name="soLuongMuon" value="<%= sach.getSoluongmuon() %>" readonly /><br>

            <button type="submit">Cập nhật</button>
        </form>
        <a href="/deploy/ThuVien/TatCaSach.jsp">Quay lại trang danh sách</a>
        <%
        } else {
            out.println("<p>Không tìm thấy sách với mã: " + maSach + "</p>");
        }
        %>
    </div>
</body>
</html>
