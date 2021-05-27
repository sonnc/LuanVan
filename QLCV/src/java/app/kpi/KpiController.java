/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.kpi;

import app.qlcv.entities.TkKpiItem;
import app.qlcv.entities.TkKpiItemDetail;
import app.qlcv.entities.TkKpiItemDetailRating;
import app.qlcv.entities.TkKpiItemSetting;
import app.qlcv.entities.TkKpiTypeSetting;
import app.qlcv.entities.TkRatingDateSetup;
import app.qlcv.entities.TkUser;
import app.qlcv.customs.MapTkUserDetail;
import app.qlcv.customs.UserKpiMapper;
import app.qlcv.utils.HibernateUtil;
import app.qlcv.utils.Contants;
import java.math.BigInteger;
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
public class KpiController {

    Session session;
    Transaction transaction;
    Contants cont;

    public KpiController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List<TkKpiTypeSetting> viewKpiOfDepartement(int deparmentId) {
        List<TkKpiTypeSetting> lstKpiTypeSettings = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkKpiTypeSetting WHERE tkDepartment.id=:deparmentId  and status='ACTIVE'");
            query.setParameter("deparmentId", deparmentId);
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
            Query query = session.createQuery("FROM TkKpiItemSetting WHERE tkKpiTypeSetting.id=:id and status='ACTIVE'");
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

    public List<UserKpiMapper> getAllStaffKpi(int phongBan, int year) {
        List<UserKpiMapper> lstKpiMappers = new ArrayList<>();
        List<Object[]> listResult = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery(cont.SQL_TK_KPI_01);
            query.setParameter("phongBan", phongBan);
            query.setParameter("year", year);
            listResult = query.list();
            for (Object[] row : listResult) {
                UserKpiMapper kpi = new UserKpiMapper(
                        (BigInteger) row[0],
                        (int) row[1],
                        (int) row[2],
                        (String) row[3],
                        (String) row[4],
                        (String) row[5],
                        (String) row[6],
                        (String) row[7]
                );
                lstKpiMappers.add(kpi);
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
        return lstKpiMappers;
    }

    public TkUser getUserInfo(int userID) {

        TkUser tku = new TkUser();
        List<Object[]> listResult = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            tku = (TkUser) session.get(TkUser.class, userID);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tku;
    }

    public TkKpiTypeSetting getKpiById(int kpiId) {
        TkKpiTypeSetting kpiTypeSetting = new TkKpiTypeSetting();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            kpiTypeSetting = (TkKpiTypeSetting) session.get(TkKpiTypeSetting.class, kpiId);
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

    public boolean createKpiForStaff(List<TkKpiItem> lstTkKpiItems,
            List<TkKpiItemDetail> lstTkKpiItemDetailPhongBan,
            List<TkKpiItemDetail> lstTkKpiItemDetailThuongXuyen,
            List<TkKpiItemDetail> lstTkKpiItemDetailDotXuat) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            for (int i = 0; i < lstTkKpiItems.size(); i++) {
                TkKpiItem tkKpiItem = new TkKpiItem();
                tkKpiItem = (TkKpiItem) lstTkKpiItems.get(i);
                int tkKpiItemId = (int) session.save(tkKpiItem);
                tkKpiItem.setId(tkKpiItemId);

                if ("BO_PHAN".equals(lstTkKpiItems.get(i).getKpiItem())) {
                    for (int j = 0; j < lstTkKpiItemDetailPhongBan.size(); j++) {
                        TkKpiItemDetail tkKpiItemDetail = (TkKpiItemDetail) lstTkKpiItemDetailPhongBan.get(j);
                        tkKpiItemDetail.setTkKpiItem(tkKpiItem);
                        session.save(tkKpiItemDetail);
                    }
                } else if ("THUONG_XUYEN".equals(lstTkKpiItems.get(i).getKpiItem())) {
                    for (int j = 0; j < lstTkKpiItemDetailThuongXuyen.size(); j++) {
                        TkKpiItemDetail tkKpiItemDetail = (TkKpiItemDetail) lstTkKpiItemDetailThuongXuyen.get(j);
                        tkKpiItemDetail.setTkKpiItem(tkKpiItem);
                        session.save(tkKpiItemDetail);
                    }
                } else if ("DOT_XUAT".equals(lstTkKpiItems.get(i).getKpiItem())) {
                    for (int j = 0; j < lstTkKpiItemDetailDotXuat.size(); j++) {
                        TkKpiItemDetail tkKpiItemDetail = (TkKpiItemDetail) lstTkKpiItemDetailDotXuat.get(j);
                        tkKpiItemDetail.setTkKpiItem(tkKpiItem);
                        session.save(tkKpiItemDetail);
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

    public List<TkKpiItem> getKpiForStaffById(int userId, int year) {
        List<TkKpiItem> lstTkKpiItems = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkKpiItem WHERE tkUser.id=:userId and kpiYear=:year and status='ACTIVE'");
            query.setParameter("userId", userId);
            query.setParameter("year", year);
            lstTkKpiItems = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTkKpiItems;
    }

    public TkKpiItemDetail getKpiItemDetailById(int kpiItemId) {
        TkKpiItemDetail kpi = new TkKpiItemDetail();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            kpi = (TkKpiItemDetail) session.get(TkKpiItemDetail.class, kpiItemId);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return kpi;
    }

    public TkKpiItemDetailRating getKpiItemDetailRatingById(int kpiItemRatingId) {
        TkKpiItemDetailRating kpi = new TkKpiItemDetailRating();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            kpi = (TkKpiItemDetailRating) session.get(TkKpiItemDetailRating.class, kpiItemRatingId);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return kpi;
    }

    public List<TkKpiItemDetailRating> getListKpiItemDetailRatingById(int kpiItemDetailId, String status) {
        List<TkKpiItemDetailRating> lstKpiRating = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM TkKpiItemDetailRating a where a.status=:status AND tkKpiItemDetail.id =:kpiItemDetailId ");
            q.setParameter("status", status);
            q.setParameter("kpiItemDetailId", kpiItemDetailId);
            lstKpiRating = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstKpiRating;
    }

    public boolean saveKpiItemDetailRating(List<TkKpiItemDetailRating> lstKpiItemDetailRatings) {
        boolean check = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < lstKpiItemDetailRatings.size(); i++) {
                TkKpiItemDetailRating rating = (TkKpiItemDetailRating) lstKpiItemDetailRatings.get(i);
                session.save(rating);
            }
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

    public boolean updateKpiRating(int key, TkKpiItemDetail itemDetail, TkKpiItemDetailRating detailRating) {
        boolean check = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            if (key == 0) {
                session.update(detailRating);
            } else {
                session.update(detailRating);
                session.update(itemDetail);
            }
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

    public TkRatingDateSetup getListTimeDateRating() {
        TkRatingDateSetup tkRatingDateSetup = new TkRatingDateSetup();
        List<TkRatingDateSetup> lstKpiRating = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM TkRatingDateSetup where status='ACTIVE'");
            lstKpiRating = q.list();
            if (lstKpiRating.size() > 0) {
                tkRatingDateSetup = lstKpiRating.get(0);
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
        return tkRatingDateSetup;
    }

    public TkUser getTkUserForUserOtherSource(String loginId) {
        List<TkUser> lstUsers = new ArrayList<>();
        TkUser user = new TkUser();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM TkUser a where a.loginId=:loginId");
            q.setParameter("loginId", loginId);
            lstUsers = q.list();
            if (lstUsers.size() > 0) {
                user = lstUsers.get(0);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }

    public TkKpiItem getKPIForUserOtherSource(int userId, int year) {
        TkKpiItem kpiItem = new TkKpiItem();
        List<TkKpiItem> lstKpiItems = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkKpiItem a where a.tkUser.id=:userId and a.kpiYear=:year and a.kpiItem='BO_PHAN'");
            query.setParameter("userId", userId);
            query.setParameter("year", year);
            lstKpiItems = query.list();
            if (lstKpiItems.size() > 0) {
                kpiItem = lstKpiItems.get(0);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return kpiItem;
    }

    public TkKpiItem CreateKpiItemForUserOtherSource(TkKpiItem kpiItem) {
        List<TkKpiItem> lstKpiItems = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            int id = (int) session.save(kpiItem);
            kpiItem.setId(id);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return kpiItem;
    }
    
    public void UpdateKpiItemForUserOtherSource(int kpiItemId) {
        List<TkKpiItem> lstKpiItems = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("UPDATE tk_kpi_item_detail A SET A.STATUS='INACTIVE' WHERE A.TK_KPI_ITEM_ID=:kpiItemId");
            q.setParameter("kpiItemId", kpiItemId);
            q.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

}
