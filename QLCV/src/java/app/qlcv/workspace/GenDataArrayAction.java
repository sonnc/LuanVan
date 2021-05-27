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
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonng
 */
public class GenDataArrayAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private SystemMethod systemMethod;
    private GenDataArray genDataArray;
    private TaskController taskController;
    public static String NODE_STRING_VAL = "{\"key\":@value1, \"loc\":\"@value2\", \"text\":\"@value3\", \"details\":\"@value4\", \"color\":\"white\", \"figure\":\"@value7\", \"fill\":\"@value8\", \"size\":\"50 50\"}";
    public static String LINE_STRING_VAL = "{\"from\":@value1, \"to\":@value2,\"dash\":@value3, \"color\":\"@value4\", \"text\":\"@value5\"}";
    private int thoiGianThucHien = 0;
    private int soNgayTreHan = 0;
    private int tongNgayThucTe = 0;

    private String contentCPM = " ";

    public GenDataArrayAction() {
        systemMethod = new SystemMethod();
        taskController = new TaskController();
        genDataArray = new GenDataArray();
    }

    public String cpmNodeGenData() {
        int workspaceId = Integer.parseInt(request.getParameter("workspaceId"));
        return GenDataArray(workspaceId);
    }

    public String GenDataArray(int workspaceId) {
        List<NodeDataArray> lstNodeDataArrays = new ArrayList<>();

        boolean endNode = false;

        int level = 1;

        // lay danh sach task list trong workspace
        List<TkWsTask> lstTasks = new ArrayList<>();
        lstTasks = taskController.GetAllTaskByWorkspaceId(workspaceId);

        for (int i = 0; i < lstTasks.size(); i++) {
            if (lstTasks.get(i).getFollowTask() == null) {
                TkWsTask task = lstTasks.get(i);
                task.setTaskLevel(1);
                Collections.replaceAll(lstTasks, lstTasks.get(i), task);
            }
        }

        while (!endNode) {
            for (int i = 0; i < lstTasks.size(); i++) {
                TkWsTask task = lstTasks.get(i);
                if (level == task.getTaskLevel()) {
                    lstTasks = findLevelForTask(level, task, lstTasks);
                }
            }

            level = level + 1;

            endNode = true;
            for (int i = 0; i < lstTasks.size(); i++) {
                TkWsTask task = lstTasks.get(i);
                if (task.getTaskLevel() == 0) {
                    endNode = false;
                }
            }
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        for (int i = 1; i < level; i++) {
            int maxDateInLevel = 0;
            int maxTreHan = 0;
            for (int j = 0; j < lstTasks.size(); j++) {
                TkWsTask task = lstTasks.get(j);
                if (task.getTaskLevel() == i) {
                    c1.setTime(task.getStartDate());
                    c2.setTime(task.getDueDate());
                    long noDay = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);
                    if (maxDateInLevel < noDay) {
                        maxDateInLevel = (int) noDay;
                    }

                    if ((task.getDateClose() == null && systemMethod.getSystemDateDate().after(task.getDueDate()))
                            || (task.getDateClose() != null && task.getDateClose().after(task.getDueDate()))) {
                        c1.setTime(task.getDueDate());
                        if (task.getDateClose() == null) {
                            c2.setTime(systemMethod.getSystemDateDate());
                        } else {
                            c2.setTime(task.getDateClose());
                        }

                        long noDayTrehan = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);

                        if (maxTreHan < noDayTrehan) {
                            maxTreHan = (int) noDayTrehan;
                        }
                    }
                }
            }

            soNgayTreHan = soNgayTreHan + maxTreHan;
            thoiGianThucHien = thoiGianThucHien + maxDateInLevel;
        }

        tongNgayThucTe = thoiGianThucHien + soNgayTreHan;

        for (int i = 0; i < lstTasks.size(); i++) {
            TkWsTask get = lstTasks.get(i);
            System.out.println(get.getId() + " - " + get.getFollowTask() + " - " + get.getTaskLevel());
        }
        // tao node end
//        CreateNode(lstTasks, level);
//
//        CreateLine(lstTasks);
        contentCPM = CreateNode(lstTasks, level) + CreateLine(lstTasks);
        return SUCCESS;
    }

    public String CreateNode(List<TkWsTask> lstTasks, int maxLevel) {
        String dataArrayString = " ";
        if (lstTasks.size() > 0) {

            String beginContent = "{ \"class\": \"GraphLinksModel\",\n"
                    + "  \"nodeDataArray\": [ ";

            String endContent = " ],";

            String content = " ";

            // tao node start
            NodeDataArray nodeStart = new NodeDataArray("0", "0 0", "START", "PROJECT START", "white", "5", "Ellipse", "pink", "");
            NodeDataArray nodeEnd = new NodeDataArray("99999", "0 0", "END", "PROJECT CLOSE", "white", "5", "Ellipse", "black", "");

            GenDataArray dataArray = new GenDataArray();
            List<NodeDataArray> lstNode = new ArrayList<>();

            lstNode.add(nodeStart);

            boolean endTask = false;
            int start = 1;
            int x = 100;
            while (start <= maxLevel) {
                int y = 0;
                for (int i = 0; i < lstTasks.size(); i++) {
                    TkWsTask task = lstTasks.get(i);
                    if (task.getTaskLevel() == start) {
                        NodeDataArray node = new NodeDataArray();
                        node = dataArray.CheckNode(task);
                        node.setLoc("" + x + " " + y + "");

                        lstNode.add(node);

                        y = y + 100;
                    }
                }
                start = start + 1;
                x = x + 100;
            }

            nodeEnd.setLoc("" + x + " 0");
            lstNode.add(nodeEnd);

            // string node
            for (int i = 0; i < lstNode.size(); i++) {
                NodeDataArray node = lstNode.get(i);
                String nodeString = NODE_STRING_VAL;

                nodeString = nodeString.replaceAll("@value1", node.getKey());
                nodeString = nodeString.replaceAll("@value2", node.getLoc());
                nodeString = nodeString.replaceAll("@value3", node.getText());
                nodeString = nodeString.replaceAll("@value4", node.getDetails());
                nodeString = nodeString.replaceAll("@value5", node.getColor());
                nodeString = nodeString.replaceAll("@value6", node.getThickness());
                nodeString = nodeString.replaceAll("@value7", node.getFigure());
                nodeString = nodeString.replaceAll("@value8", node.getFill());

                content = content + nodeString;

                if (i < lstNode.size() - 1) {
                    content = content + ",";
                }
            }
            dataArrayString = beginContent + content + endContent;
            System.out.println(dataArrayString);

        }

        return dataArrayString;
    }

    public String CreateLine(List<TkWsTask> lstTasks) {

        String lineStringData = " ";

        List<LinkDataArray> lstLinkDataArrays = new ArrayList<>();
        String beginLink = "\"linkDataArray\": [";
        String endLink = "]}";
        String content = " ";

        if (lstTasks.size() > 0) {
            for (int i = 0; i < lstTasks.size(); i++) {
                TkWsTask task = lstTasks.get(i);
                List<LinkDataArray> lstLinkData = new ArrayList<>();
                lstLinkData = genDataArray.CheckLink(task, lstTasks);
                lstLinkDataArrays.addAll(lstLinkData);
            }

            // tao link end
            for (int i = 0; i < lstTasks.size(); i++) {
                boolean isFind = false;
                for (int j = 0; j < lstTasks.size(); j++) {
                    if (lstTasks.get(j).getFollowTask() == null) {
                        continue;
                    }
                    List<String> taskFollow = Arrays.asList(lstTasks.get(j).getFollowTask().split(","));
                    for (int k = 0; k < taskFollow.size(); k++) {
                        if (String.valueOf(lstTasks.get(i).getId()).equals(taskFollow.get(k))) {
                            isFind = true;
                            break;
                        }
                    }
                    if (isFind) {
                        break;
                    }
                }
                if (!isFind) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

                    Calendar c1 = Calendar.getInstance();
                    Calendar c2 = Calendar.getInstance();

                    c1.setTime(lstTasks.get(i).getStartDate());
                    c2.setTime(lstTasks.get(i).getDueDate());
                    long noDay = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);

                    String color = "";
                    if (!lstTasks.get(i).getStatus().equals("DELETE") 
                            && ((lstTasks.get(i).getDateClose() == null && lstTasks.get(i).getDueDate().before(systemMethod.getSystemDateDate()))
                            || (lstTasks.get(i).getDateClose() != null && lstTasks.get(i).getDueDate().before(lstTasks.get(i).getDateClose()))
                            )) {
                        color = "red";
                    } else {
                        color = "blue";
                    }

                    LinkDataArray link = new LinkDataArray(String.valueOf(lstTasks.get(i).getId()), "99999", "[0,0]", color, noDay + "d", "0");
                    lstLinkDataArrays.add(link);
                }

            }

            for (int i = 0; i < lstLinkDataArrays.size(); i++) {
                LinkDataArray link = lstLinkDataArrays.get(i);
                String linkString = LINE_STRING_VAL;
                linkString = linkString.replaceAll("@value1", link.getFrom());
                linkString = linkString.replaceAll("@value2", link.getTo());
                linkString = linkString.replaceAll("@value3", link.getDash());
                linkString = linkString.replaceAll("@value4", link.getColor());
                linkString = linkString.replaceAll("@value5", link.getText());
                linkString = linkString.replaceAll("@value6", link.getDir());

                content = content + linkString;

                if (i < lstLinkDataArrays.size() - 1) {
                    content = content + ",";
                }
            }
        }
        lineStringData = beginLink + content + endLink;
        System.out.println(lineStringData);
        return lineStringData;
    }

    public List<TkWsTask> findLevelForTask(int index, TkWsTask task, List<TkWsTask> lstTasks) {

        String idTask = String.valueOf(task.getId());
        for (int i = 0; i < lstTasks.size(); i++) {
            TkWsTask taskNext = lstTasks.get(i);
            if (taskNext.getTaskLevel() > 0) {
                continue;
            }
            List<String> taskFollow = Arrays.asList(taskNext.getFollowTask().split(","));
            for (int j = 0; j < taskFollow.size(); j++) {
                if (taskFollow.get(j).toString().equals(idTask)) {
                    taskNext.setTaskLevel(index + 1);
                    Collections.replaceAll(lstTasks, lstTasks.get(i), taskNext);
                    break;
                }
            }
        }
        return lstTasks;
    }

    @Override
    public void setSession(Map<String, Object> map
    ) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr
    ) {
        this.request = hsr;
    }

    public String getContentCPM() {
        return contentCPM;
    }

    public void setContentCPM(String contentCPM) {
        this.contentCPM = contentCPM;
    }

    public int getThoiGianThucHien() {
        return thoiGianThucHien;
    }

    public void setThoiGianThucHien(int thoiGianThucHien) {
        this.thoiGianThucHien = thoiGianThucHien;
    }

    public int getSoNgayTreHan() {
        return soNgayTreHan;
    }

    public void setSoNgayTreHan(int soNgayTreHan) {
        this.soNgayTreHan = soNgayTreHan;
    }

    public int getTongNgayThucTe() {
        return tongNgayThucTe;
    }

    public void setTongNgayThucTe(int tongNgayThucTe) {
        this.tongNgayThucTe = tongNgayThucTe;
    }

}
