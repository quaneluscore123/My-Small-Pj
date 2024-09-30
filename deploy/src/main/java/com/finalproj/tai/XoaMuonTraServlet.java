package com.finalproj.tai;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/XoaMuonTraServlet")
public class XoaMuonTraServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
        String maMuon = request.getParameter("MaMuon");
        String maSach = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nguoiqlcsdl?useUnicode=true&characterEncoding=UTF-8", "root", "Quanopo123+");

            // Tìm mã sách dựa trên mã mượn
            ps = conn.prepareStatement("SELECT MaSach FROM MuonTra WHERE MaMuon = ?");
            ps.setString(1, maMuon);
            rs = ps.executeQuery();

            if (rs.next()) {
                maSach = rs.getString("MaSach");
            }

            // Xóa bản ghi trong bảng MuonTra
            ps = conn.prepareStatement("DELETE FROM MuonTra WHERE MaMuon = ?");
            ps.setString(1, maMuon);
            ps.executeUpdate();

            // Cập nhật số lượng sách
            if (maSach != null) {
                String capNhatSach = "UPDATE Sach SET Soluongmuon = Soluongmuon - 1, Soluongcon = Soluongcon + 1 WHERE MaSach = ?";
                ps = conn.prepareStatement(capNhatSach);
                ps.setString(1, maSach);
                ps.executeUpdate();
            }

            response.sendRedirect("/deploy/MuonTra/DSMuonTra.jsp"); // Redirect về danh sách sau khi xóa
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
