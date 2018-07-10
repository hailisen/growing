package com.zcz.controller;

import com.zcz.bean.*;
import com.zcz.bean.vo.ChangedVO;
import com.zcz.bean.vo.EmployeeVO;
import com.zcz.bean.vo.PositionVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 页面跳转
 */
@ApiIgnore
@Controller
public class PageTurnsController extends BaseController{

    /**跳转向登录页面*/
    @RequestMapping("/")
    public String toLogin(){
        return "login";
    }
    @RequestMapping("/toLogin")
    public String toLogin1(HttpSession session){
        session.removeAttribute("employee");
        return "redirect:/";
    }
    /**跳转首页**/
    @RequestMapping("/toIndex")
    public String toIndex(HttpServletRequest request,String token,String phone){
        return "index";
    }
    /*跳转向添加员工页面*/
    @RequestMapping("/toAddEmployee")
    public String toAddEmp(){
        return "employee/addEmployee";
    }
    /*跳转向导入Excel信息与页面*/
    @RequestMapping("/toInexcel")
    public String toInExcel(){
        return "employee/inExcel";
    }
    /*跳转向教师详情页面*/
    @RequestMapping("/toTeacher/{id}")
    public String toTeacher(@PathVariable(value = "id") Integer id, HttpServletRequest request){
        request.setAttribute("id",id);
        EmployeeVO employee = employeeService.selectTeacherInfo(id);
        List<PositionVO> voList = employee.getPositions();
        if(voList!=null && voList.size()>0){
            String positionName = voList.get(voList.size()-1).getPositionName();
            request.setAttribute("positionName",positionName);
        }
        request.setAttribute("teacher",employee);
        return "employee/teacherInfo";
    }
    /*跳转向修改编辑教师基本信息*/
    @RequestMapping("teacher/toUpdate/{empId}")
    public String toUpdateTeacher(@PathVariable(value = "empId") Integer empId,HttpServletRequest request){
        Employee employee = employeeService.selectByPrimaryKey(empId);
        request.setAttribute("updateEmployee",employee);
        return "employee/updateEmployee";
    }
    /*跳转向修改个人信息页面*/
    @RequestMapping("/toMyInfo")
    public String toMyInfo(HttpSession session,HttpServletRequest request){
        Employee employee = (Employee) session.getAttribute("employee");
        request.setAttribute("employee",employee);
        return "employee/userInfo";
    }
    /**跳转向年度考核*/
    @RequestMapping("/examines")
    public String toExamine(){
        return "examine";
    }
    /*跳转向添加考核*/
    @RequestMapping("/toAddExamine")
    public String toAddExamine(){
        return "examine/add_examine";
    }
    /*考核统计*/
    @RequestMapping("/toCount")
    public String toExamineCount(){
        return "examine/examine_count";
    }
    /**跳转向表彰统计*/
    @RequestMapping("/commends")
    public String toCommend(){
        return "commend";
    }
    /*跳转向添加表彰*/
    @RequestMapping("/toAddCommend")
    public String toAddCommend(){
        return "commend/add_commend";
    }
    /*跳转向修改表彰*/
    @RequestMapping("toUpdateCommend/{id}/{name}")
    public String toUpdateCommend(@PathVariable(value = "id") Integer id,@PathVariable(value = "name") String name,HttpServletRequest request){
        request.setAttribute("id",id);
        request.setAttribute("name",name);
        return "commend/update_commend";
    }
    /**跳转向部门管理*/
    @RequestMapping("/depts")
    public String toDept(){
        return "dept";
    }
    /*跳转向添加部门*/
    @RequestMapping("/toAddDept")
    public String toAddDept(){
        return "dept/addDept";
    }
    /*跳转向修改部门*/
    @RequestMapping("/toUpdateDept/{id}")
    public String toUpdateDept(@PathVariable(value = "id") Integer id,HttpServletRequest request){
        Dept dept = deptService.selectByPrimaryKey(id);
        request.setAttribute("dept",dept);
        return "dept/update_dept";
    }
    /**跳转向岗位管理*/
    @RequestMapping("/posts")
    public String toPost(){
        return "post";
    }
    /*跳转向添加岗位*/
    @RequestMapping("/toAddPost")
    public String toAddPost(){
        return "post/addPost";
    }
    /*跳转向修改岗位*/
    @RequestMapping("/toUpdatePost/{id}")
    public String toUpdatePost(@PathVariable(value = "id") Integer id,HttpServletRequest request){
        Post post = postService.selectByPrimaryKey(id);
        request.setAttribute("post",post);
        return "post/updatePost";
    }
    /**跳转向职称管理*/
    @RequestMapping("/positions")
    public String toPosition(){
        return "position";
    }
    /*跳转向添加职称*/
    @RequestMapping("/toAddPosition")
    public String toAddPosition(){
        return "position/addPosition";
    }
    /*跳转向修改职称*/
    @RequestMapping("/toUpdatePosition/{id}")
    public String toUpdatePosition(@PathVariable(value = "id") Integer id,HttpServletRequest request){
        Position position = positionService.selectByPrimaryKey(id);
        //根据级别ID查询该条级别对应的职称类别
        Map<String,Object> cateLevel = categoryService.findCateLevelById(position.getCategoryId());
        request.setAttribute("position",position);
        request.setAttribute("cateId",cateLevel.get("categoryId"));
        return "position/updatePosition";
    }
    /*跳转向职称类别*/
    @RequestMapping("/toCategory")
    public String toCategory(){
        return "position/category";
    }
    /*跳转向添加职称类别*/
    @RequestMapping("toAddCategory")
    public String toAddCategory(){
        return "position/addCategory";
    }
    /*跳转向修改职称类别*/
    @RequestMapping("toUpdateCategory/{id}")
    public String toUpdateCategory(@PathVariable("id") Integer id,HttpServletRequest request){
        Category category = categoryService.selectByPrimaryKey(id);
        //id,levelName,timeLimit
        List<Map<String,Object>> cateLevels = categoryService.findCateLevelByCateId(id);
        request.setAttribute("cateLevels",cateLevels);
        request.setAttribute("category",category);
        return "position/updateCategory";
    }
    /**跳转向系统管理*/
    @RequestMapping("/settings")
    public String toSettings(){
        return "setting";
    }
}
