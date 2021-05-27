/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.batch.job;

import app.qlcv.utils.ReadPropertiesFile;
import java.util.Properties;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

/**
 *
 * @author sonng
 */
public class QuartzSchedulerListener implements ServletContextListener {

    private StdSchedulerFactory factory = new StdSchedulerFactory();

    public void contextDestroyed(ServletContextEvent arg0) {
        try {
            factory.getDefaultScheduler().shutdown();
        } catch (SchedulerException ex) {
        }
    }

    public void contextInitialized(ServletContextEvent arg0) {
        ReadPropertiesFile prop = new ReadPropertiesFile();
        Properties properties = prop.ReadConfig("configQuartzScheduler.properties");
        String time = properties.getProperty("quartz.scheduler.listener.import.data.sql", "0 0 1 * * ?");
        String isRun = properties.getProperty("quartz.scheduler.listener.run", "false");
        if ("true".equals(isRun)) {
            JobDetail job = JobBuilder.newJob(QuartzJob.class)
                    .withIdentity("anyJobName", "group1").build();

            try {

                Trigger trigger = TriggerBuilder
                        .newTrigger()
                        .withIdentity("anyTriggerName", "group1")
                        .withSchedule(
                                CronScheduleBuilder.cronSchedule(time))
                        .build();

                Scheduler scheduler = factory.getScheduler();
                scheduler.start();
                scheduler.scheduleJob(job, trigger);

            } catch (SchedulerException e) {
                e.printStackTrace();
            }
        }

    }
}
