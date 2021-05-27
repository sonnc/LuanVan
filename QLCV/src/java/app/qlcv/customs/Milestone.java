/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import java.math.BigDecimal;

/**
 *
 * @author sonng
 */
public class Milestone {
    private int milestoneid;
    private BigDecimal tienKhoan;

    public Milestone() {
    }

    public Milestone(int milestoneid, BigDecimal tienKhoan) {
        this.milestoneid = milestoneid;
        this.tienKhoan = tienKhoan;
    }

    public int getMilestoneid() {
        return milestoneid;
    }

    public void setMilestoneid(int milestoneid) {
        this.milestoneid = milestoneid;
    }

    public BigDecimal getTienKhoan() {
        return tienKhoan;
    }

    public void setTienKhoan(BigDecimal tienKhoan) {
        this.tienKhoan = tienKhoan;
    }
    
    
}
