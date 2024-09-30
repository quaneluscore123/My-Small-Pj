<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Sách</title>
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
    		max-width: 400px; /* Điều chỉnh lại chiều rộng container */
    		text-align: center;
  		}

		h2{
    		font-size: 22px;
    		margin-bottom: 20px;
		}

		.form-group {
    		margin-bottom: 15px;
    		text-align: left;
		}

		label {
   		 	display: block;
    		margin-bottom: 5px;
    		font-weight: bold;
		}

		input[type="text"], input[type="number"] {
    		width: 100%;
    		padding: 10px;
    		border: 1px solid #ccc;
    		border-radius: 4px;
    		font-size: 16px;
    		box-sizing: border-box;
		}

		.submit-btn {
    		background-color: #4CAF50;
    		color: white;
    		padding: 10px 20px;
    		border: none;
    		border-radius: 5px;
    		cursor: pointer;
    		font-size: 16px;
    		width: 100%;
    		margin-top: 10px;
		}

		.submit-btn:hover {
    		background-color: #45a049;
		}

		.back-link {
   			display: block;
    		margin-top: 20px;
    		color: #333;
    		text-decoration: none;
		}

		.back-link:hover {
    		text-decoration: underline;
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
        <h2>Nhập thông tin sách:</h2>

        <form action="/deploy/ThuVien/quaTrinhThemSach.jsp" method="POST">
            <div class="form-group">
                <label for="maSach">Mã Sách:</label>
                <input type="text" id="maSach" name="maSach" required>
            </div>

            <div class="form-group">
                <label for="tenSach">Tên Sách:</label>
                <input type="text" id="tenSach" name="tenSach" required>
            </div>
            
            <div class="form-group">
                <label for="tacGia">Tác Giả:</label>
                <input type="text" id="tacGia" name="tacGia" required>
            </div>
            
            <div class="form-group">
                <label for="theLoai">Thể loại:</label>
                <input type="text" id="theLoai" name="theLoai" required>
            </div>

            <div class="form-group">
                <label for="soLuongTong">Số Lượng Tổng:</label>
                <input type="number" id="soLuongTong" name="soLuongTong" required>
            </div>

            <button type="submit" class="submit-btn">Thêm Sách</button>
        </form>

        <a href="/deploy/ThuVien/TatCaSach.jsp" class="back-link">Quay lại danh sách sách</a>
    </div>
</body>
</html>
