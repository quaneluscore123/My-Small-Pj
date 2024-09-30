package com.finalproj.tai;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.finalproj.mau.MuonTra;

public class MuonTraDao {

	public List<MuonTra> layTatCaSV() {
		List<MuonTra> danhSachMuonTra = new ArrayList<>();
		String sql = "SELECT * FROM MuonTra";

		try (Connection ketnoi = JDBCConnection.getJDBConnection();
				PreparedStatement preparedStatement = ketnoi.prepareStatement(sql);
				ResultSet rs = preparedStatement.executeQuery()) {

			while (rs.next()) {
				MuonTra muonTra = new MuonTra();
				muonTra.setMaMuon(rs.getString("MaMuon"));
				muonTra.setMaSV(rs.getInt("MaSV"));
				muonTra.setTenSV(rs.getString("TenSV"));
				muonTra.setMaSach(rs.getString("MaSach"));
				LocalDate ngayMuon = rs.getDate("NgayMuon") != null ? rs.getDate("NgayMuon").toLocalDate() : null;
				muonTra.setNgayMuon(ngayMuon);

				LocalDate ngayTra = rs.getDate("NgayTra") != null ? rs.getDate("NgayTra").toLocalDate() : null;
				muonTra.setNgayTra(ngayTra);

				danhSachMuonTra.add(muonTra);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return danhSachMuonTra;
	}

	public void xoaMuonTra(String maMuon) {
		String sql = "DELETE FROM MuonTra WHERE MaMuon = ?";

		try (Connection ketnoi = JDBCConnection.getJDBConnection();
				PreparedStatement preparedStatement = ketnoi.prepareStatement(sql)) {

			preparedStatement.setString(1, maMuon);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
