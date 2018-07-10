package com.zcz.dao;

import com.zcz.bean.Employee;
import com.zcz.bean.EmployeeExample;
import java.util.List;
import java.util.Map;

import com.zcz.bean.vo.DeptEmp;
import com.zcz.bean.vo.EmployeeVO;
import com.zcz.bean.vo.EmployeeWithPage;
import javafx.beans.binding.ObjectExpression;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * 员工Dao层接口
 */
@Component
public interface EmployeeMapper {


    /**
     * 查询某部门的所有员工ID
     * @param deptId
     * @return
     */
    List<Integer> findEmpIdInDept(@Param("deptId") Integer deptId);

    /**
     * 职称年限提醒信息
     * name,sex,phone,deptName,tp.post_name as tp.postName,positionName,
     * eduBackground,navitePlace,nature,status
     */
    List<Map<String,Object>> positionAlter(@Param("deptId") Integer deptId,@Param("postId") Integer postId,@Param("positionId") Integer positionId,
                                           @Param("eduBackground") String eduBackground,@Param("status") Integer status,@Param("nature") Integer nature,
                                           @Param("name") String name,@Param("phone") String phone);

    /**
     * 获取协议即将到期的人员信息  提前一个月
     * @param deptId 部门ID
     * @param postId 岗位ID
     * @param eduBackground 教育背景
     * @param nature 工作性质
     * @param name 姓名
     * @param phone 手机号
     * @param start 起始条数
     * @param pageSize 每页长度
     * @return
     * name 姓名,sex 性别,phone 手机号,deptName 部门名称,postName 岗位名称,agreeName 协议名,
     * endTime 协议结束时间,eduBackground 教育背景,te.nature 工作性质,te.status 工作状态
     */
    List<Map<String,Object>> agreementTime(@Param("deptId") Integer deptId,@Param("postId") Integer postId,@Param("eduBackground") String eduBackground,
                                           @Param("nature") Integer nature, @Param("name") String name,@Param("phone") String phone,@Param("start") Integer start,
                                           @Param("pageSize") Integer pageSize);
    /**
     * 协议提醒总人数
     * @return
     */
    Integer agreementTimeCount(@Param("deptId") Integer deptId,@Param("postId") Integer postId,@Param("eduBackground") String eduBackground,
                               @Param("nature") Integer nature, @Param("name") String name,@Param("phone") String phone);

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
    EmployeeVO selectTeacherInfo(@Param("empId") Integer empId);

    /**
     * 添加员工
     * @param record
     * @return
     */
    int insertSelective(Employee record);

    /**
     * 查询总条数
     * @param deptId
     * @param postId
     * @param eduBackground
     * @param status
     * @param nature
     * @param name
     * @param phone
     * @return
     */
    Integer findCount(@Param("deptId") Integer deptId,@Param("postId") Integer postId,@Param("positionId") Integer positionId,
              @Param("eduBackground") String eduBackground,@Param("status") Integer status,@Param("nature") Integer nature,
              @Param("name") String name,@Param("phone") String phone);
    /**
     * 登陆方法
     * @param phone
     * @param password
     * @return
     */
    Employee login(@Param("phone") String phone,@Param("password") String password);

    /**
     * 分页查询
     * @return
     */
    List<EmployeeWithPage> findByPage(@Param("deptId") Integer deptId,@Param("postId") Integer postId,@Param("positionId") Integer positionId,
                                @Param("eduBackground") String eduBackground,@Param("status") Integer status,@Param("nature") Integer nature,
                                @Param("name") String name,@Param("phone") String phone,@Param("start") Integer start,@Param("pageSize") Integer pageSize);

    /**
     * 样例查询员工列表
     * @param example
     * @return
     */
    List<Employee> selectByExample(EmployeeExample example);

    /**
     * 自动生成员工编号
     * @return
     */
    int autoEmpno();

    /**
     * 查询所有的员工编号集合
     * @return
     */
    List<String> findAllEmpno();

    /**
     * 修改员工编号自动生成的基数
     * @param empno
     * @return
     */
    int updateEmpno(@Param("empno") Integer empno);

    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Employee record);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKey(Employee record);
}