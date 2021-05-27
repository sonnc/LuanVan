/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.entities;

import java.util.Date;

/**
 *
 * @author sonng
 */
public class TkRatingDateSetup {
     private Integer id;
     private Date createDate;
     private Date lastUpdateDate;
     private String createBy;
     private String lastUpdateBy;
     private int ratingStart;
     private int ratingEnd;
     private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public int getRatingStart() {
        return ratingStart;
    }

    public void setRatingStart(int ratingStart) {
        this.ratingStart = ratingStart;
    }

    public int getRatingEnd() {
        return ratingEnd;
    }

    public void setRatingEnd(int ratingEnd) {
        this.ratingEnd = ratingEnd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
     
     
}
