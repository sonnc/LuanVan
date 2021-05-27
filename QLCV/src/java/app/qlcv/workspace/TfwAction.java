/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.LinkDataArray;
import app.qlcv.customs.NodeDataArray;
import app.qlcv.customs.tfw;
import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsTask;
import app.qlcv.utils.SystemMethod;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
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
public class TfwAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private SystemMethod systemMethod;
    private TaskController taskController;
    private WorkspaceController workspaceController;
    private List<tfw> lstTfw = new ArrayList<>();

    public TfwAction() {
        systemMethod = new SystemMethod();
        taskController = new TaskController();
        workspaceController = new WorkspaceController();
    }

    public String TfwRunToView() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));

        List<TkUser> lstTkUsers = workspaceController.lstUserActiveInWorkSpace(workspaceId);
        for (int i = 0; i < lstTkUsers.size(); i++) {
            TkUser userDepart = lstTkUsers.get(i);

            List<TkWsTask> lstTasks = new ArrayList<>();
            lstTasks = taskController.GetAllTaskByUserId(userDepart.getId(), "all");

            List<TkWsTask> lstOldTask = new ArrayList<>();
            List<TkWsTask> lstNewTask = new ArrayList<>();

            for (int j = 0; j < lstTasks.size(); j++) {
                TkWsTask task = lstTasks.get(j);
                if (task.getStartDate().before(systemMethod.getSystemDateDate())) {
                    lstOldTask.add(task);
                } else {
                    lstNewTask.add(task);
                }
            }
            List<String> valueReturn = TfwView(lstOldTask, lstNewTask);
            if(valueReturn.size() == 0){
                valueReturn.add("Không có dữ liệu dự báo.");
            }
            tfw  t = new tfw();
            t.setId(userDepart.getId());
            t.setLoginId(userDepart.getLoginId());
            t.setFullName(userDepart.getFullName());
            t.setEmployeeNo(userDepart.getEmployeeNo());
            t.setEmail(userDepart.getEmail());
            t.setDubaoString(valueReturn);
            lstTfw.add(t);
        }

        return SUCCESS;
    }

    public List<String> TfwView(List<TkWsTask> lstOldTask, List<TkWsTask> lstNewTask) {
        String valueReturn = "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        List<String> lstValue = new ArrayList<>();

        if (lstOldTask.size() < 10) {
            valueReturn = "Không có cơ sở dự báo";
            lstValue.add(valueReturn);
        } else {
            if (lstNewTask.size() > 0) {
                valueReturn = "Du bao";
                lstValue.add(valueReturn);
            }

            int coutTaskTrehan = 0;
            int countCVThap = 0;
            int countCVTrungBinh = 0;
            int countCVCao = 0;
            int countCVKhac = 0;

            int countCVDaiHan = 0;
            int countCVNganHan = 0;

            boolean coTreHan = false;

            int countTaskHoanThanh = 0;
            int countTaskChuaDong = 0;

            for (int i = 0; i < lstOldTask.size(); i++) {
                TkWsTask task = lstOldTask.get(i);
                if (!"DELETE".equals(task.getStatus())
                        && ((task.getDateClose() == null && task.getDueDate().before(systemMethod.getSystemDateDate()))
                        || (task.getDateClose() != null && task.getDueDate().before(task.getDateClose())))) {
                    coutTaskTrehan = coutTaskTrehan + 1;
                }
                if (1 == task.getPriority()) {
                    countCVCao = countCVCao + 1;
                } else if (2 == task.getPriority()) {
                    countCVTrungBinh = countCVTrungBinh + 1;
                } else if (3 == task.getPriority()) {
                    countCVThap = countCVThap + 1;
                } else {
                    countCVKhac = countCVKhac + 1;
                }

                c1.setTime(task.getStartDate());
                c2.setTime(task.getDueDate());
                long noDay = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);
                if (noDay < 5) {
                    countCVNganHan = countCVNganHan + 1;
                } else {
                    countCVDaiHan = countCVDaiHan + 1;
                }

                if (!"DELETE".equals(task.getStatus()) && !"CLOSE".equals(task.getStatus())) {
                    countTaskChuaDong = countTaskChuaDong + 1;
                } else if (!"DELETE".equals(task.getStatus()) && "CLOSE".equals(task.getStatus())) {
                    countTaskHoanThanh = countTaskHoanThanh + 1;
                }
            }

            double phanTramTreHan = (coutTaskTrehan / lstOldTask.size()) * 100;

            if (phanTramTreHan < 5) {
                lstValue.add("Kỳ tiếp theo không trễ hạn");
                coTreHan = true;
            } else if (phanTramTreHan >= 5 && phanTramTreHan < 40) {
                lstValue.add("Kỳ tiếp theo có thể trễ hạn");
                coTreHan = true;
            } else {
                lstValue.add("Kỳ tiếp theo sẽ trễ hạn");
            }

            if (countCVThap / lstOldTask.size() >= 0.7) {
                lstValue.add("Xu hướng làm các công việc có mức độ thấp");
            } else if (countCVTrungBinh / lstOldTask.size() >= 0.7) {
                lstValue.add("Xu hướng làm các công việc có mức độ trung bình");
            } else if (countCVCao / lstOldTask.size() >= 0.7) {
                lstValue.add("Xu hướng làm các công việc có mức độ cao");
            }

            if (coTreHan && countCVNganHan < countCVDaiHan) {
                lstValue.add("Xu hướng làm các công việc ngắn hạn, các công việc dài hạn thường trễ hạn.");
            } else if (coTreHan && countCVNganHan > countCVDaiHan) {
                lstValue.add("Xu hướng làm các công việc dài hạn, các công việc ngắn hạn thường trễ hạn");
            } else if (!coTreHan) {
                lstValue.add("Làm tốt các công việc trong kỳ tới");
            } else if (coTreHan) {
                lstValue.add("Có tỷ lệ trễ hạn trong kỳ tới");
            }

            if (countTaskChuaDong > 0 && countTaskHoanThanh / countTaskChuaDong >= 90) {
                lstValue.add("Làm tốt các công việc tiếp theo");
            } else if (countTaskChuaDong > 0 && countTaskHoanThanh / countTaskChuaDong > 50
                    && countTaskHoanThanh / countTaskChuaDong < 90) {
                lstValue.add("Đạt mức độ tốt cho công việc tiếp theo");
            } else {
                lstValue.add("Các công việc tiếp theo chỉ có thể ở mức độ đạt hoặc thấp hơn.");
            }
        }

        for (int i = 0; i < lstValue.size(); i++) {
            String get = lstValue.get(i);
            System.out.println(get);

        }

        return lstValue;
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

    public List<tfw> getLstTfw() {
        return lstTfw;
    }

    public void setLstTfw(List<tfw> lstTfw) {
        this.lstTfw = lstTfw;
    }

}
