package com.zcz.controller;

import com.zcz.bean.Commend;
import com.zcz.bean.vo.CommendList;
import com.zcz.util.Page;
import com.zcz.util.ResultData;
import io.swagger.annotations.*;
import org.openxmlformats.schemas.drawingml.x2006.main.STGuid;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

@RestController
@RequestMapping("/commend/")
@Api(value = "commend 奖彰管理及相关", tags = "奖彰统计及相关")
public class CommendController extends BaseController {

    @PostMapping("delete/{id}")
    @ApiOperation(value = "删除表彰",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void delete(@ApiParam(value = "表彰ID",name = "id") @PathVariable(value = "id") Integer id,HttpServletResponse response){
        int i = commendService.deleteById(id);
        if(i<=0){
            resultData = ResultData.buildFailureResult("由于服务器原因删除失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("add")
    @ApiOperation(value = "新增表彰",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void add(@ApiParam(value = "员工ID数组",name = "empIds") String empIds,
                    @ApiParam(value = "部门ID数组",name = "deptIds") String deptIds,
                    @ApiParam(value = "奖彰信息,员工ID以数组形式传递",name = "commend") Commend commend,
                    @RequestParam(value = "file",required = false) MultipartFile[] files,
                    HttpServletResponse response,HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("/upload//commendFiles");
        File tempFile = new File(path);
        if(!tempFile.exists()){
            tempFile.mkdirs();
        }
        String filenames = "";
        String urls = "";
        if(files!=null && files.length>0){//上传
            for(MultipartFile file : files){
                String filename = file.getOriginalFilename();
                filenames+=filename+"、";
                String urlFileName = UUID.randomUUID()+filename;
                urls+="upload/commendFiles/"+urlFileName+",";
                fileUpload(file,path,urlFileName);
            }
        }
        try {
            String[] strEmps = empIds.split(",");
            String[] strDepts = deptIds.split(",");
            System.out.println(strDepts);
            Set<Integer> emps = new HashSet<>();
            if(strEmps!=null && strEmps.length>0 && !strEmps[0].equals("")){
                for (String empId: strEmps) {
                    emps.add(Integer.valueOf(empId));
                }
            }
            if(strDepts!=null && strDepts.length>0 &&!strDepts[0].equals("")){
                for (String deptId : strDepts){
                    List<Integer> empIdsIndept = employeeService.findEmpIdInDept(Integer.valueOf(deptId));
                    for (Integer empIdIndept: empIdsIndept) {
                        emps.add(empIdIndept);
                    }
                }
            }
            for (Integer empId : emps) {
                commend.setEmpId(empId);
                commend.setFileName(filenames);
                commend.setUrl(urls);
                commendService.insert(commend);
            }
            resultData = ResultData.buildSuccessResult("添加成功");
            printJSONObject(resultData,response);
        }catch (Exception e){
            e.printStackTrace();
            resultData = ResultData.buildFailureResult("添加失败");
            printJSONObject(resultData,response);
        }
    }

    @PostMapping("commendList")
    @ApiOperation(value = "查询表彰列表",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误",response = CommendList.class),
            @ApiResponse(code = 200,message="请求成功 page中的result见下方Model： CommendList",response = Page.class)})
    public void findCommendList(@ApiParam(value = "获取时间,如:2018",name="getYear") @RequestParam(value = "getYear",required = false) Integer getYear,
                                @ApiParam(value = "级别0园级/ 1区级/ 2省级/ 3国家级",name="level") @RequestParam(value = "level",required = false)String level,
                                Integer pageNum, Integer pageSize, HttpServletResponse response){
        try {
            Page<CommendList> page = commendService.findCommendList(getYear, level, pageNum, pageSize);
            resultData = ResultData.buildSuccessResult("请求成功",page);
            printJSONObject(resultData,response);
        }catch (Exception e){
            e.printStackTrace();
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
        }
    }
    @PostMapping("findone")
    @ApiOperation(value = "获取一条表彰记录--用于修改",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 page中的result见下方Model： Commend",response = Commend.class)})
    public void findOneCommend(@ApiParam(value = "表彰ID",name = "id") Integer id,HttpServletResponse response){
        Commend commend = commendService.selectByPrimaryKey(id);
        if(commend==null){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",commend);
        printJSONObject(resultData,response);
    }

    @PostMapping("update")
    @ApiOperation(value = "修改表彰",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 page中的result见下方Model： Commend")})
    public void update(@ApiParam(value = "表彰实体",name="commend") Commend commend,
                       @ApiParam(value = "要删除的表彰文件URL",name = "deleteUrl") String deleteUrl,
                       @ApiParam(value = "未删除的老文件路径")String oldUrl,
                       @ApiParam(value = "未删除的老文件名",name = "deleteFile") String oldFilename,
                       @RequestParam(value = "file",required = false) MultipartFile[] files,HttpServletResponse response, HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("//upload//commendFiles");
        //删除服务器文件
        if(deleteUrl!=null && !"".equals(deleteUrl)){
            String[] deleteUrls = deleteUrl.split("，");
            for (String url:deleteUrls) {
                url = url.substring(url.lastIndexOf("/")+1);
                File deleteFile = new File(path,url);
                // 路径为文件且不为空则进行删除
                if (deleteFile.isFile() && deleteFile.exists()) {
                    deleteFile.delete();
                }
            }
        }
        String filename = "";
        String url = "";
        //上传新文件
        if(files!=null && files.length>0){
            for (MultipartFile file :files) {
                String newname = file.getOriginalFilename();
                filename = filename+newname+"、";
                newname = UUID.randomUUID()+newname;
                fileUpload(file,path,newname);
                url = url+"upload/commendFiles/"+newname+",";
            }
        }
        if(oldUrl==null||oldFilename==null){
            commend.setUrl(url);
            commend.setFileName(filename);
        }else{
            commend.setUrl(oldUrl+url);
            commend.setFileName(oldFilename+filename);
        }
        int result = commendService.updateByPrimaryKeySelective(commend);
        if(result<=0){
            resultData = ResultData.buildFailureResult("修改失败");
            printJSONObject(resultData,response);
            return;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("id",commend.getId());
        map.put("filenames",oldFilename+filename);
        map.put("urls",oldUrl+url);
        resultData = ResultData.buildSuccessResult("修改成功",map);
        printJSONObject(resultData,response);
    }

    @PostMapping("year")
    @ApiOperation(value = "获取年份下拉框内容",httpMethod = "POST")
    public void getYear(HttpServletResponse response){
        List<Integer> yearList = commendService.findCommendYear();
        if(yearList==null && yearList.size()<=0){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",yearList);
        printJSONObject(resultData,response);
    }

}
