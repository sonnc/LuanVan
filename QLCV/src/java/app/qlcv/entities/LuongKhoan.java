/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.entities;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author sonng
 */
public class LuongKhoan {

    private int id;
    private int userId;
    private Date createDate;
    private Date lastUpdateDate;
    private String createBy;
    private String lastUpdateBy;
    private int thang;
    private String loaiKhoan;
    private BigDecimal luongKhoan;
    private int pheDuyet;

    public LuongKhoan() {
    }

    public LuongKhoan(int id, int userId, Date createDate, Date lastUpdateDate, String createBy, String lastUpdateBy, int thang, String loaiKhoan, BigDecimal luongKhoan, int pheDuyet) {
        this.id = id;
        this.userId = userId;
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
        this.createBy = createBy;
        this.lastUpdateBy = lastUpdateBy;
        this.thang = thang;
        this.loaiKhoan = loaiKhoan;
        this.luongKhoan = luongKhoan;
        this.pheDuyet = pheDuyet;
    }

    
    
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
   
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getLastUpdateBy() {
        return lastUpdateBy;
    }

    public void setLastUpdateBy(String lastUpdateBy) {
        this.lastUpdateBy = lastUpdateBy;
    }

    public int getThang() {
        return thang;
    }

    public void setThang(int thang) {
        this.thang = thang;
    }

    public String getLoaiKhoan() {
        return loaiKhoan;
    }

    public void setLoaiKhoan(String loaiKhoan) {
        this.loaiKhoan = loaiKhoan;
    }

    public BigDecimal getLuongKhoan() {
        return luongKhoan;
    }

    public void setLuongKhoan(BigDecimal luongKhoan) {
        this.luongKhoan = luongKhoan;
    }

    public int getPheDuyet() {
        return pheDuyet;
    }

    public void setPheDuyet(int pheDuyet) {
        this.pheDuyet = pheDuyet;
    }
    
}
