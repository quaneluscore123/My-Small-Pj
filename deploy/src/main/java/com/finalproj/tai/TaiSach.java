package com.finalproj.tai;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

import com.finalproj.mau.Sach;

public class TaiSach extends HttpServlet {

    public List<Sach> layTatCaSach(){
        List<Sach> tatCaSach = new ArrayList<>();
        
        String sql = "SELECT * FROM SACH";
        try (Connection connection = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                Sach sach = new Sach();

                sach.setMaSach(rs.getString("MaSach"));
                sach.setTenSach(rs.getString("TenSach"));
                sach.setTacGia(rs.getString("TacGia"));
                sach.setTheLoai(rs.getString("TheLoai"));
                sach.setSoluongtong(rs.getInt("SoLuongTong"));
                sach.setSoluongmuon(rs.getInt("SoLuongMuon"));
                sach.setSoluongcon(rs.getInt("SoLuongCon"));

                tatCaSach.add(sach);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tatCaSach; 
    }

    public void themSach(Sach sach) {
        if (sach.getSoluongtong() > 0) {
            String sql = "INSERT INTO Sach (MaSach, TenSach, TacGia, TheLoai, SoLuongTong, SoLuongMuon, SoLuongCon) VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (Connection connection = JDBCConnection.getJDBConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

                preparedStatement.setString(1, sach.getMaSach());
                preparedStatement.setString(2, sach.getTenSach());
                preparedStatement.setString(3, sach.getTacGia());
                preparedStatement.setString(4, sach.getTheLoai());
                preparedStatement.setInt(5, sach.getSoluongtong());
                preparedStatement.setInt(6, sach.getSoluongmuon());
                preparedStatement.setInt(7, sach.getSoluongcon());

                int rowsAffected = preparedStatement.executeUpdate();
                System.out.println("Số dòng được tạo trong MySQL: " + rowsAffected);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Dữ liệu không hợp lệ. Không thể thêm sách.");
        }
    }

    public boolean sachDaTonTai(String maSach) {
        boolean tonTai = false;
        String sql = "SELECT COUNT(*) FROM Sach WHERE MaSach = ?";
        
        try (Connection connection = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setString(1, maSach);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                int count = rs.getInt(1);
                tonTai = count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return tonTai;
    }
    
    public void suaSach(Sach sach) {
        if (sach.getSoluongtong() > 0) {
            int soLuongCon = sach.getSoluongtong() - sach.getSoluongmuon();
            
            String sql = "UPDATE Sach SET TenSach = ?, TacGia = ?, TheLoai = ?, SoLuongTong = ?, SoLuongCon = ? WHERE MaSach = ?";

            try (Connection connection = JDBCConnection.getJDBConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

                preparedStatement.setString(1, sach.getTenSach());
                preparedStatement.setString(2, sach.getTacGia());
                preparedStatement.setString(3, sach.getTheLoai());
                preparedStatement.setInt(4, sach.getSoluongtong());
                preparedStatement.setInt(5, soLuongCon);  
                preparedStatement.setString(6, sach.getMaSach());

                int rowsAffected = preparedStatement.executeUpdate();
                System.out.println("Số dòng được cập nhật trong MySQL: " + rowsAffected);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Dữ liệu không hợp lệ. Không thể cập nhật sách.");
        }
    }


    public Sach laySachTheoMaSach(String maSach) {
        Sach sach = null;
        String sql = "SELECT * FROM Sach WHERE MaSach = ?";
        
        try (Connection connection = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setString(1, maSach);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
            	sach = new Sach();
            	sach.setMaSach(rs.getString("MaSach"));
            	sach.setTenSach(rs.getString("TenSach"));
            	sach.setTacGia(rs.getString("TacGia"));
            	sach.setTheLoai(rs.getString("TheLoai"));
            	sach.setSoluongtong(rs.getInt("SoLuongTong"));
            	sach.setSoluongmuon(rs.getInt("SoLuongMuon"));
            	sach.setSoluongcon(rs.getInt("SoLuongCon"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return sach;
    }
    
    public void xoaSach(String maSach) {
        String sql = "DELETE FROM SACH WHERE MaSach = ?";

        try (Connection ketnoi = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = ketnoi.prepareStatement(sql)) {

            preparedStatement.setString(1, maSach); 
            
            int Dongkhoitao = preparedStatement.executeUpdate();
            if (Dongkhoitao > 0) {
                System.out.println("Sách với mã " + maSach + " đã được xóa thành công.");
            } else {
                System.out.println("Không tìm thấy sách với mã " + maSach + " để xóa.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
