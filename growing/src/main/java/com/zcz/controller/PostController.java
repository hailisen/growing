package com.zcz.controller;

import com.zcz.bean.Dept;
import com.zcz.bean.Post;
import com.zcz.util.ResultData;
import io.swagger.annotations.*;
import javafx.geometry.Pos;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/post/")
@Api(value = "PostController 岗位管理及相关", tags = "部门管理及相关")
public class PostController extends BaseController{

    @PostMapping("list")
    @ApiOperation(value = "获取职位列表",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 岗位ID:id,岗位名:postName,部门名:deptName,人数:empNum,说明:note,排序号:orderNum",response = Dept.class)})
    public void getList(Integer deptId,HttpServletResponse response){
        //Map中的值：id,postName,deptName,empNum,note,orderNum
        List<Map<String, Object>> postList =  postService.findPostList(deptId);
        if(postList==null && postList.size()<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",postList);
        printJSONObject(resultData,response);
    }

    @PostMapping("findOne")
    public void findById(Integer id,HttpServletResponse response){
        Post post = postService.selectByPrimaryKey(id);
        if(post==null){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",post);
        printJSONObject(resultData,response);
        return;
    }
    @PostMapping("add")
    @ApiOperation(value = "获取岗位列表",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 ",response = ResultData.class)})
    @ApiImplicitParam(value = "岗位实体",name = "post",dataType = "Post")
    public void add(Post post, HttpServletResponse response){
        //获取当前列表排名最靠后的排名书，新增的默认在最后一个
        Integer orderNum = postService.findOrderNum();
        post.setOrderNum(orderNum+1);
        Integer result = postService.insertSelective(post);
        if(result==null && result<=0){
            resultData = ResultData.buildFailureResult("添加失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("添加成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("update")
    @ApiOperation(value = "修改岗位信息")
    @ApiImplicitParam(value = "岗位实体",name = "post",dataType = "Post")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 ",response = ResultData.class)})
    public void update(@ApiParam(value = "岗位实体" ,name = "post")Post post, HttpServletResponse response){
        int i = postService.updateByPrimaryKeySelective(post);
        if(i<=0){
            resultData = ResultData.buildFailureResult("修改失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("修改成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("delete")
    @ApiOperation(value = "删除岗位",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 ",response = ResultData.class)})
    public void delete(@ApiParam(value = "岗位ID",name = "postId") Integer postId,@ApiParam(value = "排序数",name = "orderNum")  Integer orderNum,
                       @ApiParam(value = "当前部门的员工数",name = "empNum")Integer empNum,HttpServletResponse response){
        if(empNum>0){
            resultData = ResultData.buildFailureResult("当前岗位还有在职员工,无法删除");
            printJSONObject(resultData,response);
            return;
        }
        int i = postService.deleteByPrimaryKey(postId);
        if(i<=0){
            resultData = ResultData.buildFailureResult("删除失败");
            printJSONObject(resultData,response);
            return;
        }
        List<Post> postList = postService.findByOrder(orderNum);
        for (Post post:postList) {
            post.setOrderNum(post.getOrderNum()-1);
            postService.updateByPrimaryKeySelective(post);
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("order")
    public void order(@ApiParam(value = "当前排序数",name = "thisOrdel") Integer thisOrdel,
                      @ApiParam(value = "当前岗位ID",name = "postId") Integer postId,HttpServletResponse response){
        try {
            //将该条数据的上一条记录的排序改成和该条数据一直的，再讲该条数据的排序数-1
            if(thisOrdel==1){
                resultData = ResultData.buildFailureResult("当前数据已在顶部");
                printJSONObject(resultData,response);
                return;
            }
            int i = postService.updateOrderByOrder(thisOrdel,thisOrdel - 1);
            i = postService.updateOrderById(thisOrdel - 1, postId);
            resultData = ResultData.buildSuccessResult("操作成功");
            printJSONObject(resultData,response);
        }catch (Exception e){
            resultData = ResultData.buildFailureResult("操作失败请重试");
            printJSONObject(resultData,response);
        }
    }
}
