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
public class MemberInfoWorkspaceSummary {
    private String maNhanVien;
    private String tenNhanVien;
    private String email;
    private String dienThoai;
    private int tongSoTask;
    private int taskOpen;
    private int taskInprocess;
    private int taskClose;
    private int taskCancel;
    private int taskDelay;
    private BigDecimal amount;

    public MemberInfoWorkspaceSummary(String maNhanVien, String tenNhanVien, String email, String dienThoai, int tongSoTask, int taskOpen, int taskInprocess, int taskClose, int taskCancel, int taskDelay, BigDecimal amount) {
        this.maNhanVien = maNhanVien;
        this.tenNhanVien = tenNhanVien;
        this.email = email;
        this.dienThoai = dienThoai;
        this.tongSoTask = tongSoTask;
        this.taskOpen = taskOpen;
        this.taskInprocess = taskInprocess;
        this.taskClose = taskClose;
        this.taskCancel = taskCancel;
        this.taskDelay = taskDelay;
        this.amount = amount;
    }

    
    
    public String getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }

    public String getTenNhanVien() {
        return tenNhanVien;
    }

    public void setTenNhanVien(String tenNhanVien) {
        this.tenNhanVien = tenNhanVien;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDienThoai() {
        return dienThoai;
    }

    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }

    public int getTongSoTask() {
        return tongSoTask;
    }

    public void setTongSoTask(int tongSoTask) {
        this.tongSoTask = tongSoTask;
    }

    public int getTaskOpen() {
        return taskOpen;
    }

    public void setTaskOpen(int taskOpen) {
        this.taskOpen = taskOpen;
    }

    public int getTaskInprocess() {
        return taskInprocess;
    }

    public void setTaskInprocess(int taskInprocess) {
        this.taskInprocess = taskInprocess;
    }

    public int getTaskClose() {
        return taskClose;
    }

    public void setTaskClose(int taskClose) {
        this.taskClose = taskClose;
    }

    public int getTaskCancel() {
        return taskCancel;
    }

    public void setTaskCancel(int taskCancel) {
        this.taskCancel = taskCancel;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public int getTaskDelay() {
        return taskDelay;
    }

    public void setTaskDelay(int taskDelay) {
        this.taskDelay = taskDelay;
    }
    
    
    
            
}
