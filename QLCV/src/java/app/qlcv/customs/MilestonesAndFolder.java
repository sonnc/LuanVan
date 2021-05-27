/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import app.qlcv.entities.TkWsTasklist;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author sonng
 */
public class MilestonesAndFolder {

    private int id;
    private String folderName;
    private String folderStatus;
    private String folderDesc;
    private String isMilestones;
    private BigDecimal milestonesTienkhoan;
    private Date milestinesStartDate;
    private Date milestonesEndDate;
    private List<TkWsTaskListCustom> tkWsTasklists;

    public MilestonesAndFolder(int id, String folderName, String folderStatus, String folderDesc, String isMilestones, BigDecimal milestonesTienkhoan, Date milestinesStartDate, Date milestonesEndDate) {
        this.id = id;
        this.folderName = folderName;
        this.folderStatus = folderStatus;
        this.folderDesc = folderDesc;
        this.isMilestones = isMilestones;
        this.milestonesTienkhoan = milestonesTienkhoan;
        this.milestinesStartDate = milestinesStartDate;
        this.milestonesEndDate = milestonesEndDate;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFolderName() {
        return folderName;
    }

    public void setFolderName(String folderName) {
        this.folderName = folderName;
    }

    public String getFolderStatus() {
        return folderStatus;
    }

    public void setFolderStatus(String folderStatus) {
        this.folderStatus = folderStatus;
    }

    public String getFolderDesc() {
        return folderDesc;
    }

    public void setFolderDesc(String folderDesc) {
        this.folderDesc = folderDesc;
    }

    public String getIsMilestones() {
        return isMilestones;
    }

    public void setIsMilestones(String isMilestones) {
        this.isMilestones = isMilestones;
    }

    public BigDecimal getMilestonesTienkhoan() {
        return milestonesTienkhoan;
    }

    public void setMilestonesTienkhoan(BigDecimal milestonesTienkhoan) {
        this.milestonesTienkhoan = milestonesTienkhoan;
    }

    public Date getMilestinesStartDate() {
        return milestinesStartDate;
    }

    public void setMilestinesStartDate(Date milestinesStartDate) {
        this.milestinesStartDate = milestinesStartDate;
    }

    public Date getMilestonesEndDate() {
        return milestonesEndDate;
    }

    public void setMilestonesEndDate(Date milestonesEndDate) {
        this.milestonesEndDate = milestonesEndDate;
    }

    public List<TkWsTaskListCustom> getTkWsTasklists() {
        return tkWsTasklists;
    }

    public void setTkWsTasklists(List<TkWsTaskListCustom> tkWsTasklists) {
        this.tkWsTasklists = tkWsTasklists;
    }



    

}
