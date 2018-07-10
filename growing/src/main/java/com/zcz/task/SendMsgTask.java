package com.zcz.task;

import com.zcz.bean.Changed;
import com.zcz.bean.Employee;
import com.zcz.bean.vo.EmpListVO;
import com.zcz.service.IChangeService;
import com.zcz.service.IEmployeeService;

import javax.servlet.ServletContext;
import java.util.TimerTask;

/**
 * 定时器
 */
public class SendMsgTask extends TimerTask {

    private static boolean isRunning = false;
    private ServletContext context = null;
    private Changed changed;
    private IEmployeeService employeeService;
    private IChangeService changeService;

    public SendMsgTask(ServletContext context,Changed changed, IEmployeeService employeeService,IChangeService changeService) {
        this.context = context;
        this.changed = changed;
        this.employeeService = employeeService;
        this.changeService = changeService;
    }

    @Override
    public void run() {
        if(!isRunning){
            context.log("开始执行任务了哦");
            //根据变更信息中empId查询一条教师记录
            Employee employee = employeeService.selectByPrimaryKey(changed.getEmpId());
            employee.setPostId(changed.getPostId());
            employee.setNature(changed.getNature());
            employee.setStatus(changed.getStatus());
            //然后把变更实体的信息赋值给员工实体，然后更改
            int i = employeeService.updateByPrimaryKeySelective(employee);
            //把变更记录的状态更改为已变更，1 标识已变更 0标识未变更
            changed.setMethod(1);
            changeService.updateByPrimaryKeySelective(changed);
            if(i>0){
                context.log("修改成功");
            }else{
                context.log("修改失败");
            }
        }else{
            context.log("上一次任务还未结束");
        }
    }
}