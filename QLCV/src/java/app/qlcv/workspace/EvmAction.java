/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.Evm;
import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsTask;
import app.qlcv.utils.SystemMethod;
import com.opensymphony.xwork2.ActionSupport;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class EvmAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private SystemMethod systemMethod;
    private TaskController taskController;
    private WorkspaceController workspaceController;
    private String ActuaCost;
    private String PlannedValue;
    private String EarnedValue;
    private String EstimateCompletion;
    private String labels = " ";
    private List<TkWsTask> lstTask;
    private int countETCMonth = 0;
    private HashMap<String, Long> hashMapPVValue;
    private String valueDateCurrAV;
    private Long valueAmountCurrAV;
    private Long valueAmountCurrPV;
    private Long valueAmountCurrEV;
    private Long valueAmountCurrETC;
    private String dataAV = " ";
    private int workspaceId;
    private List<Evm> lstEvms;

    public EvmAction() {
        systemMethod = new SystemMethod();
        taskController = new TaskController();
        workspaceController = new WorkspaceController();
    }

    public String EvmGenData() {
        int wpid = Integer.parseInt(request.getParameter("workspaceId"));
        workspaceId = wpid;
        TkWorkspace workspace = workspaceController.GetWorkspaceById(wpid);
        List<TkWsTask> lstTasks = new ArrayList<>();
        lstTasks = taskController.GetAllTaskByWorkspaceId(wpid);

        HashMap<Integer, TkWsTask> hashmapTask = new HashMap<>();
        HashMap<Integer, Integer> hashmapTaskDatePlan = new HashMap<>();
        HashMap<Integer, Integer> hashmapTaskDateETCPlan = new HashMap<>();
        //get start date and close date of project
        Date minDate = systemMethod.getSystemDateDate();
        Date maxDate = systemMethod.getSystemDateDate();
        Date etcMaxDate = systemMethod.getSystemDateDate();
        for (int i = 0; i < lstTasks.size(); i++) {
            TkWsTask task = lstTasks.get(i);
            if (task.getStartDate().before(minDate)) {
                minDate = task.getStartDate();
            }
            if (task.getDueDate().after(maxDate)) {
                maxDate = task.getDueDate();
            }
//            if (task.getEtcDatePlan().after(etcMaxDate)) {
//                etcMaxDate = task.getDueDate();
//            }

        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        Calendar c3 = Calendar.getInstance();

//        for (int i = 0; i < lstTasks.size(); i++) {
//            TkWsTask task = lstTasks.get(i);
//            c1.setTime(task.getStartDate());
//            c2.setTime(task.getDueDate());
//            c3.setTime(task.getEtcDatePlan());
//            long noDay = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);
//            hashmapTask.put(task.getId(), task);
//            hashmapTaskDatePlan.put(task.getId(), (int) noDay);
//            if (task.getEtcDatePlan() == null) {
//                hashmapTaskDateETCPlan.put(task.getId(), (int) noDay);
//            } else {
//                long noDayETC = (c3.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);
//                hashmapTaskDateETCPlan.put(task.getId(), (int) noDayETC);
//            }
//
//        }
        List<String> stringDate = new ArrayList<>();

        HashMap<String, String> hashMapDate = new HashMap<>();

        DateFormat formatter;
        formatter = new SimpleDateFormat("MM/yyyy");

        DateFormat formatter2;
        formatter2 = new SimpleDateFormat("yyyy");
        stringDate.add(formatter2.format(systemMethod.getSystemDateDate()));
        String endDatePV = null;
        Date startDate = workspace.getStartDate();
        Date endDate = workspace.getEndDate();
        long interval = 24 * 1000 * 60 * 60; // 1 hour in millis
        long endTime = endDate.getTime(); // create your endtime here, possibly using Calendar or Date
        long curTime = startDate.getTime();
        while (curTime <= endTime) {
            Date cu = new Date(curTime);
            String ds = formatter.format(cu);
            String valueDate = hashMapDate.get(ds);
            if (valueDate == null) {
                hashMapDate.put(ds, ds);
                stringDate.add(ds);
                endDatePV = ds;
            }
            curTime += interval;
        }
        if (workspace.getEtcDate() != null) {
            Date endDate1 = workspace.getEndDate();
            Date etcDate = workspace.getEtcDate();
            long interval1 = 24 * 1000 * 60 * 60; // 1 hour in millis
            long endTime1 = endDate.getTime(); // create your endtime here, possibly using Calendar or Date
            long etcTime = etcDate.getTime();

            while (endTime1 <= etcTime) {
                Date cu = new Date(endTime1);
                String ds = formatter.format(cu);
                String valueDate = hashMapDate.get(ds);
                if (valueDate == null) {
                    hashMapDate.put(ds, ds);
                    stringDate.add(ds);
                    countETCMonth++;
                }
                endTime1 += interval1;
            }
        }

        for (int i = 0; i < stringDate.size(); i++) {
            String get = stringDate.get(i);
            String data = "\"@value\"";
            data = data.replace("@value", get);
            labels = labels + data;
            if (i < stringDate.size() - 1) {
                labels = labels + ",";
            }

        }
        labels = "[" + labels + "]";
        System.out.println(labels);

        String pvs = EvmCacualtePV(lstTasks, stringDate, endDatePV);
        String avs = EvmCacualteAV(lstTasks, stringDate);
        String evs = EvmCacualteEV(lstTasks, stringDate);
        String etc = EvmCaculateETC(stringDate, (workspace.getEtcAmount() == null ? 0 : workspace.getEtcAmount()));
        session.remove("pv");
        session.remove("av");
        session.remove("ev");
        session.remove("labels");
        session.remove("etc");
        session.put("pv", pvs);
        session.put("av", avs);
        session.put("ev", evs);
        session.put("etc", etc);
        session.put("labels", labels);
        System.out.println(labels);
        System.out.println(pvs);
        System.out.println(avs);
        System.out.println(evs);
        System.out.println(etc);
        EvmData();

        return SUCCESS;
    }

    public String EvmCacualteEV(List<TkWsTask> lsTasks, List<String> date) {
        // chinh la BCWP 
        DateFormat formatter;
        formatter = new SimpleDateFormat("MM/yyyy");

        HashMap<String, Long> hashMapPlanValue = new HashMap<>();
        List<Long> valueAV = new ArrayList<>();

        String thisMonth = formatter.format(systemMethod.getSystemDateDate());
        long total = 0;
        for (int i = 0; i < date.size(); i++) {

            String get = date.get(i);
            long totalInMonth = 0;
            boolean coDuLieuTaskTrongThang = false;

            for (int j = 0; j < lsTasks.size(); j++) {
                TkWsTask task = lsTasks.get(j);
                String startDate = formatter.format(task.getStartDate());
                if (startDate.equals(get)) {
                    totalInMonth = totalInMonth + task.getAmountPlan() * (task.getPercentCoplete() == null ? 0 : task.getPercentCoplete()) / 100;
                    coDuLieuTaskTrongThang = true;
                }
            }
            total = total + totalInMonth;
            if (!coDuLieuTaskTrongThang) {
                if (valueAV.size() == 0) {
                    total = 0;
                } else {
                    total = -1;
                }

            }
            valueAV.add(total);
            valueAmountCurrEV = total;
            hashMapPlanValue.put(get, totalInMonth);

            if (thisMonth.equals(get)) {
                break;
            }
        }

        String value = "[";
        for (int i = 0; i < valueAV.size(); i++) {
            value = value + valueAV.get(i);
            if (i < valueAV.size() - 1) {
                value = value + ",";
            }
        }
        value = value + "]";

        return value;
    }

    public String EvmCacualtePV(List<TkWsTask> lsTasks, List<String> date, String endDatePV) {
        // chinh la BCWS
        DateFormat formatter;
        formatter = new SimpleDateFormat("MM/yyyy");

        HashMap<String, Long> hashMapPlanValue = new HashMap<>();
        List<Long> valuePV = new ArrayList<>();
        long total = 0;
        hashMapPVValue = new HashMap<>();
        for (int i = 0; i < date.size(); i++) {

            String get = date.get(i);
            long totalInMonth = 0;
            boolean coDuLieuTaskTrongThang = false;
            for (int j = 0; j < lsTasks.size(); j++) {
                TkWsTask task = lsTasks.get(j);
                String startDate = formatter.format(task.getStartDate());
                if (startDate.equals(get)) {
                    totalInMonth = totalInMonth + task.getAmountPlan();
                    coDuLieuTaskTrongThang = true;
                }
            }
            total = total + totalInMonth;
            hashMapPVValue.put(get, total);
            if (!coDuLieuTaskTrongThang) {
                if (valuePV.size() == 0) {
                    total = 0;
                } else {
                    total = -1;
                }

            }
            valuePV.add(total);
            hashMapPlanValue.put(get, totalInMonth);
            valueAmountCurrPV = total;
            if (endDatePV.equals(get)) {
                break;
            }
        }

        String value = "[";
        for (int i = 0; i < valuePV.size(); i++) {
            value = value + valuePV.get(i);
            if (i < valuePV.size() - 1) {
                value = value + ",";
            }
        }
        value = value + "]";

        return value;
    }

    public String EvmCacualteAV(List<TkWsTask> lsTasks, List<String> date) {
//        chinh la: ACWP
        DateFormat formatter;
        formatter = new SimpleDateFormat("MM/yyyy");

        HashMap<String, Long> hashMapPlanValue = new HashMap<>();
        List<Long> valueAV = new ArrayList<>();

        String thisMonth = formatter.format(systemMethod.getSystemDateDate());
        long total = 0;
        for (int i = 0; i < date.size(); i++) {

            String get = date.get(i);
            long totalInMonth = 0;
            boolean coDuLieuTaskTrongThang = false;

            for (int j = 0; j < lsTasks.size(); j++) {
                TkWsTask task = lsTasks.get(j);
                String startDate = formatter.format(task.getStartDate());
                if (startDate.equals(get)) {
                    totalInMonth = totalInMonth + (task.getAmountSpent() == null ? 0 : task.getAmountSpent());
                    coDuLieuTaskTrongThang = true;
                }
            }
            total = total + totalInMonth;
            if (!coDuLieuTaskTrongThang) {
                if (valueAV.size() == 0) {
                    total = 0;
                } else {
                    total = -1;
                }

            }
            valueAV.add(total);
            hashMapPlanValue.put(get, totalInMonth);

            valueAmountCurrAV = total;
            valueDateCurrAV = get;
            if (thisMonth.equals(get)) {
                break;
            }
        }

        String value = "[";
        for (int i = 0; i < valueAV.size(); i++) {
            value = value + valueAV.get(i);
            dataAV = dataAV + valueAV.get(i);
            if (i < valueAV.size() - 1) {
                value = value + ",";
                dataAV = dataAV + ",";
            }
        }
        value = value + "]";

        return value;
    }

    public String EvmCaculateETC(List<String> lstDate, long etcAmount) {
        String dataETC = " ";
        boolean isFind = false;
        long etcAmountTB = 0;
        if (countETCMonth != 0) {
            etcAmountTB = (long) etcAmount / countETCMonth;
        }

        long chechLech = 0;
        long valueETC = valueAmountCurrAV;
        System.out.println(valueAmountCurrAV);
        boolean isRunFistTime = false;
        for (int i = 0; i < lstDate.size(); i++) {
            String get = lstDate.get(i);
            if (isFind) {
                if (hashMapPVValue.get(get) != null) {
                    valueETC = hashMapPVValue.get(get) + chechLech;
                } else {
                    valueETC = valueETC + etcAmountTB;
                }
                dataETC = dataETC + valueETC + ",";
            }

            if (valueDateCurrAV.equals(get)) {
                isFind = true;
                chechLech = valueAmountCurrAV - hashMapPVValue.get(get);
                isRunFistTime = true;
            }
            if (!isFind) {
                dataETC = dataETC + ",";
            }
            if (isRunFistTime) {
                dataETC = dataETC + valueAmountCurrAV + ",";
                isRunFistTime = false;
            }

        }
        valueAmountCurrETC = valueETC;
//        dataETC = dataETC.substring(0, dataETC.length() - 1);
        System.out.println(dataETC);
        return "[" + dataETC + "]";
    }

    public String getAllTaskInWorkspaceForEVM() {
        lstTask = new ArrayList<>();
        int wd = Integer.parseInt(request.getParameter("workspaceId"));
        TkWorkspace workspace = workspaceController.GetWorkspaceById(wd);
        lstTask = taskController.GetAllTaskByWorkspaceId(wd);
        workspaceId = wd;
        return SUCCESS;
    }

    public String saveAmount() {
        int wd = Integer.parseInt(request.getParameter("workspaceId"));
        TkWorkspace workspace = workspaceController.GetWorkspaceById(wd);
        List<TkWsTask> lstTkWsTasks = new ArrayList<>();
        lstTkWsTasks = taskController.GetAllTaskByWorkspaceId(wd);
        HashMap<Integer, Long> hashMapSoTienChi = new HashMap<>();
        HashMap<Integer, Long> hashMapPhanTramHoanThanh = new HashMap<>();
        for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {

            if (entry.getKey().contains("soTienChi-")) {
                int idTask = Integer.parseInt(entry.getKey().replace("soTienChi-", ""));
                long value = 0;
                if (entry.getValue()[0] == null || "".equals(entry.getValue()[0])) {
                    value = 0;
                } else {
                    value = Long.parseLong(entry.getValue()[0]);
                }
                hashMapSoTienChi.put(idTask, value);
            }

            if (entry.getKey().contains("phanTramHoanThanh-")) {
                int idTask = Integer.parseInt(entry.getKey().replace("phanTramHoanThanh-", ""));
                long value = 0;
                if (entry.getValue()[0] == null || "".equals(entry.getValue()[0])) {
                    value = 0;
                } else {
                    value = Long.parseLong(entry.getValue()[0]);
                }
                hashMapPhanTramHoanThanh.put(idTask, value);
            }
        }

        for (int i = 0; i < lstTkWsTasks.size(); i++) {
            TkWsTask task = lstTkWsTasks.get(i);
            if (hashMapSoTienChi.get(task.getId()) != null && hashMapSoTienChi.get(task.getId()) > 0) {
                task.setAmountSpent(hashMapSoTienChi.get(task.getId()));
            }
            if (hashMapPhanTramHoanThanh.get(task.getId()) != null && hashMapPhanTramHoanThanh.get(task.getId()) > 0) {
                task.setPercentCoplete(hashMapPhanTramHoanThanh.get(task.getId()));
            }
            Collections.replaceAll(lstTkWsTasks, lstTkWsTasks.get(i), task);
        }
        taskController.updateListTask(lstTkWsTasks);
        getAllTaskInWorkspaceForEVM();
        return SUCCESS;
    }

    public void EvmData() {
        lstEvms = new ArrayList<>();
        Evm epv = new Evm("PV", valueAmountCurrPV.toString(), "");
        Evm eev = new Evm("EV", valueAmountCurrEV.toString(), "");
        Evm eav = new Evm("AV", valueAmountCurrAV.toString(), "");
        long CV = valueAmountCurrEV - valueAmountCurrAV;
        Evm ecv = new Evm("CV", String.valueOf(CV), CV < 0 ? "Vượt chi phí" : "Trong khoảng chi phí");
        long SV = valueAmountCurrEV - valueAmountCurrPV;
        Evm esv = new Evm("SV", String.valueOf(SV), SV < 0 ? "Chưa đạt đủ khối lượng công việc theo kế hoạch" : "Đủ khối lượng công việc theo kế hoạch");
//        SPI = EV / PV
        long SPI = valueAmountCurrEV / valueAmountCurrPV;
        String spiString ="";
        if(SPI == 1){
            spiString = "Đúng tiến độ";
        }else if(SPI > 1){
            spiString = "Vượt tiến độ";
        }else{
            spiString = "Chậm tiến độ";
        }
        Evm espi = new Evm("SPI", String.valueOf(SPI),spiString);
        
        long CPI  = valueAmountCurrEV / valueAmountCurrPV;
        String CPIString ="";
        if(SPI == 1){
            CPIString = "Đúng ngân sách";
        }else if(SPI > 1){
            CPIString = "Dưới ngân sách";
        }else{
            CPIString = "Vượt ngân sách";
        }
        Evm eCPI = new Evm("CPI", String.valueOf(CPI),CPIString);
        
        lstEvms.add(epv);
        lstEvms.add(eev);
        lstEvms.add(eav);
        lstEvms.add(ecv);
        lstEvms.add(esv);
        lstEvms.add(espi);
        lstEvms.add(eCPI);
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

    public String getActuaCost() {
        return ActuaCost;
    }

    public void setActuaCost(String ActuaCost) {
        this.ActuaCost = ActuaCost;
    }

    public String getPlannedValue() {
        return PlannedValue;
    }

    public void setPlannedValue(String PlannedValue) {
        this.PlannedValue = PlannedValue;
    }

    public String getEarnedValue() {
        return EarnedValue;
    }

    public void setEarnedValue(String EarnedValue) {
        this.EarnedValue = EarnedValue;
    }

    public List<TkWsTask> getLstTask() {
        return lstTask;
    }

    public void setLstTask(List<TkWsTask> lstTask) {
        this.lstTask = lstTask;
    }

    public String getLabels() {
        return labels;
    }

    public void setLabels(String labels) {
        this.labels = labels;
    }

    public int getWorkspaceId() {
        return workspaceId;
    }

    public void setWorkspaceId(int workspaceId) {
        this.workspaceId = workspaceId;
    }

    public List<Evm> getLstEvms() {
        return lstEvms;
    }

    public void setLstEvms(List<Evm> lstEvms) {
        this.lstEvms = lstEvms;
    }

    
    
}
