package com.finalproj.tai;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.finalproj.mau.NguoiQuanLy;

import java.sql.Date;
import java.time.LocalDate;

public class TaiNguoiQuanLy {
    
    public List<NguoiQuanLy> layTatCaNguoiQuanLy() {
        List<NguoiQuanLy> nhieuNguoiQuanLy = new ArrayList<>();
        
        String sql = "SELECT * FROM NGUOIQUANLY";
        try (Connection connection = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {
            
            while (rs.next()) {
                NguoiQuanLy nguoiQuanLy = new NguoiQuanLy();
                
                nguoiQuanLy.setMaQuanLy(rs.getString("MAQUANLY"));
                nguoiQuanLy.setHoTenNguoiQL(rs.getString("HoTenNguoiQL"));
                Date sqlDate = rs.getDate("NamSinh");
                LocalDate namSinh = sqlDate != null ? sqlDate.toLocalDate() : null;
                nguoiQuanLy.setNamSinh(namSinh);
                nguoiQuanLy.setEmail(rs.getString("EMAIL"));
                nguoiQuanLy.setGioiTinh(rs.getString("GioiTinh"));
                nguoiQuanLy.setTenNguoiDung(rs.getString("TenNguoiDung"));
                nguoiQuanLy.setMatkhau(rs.getString("GioiTinh"));
                
                nhieuNguoiQuanLy.add(nguoiQuanLy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return nhieuNguoiQuanLy;
    }
    
    public void themNguoiQuanLy(NguoiQuanLy nguoiQuanLy) {
        String sql = "INSERT INTO NGUOIQUANLY (MAQUANLY, HoTenNguoiQL, NamSinh, EMAIL, GioiTinh, TenNguoiDung, MatKhau) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection ketnoi = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = ketnoi.prepareStatement(sql)) {
            
            preparedStatement.setString(1, nguoiQuanLy.getMaQuanLy());
            preparedStatement.setString(2, nguoiQuanLy.getHoTenNguoiQL());


            LocalDate namSinh = nguoiQuanLy.getNamSinh();
            if (namSinh != null) {
                preparedStatement.setDate(3, Date.valueOf(namSinh)); 
            } else {
                preparedStatement.setNull(3, java.sql.Types.DATE);  
            }

            preparedStatement.setString(4, nguoiQuanLy.getEmail());
            preparedStatement.setString(5, nguoiQuanLy.getGioiTinh());
            preparedStatement.setString(6, nguoiQuanLy.getTenNguoiDung());
            preparedStatement.setString(7, nguoiQuanLy.getMatkhau());
            
            int soDongDuocThem = preparedStatement.executeUpdate();
            System.out.println("Dòng được thêm: " + soDongDuocThem);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public void suaNguoiQuanLy(NguoiQuanLy nguoiQuanLy) {
        String sql = "UPDATE NGUOIQUANLY SET MaQuanLy = ?, HoTenNguoiQL = ?, NamSinh = ?, EMAIL = ?, GioiTinh = ?, TenNguoiDung = ?, Matkhau = ?";
        
        try (Connection ketnoi = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = ketnoi.prepareStatement(sql)) {
            
            preparedStatement.setString(1, nguoiQuanLy.getHoTenNguoiQL());

            // Xử lý ngày sinh (birthday)
            if (nguoiQuanLy.getNamSinh() == null) {
                throw new IllegalArgumentException("Năm sinh không được để trống.");
            } else {
                preparedStatement.setDate(2, Date.valueOf(nguoiQuanLy.getNamSinh()));
            }
            preparedStatement.setString(3, nguoiQuanLy.getEmail());
            preparedStatement.setString(4, nguoiQuanLy.getGioiTinh());
            preparedStatement.setString(5, nguoiQuanLy.getTenNguoiDung());
            preparedStatement.setString(6, nguoiQuanLy.getMatkhau());
            
            preparedStatement.setString(7, nguoiQuanLy.getMaQuanLy());
            
            int suaNguoiQuanLy = preparedStatement.executeUpdate();
            System.out.println("Dòng được sửa: " + suaNguoiQuanLy);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void xoaNguoiQuanLy(String MaQuanLy) {
        String sql = "DELETE FROM NGUOIQUANLY WHERE MaQuanLy = ?";
        
        try (Connection ketnoi = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = ketnoi.prepareStatement(sql)) {
            
            preparedStatement.setString(1, MaQuanLy);
            
            int xoaNguoiQuanLy = preparedStatement.executeUpdate();
            System.out.println("Dòng được xoá: " + xoaNguoiQuanLy);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public NguoiQuanLy layNguoiQuanLyBangTaiKhoanvaMatKhau(String TenNguoiDung, String Matkhau) {
        String sql = "SELECT * FROM NGUOIQUANLY WHERE TenNguoiDung = ? AND Matkhau = ?";
        try (Connection connection = JDBCConnection.getJDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setString(1, TenNguoiDung);
            preparedStatement.setString(2, Matkhau);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    NguoiQuanLy nguoiQuanLy = new NguoiQuanLy();
                    nguoiQuanLy.setMaQuanLy(rs.getString("MaQuanLy"));
                    nguoiQuanLy.setHoTenNguoiQL(rs.getString("HoTenNguoiQL"));
                    nguoiQuanLy.setNamSinh(rs.getDate("NamSinh").toLocalDate());
                    nguoiQuanLy.setEmail(rs.getString("EMAIL"));
                    nguoiQuanLy.setGioiTinh(rs.getString("GioiTinh"));
                    nguoiQuanLy.setTenNguoiDung(rs.getString("TenNguoiDung"));
                    nguoiQuanLy.setMatkhau(rs.getString("Matkhau"));
                    return nguoiQuanLy;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

