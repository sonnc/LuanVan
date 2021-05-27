/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import java.math.BigInteger;

/**
 *
 * @author sonng
 */
public class UserKpiMapper {
    BigInteger stt;
    int userId;
    int userDetailId;
    String account;
    String userName;
    String kpiYear;
    String kpiStatus;
    String kpiPendingAproved;

    public UserKpiMapper(BigInteger stt, int userId, int userDetailId, String account, String userName, String kpiYear, String kpiStatus, String kpiPendingAproved) {
        this.stt = stt;
        this.userId = userId;
        this.userDetailId = userDetailId;
        this.account = account;
        this.userName = userName;
        this.kpiYear = kpiYear;
        this.kpiStatus = kpiStatus;
        this.kpiPendingAproved = kpiPendingAproved;
    }

    public BigInteger getStt() {
        return stt;
    }

    public void setStt(BigInteger stt) {
        this.stt = stt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserDetailId() {
        return userDetailId;
    }

    public void setUserDetailId(int userDetailId) {
        this.userDetailId = userDetailId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getKpiYear() {
        return kpiYear;
    }

    public void setKpiYear(String kpiYear) {
        this.kpiYear = kpiYear;
    }

    public String getKpiStatus() {
        return kpiStatus;
    }

    public void setKpiStatus(String kpiStatus) {
        this.kpiStatus = kpiStatus;
    }

    public String getKpiPendingAproved() {
        return kpiPendingAproved;
    }

    public void setKpiPendingAproved(String kpiPendingAproved) {
        this.kpiPendingAproved = kpiPendingAproved;
    }
    
    
}
