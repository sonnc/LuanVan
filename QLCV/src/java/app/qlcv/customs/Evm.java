/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

/**
 *
 * @author sonng
 */
public class Evm {
    String daiLuong;
    String giaTri;
    String thongTin;

    public Evm() {
    }

    public Evm(String daiLuong, String giaTri, String thongTin) {
        this.daiLuong = daiLuong;
        this.giaTri = giaTri;
        this.thongTin = thongTin;
    }

    public String getDaiLuong() {
        return daiLuong;
    }

    public void setDaiLuong(String daiLuong) {
        this.daiLuong = daiLuong;
    }

    public String getGiaTri() {
        return giaTri;
    }

    public void setGiaTri(String giaTri) {
        this.giaTri = giaTri;
    }

    public String getThongTin() {
        return thongTin;
    }

    public void setThongTin(String thongTin) {
        this.thongTin = thongTin;
    }
    
    
}
