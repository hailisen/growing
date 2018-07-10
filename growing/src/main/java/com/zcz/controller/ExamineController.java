package com.zcz.controller;

import com.zcz.bean.Examine;
import com.zcz.bean.vo.EmployeeWithPage;
import com.zcz.bean.vo.ExamineList;
import com.zcz.bean.vo.ExamineYear;
import com.zcz.bean.vo.ExamineYearVO;
import com.zcz.util.ExcelUtil;
import com.zcz.util.Page;
import com.zcz.util.ResultData;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 年度考核控制层
 */
@RestController
@Api(value = "examines  --教师考核",tags = "教师考核")
@RequestMapping("/examine/")
public class ExamineController extends BaseController {

    @GetMapping("countExcleOut")
    @ApiOperation(value = "Excle表格导出",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功")})
    public void countExcleOut(HttpServletResponse response,HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("upload//teacher");
        Page<ExamineYearVO> page = examinService.examineByYear(null, null, 1, 99999);
        List<ExamineYearVO> list = page.getResult();
        try {
            File file = ExcelUtil.exmineCountExcelOut(list,path);
            // 设置响应头，控制浏览器下载该文件
            response.setHeader("content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF-8"));
            FileInputStream inputStream = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            //缓冲区
            byte[] b = new byte[1024];
            int len = 0;
            while ((len = inputStream.read(b))!=-1){
                os.write(b,0,len);
            }
            os.close();
            inputStream.close();
            file.delete();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @PostMapping("statistics")
    @ApiOperation(value = "近几年的年度考核统计" ,httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误",response = ExamineYearVO.class),
            @ApiResponse(code = 200,message="请求成功 page中的result见下方Model： ExamineYearVO",response = Page.class)})
    public void statistics(@ApiParam(value = "开始年份",name = "startYear") Integer startYear,@ApiParam(value = "结束年份",name = "endYear")Integer endYear,
                           @ApiParam(value = "当前页数",name = "pageNumber") Integer pageNumber,@ApiParam(value = "每页的长度",name = "pageSize") Integer pageSize,HttpServletResponse response){
        try {
            Page<ExamineYearVO> page = examinService.examineByYear(startYear, endYear, pageNumber, pageSize);
            resultData = ResultData.buildSuccessResult("请求成功",page);
            printJSONObject(resultData,response);
        }catch (Exception e){
            resultData = ResultData.buildFailureResult("服务器内部错误");
            printJSONObject(resultData,response);
            return;
        }
    }

    @PostMapping("add")
    @ApiOperation(value = "新增年度考核",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void addExamine(@ApiParam(value = "考核实体信息",name = "examine") Examine examine,HttpServletResponse response){
        List<Integer> list = employeeService.findAllId();
        try {
            for (Integer id : list) {
                examine.setEmpId(id);
                examinService.insertSelective(examine);
            }
        }catch (Exception e){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("update")
    @ApiOperation(value = "批量更改员工考核状态",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void update(@ApiParam(value = "员工ID数组",name = "ids") Integer[] ids,
                       @ApiParam(value = "考核结果",name = "result") Integer result,
                       @ApiParam(value = "考核年度",name = "year") Integer year,HttpServletResponse response){
        for (Integer id:ids) {
            examinService.updateResult(result,id,year);
        }
        resultData = ResultData.buildSuccessResult("请求成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("getCount")
    @ApiOperation(value = "考核人数统计",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 excellent:优秀人数、qualified:合格人数、\n" +
                    "passMuster:基本合格人数、unqualified:不合格人数、count:总人数",response = ResultData.class)})
    public void getCount(HttpServletResponse response){
        try {
            Map<String, Integer> map = examinService.examineCount();
            resultData = ResultData.buildSuccessResult("请求成功",map);
            printJSONObject(resultData,response);
            return;
        }catch (Exception e){
            resultData = ResultData.buildFailureResult("服务器内部出错");
            printJSONObject(resultData,response);
        }

    }

    @GetMapping("excleout")
    @ApiOperation(value = "Excle表格导出",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功")})
    public void excleOut(HttpServletResponse response, HttpServletRequest request, Integer[] notChoose, Integer[] chooseId){
        String path = request.getSession().getServletContext().getRealPath("upload//teacher");
        List<ExamineList> list = new ArrayList<>();
        Page<ExamineList> page = examinService.getExamineList(null,null,1,99999);
        if(chooseId==null || chooseId.length<=0){//如果chooseId为null，说明是全选，获取为选取的Id列表
            if(notChoose!=null && notChoose.length>0){
                for (Integer notChooseId :notChoose) {
                    for (ExamineList examine:page.getResult()){
                        if(examine.getId()!=notChooseId)
                            list.add(examine);
                    }
                }
            }else{
                list = page.getResult();
            }
        }else{
            for (Integer choose :chooseId) {
                for (ExamineList examine:page.getResult()){
                    if(examine.getId()==choose) list.add(examine);
                }
            }
        }
        try {
            File file = ExcelUtil.exmineExcelOut(list,path);
            // 设置响应头，控制浏览器下载该文件
            response.setHeader("content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF-8"));
            FileInputStream inputStream = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            //缓冲区
            byte[] b = new byte[1024];
            int len = 0;
            while ((len = inputStream.read(b))!=-1){
                os.write(b,0,len);
            }
            os.close();
            inputStream.close();
            file.delete();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @PostMapping("examinelist")
    @ApiOperation(value = "获取考核列表",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误",response = ExamineList.class),
            @ApiResponse(code = 200,message="请求成功，page里的属性是ExamineList",response = ResultData.class)})
    public void examineList(@ApiParam(value = "考核年度",name = "year") @RequestParam(value = "year",required = false) Integer year,
                            @ApiParam(value = "考核结果",name = "result") @RequestParam(value = "result",required = false) Integer result,
                            @ApiParam(value = "当前页数",name = "pageNumber") @RequestParam(value = "pageNumber",required = true) Integer pageNumber,
                            @ApiParam(value = "每页显示个数",name = "pageSize") @RequestParam(value = "pageSize",required = true) Integer pageSize,HttpServletResponse response){
        Page<ExamineList> page = examinService.getExamineList(year,result,pageNumber,pageSize);
        if(page.getResult()==null || page.getResult().size()<=0){
            String str = "sss";
            str.concat("aa");
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",page);
        printJSONObject(resultData,response);
    }

    @PostMapping("getYear")
    @ApiOperation(value = "获取年度下拉框列表",httpMethod = "POST")
    public void getYears(HttpServletResponse response){
        List<Integer> list = examinService.findYean();
        if(list==null || list.size()<=0){
            resultData = ResultData.buildFailureResult("加载失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",list);
        printJSONObject(resultData,response);
    }
}
