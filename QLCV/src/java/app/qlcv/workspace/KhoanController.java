/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.MemberInfoWorkspaceSummary;
import app.qlcv.customs.Milestone;
import app.qlcv.customs.TeamAndMember;
import app.qlcv.customs.TkWsTaskListCustom;
import app.qlcv.entities.*;
import app.qlcv.utils.HibernateUtil;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
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
public class KhoanController {

    Session session;
    Transaction transaction;

    public KhoanController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List<LuongKhoan> getLuongKhoanByUserId(int userId) {
        List<LuongKhoan> luongkhoan = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM LuongKhoan WHERE userId=:userId ORDER BY createDate ASC, thang ASC");
            q.setParameter("userId", userId);
            luongkhoan = q.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return luongkhoan;
    }
    public List<LuongKhoan> getLuongKhoanByUserIdByMonth(int userId, int month, int year) {
        List<LuongKhoan> luongkhoan = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM LuongKhoan WHERE userId=:userId and thang=:month and year(create_date)=:year ORDER BY createDate ASC, thang ASC");
            q.setParameter("userId", userId);
            q.setParameter("month", month);
            q.setParameter("year", year);
            luongkhoan = q.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return luongkhoan;
    }

    public void saveKhoan(List<LuongKhoan> luongKhoans) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < luongKhoans.size(); i++) {
                LuongKhoan get = luongKhoans.get(i);
                session.save(get);
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

    }

    public List<Milestone> GetMilestonesClose() {
        List<Milestone> lst = new ArrayList<>();
        List<Object[]> listResult = new ArrayList<>();
        try {
            String Sql = " select cast(A.id as UNSIGNED ) MILESTONES_ID, a.milestones_tienkhoan from tk_ws_folder a where a.isMilestones='Y'and \n"
                    + " EXTRACT(MONTH FROM a.milestones_close_date) = MONTH(CURDATE()) and EXTRACT(YEAR FROM a.milestones_close_date)=YEAR(CURDATE())\n"
                    + " and status = 'CLOSE' AND A.milestones_close_date < A.milestones_end_date";

            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery(Sql);
            listResult = query.list();
            for (Object[] row : listResult) {
                Milestone m = new Milestone();
                m.setMilestoneid(((BigInteger) row[0]).intValue());
                m.setTienKhoan((BigDecimal) row[1]);
                lst.add(m);
            }

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lst;
    }

    public List<Integer> GetUserMilestonesClose(int mileStoneId) {
        List<Integer> listResult = new ArrayList<>();
        try {
            String Sql = " select distinct b.user_id from tk_ws_tasklist a join tk_ws_task_raci b on a.id=b.tk_ws_tasklist_id\n"
                    + " where a.tk_ws_folder_id=:mileStoneId";

            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery(Sql);
            query.setParameter("mileStoneId", mileStoneId);
            listResult = query.list();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return listResult;
    }
}
