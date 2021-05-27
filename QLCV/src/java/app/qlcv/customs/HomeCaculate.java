/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWsTask;
import app.qlcv.workspace.TaskController;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.jsp.PageContext;

/**
 *
 * @author sonng
 */
public class HomeCaculate {

    public String getOldData(int userId) {
        String dataOld = null;
        TaskController taskController = new TaskController();
        List<TkWsTask> lstTask = new ArrayList<>();
        lstTask = taskController.GetAllTaskByUserId(userId, "CLOSE");
        String old2 = null;
        String old3 = null;
        String old4 = null;
        String old5 = null;
        String old6 = null;
        String old7 = null;
        String old8 = null;

        // old
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        old8 = df.format(c.getTime());
        for (int i = 0; i < 6; i++) {
            c.add(Calendar.DATE, -1);
            if (i == 0) {
                old7 = df.format(c.getTime());
            }
            if (i == 1) {
                old6 = df.format(c.getTime());
            }
            if (i == 2) {
                old5 = df.format(c.getTime());
            }
            if (i == 3) {
                old4 = df.format(c.getTime());
            }
            if (i == 4) {
                old3 = df.format(c.getTime());
            }
            if (i == 5) {
                old2 = df.format(c.getTime());
            }
        }

        int oldValue2 = 0;
        int oldValue3 = 0;
        int oldValue4 = 0;
        int oldValue5 = 0;
        int oldValue6 = 0;
        int oldValue7 = 0;
        int oldValue8 = 0;

        DateFormat dformat = new SimpleDateFormat("dd/MM/yyyy");
        for (int i = 0; i < lstTask.size(); i++) {
            TkWsTask get = lstTask.get(i);

            String dateClose = dformat.format(get.getDateClose());
            if (dateClose.equals(old2)) {
                oldValue2++;
            }
            if (dateClose.equals(old3)) {
                oldValue3++;
            }
            if (dateClose.equals(old4)) {
                oldValue4++;
            }
            if (dateClose.equals(old5)) {
                oldValue5++;
            }
            if (dateClose.equals(old6)) {
                oldValue6++;
            }
            if (dateClose.equals(old7)) {
                oldValue7++;
            }
            if (dateClose.equals(old8)) {
                oldValue8++;
            }

            dataOld = "[" + oldValue2 + "," + oldValue3 + "," + oldValue4 + "," + oldValue5 + "," + oldValue6 + "," + oldValue7 + "," + oldValue8 + "]";
        }
        return dataOld;
    }

    public String getNewData(int userId) {
        String dataNew = null;
        TaskController taskController = new TaskController();
        List<TkWsTask> lstTask = new ArrayList<>();
        lstTask = taskController.GetAllTaskByUserId(userId, "CLOSE");
        String new2 = null;
        String new3 = null;
        String new4 = null;
        String new5 = null;
        String new6 = null;
        String new7 = null;
        String new8 = null;
//new
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        DateFormat df1 = new SimpleDateFormat("dd/MM/yyyy");
        new2 = df1.format(c.getTime());
        for (int i = 0; i < 6; i++) {
            c.add(Calendar.DATE, 1);
            if (i == 0) {
                new3 = df1.format(c.getTime());
            }
            if (i == 1) {
                new4 = df1.format(c.getTime());
            }
            if (i == 2) {
                new5 = df1.format(c.getTime());
            }
            if (i == 3) {
                new6 = df1.format(c.getTime());
            }
            if (i == 4) {
                new7 = df1.format(c.getTime());
            }
            if (i == 5) {
                new8 = df1.format(c.getTime());
            }
        }

        int newValue2 = 0;
        int newValue3 = 0;
        int newValue4 = 0;
        int newValue5 = 0;
        int newValue6 = 0;
        int newValue7 = 0;
        int newValue8 = 0;

        DateFormat dformat = new SimpleDateFormat("dd/MM/yyyy");
        for (int i = 0; i < lstTask.size(); i++) {
            TkWsTask get = lstTask.get(i);

            String dateClose = dformat.format(get.getDateClose());

            if (dateClose.equals(new2)) {
                newValue2++;
            }
            if (dateClose.equals(new3)) {
                newValue3++;
            }
            if (dateClose.equals(new4)) {
                newValue4++;
            }
            if (dateClose.equals(new5)) {
                newValue5++;
            }
            if (dateClose.equals(new6)) {
                newValue6++;
            }
            if (dateClose.equals(new7)) {
                newValue7++;
            }
            if (dateClose.equals(new8)) {
                newValue8++;
            }
            dataNew = "[" + newValue2 + "," + newValue3 + "," + newValue4 + "," + newValue5 + "," + newValue6 + "," + newValue7 + "," + newValue8 + "]";
        }
        return dataNew;
    }

    public List<String> getSuccessTask(int userId) {;
        List<String> slt = new ArrayList<>();
        TaskController taskController = new TaskController();
        List<TkWsTask> lstTask = new ArrayList<>();
        lstTask = taskController.GetAllTaskByUserId(userId, "CLOSE");

        List<TkWsTask> lstTask1 = new ArrayList<>();
        lstTask1 = taskController.GetAllTaskByUserId(userId, "OPEN");
        List<TkWsTask> lstTask2 = new ArrayList<>();
        lstTask2 = taskController.GetAllTaskByUserId(userId, "INPROCESS");

        if (lstTask1.size() + lstTask2.size() == 0) {
            slt.add("0");
            slt.add("100");
        } else {
            BigDecimal tyso = new BigDecimal(BigInteger.ZERO);
            int close = lstTask.size();
            int openClose = lstTask1.size() + lstTask2.size();
            tyso = new BigDecimal(close).divide(new BigDecimal(openClose), 2, RoundingMode.HALF_UP);
            BigDecimal conlai = new BigDecimal(100).subtract(tyso);
            slt.add(conlai.toString());
            slt.add(tyso.toString());
        }
        return slt;
    }

    public List<String> getDueDateTask(int userId) {;
        List<String> slt = new ArrayList<>();
        TaskController taskController = new TaskController();
        List<TkWsTask> lstTask1 = new ArrayList<>();
        lstTask1 = taskController.GetAllTaskByUserId(userId, "OPEN");
        List<TkWsTask> lstTask2 = new ArrayList<>();
        lstTask2 = taskController.GetAllTaskByUserId(userId, "CLOSE");
        List<TkWsTask> lstTask3 = new ArrayList<>();
        lstTask3 = taskController.GetAllTaskByUserId(userId, "COMPLETE");
        List<TkWsTask> lstTask4 = new ArrayList<>();
        lstTask4 = taskController.GetAllTaskByUserId(userId, "CLOSE");

        List<TkWsTask> task = new ArrayList<>();
        task.addAll(lstTask1);
        task.addAll(lstTask2);
        task.addAll(lstTask3);
        task.addAll(lstTask4);

        Date date = new Date();

        BigDecimal treHan = new BigDecimal(BigInteger.ZERO);
        int treHanInt = 0;
        for (int i = 0; i < task.size(); i++) {
            if (task.get(i).getDateClose() != null
                    && task.get(i).getDueDate().before(task.get(i).getDateClose())) {
                treHanInt++;
            }
        }
        int Total = task.size();
        if (Total == 0) {
            slt.add("0");
            slt.add("0");
        } else {
            treHan = new BigDecimal(treHanInt).divide(new BigDecimal(Total), 2, RoundingMode.HALF_UP);
            BigDecimal conlai = new BigDecimal(100).subtract(treHan);
            slt.add(treHan.toString());
            slt.add(conlai.toString());
        }
        return slt;
    }
}
