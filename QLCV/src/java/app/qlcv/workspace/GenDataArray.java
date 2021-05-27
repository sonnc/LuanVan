/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.workspace;

import app.qlcv.customs.LinkDataArray;
import app.qlcv.customs.NodeDataArray;
import app.qlcv.entities.TkWsTask;
import app.qlcv.utils.SystemMethod;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author sonng
 */
public class GenDataArray {

    public NodeDataArray CheckNode(TkWsTask task) {
        NodeDataArray node = new NodeDataArray();
        node.setKey(String.valueOf(task.getId()));
        node.setLoc(null);
        node.setText(String.valueOf(task.getId()));
        node.setDetails(task.getTaskName() + "_"
                + "Start date: " + task.getStartDate() + "_"
                + "End date: " + task.getDueDate() + "_"
                + "Close date: " + task.getDateClose() + "_"
                + "Status: " + task.getStatus());
        node.setColor(SetCollor(task));
        node.setThickness("5");
        node.setFill(SetCollor(task));
        node.setFigure("Ellipse");
        node.setIsGroup("false");
        return node;
    }

    public String SetCollor(TkWsTask task) {

        SystemMethod systemMethod = new SystemMethod();

        String collor = null;
        if (task.getStatus().equals("DELETE")) {
            collor = "#555555";
        }
        if (task.getStatus().equals("OPEN")) {
            collor = "#ABB8C3";
        }
        if (task.getStatus().equals("INPROCESS")) {
            collor = "#FCB900";
        }
        if (task.getStatus().equals("CLOSE")) {
            collor = "#7BDCB5";
        }
        if (!task.getStatus().equals("DELETE") && !task.getStatus().equals("CLOSE")
                && ((task.getDateClose() == null && task.getDueDate().before(systemMethod.getSystemDateDate()))
                || (task.getDateClose() != null && task.getDueDate().before(task.getDateClose())))) {
            collor = "red";
        }
        return collor;
    }

    public List<LinkDataArray> CheckLink(TkWsTask task, List<TkWsTask> lstTasks) {
        List<LinkDataArray> lstLinkDataArrays = new ArrayList<>();
        if (task.getFollowTask() == null) {
            LinkDataArray linkNode = new LinkDataArray();
            linkNode.setFrom("0");
            linkNode.setTo(String.valueOf(task.getId()));
            linkNode.setDash("[0,0]");
            linkNode.setColor(SetLinkColor(String.valueOf(task.getId()), lstTasks));
            linkNode.setText("0d");
            linkNode.setDir("0");
            lstLinkDataArrays.add(linkNode);
        } else {
            List<String> taskFollow = Arrays.asList(task.getFollowTask().split(","));
            for (int i = 0; i < taskFollow.size(); i++) {
                String taskFollowId = taskFollow.get(i);
                LinkDataArray linkNode = new LinkDataArray();
                linkNode.setFrom(taskFollow.get(i));
                linkNode.setTo(String.valueOf(task.getId()));
                linkNode.setDash(SetDash(taskFollowId, lstTasks));
                linkNode.setColor(SetLinkColor(taskFollowId, lstTasks));

                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

                Calendar c1 = Calendar.getInstance();
                Calendar c2 = Calendar.getInstance();

                c1.setTime(task.getStartDate());
                c2.setTime(task.getDueDate());
                long noDay = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);

                linkNode.setText(String.valueOf(noDay)+"d");
                linkNode.setDir("0");
                lstLinkDataArrays.add(linkNode);
            }
        }
        return lstLinkDataArrays;
    }

    public String SetDash(String taskFollowId, List<TkWsTask> lstTasks) {
        TkWsTask task = new TkWsTask();
        int taskMain = Integer.parseInt(taskFollowId);
        for (int i = 0; i < lstTasks.size(); i++) {
            TkWsTask get = lstTasks.get(i);
            if (taskMain == get.getId()) {
                task = get;
                break;
            }
        }

        SystemMethod systemMethod = new SystemMethod();
        String collor = null;
        if (task.getStatus().equals("DELETE")) {
            collor = "[6,3]";
        } else if (!task.getStatus().equals("DELETE")) {
            collor = "[0,0]";
        } else if (!task.getStatus().equals("DELETE")
                && ((task.getDateClose() == null && task.getDueDate().before(systemMethod.getSystemDateDate()))
                || (task.getDateClose() != null && task.getDueDate().before(task.getDateClose())))) {
            collor = "[0,0]";
        }
        return collor;
    }

    public String SetLinkColor(String taskFollowId, List<TkWsTask> lstTasks) {
        TkWsTask task = new TkWsTask();
        int taskMain = Integer.parseInt(taskFollowId);
        for (int i = 0; i < lstTasks.size(); i++) {
            TkWsTask get = lstTasks.get(i);
            if (taskMain == get.getId()) {
                task = get;
                break;
            }
        }
        SystemMethod systemMethod = new SystemMethod();
        String collor = null;
        if (task.getStatus().equals("DELETE")) {
            collor = "red";
        }else  if (!task.getStatus().equals("DELETE")
                && ((task.getDateClose() == null && task.getDueDate().before(systemMethod.getSystemDateDate()))
                || (task.getDateClose() != null && task.getDueDate().before(task.getDateClose())))) {
            collor = "red";
        }else if (!task.getStatus().equals("DELETE")) {
            collor = "blue";
        }
        return collor;
    }

}
