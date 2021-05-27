/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.MemberInfoWorkspaceSummary;
import app.qlcv.customs.TeamAndMember;
import app.qlcv.customs.WorkspaceFunction;
import app.qlcv.customs.WorkspaceDashboard;
import app.qlcv.customs.WorkspaceSummary;
import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsFolder;
import app.qlcv.entities.TkWsPeople;
import app.qlcv.entities.TkWsPeopleTeams;
import app.qlcv.entities.TkWsTask;
import app.qlcv.entities.TkWsTasklist;
import app.qlcv.entities.TkWsTeams;
import app.qlcv.utils.SystemMethod;
import com.opensymphony.xwork2.ActionSupport;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonng
 */
public class WorkspaceAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private WorkspaceController workspaceController;
    private List<TkUser> listUserInDepartement;
    private List<TkUser> listUserInWorkspace = new ArrayList<>();
    private TkWorkspace workspace;
    private SystemMethod systemMethod;
    private String errorCode;
    private Integer workspaceId;
    private TkWsTeams wsTeams;
    private WorkspaceSummary workspaceSummary = new WorkspaceSummary();
    private List<MemberInfoWorkspaceSummary> lstMemberInfoWorkspaceSummarys;
    private List<WorkspaceDashboard> lstWorkspaceDashboards;
    private WorkspaceFunction workspaceFunction;

    public WorkspaceAction() {
        workspaceController = new WorkspaceController();
        systemMethod = new SystemMethod();
        workspaceFunction = new WorkspaceFunction();
    }

    public String RunWorkspaceAction() {
        String event = request.getParameter("event");
        if ("prepareCreate".equals(event)) {
            listUserInDepartement = GetAllUserInDepartement();
            return "PREPARE_CREATE_WORKSPACE";
        } else if ("create".equals(event)) {
            try {
                TkUser user = (TkUser) session.get("user");
                // nhap thong tin cho du an
                workspace.setStartDate(systemMethod.formatStringDateToSqlDate(request.getParameter("startDate")));
                workspace.setEndDate(systemMethod.formatStringDateToSqlDate(request.getParameter("endDate")));
                workspace.setEtcDate(systemMethod.formatStringDateToSqlDate(request.getParameter("etcDate")));
                workspace.setStatus("ACTIVE");
                workspace.setCreateDate(systemMethod.getSysDateToSqlDate());
                workspace.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                workspace.setCreateBy(user.getLoginId());
                workspace.setLastUpdateBy(user.getLoginId());
                workspace.setDepartmentId(user.getTkDepartment().getId());
                workspace.setOwner(String.valueOf(user.getId()));

                // them thanh vien vao du an
                List<TkWsPeople> lstTkWsPeoples = new ArrayList<>();
//            Map<String, String> result = new LinkedHashMap<String, String>(request.getParameterMap().size());
                for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                    if (entry.getValue().length > 0 && entry.getKey().contains("checkboxSelect-")) {
//                    result.put(entry.getKey(), entry.getValue()[0]);
                        int idUser = Integer.parseInt(entry.getKey().replace("checkboxSelect-", ""));
                        TkWsPeople people = new TkWsPeople();
                        people.setStatus("ACTIVE");
                        people.setRoleWorkspace("N/A");
                        people.setUserId(idUser);
                        lstTkWsPeoples.add(people);
                    }
                }

                //luu du an
                errorCode = workspaceController.saveCreateWorkspace(workspace, lstTkWsPeoples);
            } catch (Exception e) {
                StringWriter errors = new StringWriter();
                e.printStackTrace(new PrintWriter(errors));
                errorCode = errors.toString();
            }

            if (errorCode.contains("CREATE_SUCCESS_WITH_ID=")) {
                int id = Integer.parseInt(errorCode.replace("CREATE_SUCCESS_WITH_ID=", ""));
                workspace = workspaceController.GetWorkspaceById(id);
                return "CREATE_NEW_WORKSPACE_SUCCESS";
            } else {
                return ERROR;
            }
        } else if ("prepareCreateTeamWorkspace".equals(event)) {
            try {
                int id = (int) Integer.parseInt(request.getParameter("id"));
                // lay danh sach thanh vien trong workspace
                listUserInWorkspace = workspaceController.lstUserActiveInWorkSpace(id);
                workspaceId = id;
            } catch (Exception e) {
                StringWriter errors = new StringWriter();
                e.printStackTrace(new PrintWriter(errors));
                errorCode = errors.toString();
                return ERROR;
            }
            return "PREPARE_WORKSPACE_CREATE_TEAM";
        } else if ("createTeam".equals(event)) {
            int cout = Integer.parseInt(request.getParameter("countItemInput"));
            TkUser user = (TkUser) session.get("user");
            workspace = workspaceController.GetWorkspaceById(Integer.parseInt(request.getParameter("workspaceId")));
            List<TeamAndMember> lsTeamAndMembers = new ArrayList<>();
            for (int i = 0; i < cout; i++) {
                TeamAndMember teamAndMember = new TeamAndMember();
                TkWsTeams teams = new TkWsTeams();
                List<Integer> lstUserId = new ArrayList<>();

                String key = "createTeamList[" + i + "]";
                for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                    if (entry.getValue().length > 0 && entry.getKey().contains(key)) {
                        if (entry.getKey().contains("wsTeams.teamName")) {
                            teams.setTeamName(java.util.Arrays.toString(entry.getValue()));
                        }
                        if (entry.getKey().contains("wsTeams.teamDesc")) {
                            teams.setTeamDesc(java.util.Arrays.toString(entry.getValue()));
                        }
                        if (entry.getKey().contains("checkboxSelect-")) {
                            int idUser = Integer.parseInt(entry.getKey().replace(key + "[checkboxSelect-", "").replace("][]", ""));
                            lstUserId.add(idUser);
                        }
                    }
                }
                teams.setCreateBy(user.getLoginId());
                teams.setCreateDate(systemMethod.getSysDateToSqlDate());
                teams.setLastUpdateBy(user.getLoginId());
                teams.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                teams.setTeamStatus("ACTIVE");
                teams.setTkWorkspace(workspace);

                teamAndMember.setTeams(teams);
                teamAndMember.setLstUserId(lstUserId);
                lsTeamAndMembers.add(teamAndMember);
            }
            errorCode = workspaceController.createTeamsAnMember(lsTeamAndMembers);
            if (errorCode == null) {
                return "CREATE_TEAM_SUSSESS";
            } else {
                return ERROR;
            }
        } else if ("viewWorkspace".equals(event)) {
            vewWorkspaceByUser();
            return "RETURN_WORKSPACE";
        } else if ("prepareViewWorkspace".equals(event)) {
            workspace = workspaceController.GetWorkspaceById(Integer.parseInt(request.getParameter("workspaceId")));
            return "EDIT_WORKSPACE";
        } else if ("updateWorkSpace".equals(event)) {
            TkWorkspace tkWorkspace = new TkWorkspace();
            tkWorkspace = workspaceController.GetWorkspaceById(workspace.getId());
            tkWorkspace.setWorkspaceName(workspace.getWorkspaceName());
            tkWorkspace.setDescription(workspace.getDescription());
            tkWorkspace.setTienKhoan(workspace.getTienKhoan());
            tkWorkspace.setEtcAmount(workspace.getEtcAmount());
            tkWorkspace.setStartDate(systemMethod.formatStringDateToSqlDate(request.getParameter("startDate")));
            tkWorkspace.setEndDate(systemMethod.formatStringDateToSqlDate(request.getParameter("endDate")));
            tkWorkspace.setEtcDate(systemMethod.formatStringDateToSqlDate(request.getParameter("etcDate")));
            workspaceController.updateWorkspace(tkWorkspace);
            workspace = tkWorkspace;
            return "EDIT_WORKSPACE";
        }

        return SUCCESS;
    }

    public String WorkspaceSummaryAction() {
        int id = Integer.parseInt(request.getParameter("id"));
        workspace = workspaceController.GetWorkspaceById(id);

        workspaceSummary = workspaceFunction.getWorkspaceSummary(id, request);
        session.put("bieudoTask", workspaceFunction.GetCharTask(id));
        session.put("bieudoTask2", workspaceFunction.GetCharMemberTask(id));
        session.put("bieudoTask3", workspaceFunction.GetCharTask3(id));
        lstMemberInfoWorkspaceSummarys = workspaceController.MemberInfoWorkspaceSummary(id);

        return SUCCESS;
    }

    public List<TkUser> GetAllUserInDepartement() {
        TkUser user = (TkUser) session.get("user");
        return workspaceController.GetAllUserInDepartement(user.getTkDepartment().getId());
    }

    public String GetCharTaskOpenInprocessByUser(List<TkWsTask> lstTasks) {
        int countTotal = 0;
        HashMap<Integer, Integer> hm = new HashMap<Integer, Integer>();
        for (int i = 0; i < lstTasks.size(); i++) {
            if (lstTasks.get(i).getStatus().equals("OPEN")
                    || lstTasks.get(i).getStatus().equals("INPROCESS")) {
                countTotal = countTotal++;

                if (hm.get(lstTasks.get(i).getAssigneeUserId()) != null) {
                    int value = hm.get(lstTasks.get(i).getAssigneeUserId());
                    value++;
                    hm.replace(lstTasks.get(i).getAssigneeUserId(), value);
                } else {
                    hm.put(lstTasks.get(i).getAssigneeUserId(), 0);
                }
            }
        }
        return null;
    }

    public String vewWorkspaceByUser() {
        TkUser user = (TkUser) session.get("user");
        lstWorkspaceDashboards = workspaceController.vewWorkspaceByUser(user.getId());
        return SUCCESS;
    }

    ////////////////////////////////
    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

    public List<TkUser> getListUserInDepartement() {
        return listUserInDepartement;
    }

    public void setListUserInDepartement(List<TkUser> listUserInDepartement) {
        this.listUserInDepartement = listUserInDepartement;
    }

    public TkWorkspace getWorkspace() {
        return workspace;
    }

    public void setWorkspace(TkWorkspace workspace) {
        this.workspace = workspace;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public List<TkUser> getListUserInWorkspace() {
        return listUserInWorkspace;
    }

    public void setListUserInWorkspace(List<TkUser> listUserInWorkspace) {
        this.listUserInWorkspace = listUserInWorkspace;
    }

    public Integer getWorkspaceId() {
        return workspaceId;
    }

    public void setWorkspaceId(Integer workspaceId) {
        this.workspaceId = workspaceId;
    }

    public TkWsTeams getWsTeams() {
        return wsTeams;
    }

    public void setWsTeams(TkWsTeams wsTeams) {
        this.wsTeams = wsTeams;
    }

    public WorkspaceSummary getWorkspaceSummary() {
        return workspaceSummary;
    }

    public void setWorkspaceSummary(WorkspaceSummary workspaceSummary) {
        this.workspaceSummary = workspaceSummary;
    }

    public List<MemberInfoWorkspaceSummary> getLstMemberInfoWorkspaceSummarys() {
        return lstMemberInfoWorkspaceSummarys;
    }

    public void setLstMemberInfoWorkspaceSummarys(List<MemberInfoWorkspaceSummary> lstMemberInfoWorkspaceSummarys) {
        this.lstMemberInfoWorkspaceSummarys = lstMemberInfoWorkspaceSummarys;
    }

    public List<WorkspaceDashboard> getLstWorkspaceDashboards() {
        return lstWorkspaceDashboards;
    }

    public void setLstWorkspaceDashboards(List<WorkspaceDashboard> lstWorkspaceDashboards) {
        this.lstWorkspaceDashboards = lstWorkspaceDashboards;
    }

}
