/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.sys;

import app.qlcv.user.*;
import app.qlcv.utils.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import app.qlcv.entities.*;
import java.math.BigInteger;

/**
 *
 * @author sonng
 */
public class CalculationFormulaController {

    Session session;
    Transaction transaction;

    public CalculationFormulaController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public void createNewParameter(List<ParameterSetup> lstParameterSetups) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < lstParameterSetups.size(); i++) {
                ParameterSetup ps = lstParameterSetups.get(i);
                session.saveOrUpdate(ps);
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

    public List<ParameterSetup> getAllParameter() {
        List<ParameterSetup> lstParameterSetups = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM ParameterSetup ps WHERE ps.status= 'ACTIVE'");
            lstParameterSetups = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstParameterSetups;
    }

    public ParameterSetup getSQLByParameter(String pa) {
        ParameterSetup ps = new ParameterSetup();
        List<ParameterSetup> lstList = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM ParameterSetup ps WHERE ps.paramterName=:pa ps.status= 'ACTIVE'");
            query.setParameter("pa", pa);
            lstList = query.list();
            if (lstList.size() > 0) {
                ps = lstList.get(0);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return ps;
    }

    public String getValueFromSQLParameter(String sql, int userId) {
        List<String> lst = new ArrayList<>();
        String value = "0";
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
            query.setParameter("userId", userId);
            lst = query.list();
            if (lst.size() > 0) {
                value = lst.get(0);
            }

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return value;
    }

    public void createFormula(Formula f) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(f);
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

    public List<Formula> getAllFormula() {
        List<Formula> lst = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Formula a WHERE a.status= 'ACTIVE'");
            lst = query.list();
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

    public Formula GetFormulaById(int id) {
        Formula tw = new Formula();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            tw = (Formula) session.get(Formula.class, id);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tw;
    }

}
