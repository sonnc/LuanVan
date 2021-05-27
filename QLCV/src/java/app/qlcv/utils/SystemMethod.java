/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.utils;

import app.qlcv.customs.TkWsTaskCustom;
import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWsTask;
import app.qlcv.workspace.TaskListController;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonng
 */
public class SystemMethod extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private TaskListController taskListController = new TaskListController();

    public Date formatStringDateToSqlDate(String date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateString = null;
        try {
            dateString = sdf.parse(date);
        } catch (ParseException ex) {
        }
        java.sql.Date sqlDate = new java.sql.Date(dateString.getTime());
        return sqlDate;
    }
    public Date formatStringDateToSqlDate2(String date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
        java.util.Date dateString = null;
        try {
            dateString = sdf.parse(date);
        } catch (ParseException ex) {
        }
        java.sql.Date sqlDate = new java.sql.Date(dateString.getTime());
        return sqlDate;
    }
    
    public Date formatJavaDateToSqlDate(Date date) {
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        return sqlDate;
    }

    public Date getSysDateToSqlDate() {
        java.util.Date dateString = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(dateString.getTime());
        return sqlDate;
    }

    public String saveFiles(File myFile, String pathFile, String myFileFileName, HttpServletRequest re) {
        String path = null;
        String link = null;
        try {
            System.out.println(re.getSession().getServletContext().getRealPath("/"));
            path = re.getSession().getServletContext().getRealPath("/").concat(pathFile);
            File fileToCreate = new File(path, myFileFileName);
            FileUtils.copyFile(myFile, fileToCreate);
            link = pathFile + myFileFileName;
            System.out.println(path);
        } catch (Exception e) {
            return null;
        }
        return link;
    }

    public String dateToString() {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmsszzzz");
        String strDate = formatter.format(date);
        return strDate;
    }

    public String getSystemDate() {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formatter.format(date);
        return strDate;
    }
    
    public java.util.Date getSystemDateDate() {
        java.util.Date date = new java.util.Date();
        return  date;
    }

    public int getSystemYear() {
        java.util.Date date = new java.util.Date();
        return date.getYear();
    }

    public String getSystemYearToString() {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
        String strDate = formatter.format(date);
        return strDate;
    }

    public int getSystemYearToNumber() {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
        String strDate = formatter.format(date);
        return Integer.parseInt(strDate);
    }

    public String getSystemYearToString1(java.util.Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
        String strDate = formatter.format(date);
        return strDate;
    }
    public String getSystemMonthToString() {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("mm");
        String strDate = formatter.format(date);
        return strDate;
    }

    public Long dateToMiliSecond() {
        java.util.Date date = new java.util.Date();
        long timeMilli = date.getTime();
        return timeMilli;
    }

    public TkWsTaskCustom mergeTaskWithUser(TkWsTask tasks) {
        TkWsTaskCustom taskCustom = new TkWsTaskCustom();
        taskCustom.setTask(tasks);
        TkUser assigneeUser = new TkUser();
        assigneeUser = taskListController.getUserById(tasks.getAssigneeUserId());
        taskCustom.setAssigneeUser(assigneeUser);
        TkUser reviewByUser = new TkUser();
        reviewByUser = taskListController.getUserById(tasks.getReviewBy());
        taskCustom.setReviewByUser(reviewByUser);

        return taskCustom;
    }

    public String convertAmountToString(BigDecimal value) {
        String pattern = "###,###.##";
        DecimalFormat decimalFormat = new DecimalFormat(pattern);
        String format = decimalFormat.format(value);
        return format;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}
