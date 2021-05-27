/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.kpi;

import com.opensymphony.xwork2.ActionSupport;
import app.qlcv.entities.TkKpiItem;
import app.qlcv.entities.TkKpiItemDetail;
import app.qlcv.entities.TkKpiItemDetailRating;
import app.qlcv.entities.TkKpiItemSetting;
import app.qlcv.entities.TkKpiTypeSetting;
import app.qlcv.entities.TkKpiTypeSetting;
import app.qlcv.entities.TkRatingDateSetup;
import app.qlcv.entities.TkUser;
import app.qlcv.customs.ListCustom;
import app.qlcv.customs.UserKpiMapper;
import app.qlcv.utils.SystemMethod;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import static jdk.nashorn.internal.objects.NativeMath.round;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.collection.internal.PersistentSet;

/**
 *
 * @author sonng
 */
public class KpiAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private KpiController kpiController;
    private List<TkKpiTypeSetting> lstKpiTypeSettings;
    private List<TkKpiItemSetting> lsKpiItemSettings;
    private List<UserKpiMapper> lstUserKpiMappers;
    private TkUser tkUser;

    private List<TkKpiItemDetail> lstTkKpiItemDetailPhongBan = new ArrayList<>();
    private List<TkKpiItemDetail> lstTkKpiItemDetailThuongXuyen = new ArrayList<>();
    private List<TkKpiItemDetail> lstTkKpiItemDetailDotXuat = new ArrayList<>();
    private List<TkKpiItemDetail> lstTkKpiItemDetailTOTAL = new ArrayList<>();
    private List<TkKpiItemDetail> lstTkKpiItemRating = new ArrayList<>();
    private List<TkKpiItemDetailRating> lstTkKpiItemDetailRatings = new ArrayList<>();
    private int kpiTypeId;

    public KpiAction() {
        kpiController = new KpiController();
    }

    public String viewKpiOfDepartement() {
        TkUser tkUser = (TkUser) session.get("user");
        int phongBan = tkUser.getTkDepartment().getId();
        lstKpiTypeSettings = kpiController.viewKpiOfDepartement(phongBan);
        return SUCCESS;
    }

    public String viewKpiDetail() {
        int id = Integer.parseInt(request.getParameter("id"));
        lsKpiItemSettings = kpiController.viewKpiDetail(id);
        kpiTypeId = id;
        return SUCCESS;
    }

    public String getAllStaffKpi() {
        TkUser tkUser = (TkUser) session.get("user");
        int phongBan = tkUser.getTkDepartment().getId();
        int year = Integer.parseInt(request.getParameter("kpiYear"));
        lstUserKpiMappers = kpiController.getAllStaffKpi(phongBan, year);
        return SUCCESS;
    }

    public String kpiUser() {
        int year = Integer.parseInt(request.getParameter("kpiYear"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String method = request.getParameter("method");
        if (method != null && method.equals("prepareCreate")) {
            TkUser tk = (TkUser) session.get("user");
            int phongBan = tk.getTkDepartment().getId();
            tkUser = kpiController.getUserInfo(userId);
            lstKpiTypeSettings = kpiController.viewKpiOfDepartement(phongBan);
        } else if (method != null && method.equals("create")) {
            int chooseKpiForStaff = Integer.parseInt(request.getParameter("chooseKpiForStaff"));
            TkKpiTypeSetting kpiTypeSetting = kpiController.getKpiById(chooseKpiForStaff);
            TkUser tkCreate = (TkUser) session.get("user");
            TkUser tkStaff = kpiController.getUserInfo(userId);

            HashSet<TkKpiItemSetting> hset = new HashSet<TkKpiItemSetting>(kpiTypeSetting.getTkKpiItemSettings());

            List<TkKpiItemSetting> lstTkKpiItemSettings = new ArrayList<TkKpiItemSetting>(hset);

            SystemMethod sysm = new SystemMethod();
            java.sql.Date sysDate = sysm.getSysDateToSqlDate();

            int count = 0;
            boolean isPB = false;
            boolean isTX = false;
            boolean isDX = false;
            if (kpiTypeSetting.getTrongSoKpiPhongban() != null || kpiTypeSetting.getTrongSoKpiPhongban() > 0) {
                count = count + 1;
                isPB = true;
            }
            if (kpiTypeSetting.getTrongSoKpiThuongxuyen() != null || kpiTypeSetting.getTrongSoKpiThuongxuyen() > 0) {
                count = count + 1;
                isTX = true;
            }
            if (kpiTypeSetting.getTrongSoKpiDotxuat() != null || kpiTypeSetting.getTrongSoKpiDotxuat() > 0) {
                count = count + 1;
                isDX = true;
            }

            List<TkKpiItem> lstTkKpiItems = new ArrayList<>();
            List<TkKpiItemDetail> lstTkKpiItemDetailPhongBan = new ArrayList<>();
            List<TkKpiItemDetail> lstTkKpiItemDetailThuongXuyen = new ArrayList<>();
            List<TkKpiItemDetail> lstTkKpiItemDetailDotXuat = new ArrayList<>();

            // KHOI TAO 3 KPI: BO PHAN/ THUONG XUYEN/ DOT XUAT
            for (int i = 0; i < count; i++) {
                TkKpiItem tkKpiItem = new TkKpiItem();
                tkKpiItem.setTkUser(tkStaff);
                tkKpiItem.setCreateBy(tkCreate.getLoginId());
                tkKpiItem.setLastUpdateBy(tkCreate.getLoginId());
                tkKpiItem.setCreateDate(sysDate);
                tkKpiItem.setLastUpdateDate(sysDate);
                tkKpiItem.setKpiYear(year);
                tkKpiItem.setRefId(kpiTypeSetting.getId());
                if (isPB) {
                    tkKpiItem.setStatus("ACTIVE");
                    tkKpiItem.setKpiItem("BO_PHAN");
                    tkKpiItem.setMucTieu("KPI GAN VOI BO PHAN");
                    tkKpiItem.setTrongSo(kpiTypeSetting.getTrongSoKpiPhongban());
                    isPB = false;
                } else if (isTX) {
                    tkKpiItem.setStatus("ACTIVE");
                    tkKpiItem.setKpiItem("THUONG_XUYEN");
                    tkKpiItem.setMucTieu("KPI THUONG XUYEN");
                    tkKpiItem.setTrongSo(kpiTypeSetting.getTrongSoKpiThuongxuyen());
                    isTX = false;
                } else if (isDX) {
                    tkKpiItem.setStatus("ACTIVE");
                    tkKpiItem.setKpiItem("DOT_XUAT");
                    tkKpiItem.setMucTieu("KPI CONG VIEC DOT XUAT");
                    tkKpiItem.setTrongSo(kpiTypeSetting.getTrongSoKpiDotxuat());
                    isDX = false;
                }
                lstTkKpiItems.add(tkKpiItem);
            }

            // KHOI TAO CAC KPI ITEM THEO 3 KPI TREN
            for (int j = 0; j < lstTkKpiItemSettings.size(); j++) {
                TkKpiItemDetail tkKpiItemDetail = new TkKpiItemDetail();
                tkKpiItemDetail.setCreateBy(tkCreate.getLoginId());
                tkKpiItemDetail.setLastUpdateBy(tkCreate.getLoginId());
                tkKpiItemDetail.setCreateDate(sysDate);
                tkKpiItemDetail.setLastUpdateDate(sysDate);
                tkKpiItemDetail.setKpiName(lstTkKpiItemSettings.get(j).getKpiName());
                tkKpiItemDetail.setKpiDesc(lstTkKpiItemSettings.get(j).getKpiDesc());
                tkKpiItemDetail.setItem(lstTkKpiItemSettings.get(j).getItem());
                tkKpiItemDetail.setDonViTinh(lstTkKpiItemSettings.get(j).getDonViTinh());
                tkKpiItemDetail.setTanSuatDanhGia(lstTkKpiItemSettings.get(j).getTanSuatDanhGia());
                tkKpiItemDetail.setTrongSo(lstTkKpiItemSettings.get(j).getTrongSo());
                tkKpiItemDetail.setStatus("ACTIVE");
                tkKpiItemDetail.setRefId(lstTkKpiItemSettings.get(j).getId());
                if ("BO_PHAN".equals(lstTkKpiItemSettings.get(j).getType())) {
                    lstTkKpiItemDetailPhongBan.add(tkKpiItemDetail);
                    continue;
                } else if ("THUONG_XUYEN".equals(lstTkKpiItemSettings.get(j).getType())) {
                    lstTkKpiItemDetailThuongXuyen.add(tkKpiItemDetail);
                    continue;
                } else if ("DOT_XUAT".equals(lstTkKpiItemSettings.get(j).getType())) {
                    lstTkKpiItemDetailDotXuat.add(tkKpiItemDetail);
                    continue;
                }
            }

            // LUU XUONG DB
            if (kpiController.createKpiForStaff(lstTkKpiItems, lstTkKpiItemDetailPhongBan, lstTkKpiItemDetailThuongXuyen, lstTkKpiItemDetailDotXuat)) {
                getAllStaffKpi();
                Properties prop = (Properties) session.get("properties");
                addActionMessage(prop.getProperty("tk.tko.label.kpi.create.mess9"));
                return "CREATE_KPI_STAFF_SUCCESS";
            } else {
                return ERROR;
            }
        } else if (method != null && method.equals("view")) {
            viewKpi(userId, year);
            return "VIEW_KPI_STAFF_SUCCESS";
        } else if (method != null && method.equals("viewMyKpi")) {
            TkUser tkUser = (TkUser) session.get("user");
            viewKpi(tkUser.getId(), year);
            return "VIEW_MY_KPI_SUCCESS";
        } else if (method != null && method.equals("getRatingKpi")) {
            TkUser tkUser = (TkUser) session.get("user");
            List<TkKpiItemDetail> lst = new ArrayList<>();
            lst = mergeKpiItemDetai(tkUser.getId(), year);
            getAllKpiRated(lst);
            prepareRatingKpi(lst);
            return "GET_RATING_KPI_SUCCESS";
        } else if (method != null && method.equals("sendRatingKpi")) {
            SystemMethod sysm = new SystemMethod();
            java.sql.Date sysDate = sysm.getSysDateToSqlDate();
            TkUser tkCreate = (TkUser) session.get("user");

            Date date = new Date();
            LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            int month = localDate.getMonthValue();
            int quater = 0;
            if (month == 3) {
                quater = 1;
            } else if (month == 6) {
                quater = 2;
            } else if (month == 9) {
                quater = 3;
            } else if (month == 12) {
                quater = 4;
            }

            List<TkKpiItemDetailRating> lstKpiItemDetailRatings = new ArrayList<>();
            for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                if (entry.getKey().toString().contains("ratingKpiInput") && (entry.getValue()[0].toString() != null && !"".equals(entry.getValue()[0].toString()))) {
                    int id = Integer.parseInt(entry.getKey().toString().replaceAll("ratingKpiInput", ""));
                    double key = Double.parseDouble(entry.getValue()[0].toString());

                    TkKpiItemDetail kpiItemDetail = kpiController.getKpiItemDetailById(id);
                    TkKpiItemDetailRating rating = new TkKpiItemDetailRating();
                    rating.setCreateBy(tkCreate.getLoginId());
                    rating.setLastUpdateBy(tkCreate.getLoginId());
                    rating.setCreateDate(sysDate);
                    rating.setLastUpdateDate(sysDate);
                    rating.setTkKpiItemDetail(kpiItemDetail);
                    if ("MONTH".equals(kpiItemDetail.getTanSuatDanhGia())) {
                        rating.setMonth(month);
                        rating.setYear(year);
                    } else if ("YEAR".equals(kpiItemDetail.getTanSuatDanhGia())) {
                        rating.setYear(year);
                    } else if ("QUATER".equals(kpiItemDetail.getTanSuatDanhGia())) {
                        rating.setQuater(quater);
                        rating.setYear(year);
                    }
                    rating.setTrongSo(kpiItemDetail.getTrongSo());
                    double tlth = (double) Math.round(((key / kpiItemDetail.getItem()) * 100) * 100) / 100;
                    tlth = (tlth * kpiItemDetail.getTrongSo()) / 100;
                    rating.setTyLeThucHien(tlth);
                    rating.setKetQuaThucHien(key);
                    rating.setStatus("PENDING_APPROVED");
                    lstKpiItemDetailRatings.add(rating);
                }
            }
            if (kpiController.saveKpiItemDetailRating(lstKpiItemDetailRatings)) {
                List<TkKpiItemDetail> lst = new ArrayList<>();
                lst = mergeKpiItemDetai(tkCreate.getId(), year);
                getAllKpiRated(lst);
                prepareRatingKpi(lst);
                Properties prop = (Properties) session.get("properties");
                addActionMessage(prop.getProperty("tk.tko.label.kpi.rating.mess9"));
                return "SEND_RATING_KPI_SUCCESS";
            } else {
                return "SEND_RATING_KPI_ERROR";
            }
        } else if (method != null && method.equals("prepareApprovedRating")) {
            List<TkKpiItemDetail> lst = new ArrayList<>();
            lst = mergeKpiItemDetai(userId, year);
            getAllKpiPendingApproved(lst);
            return "GET_RATING_KPI_STAFF_SUCCESS";
        } else if (method != null && method.equals("ratingKpiStaff")) {

            for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                if (entry.getKey().toString().contains("checkRatingForStaff") && (entry.getValue()[0].toString() != null && !"".equals(entry.getValue()[0].toString()))) {
                    int id = Integer.parseInt(entry.getKey().toString().replaceAll("checkRatingForStaff", ""));
                    int key = Integer.parseInt(entry.getValue()[0].toString());
                    TkKpiItemDetailRating rating = kpiController.getKpiItemDetailRatingById(id);
                    TkKpiItemDetail detail = kpiController.getKpiItemDetailById(rating.getTkKpiItemDetail().getId());

                    if (key == 0) {
                        rating.setStatus("REJECT");
                    } else if (key == 1) {
                        rating.setStatus("APPROVED");

                        List<TkKpiItemDetailRating> lstDetails
                                = kpiController.getListKpiItemDetailRatingById(rating.getTkKpiItemDetail().getId(), "APPROVED");
                        double tbTyLeThucHien = rating.getTyLeThucHien();
                        double tbketQuaThucHien = rating.getKetQuaThucHien();
                        int count = 1 + lstDetails.size();
                        for (int i = 0; i < lstDetails.size(); i++) {
                            tbTyLeThucHien = tbTyLeThucHien + lstDetails.get(i).getTyLeThucHien();
                            tbketQuaThucHien = tbketQuaThucHien + lstDetails.get(i).getKetQuaThucHien();
                        }
                        tbTyLeThucHien = (double) Math.round(((tbTyLeThucHien / count) * 100) / 100);
                        tbketQuaThucHien = (double) Math.round(((tbketQuaThucHien / count) * 100) / 100);

                        detail.setTyLeThucHien(tbTyLeThucHien);
                        detail.setKetQuaThucHien(tbketQuaThucHien);
                    }
                    if (!kpiController.updateKpiRating(key, detail, rating)) {
                        return ERROR;
                    }
                }
            }
            Properties prop = (Properties) session.get("properties");
            addActionMessage(prop.getProperty("tk.tko.label.kpi.rating1.mess9"));
            return "UPDATE_KPI_STAFF_SUCCESS";
        }

        return SUCCESS;
    }

    public List<TkKpiItemDetail> mergeKpiItemDetai(int userId, int year) {
        viewKpi(userId, year);

        List<TkKpiItemDetail> lstTkKpiItem = new ArrayList<>();
        lstTkKpiItem.addAll(lstTkKpiItemDetailPhongBan);
        lstTkKpiItem.addAll(lstTkKpiItemDetailThuongXuyen);
        lstTkKpiItem.addAll(lstTkKpiItemDetailDotXuat);
        return lstTkKpiItem;
    }

    public void viewKpi(int userId, int year) {
        List<TkKpiItem> lstTkKpiItems = kpiController.getKpiForStaffById(userId, year);

        double totalSum = 0;
        double totalBP = 0;
        double totalTX = 0;
        double totalDX = 0;
        DecimalFormat df2 = new DecimalFormat("#.##");

        for (int i = 0; i < lstTkKpiItems.size(); i++) {
            TkKpiItemDetail tkKpiItemDetail = new TkKpiItemDetail();
            tkKpiItemDetail.setKpiName(lstTkKpiItems.get(i).getKpiItem());
            tkKpiItemDetail.setKpiDesc(lstTkKpiItems.get(i).getMucTieu());
            tkKpiItemDetail.setTrongSo(lstTkKpiItems.get(i).getTrongSo());
            tkKpiItemDetail.setTyLeThucHien(lstTkKpiItems.get(i).getTyLeThucHien());
            tkKpiItemDetail.setKetQuaThucHien(lstTkKpiItems.get(i).getKetQua());
            if ("BO_PHAN".equals(lstTkKpiItems.get(i).getKpiItem())) {
                HashSet<TkKpiItemDetail> hset = new HashSet<TkKpiItemDetail>(lstTkKpiItems.get(i).getTkKpiItemDetails());
                List<TkKpiItemDetail> lstTkKpiItemSettings = new ArrayList<TkKpiItemDetail>(hset);
                double total = 0;
                for (int j = 0; j < lstTkKpiItemSettings.size(); j++) {
                    double tyLe = 0;
                    if (lstTkKpiItemSettings.get(j).getTyLeThucHien() != null) {
                        tyLe = lstTkKpiItemSettings.get(j).getTyLeThucHien();
                    }
                    total = total + tyLe;
                }
                String t = df2.format(total);
                total = Double.parseDouble(t);

                totalBP = (total * lstTkKpiItems.get(i).getTrongSo()) / 100;

                String tt = df2.format(totalBP);
                totalBP = Double.parseDouble(tt);
                
                tkKpiItemDetail.setTyLeThucHien(total);

                lstTkKpiItemDetailPhongBan.add(tkKpiItemDetail);
                lstTkKpiItemDetailPhongBan.addAll(hset);
            } else if ("THUONG_XUYEN".equals(lstTkKpiItems.get(i).getKpiItem())) {
                HashSet<TkKpiItemDetail> hset = new HashSet<TkKpiItemDetail>(lstTkKpiItems.get(i).getTkKpiItemDetails());
                List<TkKpiItemDetail> lstTkKpiItemSettings = new ArrayList<TkKpiItemDetail>(hset);
                double total = 0;
                for (int j = 0; j < lstTkKpiItemSettings.size(); j++) {
                    double tyLe = 0;
                    if (lstTkKpiItemSettings.get(j).getTyLeThucHien() != null) {
                        tyLe = lstTkKpiItemSettings.get(j).getTyLeThucHien();
                    }
                    total = total + tyLe;
                }
                String t = df2.format(total);
                total = Double.parseDouble(t);
                totalTX = (total * lstTkKpiItems.get(i).getTrongSo()) / 100;
                tkKpiItemDetail.setTyLeThucHien(total);

                String tt = df2.format(totalTX);
                totalTX = Double.parseDouble(tt);
                
                lstTkKpiItemDetailThuongXuyen.add(tkKpiItemDetail);
                lstTkKpiItemDetailThuongXuyen.addAll(hset);
            } else if ("DOT_XUAT".equals(lstTkKpiItems.get(i).getKpiItem())) {
                HashSet<TkKpiItemDetail> hset = new HashSet<TkKpiItemDetail>(lstTkKpiItems.get(i).getTkKpiItemDetails());
                List<TkKpiItemDetail> lstTkKpiItemSettings = new ArrayList<TkKpiItemDetail>(hset);
                double total = 0;
                for (int j = 0; j < lstTkKpiItemSettings.size(); j++) {
                    double tyLe = 0;
                    if (lstTkKpiItemSettings.get(j).getTyLeThucHien() != null) {
                        tyLe = lstTkKpiItemSettings.get(j).getTyLeThucHien();
                    }
                    total = total + tyLe;
                }
                String t = df2.format(total);
                total = Double.parseDouble(t);

                totalDX = (total * lstTkKpiItems.get(i).getTrongSo()) / 100;
                tkKpiItemDetail.setTyLeThucHien(total);

                String tt = df2.format(totalDX);
                totalDX = Double.parseDouble(tt);
                
                lstTkKpiItemDetailDotXuat.add(tkKpiItemDetail);
                lstTkKpiItemDetailDotXuat.addAll(hset);
            }
        }
        TkKpiItemDetail tkKpiItemDetail = new TkKpiItemDetail();
        tkKpiItemDetail.setKpiName("KET_QUA_THUC_HIEN_KPI");
        tkKpiItemDetail.setTrongSo(100.0);

        System.out.println("lstTkKpiItemDetailPhongBan = " + lstTkKpiItemDetailPhongBan.size());
        totalSum = totalBP + totalTX + totalDX;
        tkKpiItemDetail.setTyLeThucHien(totalSum);
        lstTkKpiItemDetailTOTAL.add(tkKpiItemDetail);
    }

    public void prepareRatingKpi(List<TkKpiItemDetail> lstTkKpiItem) {

        // neu month thi kiem tra 
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int month = localDate.getMonthValue();
        int day = localDate.getDayOfMonth();

        TkRatingDateSetup tkRatingDateSetup = new TkRatingDateSetup();
        tkRatingDateSetup = kpiController.getListTimeDateRating();

        if (day > tkRatingDateSetup.getRatingStart() && day <= tkRatingDateSetup.getRatingEnd()) {
            for (int i = 0; i < lstTkKpiItem.size(); i++) {
                boolean isPendingApproved = false;
                HashSet<TkKpiItemDetailRating> hset = new HashSet<TkKpiItemDetailRating>(lstTkKpiItem.get(i).getTkKpiItemDetailRatings());
                List<TkKpiItemDetailRating> lst = new ArrayList<TkKpiItemDetailRating>(hset);
                for (int j = 0; j < lst.size(); j++) {
                    if ("PENDING_APPROVED".equals(lst.get(j).getStatus())
                            || "APPROVED".equals(lst.get(j).getStatus())) {
                        isPendingApproved = true;
                        break;
                    }
                }
                if (isPendingApproved) {
                    continue;
                }
                if ("MONTH".equals(lstTkKpiItem.get(i).getTanSuatDanhGia())) {
                    lstTkKpiItemRating.add((TkKpiItemDetail) lstTkKpiItem.get(i));
                }
                if (month == 12 && "YEAR".equals(lstTkKpiItem.get(i).getTanSuatDanhGia())) {
                    lstTkKpiItemRating.add((TkKpiItemDetail) lstTkKpiItem.get(i));
                }
                if ((month == 12 || month == 9 || month == 6 || month == 3) && "QUATER".equals(lstTkKpiItem.get(i).getTanSuatDanhGia())) {
                    lstTkKpiItemRating.add((TkKpiItemDetail) lstTkKpiItem.get(i));
                }
            }
        }
    }

    public void getAllKpiRated(List<TkKpiItemDetail> lstTkKpiItem) {

        for (int i = 0; i < lstTkKpiItem.size(); i++) {
            if (lstTkKpiItem.get(i).getTkKpiItemDetailRatings().size() > 0) {
                HashSet<TkKpiItemDetailRating> hset = new HashSet<TkKpiItemDetailRating>(lstTkKpiItem.get(i).getTkKpiItemDetailRatings());
                List<TkKpiItemDetailRating> l = new ArrayList<TkKpiItemDetailRating>(hset);
                for (int j = 0; j < l.size(); j++) {
                    l.get(j).setKpiDetailRatingName(lstTkKpiItem.get(i).getKpiName());
                    l.get(j).setKpiItem(lstTkKpiItem.get(i).getItem());
                }
                lstTkKpiItemDetailRatings.addAll(l);
            }

        }
    }

    public void getAllKpiPendingApproved(List<TkKpiItemDetail> lstTkKpiItem) {

        for (int i = 0; i < lstTkKpiItem.size(); i++) {
            if (lstTkKpiItem.get(i).getTkKpiItemDetailRatings().size() > 0) {
                HashSet<TkKpiItemDetailRating> hset = new HashSet<TkKpiItemDetailRating>(lstTkKpiItem.get(i).getTkKpiItemDetailRatings());
                List<TkKpiItemDetailRating> l = new ArrayList<TkKpiItemDetailRating>(hset);
                for (int j = 0; j < l.size(); j++) {
                    l.get(j).setKpiDetailRatingName(lstTkKpiItem.get(i).getKpiName());
                    l.get(j).setKpiItem(lstTkKpiItem.get(i).getItem());
                }
                for (int j = 0; j < l.size(); j++) {
                    TkKpiItemDetailRating get = l.get(j);
                    if ("PENDING_APPROVED".equals(get.getStatus())) {
                        lstTkKpiItemDetailRatings.add(get);
                    }
                }

            }

        }
    }

    public void getKpiPendingApprovedByUser() {
    }

    public List<TkKpiItemDetailRating> getLstTkKpiItemDetailRatings() {
        return lstTkKpiItemDetailRatings;
    }

    public void setLstTkKpiItemDetailRatings(List<TkKpiItemDetailRating> lstTkKpiItemDetailRatings) {
        this.lstTkKpiItemDetailRatings = lstTkKpiItemDetailRatings;
    }

    public List<TkKpiItemDetail> getLstTkKpiItemRating() {
        return lstTkKpiItemRating;
    }

    public void setLstTkKpiItemRating(List<TkKpiItemDetail> lstTkKpiItemRating) {
        this.lstTkKpiItemRating = lstTkKpiItemRating;
    }

    public List<TkKpiItemDetail> getLstTkKpiItemDetailTOTAL() {
        return lstTkKpiItemDetailTOTAL;
    }

    public void setLstTkKpiItemDetailTOTAL(List<TkKpiItemDetail> lstTkKpiItemDetailTOTAL) {
        this.lstTkKpiItemDetailTOTAL = lstTkKpiItemDetailTOTAL;
    }

    public List<TkKpiItemDetail> getLstTkKpiItemDetailPhongBan() {
        return lstTkKpiItemDetailPhongBan;
    }

    public void setLstTkKpiItemDetailPhongBan(List<TkKpiItemDetail> lstTkKpiItemDetailPhongBan) {
        this.lstTkKpiItemDetailPhongBan = lstTkKpiItemDetailPhongBan;
    }

    public List<TkKpiItemDetail> getLstTkKpiItemDetailThuongXuyen() {
        return lstTkKpiItemDetailThuongXuyen;
    }

    public void setLstTkKpiItemDetailThuongXuyen(List<TkKpiItemDetail> lstTkKpiItemDetailThuongXuyen) {
        this.lstTkKpiItemDetailThuongXuyen = lstTkKpiItemDetailThuongXuyen;
    }

    public List<TkKpiItemDetail> getLstTkKpiItemDetailDotXuat() {
        return lstTkKpiItemDetailDotXuat;
    }

    public void setLstTkKpiItemDetailDotXuat(List<TkKpiItemDetail> lstTkKpiItemDetailDotXuat) {
        this.lstTkKpiItemDetailDotXuat = lstTkKpiItemDetailDotXuat;
    }

    public TkUser getTkUser() {
        return tkUser;
    }

    public void setTkUser(TkUser tkUser) {
        this.tkUser = tkUser;
    }

    public List<UserKpiMapper> getLstUserKpiMappers() {
        return lstUserKpiMappers;
    }

    public void setLstUserKpiMappers(List<UserKpiMapper> lstUserKpiMappers) {
        this.lstUserKpiMappers = lstUserKpiMappers;
    }

    public List<TkKpiItemSetting> getLsKpiItemSettings() {
        return lsKpiItemSettings;
    }

    public void setLsKpiItemSettings(List<TkKpiItemSetting> lsKpiItemSettings) {
        this.lsKpiItemSettings = lsKpiItemSettings;
    }

    public KpiController getKpiController() {
        return kpiController;
    }

    public List<TkKpiTypeSetting> getLstKpiTypeSettings() {
        return lstKpiTypeSettings;
    }

    public void setLstKpiTypeSettings(List<TkKpiTypeSetting> lstKpiTypeSettings) {
        this.lstKpiTypeSettings = lstKpiTypeSettings;
    }

    public void setKpiController(KpiController kpiController) {
        this.kpiController = kpiController;
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

    public int getKpiTypeId() {
        return kpiTypeId;
    }

    public void setKpiTypeId(int kpiTypeId) {
        this.kpiTypeId = kpiTypeId;
    }

}
