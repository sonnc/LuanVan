/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.kpi;

import app.qlcv.entities.TkUser;
import app.qlcv.utils.SystemMethod;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import app.qlcv.customs.*;
import app.qlcv.entities.*;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;

/**
 *
 * @author sonng
 */
public class AdminKpiAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private AdminKpiController adminController;
    private List<TkUser> lstUsers = new ArrayList<>();
    private TkUser tkUser;
    private List<TkDepartment> lstTkDepartment = new ArrayList<>();
    private List<TkRatingDateSetup> lstTkRatingDateSetup = new ArrayList<>();
    private TkDepartment tkDepartment;
    private File myFile;
    private List<TkKpiTypeSetting> lstKpiTypeSettings;
    private List<TkKpiItemSetting> lsKpiItemSettings = new ArrayList<>();
    private TkRatingDateSetup tkRatingDateSetup = new TkRatingDateSetup();
    private int kpiTypeId;
    private TkKpiTypeSetting kpiTypeSetting = new TkKpiTypeSetting();

    public AdminKpiAction() {
        adminController = new AdminKpiController();
    }

    public String adminKpi() {
        String method = request.getParameter("method");
        Properties prop = (Properties) session.get("properties");
        if ("viewKpi".equals(method)) {
            lstKpiTypeSettings = adminController.getAllKpiTypeSetting();
            return "VIEW_ALL_KPI_SUCCESS";
        } else if ("viewKpiDetail".equals(method)) {
            int kpiId = Integer.parseInt(request.getParameter("kpiId"));
            lsKpiItemSettings = adminController.viewKpiDetail(kpiId);
            kpiTypeId = kpiId;
            return "VIEW_KPI_DETAIL_SUCCESS";
        } else if ("prepareCreateKpi".equals(method)) {
            lstTkDepartment = adminController.getAllDepartments();
            return "PREPARE_CREATE_KPI_SUCCESS";
        } else if ("prepareCreateTimeRating".equals(method)) {
            lstTkRatingDateSetup = adminController.getAllKpiRatingDate();
            return "PREPARE_CREATE_KPI_RATING_DATE";
        } else if ("createTimeRating".equals(method)) {
            TkUser tku = (TkUser) session.get("user");
            SystemMethod sysm = new SystemMethod();
            java.sql.Date sysDate = sysm.getSysDateToSqlDate();

            tkRatingDateSetup.setCreateBy(tku.getLoginId());
            tkRatingDateSetup.setLastUpdateBy(tku.getLoginId());
            tkRatingDateSetup.setCreateDate(sysDate);
            tkRatingDateSetup.setLastUpdateDate(sysDate);
            tkRatingDateSetup.setStatus("ACTIVE");
            adminController.createKpiRatingDate(tkRatingDateSetup);

            lstTkRatingDateSetup = adminController.getAllKpiRatingDate();
            return "CREATE_KPI_RATING_DATE";
        } else if ("createKpi".equals(method)) {
            TkUser tku = (TkUser) session.get("user");
            SystemMethod sysm = new SystemMethod();
            java.sql.Date sysDate = sysm.getSysDateToSqlDate();

            int departementId = Integer.parseInt(request.getParameter("kpiTypeDepartement"));
            int countItemInput = Integer.parseInt(request.getParameter("countItemInput"));

            TkKpiTypeSetting kpiTypeSetting = new TkKpiTypeSetting();
            TkDepartment department = adminController.getDepartmentsByID(departementId);

            kpiTypeSetting.setCreateBy(tku.getLoginId());
            kpiTypeSetting.setLastUpdateBy(tku.getLoginId());
            kpiTypeSetting.setCreateDate(sysDate);
            kpiTypeSetting.setLastUpdateDate(sysDate);
            DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            Date date = new Date();
            String kpiCode = department.getDepartmentCode() + "." + dateFormat.format(date);
            kpiTypeSetting.setKpiName(kpiCode);
            kpiTypeSetting.setKpiDesc(request.getParameter("kpiTypekpiDesc"));
            kpiTypeSetting.setTrongSoKpiPhongban(Double.parseDouble(request.getParameter("kpiTypeTrongSoKpiPhongban")));
            kpiTypeSetting.setTrongSoKpiThuongxuyen(Double.parseDouble(request.getParameter("kpiTypeTrongSoKpiThuongxuyen")));
            kpiTypeSetting.setTrongSoKpiDotxuat(Double.parseDouble(request.getParameter("kpiTypeTrongSoKpiDotxuat")));
            kpiTypeSetting.setStatus("ACTIVE");
            kpiTypeSetting.setApDung(request.getParameter("kpiTypeApDung"));
            kpiTypeSetting.setTkDepartment(department);

            List<TkKpiItemSetting> lstKpiItemSettings = new ArrayList<>();
            for (int i = 0; i < countItemInput; i++) {
                TkKpiItemSetting itemSetting = new TkKpiItemSetting();
                itemSetting.setCreateBy(tku.getLoginId());
                itemSetting.setLastUpdateBy(tku.getLoginId());
                itemSetting.setCreateDate(sysDate);
                itemSetting.setLastUpdateDate(sysDate);
                itemSetting.setStatus("ACTIVE");
                for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "]")) {
                        if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiName]")) {
                            itemSetting.setKpiName(entry.getValue()[0].toString());
                        }
                        if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiDesc]")) {
                            itemSetting.setKpiDesc(entry.getValue()[0].toString());
                        }
                        if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiType]")) {
                            itemSetting.setType(entry.getValue()[0].toString());
                        }
                        if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiIndex]")) {
                            itemSetting.setItem(Double.parseDouble(entry.getValue()[0]));
                        }
                        if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiUnit]")) {
                            itemSetting.setDonViTinh(entry.getValue()[0].toString());
                        }
                        if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiWeight]")) {
                            itemSetting.setTrongSo(Double.parseDouble(entry.getValue()[0].toString()));
                        }
                        if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiFrequene]")) {
                            itemSetting.setTanSuatDanhGia(entry.getValue()[0].toString());
                        }
                    }
                }
                lstKpiItemSettings.add(itemSetting);
            }
            if (!adminController.createGroupKPI(kpiTypeSetting, lstKpiItemSettings)) {
                addActionMessage(prop.getProperty("tk.tko.label.admin.kpi.mess11"));
                return "VIEW_ALL_KPI_SUCCESS";
            }
            lstKpiTypeSettings = adminController.getAllKpiTypeSetting();
            addActionMessage(prop.getProperty("tk.tko.label.admin.kpi.mess10"));
            return "VIEW_ALL_KPI_SUCCESS";
        } else if ("deleteKpi".equals(method)) {
            int kpiId = Integer.parseInt(request.getParameter("kpiId"));
            TkKpiTypeSetting kpiTypeSetting = adminController.getKpiTypeSettingById(kpiId);
            kpiTypeSetting.setStatus("DELETE");
            if (adminController.updateKpiTypeSeting(kpiTypeSetting)) {
                lstKpiTypeSettings = adminController.getAllKpiTypeSetting();
                addActionMessage(prop.getProperty("tk.tko.label.admin.kpi.mess19"));
                return "VIEW_ALL_KPI_SUCCESS";
            }
        }

        return SUCCESS;

    }

    public String prepareEditKpiSetting() {
        int kpiId = Integer.parseInt(request.getParameter("kpiTypeId"));
        String type = request.getParameter("type");
        lsKpiItemSettings = adminController.prepareEditKpiSetting(kpiId, type);
        kpiTypeId = kpiId;
        return SUCCESS;

    }

    public String editKpiSetting() {
        Properties prop = (Properties) session.get("properties");

        int countItemInput = Integer.parseInt(request.getParameter("countItemInput"));

        // lay toan bo kpi tu db
        int kpiId = Integer.parseInt(request.getParameter("kpiTypeId"));
        String type = request.getParameter("type");

        TkKpiTypeSetting kpiTypeSetting = new TkKpiTypeSetting();
        kpiTypeSetting = adminController.getKpiTypeSettingById(kpiId);

        List<TkKpiItemSetting> lstItemSettingsDB = new ArrayList<>();
        lstItemSettingsDB = adminController.prepareEditKpiSetting(kpiId, type);
        // lay toan bo kpi tu man hinh
        List<TkKpiItemSetting> lstItemSettingsForm = new ArrayList<>();
        lstItemSettingsForm = genKpiItemSetting(request.getParameterMap(), countItemInput);
        // kiem tra xem co thay doi gi khong

        HashMap<String, List<TkKpiItemSetting>> hashmap = new HashMap<>();
        hashmap = checkKpiItemSetting(lstItemSettingsDB, lstItemSettingsForm, kpiTypeSetting, type);

        List<TkKpiItemSetting> remove = new ArrayList<>();
        List<TkKpiItemSetting> add = new ArrayList<>();
        List<TkKpiItemSetting> update = new ArrayList<>();

        remove = hashmap.get("REMOVE");
        add = hashmap.get("ADD");
        update = hashmap.get("UPDATE");

        TkUser tku = (TkUser) session.get("user");
        SystemMethod sysm = new SystemMethod();
        java.sql.Date sysDate = sysm.getSysDateToSqlDate();
        adminController.editKpiSetting(add, remove, update, type, kpiId, tku, sysDate);

        lsKpiItemSettings = adminController.viewKpiDetail(kpiId);
        kpiTypeId = kpiId;
        return "VIEW_KPI_DETAIL_SUCCESS";
    }

    public HashMap<String, List<TkKpiItemSetting>> checkKpiItemSetting(List<TkKpiItemSetting> lstItemSettingsDB,
            List<TkKpiItemSetting> lstItemSettingsForm, TkKpiTypeSetting kpiTypeSetting, String type) {
        List<TkKpiItemSetting> lstItemSettings = new ArrayList<>();
        TkUser tku = (TkUser) session.get("user");
        SystemMethod sysm = new SystemMethod();
        java.sql.Date sysDate = sysm.getSysDateToSqlDate();

        List<TkKpiItemSetting> remove = new ArrayList<>();
        List<TkKpiItemSetting> add = new ArrayList<>();
        List<TkKpiItemSetting> update = new ArrayList<>();

        HashMap<Integer, TkKpiItemSetting> hashMapForm = new HashMap<>();
        HashMap<Integer, TkKpiItemSetting> hashMapDB = new HashMap<>();

        for (int i = 0; i < lstItemSettingsForm.size(); i++) {
            TkKpiItemSetting form = lstItemSettingsForm.get(i);
            if (form.getId() > 0) {
                hashMapForm.put(form.getId(), form);
            } else {
                form.setTkKpiTypeSetting(kpiTypeSetting);
                form.setType(type);
                add.add(form);
            }

        }
        for (int i = 0; i < lstItemSettingsDB.size(); i++) {
            TkKpiItemSetting db = lstItemSettingsDB.get(i);
            hashMapDB.put(db.getId(), db);
        }

        for (int i = 0; i < lstItemSettingsForm.size(); i++) {
            TkKpiItemSetting form = lstItemSettingsForm.get(i);
            if (hashMapDB.get(form.getId()) != null) {
                TkKpiItemSetting itemSetting = new TkKpiItemSetting();
                itemSetting = hashMapDB.get(form.getId());
                itemSetting.setLastUpdateBy(tku.getLoginId());
                itemSetting.setLastUpdateDate(sysDate);
                itemSetting.setKpiName(form.getKpiName());
                itemSetting.setKpiDesc(form.getKpiDesc());
                itemSetting.setType(form.getType());
                itemSetting.setItem(form.getItem());
                itemSetting.setDonViTinh(form.getDonViTinh());
                itemSetting.setTrongSo(form.getTrongSo());
                itemSetting.setTanSuatDanhGia(form.getTanSuatDanhGia());
                update.add(itemSetting);
            }
        }

        for (int i = 0; i < lstItemSettingsDB.size(); i++) {
            TkKpiItemSetting db = lstItemSettingsDB.get(i);
            if (hashMapForm.get(db.getId()) == null) {
                db.setStatus("INACTIVE");
                remove.add(db);
            }

        }

        HashMap<String, List<TkKpiItemSetting>> hashmap = new HashMap<>();
        hashmap.put("ADD", add);
        hashmap.put("REMOVE", remove);
        hashmap.put("UPDATE", update);

        return hashmap;

    }

    public List<TkKpiItemSetting> genKpiItemSetting(Map<String, String[]> map, int countItemInput) {
        List<TkKpiItemSetting> lstItemSettings = new ArrayList<>();
        TkUser tku = (TkUser) session.get("user");
        SystemMethod sysm = new SystemMethod();
        java.sql.Date sysDate = sysm.getSysDateToSqlDate();
        for (int i = 0; i < countItemInput; i++) {
            TkKpiItemSetting itemSetting = new TkKpiItemSetting();
            itemSetting.setCreateBy(tku.getLoginId());
            itemSetting.setLastUpdateBy(tku.getLoginId());
            itemSetting.setCreateDate(sysDate);
            itemSetting.setLastUpdateDate(sysDate);
            itemSetting.setStatus("ACTIVE");
            for (Map.Entry<String, String[]> entry : map.entrySet()) {
                if (entry.getKey().toString().contains("lstKpiDetail[" + i + "]")) {
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][kpiItemId]")) {
                        itemSetting.setId(entry.getValue()[0] != null && !"".equals(entry.getValue()[0])
                                ? Integer.parseInt(entry.getValue()[0]) : 0);
                    }
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiName]")) {
                        itemSetting.setKpiName(entry.getValue()[0].toString());
                    }
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiDesc]")) {
                        itemSetting.setKpiDesc(entry.getValue()[0].toString());
                    }
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiType]")) {
                        itemSetting.setType(entry.getValue()[0].toString());
                    }
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiIndex]")) {
                        itemSetting.setItem(Double.parseDouble(entry.getValue()[0]));
                    }
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiUnit]")) {
                        itemSetting.setDonViTinh(entry.getValue()[0].toString());
                    }
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiWeight]")) {
                        itemSetting.setTrongSo(Double.parseDouble(entry.getValue()[0].toString()));
                    }
                    if (entry.getKey().toString().contains("lstKpiDetail[" + i + "][tkKpiDetailKpiFrequene]")) {
                        itemSetting.setTanSuatDanhGia(entry.getValue()[0].toString());
                    }
                }
            }
            lstItemSettings.add(itemSetting);
        }

        return lstItemSettings;
    }

    public String editWeightKpiTypeSetting() {
        int kpiType = Integer.parseInt(request.getParameter("kpiTypeId"));
        TkKpiTypeSetting kpiTypeSetting = new TkKpiTypeSetting();
        kpiTypeSetting = adminController.getKpiTypeSettingById(kpiType);
        String tkKpiDetailKpiName = request.getParameter("tkKpiDetailKpiName");
        String tkKpiDetailKpiDesc = request.getParameter("tkKpiDetailKpiDesc");
        double trongSoKpiPhongban = Double.parseDouble(request.getParameter("trongSoKpiPhongban"));
        double trongSoKpiThuongxuyen = Double.parseDouble(request.getParameter("trongSoKpiThuongxuyen"));
        double trongSoKpiDotxuat = Double.parseDouble(request.getParameter("trongSoKpiDotxuat"));
        kpiTypeSetting.setKpiName(tkKpiDetailKpiName);
        kpiTypeSetting.setKpiDesc(tkKpiDetailKpiDesc);
        kpiTypeSetting.setTrongSoKpiPhongban(trongSoKpiPhongban);
        kpiTypeSetting.setTrongSoKpiThuongxuyen(trongSoKpiThuongxuyen);
        kpiTypeSetting.setTrongSoKpiDotxuat(trongSoKpiDotxuat);
        adminController.editWeightKpiTypeSetting(kpiTypeSetting);
        lstKpiTypeSettings = adminController.getAllKpiTypeSetting();
        return "VIEW_ALL_KPI_SUCCESS";
    }

    public String prepareEditEditWeightKpiTypeSetting() {
        int kpiType = Integer.parseInt(request.getParameter("kpiId"));
        kpiTypeSetting = adminController.getKpiTypeSettingById(kpiType);
        return SUCCESS;
    }

    public File getMyFile() {
        return myFile;
    }

    public void setMyFile(File myFile) {
        this.myFile = myFile;
    }

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

    public List<TkUser> getLstUsers() {
        return lstUsers;
    }

    public void setLstUsers(List<TkUser> lstUsers) {
        this.lstUsers = lstUsers;
    }

    public TkUser getTkUser() {
        return tkUser;
    }

    public void setTkUser(TkUser tkUser) {
        this.tkUser = tkUser;
    }

    public List<TkDepartment> getLstTkDepartment() {
        return lstTkDepartment;
    }

    public void setLstTkDepartment(List<TkDepartment> lstTkDepartment) {
        this.lstTkDepartment = lstTkDepartment;
    }

    public List<TkRatingDateSetup> getLstTkRatingDateSetup() {
        return lstTkRatingDateSetup;
    }

    public void setLstTkRatingDateSetup(List<TkRatingDateSetup> lstTkRatingDateSetup) {
        this.lstTkRatingDateSetup = lstTkRatingDateSetup;
    }

    public TkDepartment getTkDepartment() {
        return tkDepartment;
    }

    public void setTkDepartment(TkDepartment tkDepartment) {
        this.tkDepartment = tkDepartment;
    }

    public List<TkKpiTypeSetting> getLstKpiTypeSettings() {
        return lstKpiTypeSettings;
    }

    public void setLstKpiTypeSettings(List<TkKpiTypeSetting> lstKpiTypeSettings) {
        this.lstKpiTypeSettings = lstKpiTypeSettings;
    }

    public List<TkKpiItemSetting> getLsKpiItemSettings() {
        return lsKpiItemSettings;
    }

    public void setLsKpiItemSettings(List<TkKpiItemSetting> lsKpiItemSettings) {
        this.lsKpiItemSettings = lsKpiItemSettings;
    }

    public TkRatingDateSetup getTkRatingDateSetup() {
        return tkRatingDateSetup;
    }

    public void setTkRatingDateSetup(TkRatingDateSetup tkRatingDateSetup) {
        this.tkRatingDateSetup = tkRatingDateSetup;
    }

    public int getKpiTypeId() {
        return kpiTypeId;
    }

    public void setKpiTypeId(int kpiTypeId) {
        this.kpiTypeId = kpiTypeId;
    }

    public TkKpiTypeSetting getKpiTypeSetting() {
        return kpiTypeSetting;
    }

    public void setKpiTypeSetting(TkKpiTypeSetting kpiTypeSetting) {
        this.kpiTypeSetting = kpiTypeSetting;
    }

}
