/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.batch.job;

import app.kpi.KpiController;
import app.qlcv.entities.TkDepartment;
import app.qlcv.entities.TkKpiItem;
import app.qlcv.entities.TkKpiItemDetail;
import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWsTask;
import app.qlcv.entities.TkWsTasklist;
import app.qlcv.utils.HibernateUtil;
import app.qlcv.utils.ReadPropertiesFile;
import app.qlcv.utils.SystemMethod;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author sonng
 */
public class ImportToMysql {

    Session session;
    Transaction transaction;
    SystemMethod systemMethod;

    public ImportToMysql() {
        session = HibernateUtil.getSessionFactory().openSession();
        systemMethod = new SystemMethod();
    }

    public void ImportExcelToMySQLForTableTask(String fileName, int codeTaskList, String source) throws FileNotFoundException, SQLException, java.io.IOException {

        String excelFilePath = fileName;

        try {

            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            long start = System.currentTimeMillis();
            FileInputStream inputStream = new FileInputStream(excelFilePath);
            Workbook workbook = new XSSFWorkbook(inputStream);

            Sheet firstSheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = firstSheet.iterator();

            int count = 0;

            rowIterator.next(); // skip the header row
            rowIterator.next(); // skip tieu de

            while (rowIterator.hasNext()) {
                Row nextRow = rowIterator.next();
                Iterator<Cell> cellIterator = nextRow.cellIterator();

                boolean isCreate = false;
                TkWsTask task = new TkWsTask();
                task.setCreateDate(systemMethod.getSysDateToSqlDate());
                task.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                task.setIsSubTask("N");

                TkWsTasklist tasklist = new TkWsTasklist();
                tasklist = (TkWsTasklist) session.get(TkWsTasklist.class, codeTaskList);
                task.setTkWsTasklist(tasklist);
                task.setSource(source);

                while (cellIterator.hasNext()) {
                    Cell nextCell = cellIterator.next();

                    int columnIndex = nextCell.getColumnIndex();

                    switch (columnIndex) {
                        case 0:
                            int stt = (int) nextCell.getNumericCellValue();
                            break;
                        case 1:
                            String id = nextCell.getStringCellValue();
                            task.setRefId(id);
                            Query query = session.createQuery("FROM TkWsTask a where a.refId=:id");
                            query.setParameter("id", id);
                            List<TkWsTask> lstTasks = new ArrayList<>();
                            lstTasks = query.list();
                            if (lstTasks.size() > 0) {
                                task = lstTasks.get(0);
                                isCreate = true;
                            }

                            break;
                        case 2:
                            String taskName = nextCell.getStringCellValue();
                            task.setTaskName(taskName);
                            break;
                        case 3:
                            String taskDesc = nextCell.getStringCellValue();
                            task.setTaskDesc(taskDesc);
                            break;
                        case 4:
                            String taskParent = nextCell.getStringCellValue();

                            break;
                        case 5:
                            String depatermetn = nextCell.getStringCellValue();
                            break;
                        case 6:
                            String project = nextCell.getStringCellValue();
                            break;
                        case 7:
                            String priority = nextCell.getStringCellValue();
                            break;
                        case 8:
                            String priorityCode = nextCell.getStringCellValue();
                            int p = 0;
                            if ("LOW".equals(priorityCode)) {
                                p = 1;
                            } else if ("STANDARD".equals(priorityCode)) {
                                p = 2;
                            } else if ("HIGH".equals(priorityCode)) {
                                p = 3;
                            }
                            task.setPriority(p);
                            break;
                        case 9:
                            String assign = nextCell.getStringCellValue();
                            break;
                        case 10:
                            String assignEmail = nextCell.getStringCellValue();
                            Query q = session.createQuery("FROM TkUser a where a.loginId=:assigen");
                            q.setParameter("assigen", assignEmail);
                            List<TkUser> a = new ArrayList<>();
                            a = q.list();
                            if (a.size() != 0) {
                                task.setAssigneeUserId(a.get(0).getId());
                            }
                            break;
                        case 11:
                            String reviewBy = nextCell.getStringCellValue();
                            break;
                        case 12:
                            String reviewByEmail = nextCell.getStringCellValue();
                            Query q2 = session.createQuery("FROM TkUser a where a.loginId=:reviewByEmail");
                            q2.setParameter("reviewByEmail", reviewByEmail);
                            List<TkUser> userReview = new ArrayList<>();
                            userReview = q2.list();
                            if (userReview.size() != 0) {
                                task.setReviewBy(userReview.get(0).getId());
                            }
                            break;
                        case 13:
                            String setupBy = nextCell.getStringCellValue();
                            task.setCreateBy(setupBy);
                            task.setLastUpdateBy(setupBy);
                            break;
                        case 14:
                            String startDate = nextCell.getStringCellValue();
                            System.out.println(startDate);
                            task.setStartDate(systemMethod.formatStringDateToSqlDate2(startDate));
                            break;
                        case 15:
                            String endDate = nextCell.getStringCellValue();
                            task.setDueDate(systemMethod.formatStringDateToSqlDate2(endDate));
                            break;
                        case 16:
                            String status = nextCell.getStringCellValue();
                            break;
                        case 17:
                            String statusCode = nextCell.getStringCellValue();
                            if ("INPROCESS".equals(statusCode)) {
                                task.setStatus("INPROCESS");
                            } else if ("WAIT_FOR_APPROVAL".equals(statusCode)) {
                                task.setStatus("COMPLETE");
                            } else {
                                task.setStatus("OPEN");
                            }
                            break;
                        case 18:
                            String tienDo = nextCell.getStringCellValue();
                            break;
                        case 19:
                            String thoiGianThucHien = nextCell.getStringCellValue();
                            break;
                    }

                }
                if (isCreate) {
                    session.update(task);
                } else {
                    session.save(task);
                }
            }

            workbook.close();

            long end = System.currentTimeMillis();
            System.out.printf("Import done in %d ms\n", (end - start));
            transaction.commit();

        } catch (IOException ex1) {
            System.out.println("Error reading file");
            ex1.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void ImportExcelToMySQLForTableKPI(String fileName, String kpiForUser, String source) throws FileNotFoundException, SQLException, java.io.IOException {

        String excelFilePath = fileName;

        try {

            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            long start = System.currentTimeMillis();
            FileInputStream inputStream = new FileInputStream(excelFilePath);
            Workbook workbook = new XSSFWorkbook(inputStream);

            Sheet firstSheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = firstSheet.iterator();

            int count = 0;

            rowIterator.next(); // skip the header row
            rowIterator.next(); // skip tieu de
            rowIterator.next(); // skip tieu de

            // kiem tra xem da tao kpi item chua
            TkKpiItem kpiItem = new TkKpiItem();
            KpiController kpiController = new KpiController();
            TkUser user = new TkUser();
            user = kpiController.getTkUserForUserOtherSource(kpiForUser);

            kpiItem = kpiController.getKPIForUserOtherSource(user.getId(), systemMethod.getSystemYearToNumber());

            if (kpiItem == null || kpiItem.getId() == null) {
                kpiItem.setCreateBy("SYSTEM");
                kpiItem.setLastUpdateBy("SYSTEM");
                kpiItem.setCreateDate(systemMethod.getSysDateToSqlDate());
                kpiItem.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                kpiItem.setKpiYear(systemMethod.getSystemYearToNumber());
                kpiItem.setKpiItem("BO_PHAN");
                kpiItem.setMucTieu("KPI GAN VOI BO PHAN");
                kpiItem.setStatus("ACTIVE");
                kpiItem.setTrongSo(100.0);
                kpiItem.setTkUser(user);
                kpiItem = kpiController.CreateKpiItemForUserOtherSource(kpiItem);
            }

            kpiController.UpdateKpiItemForUserOtherSource(kpiItem.getId());

            while (rowIterator.hasNext()) {
                Row nextRow = rowIterator.next();
                Iterator<Cell> cellIterator = nextRow.cellIterator();

                TkKpiItemDetail kpiItemDetail = new TkKpiItemDetail();
                kpiItemDetail.setCreateBy("SYSTEM");
                kpiItemDetail.setLastUpdateBy("SYSTEM");
                kpiItemDetail.setCreateDate(systemMethod.getSysDateToSqlDate());
                kpiItemDetail.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                kpiItemDetail.setTkKpiItem(kpiItem);
                kpiItemDetail.setItem(100.0);
                kpiItemDetail.setDonViTinh("%");
                kpiItemDetail.setTanSuatDanhGia("MONTH");
                kpiItemDetail.setStatus("ACTIVE");
                kpiItemDetail.setMonth(Integer.parseInt(systemMethod.getSystemMonthToString()));
                kpiItemDetail.setSource(source);

                while (cellIterator.hasNext()) {
                    Cell nextCell = cellIterator.next();

                    int columnIndex = nextCell.getColumnIndex();

                    switch (columnIndex) {
                        case 0:
                            int stt = (int) nextCell.getNumericCellValue();
                            break;
                        case 1:
                            String id = nextCell.getStringCellValue();
                            kpiItemDetail.setRefIdSource(id);
                            break;
                        case 2:
                            int month = (int)nextCell.getNumericCellValue();
                            kpiItemDetail.setMonth(month);
                            break;
                        case 3:
                            String kpiName = nextCell.getStringCellValue();
                            kpiItemDetail.setKpiName(kpiName);
                            kpiItemDetail.setKpiDesc(kpiName);
                            break;
                        case 4:
                            double trongSo = (Double) nextCell.getNumericCellValue();
                            kpiItemDetail.setTrongSo(trongSo);
                            break;
                        case 5:
                            String trangThai = nextCell.getStringCellValue();
                            kpiItemDetail.setStatus("ACTIVE");
                            break;
                        case 6:

                            break;
                        case 7:

                            break;
                        case 8:
                            double ketQua = (Double) nextCell.getNumericCellValue();

                            double kq = ketQua;
                            kpiItemDetail.setKetQuaThucHien(kq);
                            double tylethuchien = (kq / 100) * 100;
                            kpiItemDetail.setTyLeThucHien(tylethuchien);

                            break;
                    }

                }

                session.save(kpiItemDetail);
            }

            workbook.close();

            long end = System.currentTimeMillis();
            System.out.printf("Import done in %d ms\n", (end - start));
            transaction.commit();

        } catch (IOException ex1) {
            System.out.println("Error reading file");
            ex1.printStackTrace();
        } finally {
            session.close();
        }

    }
}
