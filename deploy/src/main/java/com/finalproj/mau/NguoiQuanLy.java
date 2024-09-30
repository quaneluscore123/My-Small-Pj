package com.finalproj.mau;

import java.time.LocalDate;

public class NguoiQuanLy {
	private String MaQuanLy;
	private String HoTenNguoiQL;
	private LocalDate NamSinh;
	private String email;
	private String GioiTinh;
	private String TenNguoiDung;
	private String Matkhau;
	public String getMaQuanLy() {
		return MaQuanLy;
	}
	public void setMaQuanLy(String maQuanLy) {
		MaQuanLy = maQuanLy;
	}
	public String getHoTenNguoiQL() {
		return HoTenNguoiQL;
	}
	public void setHoTenNguoiQL(String hoTenNguoiQL) {
		HoTenNguoiQL = hoTenNguoiQL;
	}
	public LocalDate getNamSinh() {
		return NamSinh;
	}
	public void setNamSinh(LocalDate namSinh) {
		NamSinh = namSinh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}
	public String getTenNguoiDung() {
		return TenNguoiDung;
	}
	public void setTenNguoiDung(String tenNguoiDung) {
		TenNguoiDung = tenNguoiDung;
	}
	public String getMatkhau() {
		return Matkhau;
	}
	public void setMatkhau(String matkhau) {
		Matkhau = matkhau;
	}
}
