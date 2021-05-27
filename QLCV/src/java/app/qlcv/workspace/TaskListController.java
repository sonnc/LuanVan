/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.MemberInfoWorkspaceSummary;
import app.qlcv.customs.TeamAndMember;
import app.qlcv.customs.TkWsTaskCustom;
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
public class TaskListController {

    Session session;
    Transaction transaction;

    public TaskListController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public String createTaskListWithFolder(TkWsFolder folder, List<TkWsTasklist> lsTasklists) {
        TkWorkspace tw = new TkWorkspace();
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            try {
                int idFoler = (int) session.save(folder);
                folder.setId(idFoler);
                if (idFoler > 0) {
                    for (int i = 0; i < lsTasklists.size(); i++) {
                        TkWsTasklist get = lsTasklists.get(i);
                        get.setTkWsFolder(folder);
                        session.save(get);
                    }
                    transaction.commit();
                }
            } catch (Exception e) {
                transaction.rollback();
            }
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

    public String createTaskList(TkWsTasklist tasklists) {
        TkWorkspace tw = new TkWorkspace();
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(tasklists);
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

    public String createTaskListWithList(List<TkWsTasklist> tasklists) {
        TkWorkspace tw = new TkWorkspace();
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < tasklists.size(); i++) {
                session.save(tasklists.get(i));
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

    public TkWsTasklist GetTaskListById(int taskListId) {
        TkWsTasklist task = new TkWsTasklist();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            task = (TkWsTasklist) session.get(TkWsTasklist.class, taskListId);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return task;
    }

    public String createListRaci(List<TkWsTaskRaci> lstRacis) {
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < lstRacis.size(); i++) {
                session.save(lstRacis.get(i));
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

    public TkWsFolder GetFolderByForderId(int folderId) {
        TkWsFolder f = new TkWsFolder();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            f = (TkWsFolder) session.get(TkWsFolder.class, folderId);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return f;
    }

    public List<TkWsTask> GetAllTaskByTaskListId(int taskListId) {
        List<TkWsTask> lstTasks = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTask WHERE tkWsTasklist.id =:taskListId and status <> 'DELETE'");
            query.setParameter("taskListId", taskListId);
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

    public List<TkWsTaskListCustom> GetAllTaskListWithTaskByWorkspaceId(int workspaceId) {
        List<TkWsTaskListCustom> lstTasklistsCustoms = new ArrayList<>();
        List<TkWsTasklist> lstTasklists = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTasklist WHERE tkWorkspace.id =:workspaceId and status = 'ACTIVE' ");
            query.setParameter("workspaceId", workspaceId);
            lstTasklists = query.list();

            for (int i = 0; i < lstTasklists.size(); i++) {
                List<TkWsTaskRaci> lstRacis = new ArrayList<>();
                List<TkWsTask> task = new ArrayList<>();
                Query q = session.createQuery("FROM TkWsTask WHERE tkWsTasklist.id =:tasklistID AND isSubTask ='N' and status <> 'DELETE'");
                q.setParameter("tasklistID", lstTasklists.get(i).getId());
                task = q.list();

                Query q2 = session.createQuery("FROM TkWsTaskRaci WHERE tkWsTasklist.id =:tasklistID and status = 'ACTIVE' ");
                q2.setParameter("tasklistID", lstTasklists.get(i).getId());
                lstRacis = q2.list();

                List<TkWsTaskCustom> lstTaskCustoms = new ArrayList<>();
                for (int j = 0; j < task.size(); j++) {
                    TkWsTaskCustom twtc = new TkWsTaskCustom();
                    twtc.setTask(task.get(j));
                    TkUser assigneeUser = new TkUser();
                    assigneeUser = (TkUser) session.get(TkUser.class, task.get(j).getAssigneeUserId());
                    twtc.setAssigneeUser(assigneeUser);
                    TkUser reviewByUser = new TkUser();
                    reviewByUser = (TkUser) session.get(TkUser.class, task.get(j).getReviewBy());
                    twtc.setReviewByUser(reviewByUser);
                    lstTaskCustoms.add(twtc);
                }
                TkWsTaskListCustom taskCustome = new TkWsTaskListCustom(
                        lstTasklists.get(i).getId(),
                        lstTasklists.get(i).getTkWsFolder(),
                        lstRacis,
                        lstTasklists.get(i).getTaskListTitle(),
                        lstTasklists.get(i).getTaskListDesc(),
                        lstTasklists.get(i).getTimeEstimate(),
                        lstTasklists.get(i).getTimeEstimateDdl(),
                        lstTasklists.get(i).getDueDate(),
                        lstTasklists.get(i).getPriority(),
                        lstTasklists.get(i).getStatus(),
                        lstTasklists.get(i).getCreateBy(),
                        lstTasklists.get(i).getLastUpdateBy(),
                        lstTasklists.get(i).getCreateDate(),
                        lstTasklists.get(i).getLastUpdateDate(),
                        lstTaskCustoms);
                lstTasklistsCustoms.add(taskCustome);
            }

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTasklistsCustoms;
    }

    public List<TkUser> getAllRaciR(int taskListId) {
        List<TkWsTaskRaci> lstTasksRacis = new ArrayList<>();
        List<TkUser> lstuser = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTaskRaci WHERE tkWsTasklist.id =:taskListId and status='ACTIVE' and raciR is not null");
            query.setParameter("taskListId", taskListId);
            lstTasksRacis = query.list();
            List<Integer> lstIntegers = new ArrayList<>();
            for (int i = 0; i < lstTasksRacis.size(); i++) {
                lstIntegers.add(lstTasksRacis.get(i).getUserId());
            }
            if (lstIntegers.size() > 0) {
                Query q = session.createQuery("FROM TkUser WHERE id in (:userIdList) and status = 'ACTIVE' ");
                q.setParameterList("userIdList", lstIntegers);
                lstuser = q.list();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstuser;
    }

    public List<TkWsTaskRaci> getAllRaciAndView(int taskListId) {
        List<TkWsTaskRaci> lstTasksRacis = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTaskRaci WHERE tkWsTasklist.id =:taskListId and status='ACTIVE'");
            query.setParameter("taskListId", taskListId);
            lstTasksRacis = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTasksRacis;
    }

    public TkUser getUserById(int userid) {
        TkUser user = new TkUser();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            user = (TkUser) session.get(TkUser.class, userid);
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

    public TkWsTask GetTaskById(int taskId) {
        TkWsTask task = new TkWsTask();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            task = (TkWsTask) session.get(TkWsTask.class, taskId);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return task;
    }

    public String createTask(TkWsTask task, List<SysUdfFieldValue> lstUdf,
            List<TkWsTaskChecklist> lstChecklists, List<TkWsTaskChecklistItem> lstChecklistItems,
            TkWsComment comment, List<TkWsAttachments> lstAttachments) {
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            int taskId = (int) session.save(task);

            if (taskId > 0) {
                task.setId(taskId);
                for (int i = 0; i < lstUdf.size(); i++) {
                    SysUdfFieldValue sufv = lstUdf.get(i);
                    sufv.setRefId(taskId);
                    session.save(sufv);
                }

                for (int i = 0; i < lstChecklists.size(); i++) {
                    TkWsTaskChecklist checklist = lstChecklists.get(i);
                    checklist.setTkWsTask(task);
                    int checkListId = (int) session.save(checklist);
                    checklist.setId(checkListId);
                    for (int j = 0; j < lstChecklistItems.size(); j++) {
                        TkWsTaskChecklistItem checklistItem = lstChecklistItems.get(j);
                        if (checklist.getCheckListName().equals(checklistItem.getTkWsTaskChecklist().getCheckListName())) {
                            checklistItem.setTkWsTaskChecklist(checklist);
                            session.save(checklistItem);
                        }

                    }

                }

                for (int i = 0; i < lstAttachments.size(); i++) {
                    TkWsAttachments get = lstAttachments.get(i);
                    get.setTaskId(taskId);
                    session.save(get);
                }
                comment.setTaskId(taskId);
                session.save(comment);

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

    public List<TkWsTask> GetAllSubTaskByTaskId(int taskId) {
        List<TkWsTask> lstTasks = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTask WHERE parentTaskId =:taskId and isSubTask='Y' and status <> 'DELETE'");
            query.setParameter("taskId", taskId);
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

    public List<SysUdfFieldValue> GetAllUDFByTaskId(int taskId) {
        List<SysUdfFieldValue> lstTasks = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM SysUdfFieldValue WHERE refId =:taskId and status='ACTIVE'");
            query.setParameter("taskId", taskId);
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

    public List<TkWsTaskChecklist> GetAllCheckListByTaskId(int taskId) {
        List<TkWsTaskChecklist> lstChecklists = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTaskChecklist WHERE tkWsTask.id =:taskId and checkListStatus='ACTIVE'");
            query.setParameter("taskId", taskId);
            lstChecklists = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstChecklists;
    }

    public List<TkWsTaskChecklistItem> GetAllCheckListItemByCheckListId(List<Integer> checklistID) {
        List<TkWsTaskChecklistItem> lstChecklists = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTaskChecklistItem WHERE tkWsTaskChecklist.id in (:checklistID) and itemStatus='ACTIVE'");
            query.setParameterList("checklistID", checklistID);
            lstChecklists = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstChecklists;
    }

    public List<TkWsAttachments> GetAllAttachmentByTaskId(int taskId) {
        List<TkWsAttachments> lstAttachmentses = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsAttachments WHERE taskId=:taskId and fileStatus='ACTIVE'");
            query.setParameter("taskId", taskId);
            lstAttachmentses = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstAttachmentses;
    }

    public List<TkWsComment> GetAllCommentByTaskId(int taskId) {
        List<TkWsComment> lstComments = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsComment WHERE taskId=:taskId and status='ACTIVE'");
            query.setParameter("taskId", taskId);
            lstComments = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstComments;
    }

    public String createUdf(List<SysUdfFieldValue> lstUdf) {
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < lstUdf.size(); i++) {
                session.save(lstUdf.get(i));
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

    public String deleteUdf(int udfId) {
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE SysUdfFieldValue set status='INACTIVE' where id=:udfId");
            q.setParameter("udfId", udfId);
            q.executeUpdate();
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

    public void createCheckList(List<TkWsTaskChecklist> lstChecklists, List<TkWsTaskChecklistItem> lstChecklistItems) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < lstChecklists.size(); i++) {
                TkWsTaskChecklist checklist = lstChecklists.get(i);
                int checkListId = (int) session.save(checklist);
                checklist.setId(checkListId);
                for (int j = 0; j < lstChecklistItems.size(); j++) {
                    TkWsTaskChecklistItem checklistItem = lstChecklistItems.get(j);
                    if (checklist.getCheckListName().equals(checklistItem.getTkWsTaskChecklist().getCheckListName())) {
                        checklistItem.setTkWsTaskChecklist(checklist);
                        session.save(checklistItem);
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
    }

    public String deleteCheckList(int checkListId) {
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE TkWsTaskChecklist set checkListStatus='INACTIVE' where id=:checkListId");
            q.setParameter("checkListId", checkListId);
            q.executeUpdate();
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
    public void deleteAttachment(int attachmentID) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE TkWsAttachments set fileStatus='INACTIVE' where id=:attachmentID");
            q.setParameter("attachmentID", attachmentID);
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

    public void uploadFile(List<TkWsAttachments> lstAttachments) {
        String error = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            for (int i = 0; i < lstAttachments.size(); i++) {
                TkWsAttachments get = lstAttachments.get(i);
                session.save(get);
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
    }

    public void deleteTask(int taskid) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE TkWsTask set status='DELETE' where id=:taskid");
            q.setParameter("taskid", taskid);
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
