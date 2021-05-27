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

/**
 *
 * @author sonng
 */
public class CodeValueController {

    Session session;
    Transaction transaction;

    public CodeValueController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List<SysCodeSet> getAllCodeSet() {
        List<SysCodeSet> lstCodeSet = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM SysCodeSet");
            lstCodeSet = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstCodeSet;
    }

    // PHAN CODE SET
    public SysCodeSet getCodeSetById(int id) {
        SysCodeSet codeSet = new SysCodeSet();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            codeSet = (SysCodeSet) session.get(SysCodeSet.class, id);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return codeSet;
    }

    public boolean editCodeSetById(SysCodeSet codeSet) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(codeSet);
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
    // KET THUC CODE SET

    // PHAN CODE VALUE
    public SysCodeValue getCodeValueById(int id) {
        SysCodeValue codeValue = new SysCodeValue();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            codeValue = (SysCodeValue) session.get(SysCodeValue.class, id);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return codeValue;
    }

    public boolean editCodeValueById(SysCodeValue codeValue) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(codeValue);
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

    public boolean editCodeValueByList(int codeSetId, List<SysCodeValue> codeValue) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query =session.createQuery("UPDATE SysCodeValue SET status='INACTIVE' WHERE sysCodeSet.id=:codeSetId");
            query.setParameter("codeSetId", codeSetId);
            query.executeUpdate();
            for (int i = 0; i < codeValue.size(); i++) {
                SysCodeValue cv = new SysCodeValue();
                cv = codeValue.get(i);
                session.saveOrUpdate(cv);
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

    public List<SysCodeValue> getAllCodeValueByCodeSetId(int codeSetId) {
        List<SysCodeValue> lsCodeValues = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM SysCodeValue WHERE sysCodeSet.id=:codeSetId and status = 'ACTIVE'");
            query.setParameter("codeSetId", codeSetId);
            lsCodeValues = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lsCodeValues;
    }
    // KET THUC CODE VALUE

    // TAO MOI CODE SET VA CODE VALUE
    public boolean createNewCodeSetAndCodeValue(SysCodeSet codeSet, List<SysCodeValue> lstCodeValues) {
        int idCodeSet = 0;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            idCodeSet = (int) session.save(codeSet);
            if (idCodeSet > 0) {
                codeSet.setId(idCodeSet);
                for (SysCodeValue codeValue : lstCodeValues) {
                    codeValue.setSysCodeSet(codeSet);
                    session.save(codeValue);
                }
            } else {
                if (transaction != null) {
                    transaction.rollback();
                }
                return false;
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

}
