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
public class RaciView {
    int userId;
    String userLogin;
    String fullName;
    String raciR;
    String raciA;
    String raciC;
    String raciI;

    public RaciView() {
    }

    public RaciView(int userId, String userLogin, String fullName, String raciR, String raciA, String raciC, String raciI) {
        this.userId = userId;
        this.userLogin = userLogin;
        this.fullName = fullName;
        this.raciR = raciR;
        this.raciA = raciA;
        this.raciC = raciC;
        this.raciI = raciI;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(String userLogin) {
        this.userLogin = userLogin;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRaciR() {
        return raciR;
    }

    public void setRaciR(String raciR) {
        this.raciR = raciR;
    }

    public String getRaciA() {
        return raciA;
    }

    public void setRaciA(String raciA) {
        this.raciA = raciA;
    }

    public String getRaciC() {
        return raciC;
    }

    public void setRaciC(String raciC) {
        this.raciC = raciC;
    }

    public String getRaciI() {
        return raciI;
    }

    public void setRaciI(String raciI) {
        this.raciI = raciI;
    }
    
    
}
