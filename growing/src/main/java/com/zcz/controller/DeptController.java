package com.zcz.controller;

import com.zcz.bean.Dept;
import com.zcz.util.ResultData;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/dept/")
@Api(value = "Dept 部门管理及相关", tags = "部门管理及相关")
public class DeptController extends BaseController{

    @PostMapping("list")
    @ApiOperation(value = "部门详情列表",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功Map里的键有 id,deptName,empNum,note",response = ResultData.class)})
    public void list(HttpServletResponse response){
        List<Map<String,Object>> deptList = deptService.findDeptList();//id,deptName,empNum,note,orderNum
        if(deptList==null || deptList.size()<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",deptList);
        printJSONObject(resultData,response);
    }

    @PostMapping("order")
    @ApiOperation(value = "上移--修改排序",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void order(@ApiParam(value = "部门ID",name = "deptId",required = true) Integer deptId,
                      @ApiParam(value = "排序数",name = "order",required = true) Integer order,HttpServletResponse response){
        try {
            //将该条数据的上一条记录的排序改成和该条数据一直的，再讲该条数据的排序数-1
            if(order==1){
                resultData = ResultData.buildFailureResult("当前数据已在顶部");
                printJSONObject(resultData,response);
                return;
            }
            Integer i = deptService.updateOrderByOrder(order, order - 1);
            Integer i1 = deptService.updateOrderById(order - 1, deptId);
            resultData = ResultData.buildSuccessResult("请求成功");
            printJSONObject(resultData,response);
        }catch (Exception e){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
        }
    }

    @PostMapping("add")
    @ApiOperation(value = "添加部门",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    @ApiImplicitParam(value = "部门实体",name = "dept",dataType = "Dept")
    public void add(Dept dept,HttpServletResponse response){
        Integer orderNum = deptService.findOrderNum();
        dept.setOrderNum(orderNum+1);
        int i = deptService.insertSelective(dept);
        if(i<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("update")
    @ApiOperation(value = "修改部门",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    @ApiImplicitParam(value = "部门实体",name = "dept",dataType = "Dept")
    public void update(Dept dept,HttpServletResponse response){
        int i = deptService.updateByPrimaryKeySelective(dept);
        if(i<=0){
            resultData = ResultData.buildFailureResult("修改失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("remove/{deptId}/{orderNum}/{empNum}")
    @ApiOperation(value = "删除部门",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void delete(@ApiParam(value = "部门ID",name = "deptId")@PathVariable(value = "deptId") Integer deptId,
                       @ApiParam(value = "排序数",name = "orderNum")@PathVariable(value = "orderNum") Integer orderNum,
                       @ApiParam(value = "当前部门的员工数",name = "empNum") @PathVariable(value = "empNum") Integer empNum,HttpServletResponse response){
        if(empNum>0){
            resultData = ResultData.buildFailureResult("当前部门还有员工，无法删除！");
            printJSONObject(resultData,response);
            return;
        }
        int i = deptService.deleteByPrimaryKey(deptId);
        if(i<=0){
            resultData = ResultData.buildFailureResult("删除失败");
            printJSONObject(resultData,response);
            return;
        }
        List<Dept> depts = deptService.findDeptByOrder(orderNum);
        for (Dept dept:depts) {
            dept.setOrderNum(dept.getOrderNum()-1);
            deptService.updateByPrimaryKeySelective(dept);
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }
}
