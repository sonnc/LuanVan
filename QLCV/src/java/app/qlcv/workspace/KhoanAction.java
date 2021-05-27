/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.LuongKhoanCustom;
import app.qlcv.customs.LuongKhoanTotal;
import app.qlcv.customs.Milestone;
import app.qlcv.customs.TienKhoanTheoThang;
import app.qlcv.customs.TkWsTaskCustom;
import app.qlcv.entities.Formula;
import app.qlcv.entities.LuongKhoan;
import app.qlcv.entities.ParameterSetup;
import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsTask;
import app.qlcv.sys.CaculationFormula;
import app.qlcv.sys.CalculationFormulaController;
import app.qlcv.utils.SystemMethod;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class KhoanAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private String errorCode;
    private SystemMethod systemMethod;
    private TaskListController taskListController;
    private TaskController tasktController;
    private WorkspaceController workspaceController;
    private KhoanController luongKhoanController;
    private TkWsTask task;
    private List<TkWsTask> lstTask = new ArrayList<>();
    private List<TkWsTaskCustom> lstTaskCustoms = new ArrayList<>();
    private TkWorkspace workspace;
    private List<LuongKhoanCustom> lstLuongKhoans = new ArrayList<>();
    private LuongKhoanTotal luongKhoanTotal;
    private LuongKhoanTotal luongKhoanTotal2;
    private List<Formula> lstFormula = new ArrayList<>();
    private CalculationFormulaController calculationFormulaController;

    public KhoanAction() {
        taskListController = new TaskListController();
        tasktController = new TaskController();
        systemMethod = new SystemMethod();
        workspaceController = new WorkspaceController();
        luongKhoanController = new KhoanController();
        calculationFormulaController = new CalculationFormulaController();
    }
///

    public String getThemisByUserId() {
        TkUser user = (TkUser) session.get("user");

        //lay du lieu khoan
        List<LuongKhoan> lstLuongKhoan = new ArrayList<>();
        lstLuongKhoan = luongKhoanController.getLuongKhoanByUserId(user.getId());

        for (int i = 0; i < lstLuongKhoan.size(); i++) {
            LuongKhoan get = lstLuongKhoan.get(i);
            LuongKhoanCustom custom = new LuongKhoanCustom();
            custom.setCreateBy(get.getCreateBy());
            custom.setCreateDate(get.getCreateDate());
            custom.setId(get.getId());
            custom.setLastUpdateBy(get.getLastUpdateBy());
            custom.setLastUpdateDate(get.getLastUpdateDate());
            custom.setLoaiKhoan(get.getLoaiKhoan());
            custom.setLuongKhoan(get.getLuongKhoan());
            TkUser u = taskListController.getUserById(get.getPheDuyet());
            custom.setPheDuyet(u);
            custom.setThang(get.getThang());
            custom.setUserId(user);
            lstLuongKhoans.add(custom);
        }

        BigDecimal totalKhoanCV = BigDecimal.ZERO;
        BigDecimal totalKhoanMilestone = BigDecimal.ZERO;
        BigDecimal totalKhoanHQDA = BigDecimal.ZERO;

        LuongKhoanTotal lk1 = new LuongKhoanTotal();

        for (int i = 0; i < lstLuongKhoans.size(); i++) {
            if ("CV".equals(lstLuongKhoans.get(i).getLoaiKhoan())) {
                totalKhoanCV = totalKhoanCV.add(lstLuongKhoans.get(i).getLuongKhoan());
            } else if ("MT".equals(lstLuongKhoans.get(i).getLoaiKhoan())) {
                totalKhoanMilestone = totalKhoanMilestone.add(lstLuongKhoans.get(i).getLuongKhoan());
            } else {
                totalKhoanHQDA = totalKhoanHQDA.add(lstLuongKhoans.get(i).getLuongKhoan());
            }
        }
        lk1.setTotalKhoanCV(totalKhoanCV.setScale(2, BigDecimal.ROUND_UP));
        lk1.setTotalKhoanMilestone(totalKhoanMilestone.setScale(2, BigDecimal.ROUND_UP));
        lk1.setTotalKhoanHQDA(totalKhoanHQDA.setScale(2, BigDecimal.ROUND_UP));
        lk1.setTotalKhoan(totalKhoanCV.add(totalKhoanMilestone).add(totalKhoanHQDA).setScale(2, BigDecimal.ROUND_UP));

        luongKhoanTotal = lk1;

        List<TkWsTask> lstTasks = new ArrayList<>();
        lstTasks = tasktController.GetAllTaskByUserId(user.getId(), "all");

        List<TkWsTask> lstTaskInWorkspace = new ArrayList<>();
        lstTasks = tasktController.GetAllTaskByUserId(user.getId(), "all");

        BigDecimal totalKhoanCVInMonth = BigDecimal.ZERO;
        BigDecimal totalKhoanMilstoneInMonth = BigDecimal.ZERO;
        BigDecimal totalKhoanHQDAInMonth = BigDecimal.ZERO;

        int taskclose = 0;
        int taskduedate = 0;
        Date date = new Date();
        for (int i = 0; i < lstTasks.size(); i++) {
            // neu dong task dung han thi moi duoc nhan tien khoan cv
            if ("CLOSE".equals(lstTasks.get(i).getStatus()) && lstTasks.get(i).getDateClose() != null
                    && lstTasks.get(i).getDateClose().before(lstTasks.get(i).getDueDate())
                    && lstTasks.get(i).getDateClose().getMonth() == date.getMonth()) {
                totalKhoanCVInMonth = totalKhoanCVInMonth.add(new BigDecimal(lstTasks.get(i).getNganSach()));
                taskclose = taskclose + 1;
            }
            if ("COMPLETE".equals(lstTasks.get(i).getStatus()) && lstTasks.get(i).getDateClose() != null
                    && lstTasks.get(i).getDateClose().before(date)
                    && lstTasks.get(i).getDateClose().getMonth() == date.getMonth()) {
                taskclose = taskclose + 1;
            }
            if ("OPEN".equals(lstTasks.get(i).getStatus())
                    || "INPROCESS".equals(lstTasks.get(i).getStatus())) {
                taskduedate = taskduedate + 1;
            }
        }

        // tinh he so ca nhan
        double Hcanhan = 0;
        double tySo = 0;
        if (taskduedate > 0) {
            tySo = taskclose / taskduedate;
        }
        if (taskduedate == 0 & taskclose > 0) {
            tySo = taskclose;
        }
        if (tySo < 0.7) {
            Hcanhan = 0;
        } else if (tySo >= 0.7 && tySo < 1.0) {
            Hcanhan = 1;
        } else if (tySo >= 1 && tySo < 1.2) {
            Hcanhan = 1.2;
        } else if (tySo >= 1.2) {
            Hcanhan = 1.5;
        }

        BigDecimal heSoCanBang = new BigDecimal(1.0);

        BigDecimal tongLuongCoSoVoiHeSo = user.getLuongCoSo().multiply(new BigDecimal(0.2)).multiply(new BigDecimal(Hcanhan)).setScale(2, BigDecimal.ROUND_UP);
        BigDecimal tongLuongCoSo = user.getLuongCoSo().multiply(new BigDecimal(0.2)).setScale(2, BigDecimal.ROUND_UP);

        // neu nhu tong 20% luong co so nhan voi Hca nhan > 20% luong co sơ
        if (tongLuongCoSoVoiHeSo.compareTo(tongLuongCoSo) == 1) {
            heSoCanBang = tongLuongCoSo.divide(tongLuongCoSoVoiHeSo, 2, RoundingMode.HALF_UP);
            heSoCanBang = heSoCanBang.setScale(2, BigDecimal.ROUND_UP);
        }

        totalKhoanHQDAInMonth = user.getLuongCoSo().multiply(new BigDecimal(Hcanhan)).multiply(new BigDecimal(0.2)).multiply(heSoCanBang);

        // tinh khoan theo miltone
        // lay danh sach khoan dong dung han
        List<Milestone> lstMilestones = new ArrayList<>();
        lstMilestones = luongKhoanController.GetMilestonesClose();

        // lay danh sach nguoi tham gia miletone
        for (int i = 0; i < lstMilestones.size(); i++) {
            List<Integer> lstUserMiletone = luongKhoanController.GetUserMilestonesClose(lstMilestones.get(i).getMilestoneid());
            BigDecimal khoan = lstMilestones.get(i).getTienKhoan();
            int soLuongThamGia = lstUserMiletone.size();
            BigDecimal khoanMoiCaNhan = khoan.divide(new BigDecimal(soLuongThamGia), 2, RoundingMode.HALF_UP);

            for (int j = 0; j < lstUserMiletone.size(); j++) {
                if (lstUserMiletone.get(i).intValue() == user.getId().intValue()) {
                    totalKhoanMilstoneInMonth = totalKhoanMilstoneInMonth.add(khoanMoiCaNhan.multiply(new BigDecimal(user.getHeSo()))).setScale(2, BigDecimal.ROUND_UP);
                    break;
                }
            }
        }

        List<TkUser> lstUsers = new ArrayList<>();
        TkUser userLogin = (TkUser) session.get("user");
        lstUsers = workspaceController.GetAllUserInDepartement(userLogin.getTkDepartment().getId());

        BigDecimal totalLuongToanPhongPhan = new BigDecimal(BigInteger.ZERO);

        for (int i = 0; i < lstUsers.size(); i++) {
            BigDecimal thuong = new BigDecimal(BigInteger.ZERO);
            thuong = lstUsers.get(i).getPackageSalary().subtract((new BigDecimal(13)).multiply(lstUsers.get(i).getLuongCoSo()));
            totalLuongToanPhongPhan = totalLuongToanPhongPhan.add(thuong);
        }

        BigDecimal quyThuongMotThang = new BigDecimal(BigInteger.ZERO);
        quyThuongMotThang = totalLuongToanPhongPhan.divide(new BigDecimal(12));

        BigDecimal khoanCaNhanOld = new BigDecimal(BigInteger.ZERO);
        khoanCaNhanOld = quyThuongMotThang.divide(new BigDecimal(lstUsers.size())).multiply(new BigDecimal(user.getHeSo())).setScale(2, BigDecimal.ROUND_UP);

        LuongKhoanTotal lk2 = new LuongKhoanTotal();

        lk2.setTotalKhoanCV(totalKhoanCVInMonth.setScale(2, BigDecimal.ROUND_UP));
        lk2.setTotalKhoanMilestone(totalKhoanMilstoneInMonth.setScale(2, BigDecimal.ROUND_UP));
        lk2.setTotalKhoanHQDA(totalKhoanHQDAInMonth.multiply(new BigDecimal(0.8)).setScale(2, BigDecimal.ROUND_UP));
        lk2.setTotalKhoanHQDA2(totalKhoanHQDAInMonth.multiply(new BigDecimal(1.2)).setScale(2, BigDecimal.ROUND_UP));
        lk2.setTotalKhoan(totalKhoanCVInMonth.add(totalKhoanMilstoneInMonth).add(totalKhoanHQDAInMonth.multiply(new BigDecimal(0.8))).setScale(2, BigDecimal.ROUND_UP));
        lk2.setTotalKhoan2(totalKhoanCVInMonth.add(totalKhoanMilstoneInMonth).add(totalKhoanHQDAInMonth.multiply(new BigDecimal(1.2))).setScale(2, BigDecimal.ROUND_UP));
        lk2.setTotalKhoanOld(khoanCaNhanOld);
        lk2.setTotalKhoanChange((totalKhoanHQDAInMonth.multiply(new BigDecimal(0.8)).setScale(2, BigDecimal.ROUND_UP)).subtract(khoanCaNhanOld));
        luongKhoanTotal2 = lk2;

        LayToanBoKhoanTheoNamByUserId(user);

        return SUCCESS;
    }

    public String tinhKhoanPhongBan() {
        List<TkUser> lstUsers = new ArrayList<>();
        TkUser userLogin = (TkUser) session.get("user");
        float heSoDuAn = Float.parseFloat(request.getParameter("heSoDuAn"));
        lstUsers = workspaceController.GetAllUserInDepartement(userLogin.getTkDepartment().getId());

        List<LuongKhoan> lstCreateLuongKhoans = new ArrayList<>();
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("MM");
        String strDate = formatter.format(date);

        for (int k = 0; k < lstUsers.size(); k++) {
            TkUser userTinhKhoan = new TkUser();
            userTinhKhoan = lstUsers.get(k);
            List<TkWsTask> lstTasks = new ArrayList<>();
            lstTasks = tasktController.GetAllTaskByUserId(userTinhKhoan.getId(), "all");

            BigDecimal totalKhoanCVInMonth = BigDecimal.ZERO;
            BigDecimal totalKhoanMilstoneInMonth = BigDecimal.ZERO;
            BigDecimal totalKhoanHQDAInMonth = BigDecimal.ZERO;

            int taskclose = 0;
            int taskduedate = 0;
            for (int i = 0; i < lstTasks.size(); i++) {
                // neu dong task dung han thi moi duoc nhan tien khoan cv
                if ("CLOSE".equals(lstTasks.get(i).getStatus()) && lstTasks.get(i).getDateClose() != null
                        && lstTasks.get(i).getDateClose().before(lstTasks.get(i).getDueDate())
                        && lstTasks.get(i).getDateClose().getMonth() == date.getMonth()) {
                    totalKhoanCVInMonth = totalKhoanCVInMonth.add(new BigDecimal(lstTasks.get(i).getNganSach()));
                    taskclose = taskclose + 1;
                }
                if ("COMPLETE".equals(lstTasks.get(i).getStatus()) && lstTasks.get(i).getDateClose() != null
                        && lstTasks.get(i).getDateClose().before(date)
                        && lstTasks.get(i).getDateClose().getMonth() == date.getMonth()) {
                    taskclose = taskclose + 1;
                }
                if ("OPEN".equals(lstTasks.get(i).getStatus())
                        || "INPROCESS".equals(lstTasks.get(i).getStatus())) {
                    taskduedate = taskduedate + 1;
                }
            }

            // tinh he so ca nhan
            double Hcanhan = 0;
            double tySo = 0;
            if (taskduedate > 0) {
                tySo = taskclose / taskduedate;
            }
            if (taskduedate == 0 & taskclose > 0) {
                tySo = taskclose;
            }
            if (tySo < 0.7) {
                Hcanhan = 0;
            } else if (tySo >= 0.7 && tySo < 1.0) {
                Hcanhan = 1;
            } else if (tySo >= 1 && tySo < 1.2) {
                Hcanhan = 1.2;
            } else if (tySo >= 1.2) {
                Hcanhan = 1.5;
            }

            BigDecimal heSoCanBang = new BigDecimal(1.0);

            BigDecimal tongLuongCoSoVoiHeSo = userTinhKhoan.getLuongCoSo().multiply(new BigDecimal(0.2)).multiply(new BigDecimal(Hcanhan)).setScale(2, BigDecimal.ROUND_UP);
            BigDecimal tongLuongCoSo = userTinhKhoan.getLuongCoSo().multiply(new BigDecimal(0.2)).setScale(2, BigDecimal.ROUND_UP);

            // neu nhu tong 20% luong co so nhan voi Hca nhan > 20% luong co sơ
            if (tongLuongCoSoVoiHeSo.compareTo(tongLuongCoSo) == 1) {
                heSoCanBang = tongLuongCoSo.divide(tongLuongCoSoVoiHeSo, 2, RoundingMode.HALF_UP);
                heSoCanBang = heSoCanBang.setScale(2, BigDecimal.ROUND_UP);
            }

            totalKhoanHQDAInMonth = userTinhKhoan.getLuongCoSo().multiply(new BigDecimal(Hcanhan)).multiply(new BigDecimal(0.2)).multiply(heSoCanBang);

            List<Milestone> lstMilestones = new ArrayList<>();
            lstMilestones = luongKhoanController.GetMilestonesClose();

            // lay danh sach nguoi tham gia miletone
            for (int i = 0; i < lstMilestones.size(); i++) {
                List<Integer> lstUserMiletone = luongKhoanController.GetUserMilestonesClose(lstMilestones.get(i).getMilestoneid());
                BigDecimal khoan = lstMilestones.get(i).getTienKhoan();
                int soLuongThamGia = lstUserMiletone.size();
                BigDecimal khoanMoiCaNhan = khoan.divide(new BigDecimal(soLuongThamGia), 2, RoundingMode.HALF_UP);

                for (int j = 0; j < lstUserMiletone.size(); j++) {
                    if (lstUserMiletone.get(i).intValue() == userTinhKhoan.getId().intValue()) {
                        totalKhoanMilstoneInMonth = totalKhoanMilstoneInMonth.add(khoanMoiCaNhan.multiply(new BigDecimal(userTinhKhoan.getHeSo()))).setScale(2, BigDecimal.ROUND_UP);
                        break;
                    }
                }

            }

            LuongKhoanTotal lk2 = new LuongKhoanTotal();

            lk2.setTotalKhoanCV(totalKhoanCVInMonth.setScale(2, BigDecimal.ROUND_UP));
            lk2.setTotalKhoanMilestone(totalKhoanMilstoneInMonth.setScale(2, BigDecimal.ROUND_UP));
            lk2.setTotalKhoanHQDA(totalKhoanHQDAInMonth.multiply(new BigDecimal(heSoDuAn)).setScale(2, BigDecimal.ROUND_UP));
            lk2.setTotalKhoan(totalKhoanCVInMonth.add(totalKhoanMilstoneInMonth).add(totalKhoanHQDAInMonth.multiply(new BigDecimal(heSoDuAn))).setScale(2, BigDecimal.ROUND_UP));

            for (int i = 0; i < 3; i++) {
                LuongKhoan khoan = new LuongKhoan();
                khoan.setCreateBy(userLogin.getLoginId());
                khoan.setCreateDate(systemMethod.getSysDateToSqlDate());
                khoan.setLastUpdateBy(userLogin.getLoginId());
                khoan.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                khoan.setLoaiKhoan(i == 0 ? "CV" : i == 1 ? "MT" : "HQDA");
                khoan.setLuongKhoan(i == 0 ? lk2.getTotalKhoanCV() : i == 1 ? lk2.getTotalKhoanMilestone() : lk2.getTotalKhoanHQDA());
                khoan.setPheDuyet(userLogin.getId());
                khoan.setThang(Integer.parseInt(strDate));
                khoan.setUserId(userTinhKhoan.getId());
                lstCreateLuongKhoans.add(khoan);
            }
        }

        luongKhoanController.saveKhoan(lstCreateLuongKhoans);

        for (int k = 0; k < lstUsers.size(); k++) {
            TkUser userTinhKhoan = new TkUser();
            userTinhKhoan = lstUsers.get(k);
            List<LuongKhoan> lstLuongKhoan = new ArrayList<>();
            lstLuongKhoan = luongKhoanController.getLuongKhoanByUserId(userTinhKhoan.getId());

            for (int i = 0; i < lstLuongKhoan.size(); i++) {
                LuongKhoan get = lstLuongKhoan.get(i);
                LuongKhoanCustom custom = new LuongKhoanCustom();
                custom.setCreateBy(get.getCreateBy());
                custom.setCreateDate(get.getCreateDate());
                custom.setId(get.getId());
                custom.setLastUpdateBy(get.getLastUpdateBy());
                custom.setLastUpdateDate(get.getLastUpdateDate());
                custom.setLoaiKhoan(get.getLoaiKhoan());
                custom.setLuongKhoan(get.getLuongKhoan());
                TkUser u = taskListController.getUserById(get.getPheDuyet());
                custom.setPheDuyet(u);
                custom.setThang(get.getThang());
                custom.setUserId(userTinhKhoan);
                lstLuongKhoans.add(custom);
            }
        }
        List<TkUser> lsTkUsers = workspaceController.GetAllUserInDepartement(userLogin.getTkDepartment().getId());
        String year = systemMethod.getSystemYearToString();
        String yearPeve = String.valueOf(Integer.parseInt(year) - 1);
        session.put("PMKhoanTotalCharForAll", PMTongSoTienTraTheoThangNamHienTai(year, lsTkUsers));
        session.put("PMKhoanTotalCharForAllYearPeve", PMTongSoTienTraTheoThangNamHienTai(yearPeve, lsTkUsers));
        PMTongSoTienTheoUserNamHienTai(year, lsTkUsers);

        return SUCCESS;
    }

    public String tinhKhoanPhongBan2() {
        List<TkUser> lstUsers = new ArrayList<>();
        TkUser userLogin = (TkUser) session.get("user");
        String heSoDuAn = request.getParameter("heSoDuAn");
        lstUsers = workspaceController.GetAllUserInDepartement(userLogin.getTkDepartment().getId());
        int formulaId = Integer.parseInt(request.getParameter("congthuctinh"));

        Formula formula = calculationFormulaController.GetFormulaById(formulaId);
        String formulaStringHQDA = formula.getFormulaCaculation() + heSoDuAn;
        System.out.println("formulaStringHQDA = "+formulaStringHQDA);

        CaculationFormula cf = new CaculationFormula();
        List<ParameterSetup> lstParameterWithFormula = new ArrayList<>();
        lstParameterWithFormula = cf.mappingParameterWithFormula(formulaStringHQDA);

        List<LuongKhoan> lstCreateLuongKhoans = new ArrayList<>();
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("MM");
        String strDate = formatter.format(date);

        for (int k = 0; k < lstUsers.size(); k++) {
            TkUser userTinhKhoan = new TkUser();
            userTinhKhoan = lstUsers.get(k);
            List<TkWsTask> lstTasks = new ArrayList<>();
            lstTasks = tasktController.GetAllTaskByUserId(userTinhKhoan.getId(), "all");

            BigDecimal totalKhoanCVInMonth = BigDecimal.ZERO;
            BigDecimal totalKhoanMilstoneInMonth = BigDecimal.ZERO;
            BigDecimal totalKhoanHQDAInMonth = BigDecimal.ZERO;

            int taskclose = 0;
            int taskduedate = 0;
            for (int i = 0; i < lstTasks.size(); i++) {
                // neu dong task dung han thi moi duoc nhan tien khoan cv
                if ("CLOSE".equals(lstTasks.get(i).getStatus()) && lstTasks.get(i).getDateClose() != null
                        && lstTasks.get(i).getDateClose().before(lstTasks.get(i).getDueDate())
                        && lstTasks.get(i).getDateClose().getMonth() == date.getMonth()) {
                    totalKhoanCVInMonth = totalKhoanCVInMonth.add(new BigDecimal(lstTasks.get(i).getNganSach()));
                    taskclose = taskclose + 1;
                }
                if ("COMPLETE".equals(lstTasks.get(i).getStatus()) && lstTasks.get(i).getDateClose() != null
                        && lstTasks.get(i).getDateClose().before(date)
                        && lstTasks.get(i).getDateClose().getMonth() == date.getMonth()) {
                    taskclose = taskclose + 1;
                }
                if ("OPEN".equals(lstTasks.get(i).getStatus())
                        || "INPROCESS".equals(lstTasks.get(i).getStatus())) {
                    taskduedate = taskduedate + 1;
                }
            }

            String valueHQDA = cf.generalFormula(formulaStringHQDA, lstParameterWithFormula, userLogin);
            System.out.println("sssssssssssssssss = "+valueHQDA);
            totalKhoanHQDAInMonth = new BigDecimal(valueHQDA);

            List< Milestone> lstMilestones = new ArrayList<>();
            lstMilestones = luongKhoanController.GetMilestonesClose();

            // lay danh sach nguoi tham gia miletone
            for (int i = 0; i < lstMilestones.size(); i++) {
                List<Integer> lstUserMiletone = luongKhoanController.GetUserMilestonesClose(lstMilestones.get(i).getMilestoneid());
                BigDecimal khoan = lstMilestones.get(i).getTienKhoan();
                int soLuongThamGia = lstUserMiletone.size();
                BigDecimal khoanMoiCaNhan = khoan.divide(new BigDecimal(soLuongThamGia), 2, RoundingMode.HALF_UP);

                for (int j = 0; j < lstUserMiletone.size(); j++) {
                    if (lstUserMiletone.get(i).intValue() == userTinhKhoan.getId().intValue()) {
                        totalKhoanMilstoneInMonth = totalKhoanMilstoneInMonth.add(khoanMoiCaNhan.multiply(new BigDecimal(userTinhKhoan.getHeSo()))).setScale(2, BigDecimal.ROUND_UP);
                        break;
                    }
                }

            }

            LuongKhoanTotal lk2 = new LuongKhoanTotal();

            lk2.setTotalKhoanCV(totalKhoanCVInMonth.setScale(2, BigDecimal.ROUND_UP));
            lk2.setTotalKhoanMilestone(totalKhoanMilstoneInMonth.setScale(2, BigDecimal.ROUND_UP));
            lk2.setTotalKhoanHQDA(totalKhoanHQDAInMonth.setScale(2, BigDecimal.ROUND_UP));
            lk2.setTotalKhoan(totalKhoanCVInMonth.add(totalKhoanMilstoneInMonth).add(totalKhoanHQDAInMonth).setScale(2, BigDecimal.ROUND_UP));

            for (int i = 0; i < 3; i++) {
                LuongKhoan khoan = new LuongKhoan();
                khoan.setCreateBy(userLogin.getLoginId());
                khoan.setCreateDate(systemMethod.getSysDateToSqlDate());
                khoan.setLastUpdateBy(userLogin.getLoginId());
                khoan.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                khoan.setLoaiKhoan(i == 0 ? "CV" : i == 1 ? "MT" : "HQDA");
                khoan.setLuongKhoan(i == 0 ? lk2.getTotalKhoanCV() : i == 1 ? lk2.getTotalKhoanMilestone() : lk2.getTotalKhoanHQDA());
                khoan.setPheDuyet(userLogin.getId());
                khoan.setThang(Integer.parseInt(strDate));
                khoan.setUserId(userTinhKhoan.getId());
                lstCreateLuongKhoans.add(khoan);
            }
        }

        luongKhoanController.saveKhoan(lstCreateLuongKhoans);

        for (int k = 0; k < lstUsers.size(); k++) {
            TkUser userTinhKhoan = new TkUser();
            userTinhKhoan = lstUsers.get(k);
            List<LuongKhoan> lstLuongKhoan = new ArrayList<>();
            lstLuongKhoan = luongKhoanController.getLuongKhoanByUserId(userTinhKhoan.getId());

            for (int i = 0; i < lstLuongKhoan.size(); i++) {
                LuongKhoan get = lstLuongKhoan.get(i);
                LuongKhoanCustom custom = new LuongKhoanCustom();
                custom.setCreateBy(get.getCreateBy());
                custom.setCreateDate(get.getCreateDate());
                custom.setId(get.getId());
                custom.setLastUpdateBy(get.getLastUpdateBy());
                custom.setLastUpdateDate(get.getLastUpdateDate());
                custom.setLoaiKhoan(get.getLoaiKhoan());
                custom.setLuongKhoan(get.getLuongKhoan());
                TkUser u = taskListController.getUserById(get.getPheDuyet());
                custom.setPheDuyet(u);
                custom.setThang(get.getThang());
                custom.setUserId(userTinhKhoan);
                lstLuongKhoans.add(custom);
            }
        }
        List<TkUser> lsTkUsers = workspaceController.GetAllUserInDepartement(userLogin.getTkDepartment().getId());
        String year = systemMethod.getSystemYearToString();
        String yearPeve = String.valueOf(Integer.parseInt(year) - 1);
        session.put("PMKhoanTotalCharForAll", PMTongSoTienTraTheoThangNamHienTai(year, lsTkUsers));
        session.put("PMKhoanTotalCharForAllYearPeve", PMTongSoTienTraTheoThangNamHienTai(yearPeve, lsTkUsers));
        PMTongSoTienTheoUserNamHienTai(year, lsTkUsers);
        return SUCCESS;
    }

    public String prepareCreateKhoan() {
        List<TkUser> lstUsers = new ArrayList<>();
        TkUser userLogin = (TkUser) session.get("user");
        lstUsers = workspaceController.GetAllUserInDepartement(userLogin.getTkDepartment().getId());
        for (int k = 0; k < lstUsers.size(); k++) {
            TkUser userTinhKhoan = new TkUser();
            userTinhKhoan = lstUsers.get(k);
            List<LuongKhoan> lstLuongKhoan = new ArrayList<>();
            lstLuongKhoan = luongKhoanController.getLuongKhoanByUserId(userTinhKhoan.getId());
            for (int i = 0; i < lstLuongKhoan.size(); i++) {
                LuongKhoan get = lstLuongKhoan.get(i);
                LuongKhoanCustom custom = new LuongKhoanCustom();
                custom.setCreateBy(get.getCreateBy());
                custom.setCreateDate(get.getCreateDate());
                custom.setId(get.getId());
                custom.setLastUpdateBy(get.getLastUpdateBy());
                custom.setLastUpdateDate(get.getLastUpdateDate());
                custom.setLoaiKhoan(get.getLoaiKhoan());
                custom.setLuongKhoan(get.getLuongKhoan());
                TkUser u = taskListController.getUserById(get.getPheDuyet());
                custom.setPheDuyet(u);
                custom.setThang(get.getThang());
                custom.setUserId(userTinhKhoan);
                lstLuongKhoans.add(custom);
            }
        }
        List<TkUser> lsTkUsers = workspaceController.GetAllUserInDepartement(userLogin.getTkDepartment().getId());
        String year = systemMethod.getSystemYearToString();
        String yearPeve = String.valueOf(Integer.parseInt(year) - 1);
        session.put("PMKhoanTotalCharForAll", PMTongSoTienTraTheoThangNamHienTai(year, lsTkUsers));
        session.put("PMKhoanTotalCharForAllYearPeve", PMTongSoTienTraTheoThangNamHienTai(yearPeve, lsTkUsers));
        PMTongSoTienTheoUserNamHienTai(year, lsTkUsers);

        lstFormula = calculationFormulaController.getAllFormula();

        return SUCCESS;
    }

    public void LayToanBoKhoanTheoNamByUserId(TkUser user) {
        //lay du lieu khoan
        List<LuongKhoan> lstLuongKhoan = new ArrayList<>();
        lstLuongKhoan = luongKhoanController.getLuongKhoanByUserId(user.getId());

        String khoanCv = "";
        String khoanMilestone = "";
        String khoanTamUng = "";

        for (int i = 1; i < 13; i++) {
            List<LuongKhoan> lstLuongKhoanByMonth = new ArrayList<>();
            lstLuongKhoanByMonth = luongKhoanController.getLuongKhoanByUserIdByMonth(user.getId(), i, systemMethod.getSystemYearToNumber());

            if (lstLuongKhoanByMonth != null && lstLuongKhoanByMonth.size() > 0) {
                for (int j = 0; j < lstLuongKhoanByMonth.size(); j++) {
                    LuongKhoan get = lstLuongKhoanByMonth.get(j);
                    if ("CV".equals(get.getLoaiKhoan())) {
                        khoanCv = khoanCv + get.getLuongKhoan().toString() + ",";
                    }
                    if ("MT".equals(get.getLoaiKhoan())) {
                        khoanMilestone = khoanMilestone + get.getLuongKhoan().toString() + ",";
                    }
                    if ("HQDA".equals(get.getLoaiKhoan())) {
                        khoanTamUng = khoanTamUng + get.getLuongKhoan().toString() + ",";
                    }
                }
            } else {
                khoanCv = khoanCv + ",";
                khoanMilestone = khoanMilestone + ",";
                khoanTamUng = khoanTamUng + ",";
            }
        }
        System.out.println("khoanCv = " + khoanCv);
        System.out.println("khoanMilestone = " + khoanMilestone);
        System.out.println("khoanTamUng = " + khoanTamUng);

//        for (int i = 0; i < lstLuongKhoan.size(); i++) {
//            LuongKhoan get = lstLuongKhoan.get(i);
//            if (get.getCreateDate().getYear() == systemMethod.getSystemYear()) {
//                if ("CV".equals(get.getLoaiKhoan())) {
//                    khoanCv = khoanCv + get.getLuongKhoan().toString() + ",";
//                }
//                if ("MT".equals(get.getLoaiKhoan())) {
//                    khoanMilestone = khoanMilestone + get.getLuongKhoan().toString() + ",";
//                }
//                if ("HQDA".equals(get.getLoaiKhoan())) {
//                    khoanTamUng = khoanTamUng + get.getLuongKhoan().toString() + ",";
//                }
//            }
//        }
        List<TkUser> lsTkUsers = workspaceController.GetAllUserInDepartement(user.getTkDepartment().getId());
        String year = systemMethod.getSystemYearToString();
        String yearPeve = String.valueOf(Integer.parseInt(year) - 1);
        session.put("khoanCv", khoanCv);
        session.put("khoanMilestone", khoanMilestone);
        session.put("khoanTamUng", khoanTamUng);
        session.put("KhoanTotalChar", GetDataForCharYear(lstLuongKhoan, year));
        session.put("KhoanTotalCharPerve", GetDataForCharYear(lstLuongKhoan, yearPeve));
        session.put("KhoanTotalCharTB", GetDataForCharYearTrungBInh(year, lsTkUsers));
    }

    public String GetDataForCharYear(List<LuongKhoan> lstLuongKhoan, String year) {
        HashMap<Integer, BigDecimal> hashMap = new HashMap<>();
        for (int i = 0; i < lstLuongKhoan.size(); i++) {
            LuongKhoan lk = lstLuongKhoan.get(i);
            if (year.equals(systemMethod.getSystemYearToString1(lk.getCreateDate()))) {
                if (hashMap.get(lk.getThang()) == null) {
                    hashMap.put(lk.getThang(), lk.getLuongKhoan());
                } else {
                    BigDecimal a = hashMap.get(lk.getThang());
                    hashMap.replace(lk.getThang(), lk.getLuongKhoan().add(a));
                }
            }
        }
        String KhoanTotalChar = "";
        KhoanTotalChar = hashMap.get(1) == null ? "," : hashMap.get(1).toString() + ",";
        KhoanTotalChar = hashMap.get(2) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(2).toString() + ",";
        KhoanTotalChar = hashMap.get(3) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(3).toString() + ",";
        KhoanTotalChar = hashMap.get(4) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(4).toString() + ",";
        KhoanTotalChar = hashMap.get(5) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(5).toString() + ",";
        KhoanTotalChar = hashMap.get(6) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(6).toString() + ",";
        KhoanTotalChar = hashMap.get(7) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(7).toString() + ",";
        KhoanTotalChar = hashMap.get(8) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(8).toString() + ",";
        KhoanTotalChar = hashMap.get(9) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(9).toString() + ",";
        KhoanTotalChar = hashMap.get(10) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(10).toString() + ",";
        KhoanTotalChar = hashMap.get(11) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(11).toString() + ",";
        KhoanTotalChar = hashMap.get(12) == null ? KhoanTotalChar + "" : KhoanTotalChar + hashMap.get(12).toString();

        System.out.println(KhoanTotalChar);
        return KhoanTotalChar;
    }

    public String GetDataForCharYearTrungBInh(String year, List<TkUser> lstUsers) {
        HashMap<Integer, BigDecimal> hashMap = new HashMap<>();
        for (int k = 0; k < lstUsers.size(); k++) {
            TkUser u = lstUsers.get(k);
            List<LuongKhoan> lstLuongKhoan = new ArrayList<>();
            lstLuongKhoan = luongKhoanController.getLuongKhoanByUserId(u.getId());
            for (int i = 0; i < lstLuongKhoan.size(); i++) {
                LuongKhoan lk = lstLuongKhoan.get(i);
                if (year.equals(systemMethod.getSystemYearToString1(lk.getCreateDate()))) {
                    if (hashMap.get(lk.getThang()) == null) {
                        hashMap.put(lk.getThang(), lk.getLuongKhoan());
                    } else {
                        BigDecimal a = hashMap.get(lk.getThang());
                        hashMap.replace(lk.getThang(), lk.getLuongKhoan().add(a));
                    }
                }
            }
        }
        BigDecimal numberUser = new BigDecimal(lstUsers.size());

        String KhoanTotalChar = "";
        KhoanTotalChar = hashMap.get(1) == null ? "," : (hashMap.get(1).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(2) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(2).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(3) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(3).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(4) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(4).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(5) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(5).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(6) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(6).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(7) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(7).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(8) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(8).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(9) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(9).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(10) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(10).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(11) == null ? KhoanTotalChar + "," : (KhoanTotalChar + hashMap.get(11).divide(numberUser, 2, RoundingMode.HALF_UP)).toString() + ",";
        KhoanTotalChar = hashMap.get(12) == null ? KhoanTotalChar + "" : (KhoanTotalChar + hashMap.get(12).divide(numberUser, 2, RoundingMode.HALF_UP)).toString();

        System.out.println(KhoanTotalChar);
        return KhoanTotalChar;
    }

    public String PMTongSoTienTraTheoThangNamHienTai(String year, List<TkUser> lstUsers) {
        HashMap<Integer, BigDecimal> hashMap = new HashMap<>();
        for (int k = 0; k < lstUsers.size(); k++) {
            TkUser u = lstUsers.get(k);
            List<LuongKhoan> lstLuongKhoan = new ArrayList<>();
            lstLuongKhoan = luongKhoanController.getLuongKhoanByUserId(u.getId());
            for (int i = 0; i < lstLuongKhoan.size(); i++) {
                LuongKhoan lk = lstLuongKhoan.get(i);
                if (year.equals(systemMethod.getSystemYearToString1(lk.getCreateDate()))) {
                    if (hashMap.get(lk.getThang()) == null) {
                        hashMap.put(lk.getThang(), lk.getLuongKhoan());
                    } else {
                        BigDecimal a = hashMap.get(lk.getThang());
                        hashMap.replace(lk.getThang(), lk.getLuongKhoan().add(a));
                    }
                }
            }
        }

        String KhoanTotalChar = "";
        KhoanTotalChar = hashMap.get(1) == null ? "," : hashMap.get(1).toString() + ",";
        KhoanTotalChar = hashMap.get(2) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(2).toString() + ",";
        KhoanTotalChar = hashMap.get(3) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(3).toString() + ",";
        KhoanTotalChar = hashMap.get(4) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(4).toString() + ",";
        KhoanTotalChar = hashMap.get(5) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(5).toString() + ",";
        KhoanTotalChar = hashMap.get(6) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(6).toString() + ",";
        KhoanTotalChar = hashMap.get(7) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(7).toString() + ",";
        KhoanTotalChar = hashMap.get(8) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(8).toString() + ",";
        KhoanTotalChar = hashMap.get(9) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(9).toString() + ",";
        KhoanTotalChar = hashMap.get(10) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(10).toString() + ",";
        KhoanTotalChar = hashMap.get(11) == null ? KhoanTotalChar + "," : KhoanTotalChar + hashMap.get(11).toString() + ",";
        KhoanTotalChar = hashMap.get(12) == null ? KhoanTotalChar + "" : KhoanTotalChar + hashMap.get(12).toString();

        System.out.println(KhoanTotalChar);
        return KhoanTotalChar;

    }

    public void PMTongSoTienTheoUserNamHienTai(String year, List<TkUser> lstUsers) {
        HashMap<String, BigDecimal> hashMap = new HashMap<>();
        for (int k = 0; k < lstUsers.size(); k++) {
            TkUser u = lstUsers.get(k);

            String code = u.getLoginId() + " - " + u.getFullName();

            List<LuongKhoan> lstLuongKhoan = new ArrayList<>();
            lstLuongKhoan = luongKhoanController.getLuongKhoanByUserId(u.getId());
            for (int i = 0; i < lstLuongKhoan.size(); i++) {
                LuongKhoan lk = lstLuongKhoan.get(i);
                if (year.equals(systemMethod.getSystemYearToString1(lk.getCreateDate()))) {
                    if (hashMap.get(code) == null) {
                        hashMap.put(code, lk.getLuongKhoan() == null ? BigDecimal.ZERO : lk.getLuongKhoan());
                    } else {
                        BigDecimal a = hashMap.get(code);
                        BigDecimal value = BigDecimal.ZERO;
                        if (lk.getLuongKhoan() != null) {
                            value = lk.getLuongKhoan().add(a);
                        }
                        hashMap.replace(code, value);
                    }
                }
            }
        }

        String dataLabel = "";
        String dataAmount = "";
        for (Map.Entry<String, BigDecimal> entry : hashMap.entrySet()) {
            String key = entry.getKey();
            BigDecimal value = entry.getValue();
            dataLabel = dataLabel + ",\"" + key + "\"";
            dataAmount = dataAmount + "," + value.toString();

        }
        System.out.println("dataLabel = " + dataLabel);
        System.out.println("dataAmount = " + dataAmount);
        session.put("dataLabel", dataLabel);
        session.put("dataAmount", dataAmount);

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

    public List<LuongKhoanCustom> getLstLuongKhoans() {
        return lstLuongKhoans;
    }

    public void setLstLuongKhoans(List<LuongKhoanCustom> lstLuongKhoans) {
        this.lstLuongKhoans = lstLuongKhoans;
    }

    public LuongKhoanTotal getLuongKhoanTotal() {
        return luongKhoanTotal;
    }

    public void setLuongKhoanTotal(LuongKhoanTotal luongKhoanTotal) {
        this.luongKhoanTotal = luongKhoanTotal;
    }

    public LuongKhoanTotal getLuongKhoanTotal2() {
        return luongKhoanTotal2;
    }

    public void setLuongKhoanTotal2(LuongKhoanTotal luongKhoanTotal2) {
        this.luongKhoanTotal2 = luongKhoanTotal2;
    }

    public List<Formula> getLstFormula() {
        return lstFormula;
    }

    public void setLstFormula(List<Formula> lstFormula) {
        this.lstFormula = lstFormula;
    }

}
