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
public class WorkspaceDashboard {
    String workspaceId;
    String workspaceName;
    String workspaceQuanLy;
    String workspaceStatus;
    String numberUserAndTeams;
    String numberMilestones;
    String task;

    public WorkspaceDashboard() {
    }

    
    public WorkspaceDashboard(String workspaceId, String workspaceName, String workspaceQuanLy, String workspaceStatus, String numberUserAndTeams, String numberMilestones, String task) {
        this.workspaceId = workspaceId;
        this.workspaceName = workspaceName;
        this.workspaceQuanLy = workspaceQuanLy;
        this.workspaceStatus = workspaceStatus;
        this.numberUserAndTeams = numberUserAndTeams;
        this.numberMilestones = numberMilestones;
        this.task = task;
    }

    
    
    
    public String getWorkspaceId() {
        return workspaceId;
    }

    public void setWorkspaceId(String workspaceId) {
        this.workspaceId = workspaceId;
    }

    public String getWorkspaceName() {
        return workspaceName;
    }

    public void setWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
    }

    public String getWorkspaceQuanLy() {
        return workspaceQuanLy;
    }

    public void setWorkspaceQuanLy(String workspaceQuanLy) {
        this.workspaceQuanLy = workspaceQuanLy;
    }

    public String getWorkspaceStatus() {
        return workspaceStatus;
    }

    public void setWorkspaceStatus(String workspaceStatus) {
        this.workspaceStatus = workspaceStatus;
    }

    public String getNumberUserAndTeams() {
        return numberUserAndTeams;
    }

    public void setNumberUserAndTeams(String numberUserAndTeams) {
        this.numberUserAndTeams = numberUserAndTeams;
    }

    public String getNumberMilestones() {
        return numberMilestones;
    }

    public void setNumberMilestones(String numberMilestones) {
        this.numberMilestones = numberMilestones;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    
    
    
}
