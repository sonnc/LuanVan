/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.soap;

/**
 *
 * @author sonng
 */
public class ObjectFile {
           
	private String userid;
	private String nameTemplate;
	private String fileType;
	private String ip1;
	private String ip2;
	private String ip3;
	private String sp1;
	private String sp2;
	private String sp3;

    public ObjectFile() {
    }

    public ObjectFile(String userid, String nameTemplate, String fileType, String ip1, String ip2, String ip3, String sp1, String sp2, String sp3) {
        this.userid = userid;
        this.nameTemplate = nameTemplate;
        this.fileType = fileType;
        this.ip1 = ip1;
        this.ip2 = ip2;
        this.ip3 = ip3;
        this.sp1 = sp1;
        this.sp2 = sp2;
        this.sp3 = sp3;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getNameTemplate() {
        return nameTemplate;
    }

    public void setNameTemplate(String nameTemplate) {
        this.nameTemplate = nameTemplate;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getIp1() {
        return ip1;
    }

    public void setIp1(String ip1) {
        this.ip1 = ip1;
    }

    public String getIp2() {
        return ip2;
    }

    public void setIp2(String ip2) {
        this.ip2 = ip2;
    }

    public String getIp3() {
        return ip3;
    }

    public void setIp3(String ip3) {
        this.ip3 = ip3;
    }

    public String getSp1() {
        return sp1;
    }

    public void setSp1(String sp1) {
        this.sp1 = sp1;
    }

    public String getSp2() {
        return sp2;
    }

    public void setSp2(String sp2) {
        this.sp2 = sp2;
    }

    public String getSp3() {
        return sp3;
    }

    public void setSp3(String sp3) {
        this.sp3 = sp3;
    }
	
	
    
}
