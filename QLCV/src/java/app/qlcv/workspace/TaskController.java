/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.MemberInfoWorkspaceSummary;
import app.qlcv.customs.TeamAndMember;
import app.qlcv.customs.TkWsTaskListCustom;
import app.qlcv.entities.*;
import app.qlcv.utils.HibernateUtil;
import java.io.PrintWriter;
import java.io.StringWriter;
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
public class TaskController {

    Session session;
    Transaction transaction;

    public TaskController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public String updateTask(TkWsTask task) {
        TkWorkspace tw = new TkWorkspace();
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(task);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            error = errors.toString();
        } finally {
            session.close();
        }
        return error;

    }

    public List<TkWsTask> GetAllTaskByUserId(int userId, String status) {
        List<TkWsTask> lstTasks = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String q = "FROM TkWsTask a where a.assigneeUserId=:userId ";
            if (!"all".equals(status)) {
                q = q + "and status ='" + status.toUpperCase() + "'";
            }
            if ("DELAY".equals(status)) {
                q = q + " and a.status NOT IN ('CLOSE','CANCEL') and a.dueDate < sysdate()";
            }
            Query query = session.createQuery(q);
            query.setParameter("userId", userId);
            lstTasks = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTasks;
    }

    public List<TkWsTask> getAllTaskPendingRating(int userId) {
        List<TkWsTask> lstTasks = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String q = "FROM TkWsTask a where a.reviewBy=:userId and status='COMPLETE'";
            Query query = session.createQuery(q);
            query.setParameter("userId", userId);
            lstTasks = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTasks;
    }

    public List<TkWorkspace> soDuAnThamGiaByUserId(int userId) {
        List<TkWsPeople> lstList = new ArrayList<>();
        List<TkWorkspace> lstWorkspaces = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String q = "FROM TkWsPeople a where a.userId=:userId and status='ACTIVE'";
            Query query = session.createQuery(q);
            query.setParameter("userId", userId);
            lstList = query.list();
            if (lstList != null && lstList.size() > 0) {
                for (int i = 0; i < lstList.size(); i++) {
                    TkWsPeople get = lstList.get(i);
                    TkWorkspace workspace = new TkWorkspace();
                    workspace = (TkWorkspace) session.get(TkWsTasklist.class, get.getTkWorkspace().getId());
                    if ("ACTIVE".equals(workspace.getStatus())) {
                        lstWorkspaces.add(workspace);
                    }
                }

            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstWorkspaces;
    }

    public List<TkWsTask> GetAllTaskByWorkspaceId(int workspaceId) {
        List<TkWsTask> lstTasks = new ArrayList<>();
        List<TkWsTasklist> lstTasklists = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTasklist WHERE tkWorkspace.id =:workspaceId");
            query.setParameter("workspaceId", workspaceId);
            lstTasklists = query.list();

            for (int i = 0; i < lstTasklists.size(); i++) {
                List<TkWsTask> task = new ArrayList<>();
                Query q = session.createQuery("FROM TkWsTask WHERE tkWsTasklist.id =:tasklistID AND isSubTask ='N'");
                q.setParameter("tasklistID", lstTasklists.get(i).getId());
                task = q.list();
                lstTasks.addAll(task);
            }

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTasks;
    }
    
    public List<TkWsTask> GetAllTaskByWorkspaceIdForEVM(int workspaceId) {
        List<TkWsTask> lstTasks = new ArrayList<>();
        List<TkWsTasklist> lstTasklists = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTasklist WHERE tkWorkspace.id =:workspaceId");
            query.setParameter("workspaceId", workspaceId);
            lstTasklists = query.list();

            for (int i = 0; i < lstTasklists.size(); i++) {
                List<TkWsTask> task = new ArrayList<>();
                Query q = session.createQuery("FROM TkWsTask WHERE tkWsTasklist.id =:tasklistID AND isSubTask ='N' "
                        + "and (percentCoplete is null or percentCoplete < 100) "
                        + "  ");
                q.setParameter("tasklistID", lstTasklists.get(i).getId());
                task = q.list();
                lstTasks.addAll(task);
            }

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTasks;
    }
    
    public String updateListTask(List<TkWsTask> lstTask) {
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < lstTask.size(); i++) {
                TkWsTask task = lstTask.get(i);
                session.update(task);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            error = errors.toString();
        } finally {
            session.close();
        }
        return error;

    }

}
