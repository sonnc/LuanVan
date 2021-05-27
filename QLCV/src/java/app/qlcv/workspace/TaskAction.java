/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.TkWsTaskCustom;
import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsTask;
import app.qlcv.entities.TkWsTasklist;
import app.qlcv.utils.SystemMethod;
import com.opensymphony.xwork2.ActionSupport;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonng
 */
public class TaskAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private String errorCode;
    private SystemMethod systemMethod;
    private TaskListController taskListController;
    private TaskController tasktController;
    private WorkspaceController workspaceController;
    private TkWsTask task;
    private List<TkWsTask> lstTask = new ArrayList<>();
    private List<TkWsTaskCustom> lstTaskCustoms = new ArrayList<>();
    private TkWorkspace workspace;
    private TkWsTasklist tasklist;
    private TkWsTaskCustom taskCustoms;
    private List<TkUser> listUserInWorkspace;
    private List<TkUser> listUserRaciR = new ArrayList<>();
    

    public TaskAction() {
        taskListController = new TaskListController();
        tasktController = new TaskController();
        systemMethod = new SystemMethod();
        workspaceController = new WorkspaceController();
    }
///

    public String updateTask() {
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        String taskstatus = String.valueOf(request.getParameter("status"));
        task = taskListController.GetTaskById(taskid);
        task.setStatus(taskstatus);
        if ("CLOSE".equals(taskstatus)) {
            task.setDateClose(systemMethod.getSysDateToSqlDate());
        }
        errorCode = tasktController.updateTask(task);
        if (errorCode == null) {
            GetAllTask();
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String GetAllTask() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        TkUser user = (TkUser) session.get("user");
        List<TkWsTask> lstTask = new ArrayList<>();
        lstTask = tasktController.GetAllTaskByUserId(user.getId(), "all");
        for (int i = 0; i < lstTask.size(); i++) {
            TkWsTask get = lstTask.get(i);
            TkWsTaskCustom taskCustom = new TkWsTaskCustom();
            taskCustom.setTask(get);
            TkUser u = new TkUser();
            u = taskListController.getUserById(get.getAssigneeUserId());
            taskCustom.setAssigneeUser(u);
            TkUser u1 = new TkUser();
            u1 = taskListController.getUserById(get.getReviewBy());
            taskCustom.setReviewByUser(u1);
            lstTaskCustoms.add(taskCustom);
        }
        workspace = workspaceController.GetWorkspaceById(workspaceId);
        return SUCCESS;
    }

    public String GetAllTaskByUserId() {
        String status = request.getParameter("status");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        TkUser user = (TkUser) session.get("user");
        List<TkWsTask> lstTask = new ArrayList<>();
        lstTask = tasktController.GetAllTaskByUserId(user.getId(), status);
        for (int i = 0; i < lstTask.size(); i++) {
            TkWsTask get = lstTask.get(i);
            TkWsTaskCustom taskCustom = new TkWsTaskCustom();
            taskCustom.setTask(get);
            TkUser u = new TkUser();
            u = taskListController.getUserById(get.getAssigneeUserId());
            taskCustom.setAssigneeUser(u);
            TkUser u1 = new TkUser();
            u1 = taskListController.getUserById(get.getReviewBy());
            taskCustom.setReviewByUser(u1);
            lstTaskCustoms.add(taskCustom);
        }
        workspace = workspaceController.GetWorkspaceById(workspaceId);
        return SUCCESS;
    }

    public String getAllTaskPendingRating() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        TkUser user = (TkUser) session.get("user");
        List<TkWsTask> lstTask = new ArrayList<>();
        lstTask = tasktController.getAllTaskPendingRating(user.getId());
        for (int i = 0; i < lstTask.size(); i++) {
            TkWsTask get = lstTask.get(i);
            TkWsTaskCustom taskCustom = new TkWsTaskCustom();
            taskCustom.setTask(get);
            TkUser u = new TkUser();
            u = taskListController.getUserById(get.getAssigneeUserId());
            taskCustom.setAssigneeUser(u);
            TkUser u1 = new TkUser();
            u1 = taskListController.getUserById(get.getReviewBy());
            taskCustom.setReviewByUser(u1);
            lstTaskCustoms.add(taskCustom);
        }
        workspace = workspaceController.GetWorkspaceById(workspaceId);
        return SUCCESS;
    }

    public String prepareEditTask() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        task = taskListController.GetTaskById(taskid);
        taskCustoms = systemMethod.mergeTaskWithUser(task);
        workspace = workspaceController.GetWorkspaceById(workspaceId);
        tasklist = taskListController.GetTaskListById(tasklistid);
        listUserInWorkspace = workspaceController.lstUserActiveInWorkSpace(workspaceId);
        listUserRaciR = taskListController.getAllRaciR(tasklistid);

        return SUCCESS;
    }
    
    ///
    @Override
    public void setSession(Map<String, Object> map
    ) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr
    ) {
        this.request = hsr;
    }

    public TkWsTask getTask() {
        return task;
    }

    public void setTask(TkWsTask task) {
        this.task = task;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public List<TkWsTask> getLstTask() {
        return lstTask;
    }

    public void setLstTask(List<TkWsTask> lstTask) {
        this.lstTask = lstTask;
    }

    public List<TkWsTaskCustom> getLstTaskCustoms() {
        return lstTaskCustoms;
    }

    public void setLstTaskCustoms(List<TkWsTaskCustom> lstTaskCustoms) {
        this.lstTaskCustoms = lstTaskCustoms;
    }

    public TkWorkspace getWorkspace() {
        return workspace;
    }

    public void setWorkspace(TkWorkspace workspace) {
        this.workspace = workspace;
    }

    public TkWsTasklist getTasklist() {
        return tasklist;
    }

    public void setTasklist(TkWsTasklist tasklist) {
        this.tasklist = tasklist;
    }

    public TkWsTaskCustom getTaskCustoms() {
        return taskCustoms;
    }

    public void setTaskCustoms(TkWsTaskCustom taskCustoms) {
        this.taskCustoms = taskCustoms;
    }

    public List<TkUser> getListUserInWorkspace() {
        return listUserInWorkspace;
    }

    public void setListUserInWorkspace(List<TkUser> listUserInWorkspace) {
        this.listUserInWorkspace = listUserInWorkspace;
    }

    public List<TkUser> getListUserRaciR() {
        return listUserRaciR;
    }

    public void setListUserRaciR(List<TkUser> listUserRaciR) {
        this.listUserRaciR = listUserRaciR;
    }
    

}
