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
public class LuongKhoanTotal {
    private BigDecimal totalKhoanCV;
    private BigDecimal totalKhoanMilestone;
    private BigDecimal totalKhoanHQDA;
    private BigDecimal totalKhoanHQDA2;
    private BigDecimal totalKhoan;
    private BigDecimal totalKhoan2;
    private BigDecimal totalKhoanOld;
    private BigDecimal totalKhoanChange;

    public LuongKhoanTotal() {
    }

    public LuongKhoanTotal(BigDecimal totalKhoanCV, BigDecimal totalKhoanMilestone, BigDecimal totalKhoanHQDA, BigDecimal totalKhoan) {
        this.totalKhoanCV = totalKhoanCV;
        this.totalKhoanMilestone = totalKhoanMilestone;
        this.totalKhoanHQDA = totalKhoanHQDA;
        this.totalKhoan = totalKhoan;
    }

    public BigDecimal getTotalKhoanCV() {
        return totalKhoanCV;
    }

    public void setTotalKhoanCV(BigDecimal totalKhoanCV) {
        this.totalKhoanCV = totalKhoanCV;
    }

    public BigDecimal getTotalKhoanMilestone() {
        return totalKhoanMilestone;
    }

    public void setTotalKhoanMilestone(BigDecimal totalKhoanMilestone) {
        this.totalKhoanMilestone = totalKhoanMilestone;
    }

    public BigDecimal getTotalKhoanHQDA() {
        return totalKhoanHQDA;
    }

    public void setTotalKhoanHQDA(BigDecimal totalKhoanHQDA) {
        this.totalKhoanHQDA = totalKhoanHQDA;
    }

    public BigDecimal getTotalKhoan() {
        return totalKhoan;
    }

    public void setTotalKhoan(BigDecimal totalKhoan) {
        this.totalKhoan = totalKhoan;
    }

    public BigDecimal getTotalKhoanHQDA2() {
        return totalKhoanHQDA2;
    }

    public void setTotalKhoanHQDA2(BigDecimal totalKhoanHQDA2) {
        this.totalKhoanHQDA2 = totalKhoanHQDA2;
    }

    public BigDecimal getTotalKhoan2() {
        return totalKhoan2;
    }

    public void setTotalKhoan2(BigDecimal totalKhoan2) {
        this.totalKhoan2 = totalKhoan2;
    }

    public BigDecimal getTotalKhoanOld() {
        return totalKhoanOld;
    }

    public void setTotalKhoanOld(BigDecimal totalKhoanOld) {
        this.totalKhoanOld = totalKhoanOld;
    }

    public BigDecimal getTotalKhoanChange() {
        return totalKhoanChange;
    }

    public void setTotalKhoanChange(BigDecimal totalKhoanChange) {
        this.totalKhoanChange = totalKhoanChange;
    }
    
    
}
