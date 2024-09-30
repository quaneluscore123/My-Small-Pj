package com.finalproj.mau;

import java.time.LocalDate;

public class MuonTra {

	private String MaMuon;
	private int MaSV;
	private String TenSV;
	private String MaSach;
	private LocalDate NgayMuon;
	private LocalDate NgayTra;
	
	public String getMaMuon() {
		return MaMuon;
	}
	public void setMaMuon(String maMuon) {
		MaMuon = maMuon;
	}
	public int getMaSV() {
		return MaSV;
	}
	public void setMaSV(int maSV) {
		MaSV = maSV;
	}
	public String getTenSV() {
	    return this.TenSV; 
	}
	public void setTenSV(String tenSV) {
		TenSV = tenSV;
	}
	public String getMaSach() {
		return MaSach;
	}
	public void setMaSach(String maSach) {
		MaSach = maSach;
	}
	public LocalDate getNgayMuon() {
		return NgayMuon;
	}
	public void setNgayMuon(LocalDate ngayMuon) {
		NgayMuon = ngayMuon;
	}
	public LocalDate getNgayTra() {
		return NgayTra;
	}
	public void setNgayTra(LocalDate ngayTra) {
		NgayTra = ngayTra;
	}
	
}
