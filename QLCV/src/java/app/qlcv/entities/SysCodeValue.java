package app.qlcv.entities;
// Generated Feb 20, 2021 4:59:14 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * SysCodeValue generated by hbm2java
 */
public class SysCodeValue  implements java.io.Serializable {


     private Integer id;
     private SysCodeSet sysCodeSet;
     private int versionTime;
     private Date creationDate;
     private Date lastUpdateDate;
     private Integer displayOrder;
     private String createBy;
     private String lastUpdateBy;
     private String status;
     private String code;
     private String codeValue;
     private String localCodeValue;

    public SysCodeValue() {
    }

	
    public SysCodeValue(int versionTime, Date creationDate, Date lastUpdateDate) {
        this.versionTime = versionTime;
        this.creationDate = creationDate;
        this.lastUpdateDate = lastUpdateDate;
    }
    public SysCodeValue(SysCodeSet sysCodeSet, int versionTime, Date creationDate, Date lastUpdateDate, Integer displayOrder, String createBy, String lastUpdateBy, String status, String code, String codeValue, String localCodeValue) {
       this.sysCodeSet = sysCodeSet;
       this.versionTime = versionTime;
       this.creationDate = creationDate;
       this.lastUpdateDate = lastUpdateDate;
       this.displayOrder = displayOrder;
       this.createBy = createBy;
       this.lastUpdateBy = lastUpdateBy;
       this.status = status;
       this.code = code;
       this.codeValue = codeValue;
       this.localCodeValue = localCodeValue;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public SysCodeSet getSysCodeSet() {
        return this.sysCodeSet;
    }
    
    public void setSysCodeSet(SysCodeSet sysCodeSet) {
        this.sysCodeSet = sysCodeSet;
    }
    public int getVersionTime() {
        return this.versionTime;
    }
    
    public void setVersionTime(int versionTime) {
        this.versionTime = versionTime;
    }
    public Date getCreationDate() {
        return this.creationDate;
    }
    
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    public Date getLastUpdateDate() {
        return this.lastUpdateDate;
    }
    
    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }
    public Integer getDisplayOrder() {
        return this.displayOrder;
    }
    
    public void setDisplayOrder(Integer displayOrder) {
        this.displayOrder = displayOrder;
    }
    public String getCreateBy() {
        return this.createBy;
    }
    
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    public String getLastUpdateBy() {
        return this.lastUpdateBy;
    }
    
    public void setLastUpdateBy(String lastUpdateBy) {
        this.lastUpdateBy = lastUpdateBy;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public String getCodeValue() {
        return this.codeValue;
    }
    
    public void setCodeValue(String codeValue) {
        this.codeValue = codeValue;
    }
    public String getLocalCodeValue() {
        return this.localCodeValue;
    }
    
    public void setLocalCodeValue(String localCodeValue) {
        this.localCodeValue = localCodeValue;
    }




}


