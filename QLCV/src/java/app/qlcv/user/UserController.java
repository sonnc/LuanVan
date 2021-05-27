/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.user;

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
public class UserController {
    
    Session session;
    Transaction transaction;

    public UserController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }
    
    public List<TkUser> userLogin(String email, String pass) {
        List<TkUser> lstLogin = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkUser WHERE loginId =:email and password =:pass");
            query.setParameter("email", email);
            query.setParameter("pass", pass);
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
    
}
