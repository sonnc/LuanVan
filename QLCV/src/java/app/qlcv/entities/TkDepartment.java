package app.qlcv.entities;
// Generated Mar 28, 2020 3:08:46 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TkDepartment generated by hbm2java
 */
public class TkDepartment  implements java.io.Serializable {


     private Integer id;
     private Date createDate;
     private Date lastUpdateDate;
     private String createBy;
     private String lastUpdateBy;
     private String departmentName;
     private String departmentDetail;
     private String departmentCode;
     private String departmentStatus;
     private Set tkUsers = new HashSet(0);

    public TkDepartment() {
    }

	
    public TkDepartment(Date createDate, Date lastUpdateDate, String createBy, String lastUpdateBy, String departmentName, String departmentDetail, String departmentCode, String departmentStatus) {
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
        this.createBy = createBy;
        this.lastUpdateBy = lastUpdateBy;
        this.departmentName = departmentName;
        this.departmentDetail = departmentDetail;
        this.departmentCode = departmentCode;
        this.departmentStatus = departmentStatus;
    }
    public TkDepartment(Date createDate, Date lastUpdateDate, String createBy, String lastUpdateBy, String departmentName, String departmentDetail, String departmentCode, Set tkUsers) {
       this.createDate = createDate;
       this.lastUpdateDate = lastUpdateDate;
       this.createBy = createBy;
       this.lastUpdateBy = lastUpdateBy;
       this.departmentName = departmentName;
       this.departmentDetail = departmentDetail;
       this.departmentCode = departmentCode;
       this.tkUsers = tkUsers;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public Date getLastUpdateDate() {
        return this.lastUpdateDate;
    }
    
    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
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
    public String getDepartmentName() {
        return this.departmentName;
    }
    
    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
    public String getDepartmentDetail() {
        return this.departmentDetail;
    }
    
    public void setDepartmentDetail(String departmentDetail) {
        this.departmentDetail = departmentDetail;
    }
    public String getDepartmentCode() {
        return this.departmentCode;
    }
    
    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }

    public String getDepartmentStatus() {
        return departmentStatus;
    }

    public void setDepartmentStatus(String departmentStatus) {
        this.departmentStatus = departmentStatus;
    }
    
    public Set getTkUsers() {
        return this.tkUsers;
    }
    
    public void setTkUsers(Set tkUsers) {
        this.tkUsers = tkUsers;
    }



}


