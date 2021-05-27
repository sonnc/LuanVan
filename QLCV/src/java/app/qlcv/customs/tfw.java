/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import java.util.List;

/**
 *
 * @author sonng
 */
public class tfw {

    private Integer id;
    private String loginId;
    private String fullName;
    private String employeeNo;
    private String email;
    private String dubao;
    private List<String> dubaoString;

    public tfw() {
    }

    public tfw(Integer id, String loginId, String fullName, String employeeNo, String email, String dubao, List<String> dubaoString) {
        this.id = id;
        this.loginId = loginId;
        this.fullName = fullName;
        this.employeeNo = employeeNo;
        this.email = email;
        this.dubao = dubao;
        this.dubaoString = dubaoString;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmployeeNo() {
        return employeeNo;
    }

    public void setEmployeeNo(String employeeNo) {
        this.employeeNo = employeeNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDubao() {
        return dubao;
    }

    public void setDubao(String dubao) {
        this.dubao = dubao;
    }

    public List<String> getDubaoString() {
        return dubaoString;
    }

    public void setDubaoString(List<String> dubaoString) {
        this.dubaoString = dubaoString;
    }
    
    
    
}
