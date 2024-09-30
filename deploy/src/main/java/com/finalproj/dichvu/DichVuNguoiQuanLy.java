package com.finalproj.dichvu;

import java.util.List;

import com.finalproj.mau.NguoiQuanLy;
import com.finalproj.tai.TaiNguoiQuanLy;

public class DichVuNguoiQuanLy {
    
    private TaiNguoiQuanLy taiNguoiQuanLy; 
    
    public DichVuNguoiQuanLy() {
    	taiNguoiQuanLy = new TaiNguoiQuanLy(); 
    }
    
    public List<NguoiQuanLy> layTatCaNguoiQuanLy() {
        try {
            return taiNguoiQuanLy.layTatCaNguoiQuanLy(); 
        } catch (Exception e) {
            System.err.println("Lỗi lấy người dùng: " + e.getMessage());
            return null;
        }
    }
    
    public void themNguoiQuanLy(NguoiQuanLy nguoiQuanLy) {
        try {
        	taiNguoiQuanLy.themNguoiQuanLy(nguoiQuanLy); 
        } catch (Exception e) {
            System.err.println("Lỗi thêm người quản lí: " + e.getMessage());
        }
    }
    
    public void suaNguoiQuanLy(NguoiQuanLy nguoiQuanLy) {
        try {
        	taiNguoiQuanLy.suaNguoiQuanLy(nguoiQuanLy); 
        } catch (Exception e) {
            System.err.println("Lỗi cập nhật người quản lý: " + e.getMessage());
        }
    }
    
    public void xoaNguoiQuanLy(String MaQuanLy) {
        try {
        	taiNguoiQuanLy.xoaNguoiQuanLy(MaQuanLy); 
        } catch (Exception e) {
            System.err.println("Lỗi xoá người quản lý: " + e.getMessage());
        }
    }
}


