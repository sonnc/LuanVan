/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.kpi;

import app.qlcv.customs.*;
import app.qlcv.entities.*;
import app.qlcv.utils.HibernateUtil;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author sonng
 */
public class AdminKpiController {

    Session session;
    Transaction transaction;

    public AdminKpiController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List<TkUser> getAllUser() {
        List<TkUser> lstLogin = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkUser ");
            lstLogin = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstLogin;
    }

    public TkUser getUserById(int userId) {
        TkUser tkUser = new TkUser();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            tkUser = (TkUser) session.get(TkUser.class, userId);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tkUser;
    }

    public boolean deleteUser(TkUser user) {
        boolean success = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            success = false;
            e.printStackTrace();
        } finally {
            session.close();
        }
        return success;
    }

    public List<TkDepartment> getAllDepartments() {
        List<TkDepartment> lstTkDepartment = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkDepartment ");
            lstTkDepartment = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTkDepartment;
    }

    public List<TkRatingDateSetup> getAllKpiRatingDate() {
        List<TkRatingDateSetup> lstTkDepartment = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkRatingDateSetup order by id desc");
            lstTkDepartment = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTkDepartment;
    }

    public boolean createKpiRatingDate(TkRatingDateSetup tkRatingDateSetup) {
        boolean check = true;
        List<TkRatingDateSetup> lstTkRatingDateSetups = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkRatingDateSetup");
            lstTkRatingDateSetups = query.list();
            for (int i = 0; i < lstTkRatingDateSetups.size(); i++) {
                TkRatingDateSetup get = lstTkRatingDateSetups.get(i);
                if ("ACTIVE".equals(get.getStatus())) {
                    get.setStatus("INACTIVE");
                    session.update(get);
                }

            }
            session.save(tkRatingDateSetup);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            check = false;
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }

    public TkDepartment getDepartmentsByID(int id) {
        TkDepartment department = new TkDepartment();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            department = (TkDepartment) session.get(TkDepartment.class, id);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return department;
    }

    public List<TkUser> getAllUserByDepartmentId(int departmentId) {
        List<TkUser> lstTkUserLogin = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkUser where tkDepartment.id =:departmentId");
            query.setParameter("departmentId", departmentId);
            lstTkUserLogin = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTkUserLogin;
    }

    public boolean updateDepartment(TkDepartment department) {
        boolean success = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(department);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            success = false;
            e.printStackTrace();
        } finally {
            session.close();
        }
        return success;
    }

    public boolean saveDepartment(TkDepartment department) {
        boolean success = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(department);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            success = false;
            e.printStackTrace();
        } finally {
            session.close();
        }
        return success;
    }

    public List<TkKpiTypeSetting> getAllKpiTypeSetting() {
        List<TkKpiTypeSetting> lstKpiTypeSettings = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkKpiTypeSetting");
            lstKpiTypeSettings = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstKpiTypeSettings;
    }

    public List<TkKpiItemSetting> viewKpiDetail(int id) {
        List<TkKpiItemSetting> lstKpiItemSettings = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkKpiItemSetting WHERE tkKpiTypeSetting.id=:id and status='ACTIVE' order by type ASC");
            query.setParameter("id", id);
            lstKpiItemSettings = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstKpiItemSettings;
    }

    public boolean createGroupKPI(TkKpiTypeSetting tkKpiTypeSetting, List<TkKpiItemSetting> lstKpiItemSettings) {
        boolean success = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            int tkKpiTypeId = (int) session.save(tkKpiTypeSetting);
            tkKpiTypeSetting.setId(tkKpiTypeId);
            for (TkKpiItemSetting lstKpiItemSetting : lstKpiItemSettings) {
                lstKpiItemSetting.setTkKpiTypeSetting(tkKpiTypeSetting);
                session.save(lstKpiItemSetting);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            success = false;
            e.printStackTrace();
        } finally {
            session.close();
        }
        return success;
    }

    public TkKpiTypeSetting getKpiTypeSettingById(int kpiID) {
        TkKpiTypeSetting kpiTypeSetting = new TkKpiTypeSetting();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            kpiTypeSetting = (TkKpiTypeSetting) session.get(TkKpiTypeSetting.class, kpiID);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return kpiTypeSetting;
    }

    public boolean updateKpiTypeSeting(TkKpiTypeSetting tkKpiTypeSetting) {
        boolean success = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(tkKpiTypeSetting);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            success = false;
            e.printStackTrace();
        } finally {
            session.close();
        }
        return success;
    }

    public List<TkKpiItemSetting> prepareEditKpiSetting(int kpiTypeId, String type) {
        List<TkKpiItemSetting> lstKpiItemSettings = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkKpiItemSetting WHERE tkKpiTypeSetting.id=:id and type=:type and status='ACTIVE'");
            query.setParameter("id", kpiTypeId);
            query.setParameter("type", type);
            lstKpiItemSettings = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstKpiItemSettings;
    }

    public boolean editKpiSetting(List<TkKpiItemSetting> add, List<TkKpiItemSetting> remove, List<TkKpiItemSetting> update,
            String type, int kpiTypeId, TkUser tkCreate, java.sql.Date sysDate
    ) {

        List<TkKpiItemSetting> lstAdd = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            List<TkKpiItem> lstKpiItems = new ArrayList<>();
            Query q = session.createQuery("FROM TkKpiItem a where a.kpiItem=:type and a.refId=:kpiTypeId and status='ACTIVE' ");
            q.setParameter("type", type);
            q.setParameter("kpiTypeId", kpiTypeId);
            lstKpiItems = q.list();

            for (int i = 0; i < add.size(); i++) {
                TkKpiItemSetting ad = add.get(i);
                int id = (int) session.save(ad);
                ad.setId(id);
                lstAdd.add(ad);
            }

            if (lstKpiItems != null && lstKpiItems.size() > 0) {
                for (int j = 0; j < lstKpiItems.size(); j++) {
                    TkKpiItem get = lstKpiItems.get(j);

                    for (int i = 0; i < lstAdd.size(); i++) {
                        TkKpiItemDetail tkKpiItemDetail = new TkKpiItemDetail();
                        tkKpiItemDetail.setCreateBy(tkCreate.getLoginId());
                        tkKpiItemDetail.setLastUpdateBy(tkCreate.getLoginId());
                        tkKpiItemDetail.setCreateDate(sysDate);
                        tkKpiItemDetail.setLastUpdateDate(sysDate);
                        tkKpiItemDetail.setKpiName(lstAdd.get(i).getKpiName());
                        tkKpiItemDetail.setKpiDesc(lstAdd.get(i).getKpiDesc());
                        tkKpiItemDetail.setItem(lstAdd.get(i).getItem());
                        tkKpiItemDetail.setDonViTinh(lstAdd.get(i).getDonViTinh());
                        tkKpiItemDetail.setTanSuatDanhGia(lstAdd.get(i).getTanSuatDanhGia());
                        tkKpiItemDetail.setTrongSo(lstAdd.get(i).getTrongSo());
                        tkKpiItemDetail.setStatus("ACTIVE");
                        tkKpiItemDetail.setRefId(lstAdd.get(i).getId());
                        tkKpiItemDetail.setTkKpiItem(get);
                        session.save(tkKpiItemDetail);
                    }

                }

            }

            for (int i = 0; i < remove.size(); i++) {
                TkKpiItemSetting re = remove.get(i);
                session.update(re);
                Query q1 = session.createQuery("UPDATE FROM TkKpiItemDetail a set a.status = 'INACTIVE' where a.refId=:refId ");
                q1.setParameter("refId", re.getId());
                q1.executeUpdate();
            }

            DecimalFormat df2 = new DecimalFormat("#.##");
            for (int i = 0; i < update.size(); i++) {
                TkKpiItemSetting up = update.get(i);
                session.update(up);
                List<TkKpiItemDetail> lstKpiItemDetails = new ArrayList<>();
                Query q2 = session.createQuery("FROM TkKpiItemDetail a where a.refId=:refId and a.status='ACTIVE'");
                q2.setParameter("refId", up.getId());
                lstKpiItemDetails = q2.list();
                if (lstKpiItemDetails != null && lstKpiItemDetails.size() > 0) {
                    for (int j = 0; j < lstKpiItemDetails.size(); j++) {
                        TkKpiItemDetail tkKpiItemDetail = lstKpiItemDetails.get(j);
                        tkKpiItemDetail.setLastUpdateBy(tkCreate.getLoginId());
                        tkKpiItemDetail.setLastUpdateDate(sysDate);
                        tkKpiItemDetail.setKpiName(up.getKpiName());
                        tkKpiItemDetail.setKpiDesc(up.getKpiDesc());
                        tkKpiItemDetail.setItem(up.getItem());
                        tkKpiItemDetail.setDonViTinh(up.getDonViTinh());
                        tkKpiItemDetail.setTanSuatDanhGia(up.getTanSuatDanhGia());
                        tkKpiItemDetail.setTrongSo(up.getTrongSo());
                        tkKpiItemDetail.setRefId(up.getId());

                        double value = (tkKpiItemDetail.getKetQuaThucHien() / up.getItem()) * up.getTrongSo();
                        String t = df2.format(value);
                        value = Double.parseDouble(t);
                        tkKpiItemDetail.setTyLeThucHien(value);
                        session.update(tkKpiItemDetail);

                    }
                }

            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return true;
    }

    public boolean editWeightKpiTypeSetting(TkKpiTypeSetting kpiTypeSetting) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(kpiTypeSetting);

            Query q1 = session.createQuery("UPDATE TkKpiItem a set a.trongSo=:trongso where  a.kpiItem='BO_PHAN' AND STATUS = 'ACTIVE'");
            q1.setParameter("trongso", kpiTypeSetting.getTrongSoKpiPhongban());
            Query q2 = session.createQuery("UPDATE TkKpiItem a set a.trongSo=:trongso where  a.kpiItem='THUONG_XUYEN' AND STATUS = 'ACTIVE'");
            q2.setParameter("trongso", kpiTypeSetting.getTrongSoKpiThuongxuyen());
            Query q3 = session.createQuery("UPDATE TkKpiItem a set a.trongSo=:trongso where  a.kpiItem='DOT_XUAT' AND STATUS = 'ACTIVE'");
            q3.setParameter("trongso", kpiTypeSetting.getTrongSoKpiDotxuat());
            q1.executeUpdate();
            q2.executeUpdate();
            q3.executeUpdate();
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return true;
    }

}
