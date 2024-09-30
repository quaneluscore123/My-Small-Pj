package com.finalproj.dichvu;

import java.util.List;

import com.finalproj.mau.Sach;
import com.finalproj.tai.TaiSach;

public class DichVuSach {

    private TaiSach TaiSach;

    public DichVuSach() {
    	TaiSach = new TaiSach();
    }

    //Mã sách không trùng lặp
    public boolean sachDaTonTai(String maSach) {
        return TaiSach.sachDaTonTai(maSach);
    }
    
    // Lấy tất cả sách
    public List<Sach> layTatCaSach() {
        return TaiSach.layTatCaSach();
    }

    // Thêm sách
    public void themSach(Sach sach) {
    	TaiSach.themSach(sach); 
    }

    public Sach laySachTheoMaSach(String maSach) {
        return TaiSach.laySachTheoMaSach(maSach);
    }
    
    //Sửa sách
    public void suaSach(Sach sach) {
    	TaiSach.suaSach(sach); 
    }

    // Xóa sách
    public void xoaSach(String maSach) {
    	TaiSach.xoaSach(maSach);  
    }
}