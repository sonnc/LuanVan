/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.MemberInfoWorkspaceSummary;
import app.qlcv.customs.MilestonesAndFolder;
import app.qlcv.customs.RaciMappingCustome;
import app.qlcv.customs.RaciView;
import app.qlcv.customs.TkWsTaskCustom;
import app.qlcv.customs.TkWsTaskListCustom;
import app.qlcv.customs.WorkspaceFunction;
import app.qlcv.customs.WorkspaceSummary;
import app.qlcv.entities.SysCodeSet;
import app.qlcv.entities.SysCodeValue;
import app.qlcv.entities.SysUdfFieldValue;
import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsAttachments;
import app.qlcv.entities.TkWsComment;
import app.qlcv.entities.TkWsFolder;
import app.qlcv.entities.TkWsTask;
import app.qlcv.entities.TkWsTaskChecklist;
import app.qlcv.entities.TkWsTaskChecklistItem;
import app.qlcv.entities.TkWsTaskRaci;
import app.qlcv.entities.TkWsTasklist;
import app.qlcv.utils.SystemMethod;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonng
 */
public class TaskListAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private SystemMethod systemMethod;
    private TaskListController taskListController;
    private WorkspaceController workspaceController;
    private List<TkWsTasklist> lstTaskList;
    private List<TkUser> listUserInWorkspace;
    private TkWsTasklist tasklist;
    private TkWsFolder tkWsFolder;
    private TkWorkspace workspace;
    private String errorCode;
    private WorkspaceSummary workspaceSummary = new WorkspaceSummary();
    private List<MemberInfoWorkspaceSummary> lstMemberInfoWorkspaceSummarys;
    private WorkspaceFunction workspaceFunction;
    private List<MilestonesAndFolder> lstMilestonesAndFolders = new ArrayList<>();
    private List<TkWsTaskListCustom> lstWsTaskListCustoms = new ArrayList<>();
    private List<TkWsTaskRaci> lstTaskRacis = new ArrayList<>();
    private TkWsTask task;
    private TkWsTask taskParent;
    private TkWsTaskCustom taskCustom;
    private TkWsComment taskComment;
    private List<SysCodeSet> lstCodeSets = new ArrayList<>();
    private List<SysCodeValue> lstCodeValues = new ArrayList<>();
    private List<TkUser> listUserRaciR = new ArrayList<>();
    private File[] myFile;
    private String[] myFileFileName;
    private List<RaciView> lstRaciViews = new ArrayList<>();
    private List<TkWsTask> lstTasks = new ArrayList<>();
    private List<TkWsTask> lstTasksFollows = new ArrayList<>();
    private List<SysUdfFieldValue> lstUdf = new ArrayList<>();
    private List<TkWsAttachments> lstAttachmentses = new ArrayList<>();
    private List<TkWsTaskChecklist> lstChecklists = new ArrayList<>();
    private List<TkWsTaskChecklistItem> lstChecklistItems = new ArrayList<>();
    private List<TkWsComment> lstComments = new ArrayList<>();
    private TaskController taskController;
    private List<TkWsTaskCustom> lstTaskCustoms = new ArrayList<>();

    public TaskListAction() {
        taskListController = new TaskListController();
        workspaceController = new WorkspaceController();
        systemMethod = new SystemMethod();
        workspaceFunction = new WorkspaceFunction();
        taskController = new TaskController();

    }

    public String TaskListActions() {
        String event = request.getParameter("event");
        TkUser user = (TkUser) session.get("user");
        if ("prepareCreateTaskList".equals(event)) {
            int workspaceid = Integer.parseInt(request.getParameter("workspaceId"));
            workspace = workspaceController.GetWorkspaceById(workspaceid);
            listUserInWorkspace = workspaceController.lstUserActiveInWorkSpace(workspaceid);
            return "PREPARE_CREATE_TASK_LIST";
        } else if ("createTaskList".equals(event)) {
            int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
            workspace = workspaceController.GetWorkspaceById(workspaceId);
            String isFolder = request.getParameter("isFolderCheckbox");
            String isFolderMilestones = request.getParameter("isMilestones");
            if (isFolderMilestones != null && !isFolderMilestones.equals("")) {
                tkWsFolder.setIsMilestones("Y");
                tkWsFolder.setMilestinesStartDate(systemMethod.formatStringDateToSqlDate(request.getParameter("milestonesStartDate")));
                tkWsFolder.setMilestonesEndDate(systemMethod.formatStringDateToSqlDate(request.getParameter("milestonesEndDate")));
            }
            tkWsFolder.setFolderStatus("ACTIVE");
            int count = Integer.parseInt(request.getParameter("countItemInput"));
            List<TkWsTasklist> lstTasklists = new ArrayList<>();
            for (int i = 0; i < count; i++) {
                TkWsTasklist twt = new TkWsTasklist();
                twt.setCreateBy(user.getLoginId());
                twt.setCreateDate(systemMethod.getSysDateToSqlDate());
                twt.setDueDate(
                        systemMethod.formatStringDateToSqlDate(request.getParameter("createTaskList[" + i + "][tasklist.due.date]")));
                twt.setLastUpdateBy(user.getLoginId());
                twt.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                twt.setPriority(request.getParameter("createTaskList[" + i + "][tasklist.priority]"));
                twt.setStatus("ACTIVE");
                twt.setTaskListDesc(request.getParameter("createTaskList[" + i + "][tasklist.taskListDesc]"));
                twt.setTaskListTitle(request.getParameter("createTaskList[" + i + "][tasklist.taskListTitle]"));
                twt.setTimeEstimate(Integer.parseInt(request.getParameter("createTaskList[" + i + "][tasklist.timeEstimate]")));
                twt.setTkWorkspace(workspace);
//                twt.setTkWsFolder(tkWsFolder);
                twt.setTkWsTaskRacis(null);
                lstTasklists.add(twt);
            }
            String error = null;
            if (isFolder != null && !"".equals(isFolder)) {
                error = taskListController.createTaskListWithFolder(tkWsFolder, lstTasklists);
            } else {
                error = taskListController.createTaskListWithList(lstTasklists);
            }

            if (error == null) {
                workspace = workspaceController.GetWorkspaceById(workspaceId);
                listUserInWorkspace = workspaceController.lstUserActiveInWorkSpace(workspaceId);
                lstTaskList = workspaceController.GetAllTaskListNotCreateRaciByWorkspaceId(workspaceId);
                return "CREATE_TASK_LIST_SUCCESS";
            } else {
                errorCode = error;
                return ERROR;
            }

        }

        return null;
    }

    public String TaskListCreateRACI() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        String key = "raci_";
        List<RaciMappingCustome> lstRaciMapping = new ArrayList<>();
        for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
            String checkNull = entry.getValue()[0];
            if (entry.getValue().length > 0 && entry.getKey().contains(key) && !"".equals(checkNull)) {
                String data[] = entry.getValue();
                System.out.println(entry.getKey() + " - " + data.length);
                for (int i = 0; i < data.length; i++) {
                    RaciMappingCustome raci = new RaciMappingCustome();

                    int taskId = 0;
                    if (entry.getKey().contains("raci_r_")) {
                        raci.setRaciType("R");
                        taskId = Integer.parseInt(entry.getKey().replace("raci_r_", "").replace("[]", ""));
                    }
                    if (entry.getKey().contains("raci_a_")) {
                        raci.setRaciType("A");
                        taskId = Integer.parseInt(entry.getKey().replace("raci_a_", "").replace("[]", ""));
                    }
                    if (entry.getKey().contains("raci_c_")) {
                        raci.setRaciType("C");
                        taskId = Integer.parseInt(entry.getKey().replace("raci_c_", "").replace("[]", ""));
                    }
                    if (entry.getKey().contains("raci_i_")) {
                        raci.setRaciType("I");
                        taskId = Integer.parseInt(entry.getKey().replace("raci_i_", "").replace("[]", ""));
                    }
                    raci.setTaskListId(taskId);

                    String string = data[i];
                    raci.setUserId(Integer.parseInt(string));
                    lstRaciMapping.add(raci);
                }
            }
        }

//        lay danh sach tasklist id
        HashMap<Integer, List<RaciMappingCustome>> hashmapTasklistID = new HashMap<>();
        for (int i = 0; i < lstRaciMapping.size(); i++) {
            System.out.println(lstRaciMapping.get(i).getUserId());
            if (hashmapTasklistID.get(lstRaciMapping.get(i).getTaskListId()) == null) {
                List<RaciMappingCustome> lst = new ArrayList<>();
                for (int j = 0; j < lstRaciMapping.size(); j++) {
                    RaciMappingCustome get = lstRaciMapping.get(j);
                    if (lstRaciMapping.get(j).getTaskListId() == lstRaciMapping.get(i).getTaskListId()) {
                        lst.add(get);
                    }
                }
                hashmapTasklistID.put(lstRaciMapping.get(i).getTaskListId(), lst);
            }
        }

        List<TkWsTaskRaci> lstTaskRacis = new ArrayList<>();

        for (Map.Entry<Integer, List<RaciMappingCustome>> entry : hashmapTasklistID.entrySet()) {
            Integer key1 = entry.getKey();
            List<RaciMappingCustome> value = entry.getValue();

            HashMap<Integer, TkWsTaskRaci> lstHashMap = new HashMap<>();

            for (int i = 0; i < value.size(); i++) {
                RaciMappingCustome get = value.get(i);
                if (lstHashMap.get(get.getUserId()) == null) {
                    TkWsTaskRaci raci = new TkWsTaskRaci();
                    raci.setStatus("ACTIVE");
                    raci.setUserId(get.getUserId());
                    if ("A".equals(get.getRaciType())) {
                        raci.setRaciA("Y");
                    } else if ("R".equals(get.getRaciType())) {
                        raci.setRaciR("Y");
                    } else if ("C".equals(get.getRaciType())) {
                        raci.setRaciC("Y");
                    } else if ("I".equals(get.getRaciType())) {
                        raci.setRaciI("Y");
                    }
                    TkWsTasklist tasklistr = new TkWsTasklist();
                    tasklistr = taskListController.GetTaskListById(get.getTaskListId());
                    raci.setTkWsTasklist(tasklistr);
                    lstHashMap.put(get.getUserId(), raci);
                } else {
                    TkWsTaskRaci raci = lstHashMap.get(get.getUserId());
                    if ("A".equals(get.getRaciType())) {
                        raci.setRaciA("Y");
                    } else if ("R".equals(get.getRaciType())) {
                        raci.setRaciR("Y");
                    } else if ("C".equals(get.getRaciType())) {
                        raci.setRaciC("Y");
                    } else if ("I".equals(get.getRaciType())) {
                        raci.setRaciI("Y");
                    }
                    lstHashMap.replace(get.getUserId(), raci);
                }
            }

            for (Map.Entry<Integer, TkWsTaskRaci> entry1 : lstHashMap.entrySet()) {
                Integer key2 = entry1.getKey();
                TkWsTaskRaci value1 = entry1.getValue();
                lstTaskRacis.add(value1);
            }

        }

        errorCode = taskListController.createListRaci(lstTaskRacis);

        if (errorCode == null) {
            workspace = workspaceController.GetWorkspaceById(workspaceId);
            workspaceSummary = workspaceFunction.getWorkspaceSummary(workspaceId, request);
            session.put("bieudoTask", workspaceFunction.GetCharTask(workspaceId));
            session.put("bieudoTask2", workspaceFunction.GetCharMemberTask(workspaceId));
            session.put("bieudoTask3", workspaceFunction.GetCharTask3(workspaceId));
            lstMemberInfoWorkspaceSummarys = workspaceController.MemberInfoWorkspaceSummary(workspaceId);

            return "CREATE_RACI_SUCCESS";
        } else {
            return ERROR;
        }
    }

    public String createRaciForTaskList() {
        int workspaceid = Integer.parseInt(request.getParameter("workspaceId"));
        workspace = workspaceController.GetWorkspaceById(workspaceid);
        listUserInWorkspace = workspaceController.lstUserActiveInWorkSpace(workspaceid);
        lstTaskList = workspaceController.GetAllTaskListNotCreateRaciByWorkspaceId(workspaceid);

        return SUCCESS;
    }

    public String genOptionSelectTaskList(List<TkUser> listUser) {
        String data = "";
        String content = " <option value=\"@userid@\">@loginid@</option> ";
        for (int i = 0; i < listUser.size(); i++) {
            TkUser get = listUser.get(i);
            String c = content;
            c = c.replaceAll("@userid@", String.valueOf(get.getId()));
            c = c.replaceAll("@loginid@", get.getLoginId());
            data = data + c;
        }
        System.out.println(data);
        return data;
    }

    public String getAllTask() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
//        List<TkWsTasklist> lstTasklists = workspaceController.GetAllTaskListByWorkspaceId(workspaceId);
        workspace = workspaceController.GetWorkspaceById(workspaceId);
        List<TkWsTaskListCustom> lstTasklists = taskListController.GetAllTaskListWithTaskByWorkspaceId(workspaceId);

        HashMap<Integer, MilestonesAndFolder> hashMap = new HashMap<>();

        for (Iterator<TkWsTaskListCustom> iterator = lstTasklists.iterator(); iterator.hasNext();) {
            TkWsTaskListCustom next = iterator.next();
            if (next.getTkWsFolder() != null && next.getTkWsFolder().getId() > 0) {
                if (hashMap.get(next.getTkWsFolder().getId()) == null) {
                    TkWsFolder folder = new TkWsFolder();
                    folder = taskListController.GetFolderByForderId(next.getTkWsFolder().getId());
                    MilestonesAndFolder mf = new MilestonesAndFolder(folder.getId(),
                            folder.getFolderName(),
                            folder.getFolderStatus(),
                            folder.getFolderDesc(),
                            folder.getIsMilestones(),
                            folder.getMilestonesTienkhoan(),
                            folder.getMilestinesStartDate(),
                            folder.getMilestonesEndDate());
                    List<TkWsTaskListCustom> lst = new ArrayList<>();
                    for (int i = 0; i < lstTasklists.size(); i++) {
                        if (lstTasklists.get(i).getTkWsFolder() != null && lstTasklists.get(i).getTkWsFolder().getId() > 0
                                && lstTasklists.get(i).getTkWsFolder().getId() == next.getTkWsFolder().getId()) {
                            lst.add(lstTasklists.get(i));
                        }
                    }
                    mf.setTkWsTasklists(lst);
                    hashMap.put(next.getTkWsFolder().getId(), mf);
                }
            } else {
                lstWsTaskListCustoms.add(next);
            }
        }

        for (Map.Entry<Integer, MilestonesAndFolder> entry : hashMap.entrySet()) {
            MilestonesAndFolder value = entry.getValue();
            lstMilestonesAndFolders.add(value);

        }

        return SUCCESS;
    }

    public String prepareCreateTask() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        if (request.getParameter("parentTaskId") != null) {
            int parentTaskId = Integer.parseInt(request.getParameter("parentTaskId"));
            taskParent = taskListController.GetTaskById(parentTaskId);
        }
        workspace = workspaceController.GetWorkspaceById(workspaceId);
        listUserRaciR = taskListController.getAllRaciR(tasklistid);
        tasklist = taskListController.GetTaskListById(tasklistid);
        listUserInWorkspace = workspaceController.lstUserActiveInWorkSpace(workspaceId);
        lstWsTaskListCustoms = taskListController.GetAllTaskListWithTaskByWorkspaceId(workspaceId);

        return SUCCESS;
    }

    public String createTask() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        List<SysUdfFieldValue> lstSysUdfFieldValues = new ArrayList<>();
        List<TkWsTaskChecklist> lstChecklists = new ArrayList<>();
        List<TkWsTaskChecklistItem> lstChecklistItems = new ArrayList<>();
        TkWsTasklist taskList = new TkWsTasklist();
        TkUser user = (TkUser) session.get("user");
        taskList = taskListController.GetTaskListById(tasklistid);
        task.setTkWsTasklist(taskList);
        task.setCreateBy(user.getLoginId());
        task.setLastUpdateBy(user.getLoginId());
        task.setCreateDate(systemMethod.getSysDateToSqlDate());
        task.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
        task.setIsSubTask("N");
        task.setStartDate(systemMethod.formatStringDateToSqlDate(request.getParameter("startDate")));
        task.setDueDate(systemMethod.formatStringDateToSqlDate(request.getParameter("dueDate")));
        task.setStatus("OPEN");
        if (request.getParameter("subtask") != null && "true".equals(request.getParameter("subtask"))) {
            int parentTaskId = Integer.parseInt(request.getParameter("taskid"));
            task.setParentTaskId(parentTaskId);
            task.setIsSubTask("Y");
        }

        HashMap<String, String[]> hashMap = new HashMap<>();
        hashMap = (HashMap<String, String[]>) request.getParameterMap();
        String[] taskFollow = null;
        if (hashMap.get("lstFollowTask") != null) {
            taskFollow = hashMap.get("lstFollowTask");
        }
        String followString = null;
        if (taskFollow != null && taskFollow.length > 0) {
            for (int i = 0; i < taskFollow.length; i++) {
                String string = taskFollow[i];
                if (followString == null) {
                    followString = string;
                } else {
                    followString = followString + "," + string;
                }

            }
        }
        System.out.println(followString);
        task.setFollowTask(followString);

        int countItemInputUDF = Integer.parseInt(request.getParameter("countItemInputUDF"));
        int countItemInputCheckList = Integer.parseInt(request.getParameter("countItemInputCheckList"));
        // tao udf
        for (int i = 0; i < countItemInputUDF; i++) {
            SysUdfFieldValue udf = new SysUdfFieldValue();
            udf.setCreateBy(user.getLoginId());
            udf.setLastUpdateBy(user.getLoginId());
            udf.setCreationDate(systemMethod.getSysDateToSqlDate());
            udf.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
            udf.setRefKey(request.getParameter("listUdfTask[" + i + "][UdfName]"));
            udf.setExtValue1(request.getParameter("listUdfTask[" + i + "][UdfType]"));
            udf.setFieldValue(request.getParameter("listUdfTask[" + i + "][UdfValue]"));
            udf.setStatus("ACTIVE");
            lstSysUdfFieldValues.add(udf);
        }

        //tao check list
        for (int i = 0; i < countItemInputCheckList; i++) {
            TkWsTaskChecklist checklist = new TkWsTaskChecklist();
            checklist.setCreateDate(systemMethod.getSysDateToSqlDate());
            checklist.setCreateBy(user.getLoginId());
            checklist.setLastUdpateDate(systemMethod.getSysDateToSqlDate());
            checklist.setLastUdpateBy(user.getLoginId());
            checklist.setCheckListName(request.getParameter("lstCheckList[" + i + "][checkListTitle]"));
            checklist.setCheckListStatus("ACTIVE");
            lstChecklists.add(checklist);
            for (int j = 0; j < 2; j++) {
                TkWsTaskChecklistItem checklistItem = new TkWsTaskChecklistItem();
                checklistItem.setCreateDate(systemMethod.getSysDateToSqlDate());
                checklistItem.setCreateBy(user.getLoginId());
                checklistItem.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                checklistItem.setLastUpdateBy(user.getLoginId());
                checklistItem.setItemName(
                        j == 0 ? request.getParameter("lstCheckList[" + i + "][checkListItem1]")
                                : request.getParameter("lstCheckList[" + i + "][checkListItem2]"));
                checklistItem.setItemStatus("ACTIVE");
                // de so sanh
                checklistItem.setTkWsTaskChecklist(checklist);
                lstChecklistItems.add(checklistItem);
            }
        }

        // tao comment
        taskComment.setCreateDate(systemMethod.getSysDateToSqlDate());
        taskComment.setCreateBy(user.getLoginId());
        taskComment.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
        taskComment.setLastUpdateBy(user.getLoginId());
        taskComment.setStatus("ACTIVE");
        taskComment.setUserLogin(user.getLoginId());

        // luu file
        List<TkWsAttachments> lstFile = new ArrayList<>();
        if (myFile != null) {
            for (int i = 0; i < myFile.length; i++) {
                String fileName = myFileFileName[i];
                File uploadedFile = myFile[i];
                String path = systemMethod.saveFiles(uploadedFile, "files/attachments/", fileName, request);
                if (path != null) {
                    TkWsAttachments tkFile = new TkWsAttachments();
                    tkFile.setCreateDate(systemMethod.getSysDateToSqlDate());
                    tkFile.setCreateBy(user.getLoginId());
                    tkFile.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                    tkFile.setLastUpdateBy(user.getLoginId());
                    tkFile.setFileLink(path);
                    tkFile.setFileName(fileName);
                    tkFile.setFileStatus("ACTIVE");
                    lstFile.add(tkFile);
                } else {
                    errorCode = "ERROR WHEN UPLOAD FILE.";
                    return errorCode;
                }
            }
        }

        errorCode = taskListController.createTask(task, lstSysUdfFieldValues, lstChecklists, lstChecklistItems, taskComment, lstFile);
        if (errorCode == null) {

            if (request.getParameter("subtask") != null) {
                viewTask();
                return "RETURN_PARENT_TASK";
            } else {
                getAllTask();
            }

            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String viewRaci() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        List<TkWsTaskRaci> lstRacis = new ArrayList<>();
        lstRacis = taskListController.getAllRaciAndView(tasklistid);
        for (int i = 0; i < lstRacis.size(); i++) {
            TkWsTaskRaci get = lstRacis.get(i);
            TkUser user = taskListController.getUserById(get.getUserId());
            RaciView rv = new RaciView();
            rv.setUserId(user.getId());
            rv.setUserLogin(user.getLoginId());
            rv.setFullName(user.getFullName());
            rv.setRaciA(get.getRaciA());
            rv.setRaciR(get.getRaciR());
            rv.setRaciC(get.getRaciC());
            rv.setRaciI(get.getRaciI());
            lstRaciViews.add(rv);
        }
        workspace = workspaceController.GetWorkspaceById(workspaceId);
        tasklist = taskListController.GetTaskListById(tasklistid);
        return SUCCESS;
    }

    public String viewTask() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        if (request.getParameter("issubtask") != null
                && "true".equals(String.valueOf(request.getParameter("issubtask")))) {
            taskid = Integer.parseInt(request.getParameter("parenttask"));
        }
        task = taskListController.GetTaskById(taskid);
        TkWsTasklist tasklist = taskListController.GetTaskListById(tasklistid);
        task.setTkWsTasklist(tasklist);
        taskCustom = new TkWsTaskCustom();
        taskCustom.setTask(task);
        TkUser assigneeUser = new TkUser();
        assigneeUser = taskListController.getUserById(task.getAssigneeUserId());
        taskCustom.setAssigneeUser(assigneeUser);

        TkUser reviewByUser = new TkUser();
        reviewByUser = taskListController.getUserById(task.getReviewBy());
        taskCustom.setReviewByUser(reviewByUser);

        // thong tin cong viec theo sau:
        if (task.getFollowTask() != null) {
            String[] taskidFollow = task.getFollowTask().split(",");
            for (int i = 0; i < taskidFollow.length; i++) {
                String string = taskidFollow[i];
                int idtasks = Integer.parseInt(string);
                TkWsTask t = new TkWsTask();
                t = taskListController.GetTaskById(idtasks);
                lstTasksFollows.add(t);
            }
        }

        // thong tin subtask
        lstTasks = taskListController.GetAllSubTaskByTaskId(taskid);
        for (int i = 0; i < lstTasks.size(); i++) {
            TkWsTask tas = new TkWsTask();
            tas = lstTasks.get(i);
            TkWsTaskCustom taskCustom = new TkWsTaskCustom();
            taskCustom = mergeTaskWithUser(tas);
            lstTaskCustoms.add(taskCustom);

        }

        // thông tin udf
        lstUdf = taskListController.GetAllUDFByTaskId(taskid);

        // thông tin checklist
        lstChecklists = taskListController.GetAllCheckListByTaskId(taskid);
        List<Integer> lstchecklist = new ArrayList<>();
        for (int i = 0; i < lstChecklists.size(); i++) {
            lstchecklist.add(lstChecklists.get(i).getId());
        }

        lstChecklistItems = taskListController.GetAllCheckListItemByCheckListId(lstchecklist);

        // thông tin file
        lstAttachmentses = taskListController.GetAllAttachmentByTaskId(taskid);

        // thong tin comment
        lstComments = taskListController.GetAllCommentByTaskId(taskid);

        workspace = workspaceController.GetWorkspaceById(workspaceId);
        tasklist = taskListController.GetTaskListById(tasklistid);
        return SUCCESS;
    }

    public String editTask() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        TkWsTask t = new TkWsTask();
        t = taskListController.GetTaskById(taskid);
        t.setTaskName(task.getTaskName());
        t.setTaskDesc(task.getTaskDesc());
        t.setNganSach(task.getNganSach());
        t.setAssigneeUserId(task.getAssigneeUserId());
        t.setReviewBy(task.getReviewBy());
        t.setStartDate(systemMethod.formatStringDateToSqlDate(request.getParameter("startDate")));
        t.setDueDate(systemMethod.formatStringDateToSqlDate(request.getParameter("dueDate")));
        t.setPriority(task.getPriority());
        t.setTimeEstimate(task.getTimeEstimate());
        t.setLastUpdateBy(user.getLoginId());
        t.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
        t.setAmountPlan(task.getAmountPlan());

        errorCode = taskController.updateTask(t);
        if (errorCode == null) {
            viewTask();
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String createUdf() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));

        List<SysUdfFieldValue> lstSysUdfFieldValues = new ArrayList<>();
        int countItemInputUDF = Integer.parseInt(request.getParameter("countItemInputUDF"));
        // tao udf
        for (int i = 0; i < countItemInputUDF; i++) {
            SysUdfFieldValue udf = new SysUdfFieldValue();
            udf.setCreateBy(user.getLoginId());
            udf.setLastUpdateBy(user.getLoginId());
            udf.setCreationDate(systemMethod.getSysDateToSqlDate());
            udf.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
            udf.setRefKey(request.getParameter("listUdfTask[" + i + "][UdfName]"));
            udf.setExtValue1(request.getParameter("listUdfTask[" + i + "][UdfType]"));
            udf.setFieldValue(request.getParameter("listUdfTask[" + i + "][UdfValue]"));
            udf.setStatus("ACTIVE");
            udf.setRefId(taskid);
            lstSysUdfFieldValues.add(udf);
        }
        taskListController.createUdf(lstSysUdfFieldValues);
        viewTask();
        return SUCCESS;
    }

    public String deleteUdf() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        int udfId = Integer.parseInt(request.getParameter("udfid"));
        taskListController.deleteUdf(udfId);
        viewTask();
        return SUCCESS;
    }

    public String prepareCreateUdf() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));

        task = taskListController.GetTaskById(taskid);
        workspace = workspaceController.GetWorkspaceById(workspaceId);

        return SUCCESS;
    }

    public String prepareCreateTaskFollow() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));

        task = taskListController.GetTaskById(taskid);
        workspace = workspaceController.GetWorkspaceById(workspaceId);

        lstWsTaskListCustoms = taskListController.GetAllTaskListWithTaskByWorkspaceId(workspaceId);

        return SUCCESS;
    }

    public String createTaskFollow() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        
        TkWsTask t = new TkWsTask();
        t = taskListController.GetTaskById(taskid);
        HashMap<String, String[]> hashMap = new HashMap<>();
        hashMap = (HashMap<String, String[]>) request.getParameterMap();
        String[] taskFollow = null;
        if (hashMap.get("lstFollowTask") != null) {
            taskFollow = hashMap.get("lstFollowTask");
        }
        String followString = null;
        if (taskFollow != null && taskFollow.length > 0) {
            for (int i = 0; i < taskFollow.length; i++) {
                String string = taskFollow[i];
                if (followString == null) {
                    followString = string;
                } else {
                    followString = followString + "," + string;
                }

            }
        }
        System.out.println(followString);
        t.setFollowTask(followString);
        
        taskController.updateTask(t);
        
        viewTask();
        return SUCCESS;
    }

    public String prepareCreateCheckList() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));

        task = taskListController.GetTaskById(taskid);
        workspace = workspaceController.GetWorkspaceById(workspaceId);

        return SUCCESS;
    }

    public String createCheckList() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));

        TkWsTask t = new TkWsTask();
        t = taskListController.GetTaskById(taskid);

        List<TkWsTaskChecklistItem> lstChecklistItems = new ArrayList<>();
        List<TkWsTaskChecklist> lstChecklists = new ArrayList<>();
        int countItemInputCheckList = Integer.parseInt(request.getParameter("countItemInputCheckList"));
        // tao udf
        for (int i = 0; i < countItemInputCheckList; i++) {
            TkWsTaskChecklist checklist = new TkWsTaskChecklist();
            checklist.setCreateDate(systemMethod.getSysDateToSqlDate());
            checklist.setCreateBy(user.getLoginId());
            checklist.setLastUdpateDate(systemMethod.getSysDateToSqlDate());
            checklist.setLastUdpateBy(user.getLoginId());
            checklist.setCheckListName(request.getParameter("lstCheckList[" + i + "][checkListTitle]"));
            checklist.setCheckListStatus("ACTIVE");
            checklist.setTkWsTask(t);
            lstChecklists.add(checklist);
            for (int j = 0; j < 2; j++) {
                TkWsTaskChecklistItem checklistItem = new TkWsTaskChecklistItem();
                checklistItem.setCreateDate(systemMethod.getSysDateToSqlDate());
                checklistItem.setCreateBy(user.getLoginId());
                checklistItem.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                checklistItem.setLastUpdateBy(user.getLoginId());
                checklistItem.setItemName(
                        j == 0 ? request.getParameter("lstCheckList[" + i + "][checkListItem1]")
                                : request.getParameter("lstCheckList[" + i + "][checkListItem2]"));
                checklistItem.setItemStatus("ACTIVE");
                // de so sanh
                checklistItem.setTkWsTaskChecklist(checklist);
                lstChecklistItems.add(checklistItem);
            }
        }

        taskListController.createCheckList(lstChecklists, lstChecklistItems);

        viewTask();
        return SUCCESS;
    }

    public String deleteCheckList() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        int checkListId = Integer.parseInt(request.getParameter("checklistid"));
        taskListController.deleteCheckList(checkListId);
        viewTask();
        return SUCCESS;
    }

    public String uploadFile() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));

        List<TkWsAttachments> lstFile = new ArrayList<>();
        if (myFile != null) {
            for (int i = 0; i < myFile.length; i++) {
                String fileName = myFileFileName[i];
                File uploadedFile = myFile[i];
                String path = systemMethod.saveFiles(uploadedFile, "files/attachments/", fileName, request);
                if (path != null) {
                    TkWsAttachments tkFile = new TkWsAttachments();
                    tkFile.setCreateDate(systemMethod.getSysDateToSqlDate());
                    tkFile.setCreateBy(user.getLoginId());
                    tkFile.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                    tkFile.setLastUpdateBy(user.getLoginId());
                    tkFile.setFileLink(path);
                    tkFile.setFileName(fileName);
                    tkFile.setFileStatus("ACTIVE");
                    tkFile.setTaskId(taskid);
                    lstFile.add(tkFile);
                } else {
                    errorCode = "ERROR WHEN UPLOAD FILE.";
                    return errorCode;
                }
            }
        }
        taskListController.uploadFile(lstFile);
        viewTask();
        return SUCCESS;
    }

    public String deleteAttachment() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        int attachmentid = Integer.parseInt(request.getParameter("attachmentid"));
        taskListController.deleteAttachment(attachmentid);
        viewTask();
        return SUCCESS;
    }

    public TkWsTaskCustom mergeTaskWithUser(TkWsTask tasks) {
        TkWsTaskCustom taskCustom = new TkWsTaskCustom();
        taskCustom.setTask(tasks);
        TkUser assigneeUser = new TkUser();
        assigneeUser = taskListController.getUserById(tasks.getAssigneeUserId());
        taskCustom.setAssigneeUser(assigneeUser);
        TkUser reviewByUser = new TkUser();
        reviewByUser = taskListController.getUserById(tasks.getReviewBy());
        taskCustom.setReviewByUser(reviewByUser);

        return taskCustom;
    }

    public String deleteTask() {
        TkUser user = (TkUser) session.get("user");
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        int tasklistid = Integer.parseInt(request.getParameter("tasklistid"));
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        taskListController.deleteTask(taskid);
        if (request.getParameter("issubtask") != null
                && "true".equals(String.valueOf(request.getParameter("issubtask")))) {
            viewTask();
            return "GET_PARENT_TASK";
        } else {
            getAllTask();
            return "GET_ALL_TASK";
        }
    }

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

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public TkWsTasklist getTasklist() {
        return tasklist;
    }

    public void setTasklist(TkWsTasklist tasklist) {
        this.tasklist = tasklist;
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

    public TkWsFolder getTkWsFolder() {
        return tkWsFolder;
    }

    public void setTkWsFolder(TkWsFolder tkWsFolder) {
        this.tkWsFolder = tkWsFolder;
    }

    public List<TkUser> getListUserInWorkspace() {
        return listUserInWorkspace;
    }

    public void setListUserInWorkspace(List<TkUser> listUserInWorkspace) {
        this.listUserInWorkspace = listUserInWorkspace;
    }

    public List<TkWsTasklist> getLstTaskList() {
        return lstTaskList;
    }

    public void setLstTaskList(List<TkWsTasklist> lstTaskList) {
        this.lstTaskList = lstTaskList;
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

    public List<MilestonesAndFolder> getLstMilestonesAndFolders() {
        return lstMilestonesAndFolders;
    }

    public void setLstMilestonesAndFolders(List<MilestonesAndFolder> lstMilestonesAndFolders) {
        this.lstMilestonesAndFolders = lstMilestonesAndFolders;
    }

    public List<TkWsTaskListCustom> getLstWsTaskListCustoms() {
        return lstWsTaskListCustoms;
    }

    public void setLstWsTaskListCustoms(List<TkWsTaskListCustom> lstWsTaskListCustoms) {
        this.lstWsTaskListCustoms = lstWsTaskListCustoms;
    }

    public List<TkWsTaskRaci> getLstTaskRacis() {
        return lstTaskRacis;
    }

    public void setLstTaskRacis(List<TkWsTaskRaci> lstTaskRacis) {
        this.lstTaskRacis = lstTaskRacis;
    }

    public List<TkUser> getListUserRaciR() {
        return listUserRaciR;
    }

    public void setListUserRaciR(List<TkUser> listUserRaciR) {
        this.listUserRaciR = listUserRaciR;
    }

    public TkWsTask getTask() {
        return task;
    }

    public void setTask(TkWsTask task) {
        this.task = task;
    }

    public List<SysCodeSet> getLstCodeSets() {
        return lstCodeSets;
    }

    public void setLstCodeSets(List<SysCodeSet> lstCodeSets) {
        this.lstCodeSets = lstCodeSets;
    }

    public List<SysCodeValue> getLstCodeValues() {
        return lstCodeValues;
    }

    public void setLstCodeValues(List<SysCodeValue> lstCodeValues) {
        this.lstCodeValues = lstCodeValues;
    }

    public TkWsComment getTaskComment() {
        return taskComment;
    }

    public void setTaskComment(TkWsComment taskComment) {
        this.taskComment = taskComment;
    }

    public File[] getMyFile() {
        return myFile;
    }

    public void setMyFile(File[] myFile) {
        this.myFile = myFile;
    }

    public String[] getMyFileFileName() {
        return myFileFileName;
    }

    public void setMyFileFileName(String[] myFileFileName) {
        this.myFileFileName = myFileFileName;
    }

    public List<RaciView> getLstRaciViews() {
        return lstRaciViews;
    }

    public void setLstRaciViews(List<RaciView> lstRaciViews) {
        this.lstRaciViews = lstRaciViews;
    }

    public List<TkWsTask> getLstTasks() {
        return lstTasks;
    }

    public void setLstTasks(List<TkWsTask> lstTasks) {
        this.lstTasks = lstTasks;
    }

    public List<SysUdfFieldValue> getLstUdf() {
        return lstUdf;
    }

    public void setLstUdf(List<SysUdfFieldValue> lstUdf) {
        this.lstUdf = lstUdf;
    }

    public List<TkWsAttachments> getLstAttachmentses() {
        return lstAttachmentses;
    }

    public void setLstAttachmentses(List<TkWsAttachments> lstAttachmentses) {
        this.lstAttachmentses = lstAttachmentses;
    }

    public List<TkWsTaskChecklist> getLstChecklists() {
        return lstChecklists;
    }

    public void setLstChecklists(List<TkWsTaskChecklist> lstChecklists) {
        this.lstChecklists = lstChecklists;
    }

    public List<TkWsTaskChecklistItem> getLstChecklistItems() {
        return lstChecklistItems;
    }

    public void setLstChecklistItems(List<TkWsTaskChecklistItem> lstChecklistItems) {
        this.lstChecklistItems = lstChecklistItems;
    }

    public List<TkWsComment> getLstComments() {
        return lstComments;
    }

    public void setLstComments(List<TkWsComment> lstComments) {
        this.lstComments = lstComments;
    }

    public TkWsTaskCustom getTaskCustom() {
        return taskCustom;
    }

    public void setTaskCustom(TkWsTaskCustom taskCustom) {
        this.taskCustom = taskCustom;
    }

    public TkWsTask getTaskParent() {
        return taskParent;
    }

    public void setTaskParent(TkWsTask taskParent) {
        this.taskParent = taskParent;
    }

    public List<TkWsTaskCustom> getLstTaskCustoms() {
        return lstTaskCustoms;
    }

    public void setLstTaskCustoms(List<TkWsTaskCustom> lstTaskCustoms) {
        this.lstTaskCustoms = lstTaskCustoms;
    }

    public List<TkWsTask> getLstTasksFollows() {
        return lstTasksFollows;
    }

    public void setLstTasksFollows(List<TkWsTask> lstTasksFollows) {
        this.lstTasksFollows = lstTasksFollows;
    }

}
