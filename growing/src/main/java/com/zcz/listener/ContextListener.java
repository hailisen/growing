package com.zcz.listener;

import com.zcz.bean.Changed;
import com.zcz.service.IChangeService;
import com.zcz.service.IEmployeeService;
import com.zcz.task.SendMsgTask;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;

/**
 * Created by Administrator on 2018/2/28.
 */
public class ContextListener implements ServletContextListener {

    private Timer timer = null;
    private static WebApplicationContext webApplicationContext;
    private IChangeService changeService;
    private IEmployeeService employeeService;
    /*
     * 监听执行方法
     * @param servletContextEvent
     */
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent){
        webApplicationContext=
                WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext());
        changeService = (IChangeService) webApplicationContext.getBean("changeService");
        employeeService = (IEmployeeService) webApplicationContext.getBean("employeeService");
        /**
         * 设置一个定时器
         */
        timer = new Timer(true);
        //查询Changed数据库未执行的变更集合
        List<Changed> changeds = changeService.findAll();
        //遍历集合，获取开始时间，执行定时器
        for (Changed changed: changeds) {
            execute(changed,servletContextEvent);
        }
    }

    /**
     * 获取WebApplicationContext实例
     * @return
     */
    public static WebApplicationContext getApplicationContext(){
        return webApplicationContext;
    }

    /**
     * 执行
     */
    public void execute(Changed changed,ServletContextEvent servletContextEvent){
        //获取变更时间
        Date changeTime = changed.getChangeTime();
        Calendar cal = Calendar.getInstance();
        cal.setTime(changeTime);//变更时间
        cal.set(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH),8,0,0);//给变更时间设置到时间
        Date date = cal.getTime();
        //在指定的date时刻执行task, 仅执行一次
        timer.schedule(new SendMsgTask(servletContextEvent.getServletContext(),changed,employeeService,changeService),date);
        servletContextEvent.getServletContext().log("已经添加任务调度表");
    }

    /**
     * 销毁方法
     * @param servletContextEvent
     */
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
