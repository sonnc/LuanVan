/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.utils;

/**
 *
 * @author sonng
 */
public class Contants {

    public static final String STATUS_ACTIVE = "ACTIVE";
    public static final String STATUS_OPEN = "OPEN";
    public static final String UPDATE_USER_DETAIL = "updateUserDetail";
    public static final String SQL_TK_TASK_01 = "select b.id id_tkud,a.id tku,a.user_name as account,  "
            + "b.create_date,b.last_update_date, b.create_by,b.last_update_by,"
            + "b.user_name,b.user_date_of_birth,b.user_gender,b.user_phone,b.user_address,"
            + "b.user_degree,b.user_job,b.user_avarta,b.user_others "
            + "from tk_user a join tk_user_detail b on a.id=b.user_id"
            + " where a.user_department_no =:userDepartId";
    public static final String SQL_TK_TASK_02 = "select c.* "
            + "from tk_user a join tk_user_project b on a.id=b.user_id "
            + "join tk_project c on b.project_id = c.id "
            + "where a.id =:userId";
    public static final String SQL_TK_TASK_03 = "select "
            + "tk.id, tk.create_date, tk.last_update_date, tk.create_by, tk.last_update_by, "
            + "tk.task_code, tk.task_name, tk.task_desc, tk.task_status, tk.task_start_date, "
            + "tk.task_end_date, tk.task_parent_id, tk.task_percent, tk.task_percent_finish, tk.task_display_order, "
            + "tk.task_alphabetindex, tk.task_type, tk.task_priority "
            + "from tk_user u join tk_raci raci on u.id = raci.raci_user_id "
            + "join tk_task tk on raci.raci_task_id = tk.id "
            + "where u.id =:userId";

    public static final String SQL_TK_KPI_01 = "select   \n" +
            "row_number() over (  \n" +
            "order by kpi_year   \n" +
            ")  stt, k.* from(\n" +
            "select distinct u.id as user_id, u.id as user_detail_id, u.login_id as kpi_account,\n" +
            "u.full_name, k.kpi_year, k.status as kpi_status,  \n" +
            "(select count(*) from tk_kpi_item_detail td  \n" +
            "join tk_kpi_item_detail_rating tdr on td.id=tdr.tk_kpi_item_detail_id  \n" +
            "where tdr.status = 'pending_approved' and td.tk_kpi_item_id in (select k.id from tk_user u1  \n" +
            "join tk_kpi_item k on u1.id = k.user_id where kpi_year=:year and u1.department =:phongBan and u1.id=u.id)) as kpi_pending_aprroved \n" +
            "from   \n" +
            "tk_user u \n" +
            "join tk_kpi_item k on u.id = k.user_id  \n" +
            "where kpi_year=:year and u.department =:phongBan \n" +
            "union all  \n" +
            "select distinct u.id as user_id,u.id as user_detail_id, u.login_id as kpi_account, u.full_name, '0' as kpi_year,   \n" +
            "'not_create' as kpi_status, '0' as kpi_pending_aprroved  from   \n" +
            "tk_user u  \n" +
            "left join tk_kpi_item k on u.id = k.user_id  \n" +
            "where u.department =:phongBan and u.id not in (  \n" +
            "select distinct u.id  from   \n" +
            "tk_user u \n" +
            "join tk_kpi_item k on u.id = k.user_id  \n" +
            "where kpi_year=:year   \n" +
            ")\n" +
            ")k order by kpi_year;";

}

