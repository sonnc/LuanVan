/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.batch.job;

import app.qlcv.utils.ReadPropertiesFile;
import app.qlcv.utils.SystemMethod;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 *
 * @author sonng
 */
public class QuartzJob implements Job {

    public static boolean isStop = true;

    public void execute(JobExecutionContext context) throws JobExecutionException {
        if (isStop) {
            SystemMethod systemMethod = new SystemMethod();
            isStop = false;
            ImportToMysql importToMysql = new ImportToMysql();
            ReadPropertiesFile prop = new ReadPropertiesFile();
            Properties properties = prop.ReadConfig("configQuartzScheduler.properties");
            String path = (String) properties.get("quartz.scheduler.listener.path.file");

            // lay toan bo file trong, sap xep: task => kpi => task-kpi
            File dir = new File(path);
            File[] children = dir.listFiles();

            List<String> lstFileTask = new ArrayList<>();
            List<String> lstFileKPI = new ArrayList<>();
            List<String> lstFileTaskKpi = new ArrayList<>();

            for (File file : children) {
                if (file.getName().contains("TASK")) {
                    lstFileTask.add(file.getAbsolutePath());
                }
                if (file.getName().contains("KPI")) {
                    lstFileKPI.add(file.getAbsolutePath());
                }
                if (file.getName().contains("TA-KI")) {
                    lstFileTaskKpi.add(file.getAbsolutePath());
                }
                System.out.println(file.getAbsolutePath());
            }

            for (int i = 0; i < lstFileTask.size(); i++) {
                String get = lstFileTask.get(i);
                File afile = new File(get);
                try {
                    String test = afile.getName().toUpperCase().replace(".XLSX", "");
                    String[] output = test.split("-");

                    String source = output[0].toString();
                    String codeTaskListString = output[2].toString();

                    int codeTaskList = Integer.parseInt(codeTaskListString);
                    
                    importToMysql.ImportExcelToMySQLForTableTask(get, codeTaskList, source);
                    
                    if (afile.renameTo(new File(path + "\\old\\"+systemMethod.dateToString().toString()+"-" + afile.getName()))) {
                        System.out.println("File is moved successful! " + afile.getName());
                    } else {
                        System.out.println("File is failed to move! " + afile.getName());
                    }
                    
                } catch (SQLException ex) {
                    Logger.getLogger(QuartzJob.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(QuartzJob.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            
            for (int i = 0; i < lstFileKPI.size(); i++) {
                String get = lstFileKPI.get(i);
                File afile = new File(get);
                try {
                    String test = afile.getName().toUpperCase().replace(".XLSX", "");
                    String[] output = test.split("-");

                    String source = output[0].toString();
                    String codeUserString = output[2].toString();
                    
                    importToMysql.ImportExcelToMySQLForTableKPI(get, codeUserString, source);
                    
                    if (afile.renameTo(new File(path + "\\old\\"+systemMethod.dateToString().toString()+"-" + afile.getName()))) {
                        System.out.println("File is moved successful! " + afile.getName());
                    } else {
                        System.out.println("File is failed to move! " + afile.getName());
                    }
                    
                } catch (SQLException ex) {
                    Logger.getLogger(QuartzJob.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(QuartzJob.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            
            // thuc hien xong, chuyen file vao thu muc old
            isStop = true;
        }
    }
}
