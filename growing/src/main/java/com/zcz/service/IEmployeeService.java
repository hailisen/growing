package com.zcz.service;


import com.zcz.bean.Agreement;
import com.zcz.bean.Employee;
import com.zcz.bean.EmployeeExample;
import com.zcz.bean.vo.DeptEmp;
import com.zcz.bean.vo.EmployeeVO;
import com.zcz.bean.vo.EmployeeWithPage;
import com.zcz.util.Page;
import com.zcz.util.ResultData;
import org.apache.ibatis.annotations.Param;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * 教师服务层接口
 */
public interface IEmployeeService {

    ResultData batchInsert(File excelFile, String filetype,List<String> emponList);
    /**
     * 查询某部门的所有员工ID
     * @param deptId
     * @return
     */
    List<Integer> findEmpIdInDept(@Param("depeId") Integer deptId);

    /**
     * 职称年限提醒信息
     * name,sex,phone,deptName,tp.post_name as tp.postName,positionName,
     * eduBackground,navitePlace,nature,status
     */
    Page<Map<String,Object>> positionAlter(Integer deptId,Integer postId,Integer positionId,
                                           String eduBackground,Integer status,Integer nature,
                                           String nameOrPhone,Integer pageNum,Integer pageSize);

    /**
     * 职称年限提醒信息--数量
     * name,positionName,cateName,levelName,getTime,timeLimit
     */
    Integer positionAlterCount();

    /**
     * 获取协议即将到期的人员信息  提前一个月
     * @param deptId 部门ID
     * @param postId 岗位ID
     * @param eduBackground 教育背景
     * @param nature 工作性质
     * @param nameOrPhone 姓名或手机号
     * @param pageNum 当前页数
     * @param pageSize 每页长度
     * @return
     * name 姓名,sex 性别,phone 手机号,deptName 部门名称,postName 岗位名称,agreeName 协议名,
     * endTime 协议结束时间,eduBackground 教育背景,te.nature 工作性质,te.status 工作状态
     */
    Page<Map<String,Object>> agreementTime(Integer deptId,Integer postId,String eduBackground,Integer nature,String nameOrPhone,Integer pageNum,Integer pageSize);
    /**
     * 获取协议即将到期的人员数量
     * name,deptName,postName,agreeName,endTime
     * @return
     */
    Integer agreementTimeCount();

    /**
     * 根据部门查询员工
     * @param
     * @return id  name
     */
    List<DeptEmp> findEmpByDept();

    /**
     * 查询所有员工ID
     * @return
     */
    List<Integer> findAllId();

    /**
     * 根据ID查询员工信息
     * @param id
     * @return
     */
    Employee selectByPrimaryKey(Integer id);

    /**
     * 修改員工教師信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Employee record);

    /**
     * 教师详细信息
     * @param empId
     * @return
     */
    EmployeeVO selectTeacherInfo(Integer empId);

    /**
     * 查询所有的员工编号集合
     * @return
     */
    List<String> findAllEmpno();

    /**
     * 添加员工
     * @param record
     * @return
     */
    int insertSelective(Employee record,Integer positionId,List<String> empnoList);

    /**
     * 登陆方法
     * @param phone
     * @param password
     * @return
     */
    Employee login(String phone,String password);

    /**
     * 分页查询教师列表
     * @return
     */
    Page<EmployeeWithPage> findByPage(Integer deptId, Integer postId, Integer positionId,
                                      String eduBackground, Integer status, Integer nature,
                                      String nameOrPhone, Integer pageNum, Integer pageSize);
}
