package app.qlcv.entities;
// Generated Feb 20, 2021 4:59:14 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * SysCodeSet generated by hbm2java
 */
public class SysCodeSet  implements java.io.Serializable {


     private Integer id;
     private int versionTime;
     private Date creationDate;
     private Date lastUpdateDate;
     private Character deprecated;
     private String createBy;
     private String lastUpdateBy;
     private String status;
     private String code;
     private String name;
     private Set sysCodeValues = new HashSet(0);

    public SysCodeSet() {
    }

	
    public SysCodeSet(int versionTime, Date creationDate, Date lastUpdateDate) {
        this.versionTime = versionTime;
        this.creationDate = creationDate;
        this.lastUpdateDate = lastUpdateDate;
    }
    public SysCodeSet(int versionTime, Date creationDate, Date lastUpdateDate, Character deprecated, String createBy, String lastUpdateBy, String status, String code, String name, Set sysCodeValues) {
       this.versionTime = versionTime;
       this.creationDate = creationDate;
       this.lastUpdateDate = lastUpdateDate;
       this.deprecated = deprecated;
       this.createBy = createBy;
       this.lastUpdateBy = lastUpdateBy;
       this.status = status;
       this.code = code;
       this.name = name;
       this.sysCodeValues = sysCodeValues;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
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
    public Character getDeprecated() {
        return this.deprecated;
    }
    
    public void setDeprecated(Character deprecated) {
        this.deprecated = deprecated;
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
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Set getSysCodeValues() {
        return this.sysCodeValues;
    }
    
    public void setSysCodeValues(Set sysCodeValues) {
        this.sysCodeValues = sysCodeValues;
    }




}


