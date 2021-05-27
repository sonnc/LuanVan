/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.MemberInfoWorkspaceSummary;
import app.qlcv.customs.TeamAndMember;
import app.qlcv.customs.WorkspaceDashboard;
import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWorkspace;
import app.qlcv.entities.TkWsFolder;
import app.qlcv.entities.TkWsPeople;
import app.qlcv.entities.TkWsPeopleTeams;
import app.qlcv.entities.TkWsTask;
import app.qlcv.entities.TkWsTaskRaci;
import app.qlcv.entities.TkWsTasklist;
import app.qlcv.entities.TkWsTeams;
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
public class WorkspaceController {

    Session session;
    Transaction transaction;
    private String MEMBER_CACULATE = "select c.employee_no,c.full_name,c.email,c.mobile_number,\n"
            + "(select count(*) from tk_ws_task t where t.assignee_user_id = c.id) total_task,\n"
            + "(select count(*) from tk_ws_task t where t.assignee_user_id = c.id and t.status='OPEN') total_task_open,\n"
            + "(select count(*) from tk_ws_task t where t.assignee_user_id = c.id and t.status='INPROCESS') total_task_inprocess,\n"
            + "(select count(*) from tk_ws_task t where t.assignee_user_id = c.id and t.status='CLOSE') total_task_close,\n"
            + "(select count(*) from tk_ws_task t where t.assignee_user_id = c.id and t.status='CANCEL') total_task_cancel,\n"
            + "(select count(*) from tk_ws_task t where t.assignee_user_id = c.id and t.date_close > t.due_date and t.status <> 'CANCEL') total_task_delay,\n"
            + "(select sum(t.ngan_sach) from tk_ws_task t where t.assignee_user_id = c.id and t.date_close < t.due_date and t.status not in ('CANCEL','OPEN','INPROCESS')) total_amount\n"
            + "from tk_workspace a join tk_ws_people b on a.id = b.tk_workspace_id join tk_user c on b.user_id = c.id\n"
            + "where a.status='ACTIVE' and b.status='ACTIVE' and c.status='ACTIVE' and a.id=:workspaceId";

    private String GET_ALL_WORKSPACE_BY_USER = "select w.id, w.workspace_name, \n"
            + "(select full_name from tk_user where id = w.owner) full_name,\n"
            + "w.status, \n"
            + "(select count(*) from tk_ws_people where tk_workspace_id=w.id ) memberOfWS,\n"
            + "(select count(*) from (select distinct tk_ws_folder_id from tk_ws_tasklist l join tk_ws_folder f on l.tk_ws_folder_id = f.id where f.isMilestones='Y' and l.tk_workspace_id=w.id)x) count_milestone,\n"
            + "(select count(*) from tk_ws_task t join tk_ws_tasklist l on t.tk_ws_tasklist_id = l.id where l.tk_workspace_id=w.id ) count_task\n"
            + " from tk_workspace w join tk_ws_people p on w.id= p.tk_workspace_id\n"
            + "where p.status='ACTIVE' and p.user_id=:userId";

    private String CHAR_TASK_3 = "SELECT \n"
            + "COUNT(*) count_task\n"
            + " FROM tk_ws_tasklist a join tk_ws_folder b on a.tk_ws_folder_id = b.id join tk_ws_task c on a.id= c.tk_ws_tasklist_id\n"
            + " where A.STATUS='ACTIVE'  AND B.isMilestones = 'Y' and a.tk_workspace_ID=:workspaceId\n"
            + " union all\n"
            + " SELECT \n"
            + "COUNT(*) count_task\n"
            + " FROM tk_ws_tasklist a join tk_ws_folder b on a.tk_ws_folder_id = b.id join tk_ws_task c on a.id= c.tk_ws_tasklist_id\n"
            + " where a.status='ACTIVE' AND ( B.isMilestones <> 'Y' or B.isMilestones is null) and a.tk_workspace_ID=:workspaceId\n"
            + " union all\n"
            + " select count(*) count_task from tk_ws_tasklist a join tk_ws_task c on a.id= c.tk_ws_tasklist_id\n"
            + " where a.tk_ws_folder_id is null and a.tk_workspace_ID=:workspaceId";

    public WorkspaceController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List<TkWorkspace> GetWorkpaceByUserId(int userId) {
        List<TkWorkspace> lstWorkspaces = new ArrayList<>();
        List<TkWsPeople> lstTkWsPeoples = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM TkWsPeople WHERE id =:userId and status='ACTIVE' ");
            q.setParameter("userId", userId);
            lstTkWsPeoples = q.list();
            if (lstTkWsPeoples.size() > 0) {
                List<Integer> workpaceid = new ArrayList<>();
                for (int i = 0; i < lstTkWsPeoples.size(); i++) {
                    TkWsPeople get = lstTkWsPeoples.get(i);
                    workpaceid.add(get.getTkWorkspace().getId());
                }

                Query query = session.createQuery("FROM TkWorkspace WHERE id in (:workpaceid) and status = 'ACTIVE'");
                query.setParameterList("workpaceid", workpaceid);
                lstWorkspaces = query.list();
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

    public TkWorkspace GetWorkspaceById(int id) {
        TkWorkspace tw = new TkWorkspace();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            tw = (TkWorkspace) session.get(TkWorkspace.class, id);
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

    public List<TkUser> GetAllUserInDepartement(int departmentId) {
        List<TkUser> lstTkUsers = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkUser WHERE tkDepartment.id =:departmentId and status = 'ACTIVE'");
            query.setParameter("departmentId", departmentId);
            lstTkUsers = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTkUsers;
    }

    public String saveCreateWorkspace(TkWorkspace workspace, List<TkWsPeople> lstTkWsPeople) {
        String error = null;
        int idWorkspace = 0;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            idWorkspace = (int) session.save(workspace);
            if (idWorkspace > 0) {
                workspace.setId(idWorkspace);
                for (int i = 0; i < lstTkWsPeople.size(); i++) {
                    TkWsPeople get = lstTkWsPeople.get(i);
                    get.setTkWorkspace(workspace);
                    session.save(get);
                }
                transaction.commit();
                error = "CREATE_SUCCESS_WITH_ID=" + idWorkspace;
            } else {
                transaction.rollback();
                error = "Error: Cannot create Workspace !";
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

    public List<TkUser> lstUserActiveInWorkSpace(int workspaceId) {
        List<TkUser> lstTkUsers = new ArrayList<>();
        List<TkWsPeople> lstTkWsPeoples = new ArrayList<>();

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM TkWsPeople WHERE tkWorkspace.id =:workspaceId ");
            q.setParameter("workspaceId", workspaceId);
            lstTkWsPeoples = q.list();
            if (lstTkWsPeoples.size() > 0) {
                List<Integer> userid = new ArrayList<>();
                for (int i = 0; i < lstTkWsPeoples.size(); i++) {
                    TkWsPeople get = lstTkWsPeoples.get(i);
                    userid.add(get.getUserId());
                }

                Query query = session.createQuery("FROM TkUser WHERE id in (:listUserId) and status = 'ACTIVE'");
                query.setParameterList("listUserId", userid);
                lstTkUsers = query.list();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTkUsers;
    }

    public String createTeamsAnMember(List<TeamAndMember> lsTeamAndMembers) {
        String error = null;
        int idWorkspace = 0;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            int idTeam = 0;
            boolean isError = false;
            for (int i = 0; i < lsTeamAndMembers.size(); i++) {
                TeamAndMember get = lsTeamAndMembers.get(i);
                TkWsTeams teams = get.getTeams();
                idTeam = (int) session.save(teams);
                if (idTeam > 0) {
                    teams.setId(idTeam);
                    for (int j = 0; j < get.getLstUserId().size(); j++) {
                        TkWsPeopleTeams twpt = new TkWsPeopleTeams();
                        twpt.setTkWsTeams(teams);
                        TkWsPeople user = (TkWsPeople) session.get(TkWsPeople.class, get.getLstUserId().get(j));
                        twpt.setTkWsPeople(user);
                        session.save(twpt);
                    }
                }
            }
            if (isError) {
                transaction.rollback();
                error = "Error: Cannot create Teams !";
            } else {
                transaction.commit();
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

    public List<TkWsTeams> GetAllTeamsByWorkspaceId(int workspaceId) {
        List<TkWsTeams> lstTeamses = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTeams WHERE tkWorkspace.id =:workspaceId and teamStatus = 'ACTIVE'");
            query.setParameter("workspaceId", workspaceId);
            lstTeamses = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTeamses;
    }

    public List<TkWsPeople> GetAllMemberByWorkspaceId(int workspaceId) {
        List<TkWsPeople> lstPeoples = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsPeople WHERE tkWorkspace.id =:workspaceId and status = 'ACTIVE'");
            query.setParameter("workspaceId", workspaceId);
            lstPeoples = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstPeoples;
    }

    public List<TkWsPeopleTeams> GetAllMemberAndTeamsByTeamsId(int teamsId) {
        List<TkWsPeopleTeams> lstMemberAndTeams = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsPeopleTeams WHERE tkWsTeams.id =:teamsId ");
            query.setParameter("teamsId", teamsId);
            lstMemberAndTeams = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstMemberAndTeams;
    }

    public List<TkWsTasklist> GetAllTaskListByWorkspaceId(int workspaceId) {
        List<TkWsTasklist> lstTasklists = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTasklist WHERE tkWorkspace.id =:workspaceId and status = 'ACTIVE' ");
            query.setParameter("workspaceId", workspaceId);
            lstTasklists = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTasklists;
    }

    public List<TkWsTasklist> GetAllTaskListNotCreateRaciByWorkspaceId(int workspaceId) {
        List<TkWsTasklist> lstTasklists = new ArrayList<>();
        List<TkWsTaskRaci> lstTaskRacis = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTasklist WHERE tkWorkspace.id =:workspaceId and status = 'ACTIVE'");
            query.setParameter("workspaceId", workspaceId);
            lstTasklists = query.list();
            if (lstTasklists.size() > 0) {
                List<Integer> lsttaskid = new ArrayList<>();
                for (int i = 0; i < lstTasklists.size(); i++) {
                    TkWsTasklist get = lstTasklists.get(i);
                    lsttaskid.add(get.getId());
                }

                Query query1 = session.createQuery("FROM TkWsTaskRaci WHERE tkWsTasklist.id in (:lsttaskid) and status = 'ACTIVE'");
                query1.setParameterList("lsttaskid", lsttaskid);
                lstTaskRacis = query1.list();
            }
            List<TkWsTasklist> lstTasklistsRemove = new ArrayList<>();
            for (int i = 0; i < lstTasklists.size(); i++) {
                TkWsTasklist get = lstTasklists.get(i);
                for (int j = 0; j < lstTaskRacis.size(); j++) {
                    TkWsTaskRaci get1 = lstTaskRacis.get(j);
                    if (get.getId() == get1.getTkWsTasklist().getId()) {
                        lstTasklistsRemove.add(get);
                        break;
                    }

                }

            }
            lstTasklists.removeAll(lstTasklistsRemove);

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTasklists;
    }

    public List<TkWsFolder> GetAllFolderByWorkspaceId(int workspaceId) {
        List<TkWsFolder> lstFolders = new ArrayList<>();
        List<TkWsTasklist> lstTasklists = new ArrayList<>();

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM TkWsTasklist WHERE tkWorkspace.id =:workspaceId and status='ACTIVE' and tkWsFolder.id is not null");
            q.setParameter("workspaceId", workspaceId);
            lstTasklists = q.list();
            if (lstTasklists.size() > 0) {
                List<Integer> forderid = new ArrayList<>();
                for (int i = 0; i < lstTasklists.size(); i++) {
                    TkWsTasklist get = lstTasklists.get(i);
                    forderid.add(get.getTkWsFolder().getId());
                }

                Query query = session.createQuery("FROM TkWsFolder WHERE id in (:forderid) and folderStatus = 'ACTIVE'");
                query.setParameterList("forderid", forderid);
                lstFolders = query.list();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstFolders;
    }

    public List<TkWsTask> GetAllTaskTaskListId(int taskListId) {
        List<TkWsTask> lstTask = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWsTask WHERE tkWsTasklist.id =:taskListId and status <> 'DELETE'");
            query.setParameter("taskListId", taskListId);
            lstTask = query.list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstTask;
    }

    public List<MemberInfoWorkspaceSummary> MemberInfoWorkspaceSummary(int workspaceId) {
        List<MemberInfoWorkspaceSummary> lst = new ArrayList<>();
        List<Object[]> listResult = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery(MEMBER_CACULATE);
            query.setParameter("workspaceId", workspaceId);
            listResult = query.list();
            for (Object[] row : listResult) {
                MemberInfoWorkspaceSummary member = new MemberInfoWorkspaceSummary(
                        (String) row[0],
                        (String) row[1],
                        (String) row[2],
                        (String) row[3],
                        (int) ((BigInteger) row[4]).intValue(),
                        (int) ((BigInteger) row[5]).intValue(),
                        (int) ((BigInteger) row[6]).intValue(),
                        (int) ((BigInteger) row[7]).intValue(),
                        (int) ((BigInteger) row[8]).intValue(),
                        (int) ((BigInteger) row[9]).intValue(),
                        (BigDecimal) row[10]
                );
                lst.add(member);
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

    public List<WorkspaceDashboard> vewWorkspaceByUser(int userId) {
        List<WorkspaceDashboard> lst = new ArrayList<>();
        List<Object[]> listResult = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery(GET_ALL_WORKSPACE_BY_USER);
            query.setParameter("userId", userId);
            listResult = query.list();
            for (Object[] row : listResult) {
                WorkspaceDashboard member = new WorkspaceDashboard(
                        (String) String.valueOf(row[0]),
                        (String) row[1],
                        (String) row[2],
                        (String) row[3],
                        (String) String.valueOf(row[4]),
                        (String) String.valueOf(row[5]),
                        (String) String.valueOf(row[6])
                );
                lst.add(member);
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

    public List<Integer> GetChar3(int workspaceId) {
        List<Integer> lst = new ArrayList<>();
        List<BigInteger> listResult = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery(CHAR_TASK_3);
            query.setParameter("workspaceId", workspaceId);
            listResult = query.list();
            for (int i = 0; i < listResult.size(); i++) {
                BigInteger get = listResult.get(i);
                System.out.println(get.intValue());
                lst.add(get.intValue());
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
    
    public  List<TkWorkspace> GetAllWorkspaceByDepartemnetId(int departmentId){
        List<TkWorkspace> lstWorkspaces = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM TkWorkspace WHERE departmentId=:departmentId and status = 'ACTIVE' ");
            query.setParameter("departmentId", departmentId);
            lstWorkspaces = query.list();
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
    
     public void updateWorkspace(TkWorkspace tkWorkspace) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(tkWorkspace);
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
