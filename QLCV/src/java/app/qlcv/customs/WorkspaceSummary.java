/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsTeams;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author sonng
 */
public class WorkspaceSummary {
    private int idWorkspace;
    private int totalMember;
    private int totalTask;
    private int totalTeams;
    private int totalTaskList;
    private int totalMilestones;
    private String chartTaskByStatus;
    private String chartTaskByTeams;
    private String chartAmountByUsers;

    public int getIdWorkspace() {
        return idWorkspace;
    }

    public void setIdWorkspace(int idWorkspace) {
        this.idWorkspace = idWorkspace;
    }

    public int getTotalMember() {
        return totalMember;
    }

    public void setTotalMember(int totalMember) {
        this.totalMember = totalMember;
    }

    public int getTotalTask() {
        return totalTask;
    }

    public void setTotalTask(int totalTask) {
        this.totalTask = totalTask;
    }

    public int getTotalTeams() {
        return totalTeams;
    }

    public void setTotalTeams(int totalTeams) {
        this.totalTeams = totalTeams;
    }

    public String getChartTaskByStatus() {
        return chartTaskByStatus;
    }

    public void setChartTaskByStatus(String chartTaskByStatus) {
        this.chartTaskByStatus = chartTaskByStatus;
    }

    public String getChartTaskByTeams() {
        return chartTaskByTeams;
    }

    public void setChartTaskByTeams(String chartTaskByTeams) {
        this.chartTaskByTeams = chartTaskByTeams;
    }

    public String getChartAmountByUsers() {
        return chartAmountByUsers;
    }

    public void setChartAmountByUsers(String chartAmountByUsers) {
        this.chartAmountByUsers = chartAmountByUsers;
    }

    public int getTotalTaskList() {
        return totalTaskList;
    }

    public void setTotalTaskList(int totalTaskList) {
        this.totalTaskList = totalTaskList;
    }

    public int getTotalMilestones() {
        return totalMilestones;
    }

    public void setTotalMilestones(int totalMilestones) {
        this.totalMilestones = totalMilestones;
    }
    
    
    
}
