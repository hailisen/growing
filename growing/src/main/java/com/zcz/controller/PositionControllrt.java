package com.zcz.controller;

import com.zcz.bean.Category;
import com.zcz.bean.Position;
import com.zcz.util.ResultData;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/position/")
@Api(value = "Position 职称管理及相关", tags = "职称管理及相关")
public class PositionControllrt extends BaseController{

    @PostMapping("deleteCategory/{cateId}")
    @ApiOperation(value = "删除一个职称类别")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void deleteCategory(@ApiParam(value = "职称类别ID",name = "cateId") @PathVariable Integer cateId, HttpServletResponse response, HttpServletRequest request){
        try {
            categoryService.deleteLecelByCateId(cateId);//删除职称类别的所属级别
            categoryService.deleteByPrimaryKey(cateId);
            resultData = ResultData.buildSuccessResult("请求成功");
            printJSONObject(resultData,response);
        }catch (Exception e){
            resultData = ResultData.buildFailureResult("系统内部出错");
            printJSONObject(resultData,response);
        }
    }
    @PostMapping("updateCategory")
    @ApiOperation(value = "修改/添加职称类别")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void updateCategoty(@ApiParam(value = "级别名称集合,用中文'，'分隔",name = "levelNames") String levelNames,
                               @ApiParam(value = "级别晋升年限,用中文'，'分隔",name = "limitTimes") String limitTimes,
                               @ApiParam(value = "职称类别ID 为空时添加/否则是修改",name = "id") Integer id,
                               @ApiParam(value = "职称类别名",name = "cateName") String cateName,
                               @ApiParam(value = "类别级别数量",name = "levelNum") Integer levelNum,
                               @ApiParam(value = "职称类别说明",name = "note") String note, HttpServletResponse response){
        try {
            if(id==null || id<=0){
                Category category = new Category(id,cateName,levelNum,note);
                int i = categoryService.insertSelective(category);
                id = category.getId();
            }else{
                //修改职称类别
                int i = positionService.updateCategory(id, cateName, levelNum, note);
                //删除级别表里原有的职称类别的级别
                int deleteResult = categoryService.deleteLecelByCateId(id);
            }
            /*
            添加新的职称级别
             */
            String[] levelNameList = levelNames.split("，");
            String[] limitTimeList = limitTimes.split("，");
            for (int j = 0; j < levelNameList.length; j++) {
                categoryService.insertLevel(levelNameList[j], Integer.valueOf(limitTimeList[j]), levelNameList[j], id);
            }
            resultData = ResultData.buildSuccessResult("操作成功");
            printJSONObject(resultData,response);
        }catch (Exception e){
            e.printStackTrace();
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
        }
    }

    @PostMapping("categoryList")
    @ApiOperation(value = "职称类别列表",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 \n职称类别id,职称类别姓名：cateName,说明：tc.note,人数：empNum",response = ResultData.class)})
    public void categoryList(HttpServletResponse response){
        List<Map<String,Object>> list = positionService.categoryList();
        if(list==null && list.size()<=0){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",list);
        printJSONObject(resultData,response);
    }

    @PostMapping("deletePosition")
    @ApiOperation(value = "删除职称",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void deletePosition(@ApiParam(value = "职称ID",name = "id") Integer id,HttpServletResponse response){
        int i = positionService.deleteByPrimaryKey(id);
        if(i<=0){
            resultData = ResultData.buildFailureResult("删除失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("addPosition")
    @ApiOperation(value = "添加/修改职称，ID为空时添加，不为空是为修改",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    @ApiImplicitParam(value = "职称实体类",name = "position",dataType = "Position")
    public void addPosition(Position position,HttpServletResponse response){
        int i = 0;
        if( null==position.getId() || position.getId()<=0){//为空时添加
            i = positionService.insertSelective(position);
        }else{//反之为修改
            i = positionService.updateByPrimaryKeySelective(position);
        }
        if(i<=0){
            resultData = ResultData.buildFailureResult("操作失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("操作成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("list")
    @ApiOperation(value = "职称详情列表",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功,返回数据为：id,positionName：职称名,cateName：所属类别,timeLimit：年限 ,empNum：人数",response = ResultData.class)})
    public void getList(HttpServletResponse response){
        //Map里的属性：id,positionName：职称名,cateName：所属类别,timeLimit：年限 ,empNum：人数
        List<Map<String,Object>> list = positionService.getPositionList();
        if(list==null || list.size()<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",list);
        printJSONObject(resultData,response);
    }

    @PostMapping("getSelectLevel")
    @ApiOperation(value = "级别下拉框",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功,返回数据为：id：级别ID level：级别 timeLimit：年限",response = ResultData.class)})
    public void getSelectLevel(@ApiParam(value = "职称类别ID",name = "cateId") Integer cateId, HttpServletResponse response){
        List<Map<String,Object>> list = positionService.findCateLevleByCateId(cateId);
        if(list==null || list.size()<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",list);
        printJSONObject(resultData,response);
    }

}
