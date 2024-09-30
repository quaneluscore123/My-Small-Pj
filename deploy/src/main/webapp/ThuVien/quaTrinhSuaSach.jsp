<%@ page import="com.finalproj.mau.Sach"%>
<%@ page import="com.finalproj.dichvu.DichVuSach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xử lý cập nhật sách</title>
    <style>
    	body{
    		font-family: Arial, Helvetica, sans-serif;
    	}
    </style>
</head>
<body>
    <%
            String maSach = request.getParameter("maSach");
            String tenSach = request.getParameter("tenSach");
            String tacGia = request.getParameter("tacGia");
            String theLoai = request.getParameter("theLoai");
            int soLuongTong = Integer.parseInt(request.getParameter("soLuongTong"));
            int soLuongMuon = Integer.parseInt(request.getParameter("soLuongMuon"));

            Sach sach = new Sach();
            sach.setMaSach(maSach);
            sach.setTenSach(tenSach);
            sach.setTacGia(tacGia);
            sach.setTheLoai(theLoai);
            sach.setSoluongtong(soLuongTong);
            sach.setSoluongmuon(soLuongMuon); 

            DichVuSach dichVuSach = new DichVuSach();
            dichVuSach.suaSach(sach);

            response.sendRedirect("TatCaSach.jsp");
    %>
</body>
</html>
