/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsFolder;
import app.qlcv.entities.TkWsTask;
import app.qlcv.entities.TkWsTaskRaci;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author sonng
 */
public class TkWsTaskListCustom {
    private int id;
    private TkWsFolder tkWsFolder;
    private List <TkWsTaskRaci> tkWsTaskRacis;
    private String taskListTitle;
    private String taskListDesc;
    private Integer timeEstimate;
    private Integer timeEstimateDdl;
    private Date dueDate;
    private String priority;
    private String status;
    private String createBy;
    private String lastUpdateBy;
    private Date createDate;
    private Date lastUpdateDate;
    private List<TkWsTask> lstTask;
    private List<TkWsTaskCustom> lstTaskCustoms;

    public TkWsTaskListCustom() {
    }

    public TkWsTaskListCustom(int id, TkWsFolder tkWsFolder, List<TkWsTaskRaci> tkWsTaskRacis, String taskListTitle, String taskListDesc, Integer timeEstimate, Integer timeEstimateDdl, Date dueDate, String priority, String status, String createBy, String lastUpdateBy, Date createDate, Date lastUpdateDate, List<TkWsTaskCustom> lstTaskCustoms) {
        this.id = id;
        this.tkWsFolder = tkWsFolder;
        this.tkWsTaskRacis = tkWsTaskRacis;
        this.taskListTitle = taskListTitle;
        this.taskListDesc = taskListDesc;
        this.timeEstimate = timeEstimate;
        this.timeEstimateDdl = timeEstimateDdl;
        this.dueDate = dueDate;
        this.priority = priority;
        this.status = status;
        this.createBy = createBy;
        this.lastUpdateBy = lastUpdateBy;
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
        this.lstTaskCustoms = lstTaskCustoms;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTaskListTitle() {
        return taskListTitle;
    }

    public void setTaskListTitle(String taskListTitle) {
        this.taskListTitle = taskListTitle;
    }

    public String getTaskListDesc() {
        return taskListDesc;
    }

    public void setTaskListDesc(String taskListDesc) {
        this.taskListDesc = taskListDesc;
    }

    public Integer getTimeEstimate() {
        return timeEstimate;
    }

    public void setTimeEstimate(Integer timeEstimate) {
        this.timeEstimate = timeEstimate;
    }

    public Integer getTimeEstimateDdl() {
        return timeEstimateDdl;
    }

    public void setTimeEstimateDdl(Integer timeEstimateDdl) {
        this.timeEstimateDdl = timeEstimateDdl;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public List<TkWsTask> getLstTask() {
        return lstTask;
    }

    public void setLstTask(List<TkWsTask> lstTask) {
        this.lstTask = lstTask;
    }

    public TkWsFolder getTkWsFolder() {
        return tkWsFolder;
    }

    public void setTkWsFolder(TkWsFolder tkWsFolder) {
        this.tkWsFolder = tkWsFolder;
    }

    public List<TkWsTaskRaci> getTkWsTaskRacis() {
        return tkWsTaskRacis;
    }

    public void setTkWsTaskRacis(List<TkWsTaskRaci> tkWsTaskRacis) {
        this.tkWsTaskRacis = tkWsTaskRacis;
    }

    public List<TkWsTaskCustom> getLstTaskCustoms() {
        return lstTaskCustoms;
    }

    public void setLstTaskCustoms(List<TkWsTaskCustom> lstTaskCustoms) {
        this.lstTaskCustoms = lstTaskCustoms;
    }
    
    
    
    
    
}
