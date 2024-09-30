<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng kí</title>
    <style>
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
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        h1 {
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="date"],
        select {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
        a {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Đăng kí</h1>
        <form action="QuaTrinhDangKy.jsp" method="post">
            <label for="MaQuanLy">Mã quản trị viên:</label>
            <input type="text" id="MaQuanLy" name="MaQuanLy" required>
            <label for="HoTenNguoiQL">Họ và tên(viết không dấu):</label>
            <input type="text" id="HoTenNguoiQL" name="HoTenNguoiQL" required>
            <label for="NamSinh">Ngày sinh:</label>
            <input type="date" id="NamSinh" name="NamSinh" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="GioiTinh">Giới tính:</label>
            <select id="GioiTinh" name="GioiTinh" required>
                <option value="Nam">Nam</option>
                <option value="Nu">Nữ</option>
                <option value="Khác">Khác</option>
            </select>
            <label for="TenNguoiDung">Tên đăng nhập: </label>
            <input type="text" id="TenNguoiDung" name="TenNguoiDung" required>
            <label for="Matkhau">Mật khẩu: </label>
            <input type="password" id="Matkhau" name="Matkhau" required>
            <button type="submit">Đăng kí</button>
        </form>
        <a href="/deploy/TrangLuaChon.jsp">Quay lại</a>
    </div>
</body>
</html>
