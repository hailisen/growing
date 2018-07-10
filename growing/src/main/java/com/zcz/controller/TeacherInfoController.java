package com.zcz.controller;

import com.zcz.bean.*;
import com.zcz.bean.vo.EmployeeVO;
import com.zcz.util.DateUtil;
import com.zcz.util.EncryptUtils;
import com.zcz.util.ResultData;
import io.swagger.annotations.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

@Api(value = "teacher  --教师详情页",tags = "教师详情页")
@RestController
@RequestMapping("/teacher/")
public class TeacherInfoController extends BaseController{

    @PostMapping("change")
    @ApiOperation(value = "新增人员变动",httpMethod = "POST")
    @ApiImplicitParam(name = "change",value = "变更实体，见下方Model：Changed",dataType = "Changed")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void addChange(Changed change,HttpServletResponse response){
        int result = changeService.insertSelective(change);
        if(result<=0){
            resultData = ResultData.buildFailureResult("添加失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("添加成功",change.getId());
        printJSONObject(resultData,response);
    }

    @PostMapping("deleteChange/{id}")
    @ApiOperation(value = "删除变动信息",httpMethod = "POST")
    public void removeChange(@ApiParam(name = "id",value = "要删除的变更信息的ID") @PathVariable(value = "id") Integer id,HttpServletResponse response){
        int result = changeService.deleteByPrimaryKey(id);
        if(result<=0){
            resultData = ResultData.buildFailureResult("删除失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("findOneChanged/{id}")
    @ApiOperation(value = "根据ID查询一条变动信息")
    public void findOneChange(@PathVariable(value = "id") Integer id,HttpServletResponse response){
        Changed changed = changeService.selectByPrimaryKey(id);
        if(changed==null){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        Post post = postService.selectByPrimaryKey(changed.getPostId());
        Map<String,Object> map = new HashMap<>();
        map.put("changed",changed);
//        map.put("deptId",post.getDeptId());
        resultData = ResultData.buildSuccessResult("请求成功",map);
        printJSONObject(resultData,response);
    }

    @PostMapping("updateChange")
    @ApiOperation(value = "修改变动信息",httpMethod = "POST")
    @ApiImplicitParam(name = "change",value = "变更实体，见下方Model：Changed",dataType = "Changed")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    public void updateChange(Changed changed,HttpServletResponse response){
        int result = changeService.updateByPrimaryKeySelective(changed);
        if(result<=0){
            resultData = ResultData.buildFailureResult("修改失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("修改成功",changed.getId());
        printJSONObject(resultData,response);
    }
    @PostMapping("addAgreement")
    @ApiOperation(value = "新增协议",httpMethod = "POST")
    @ApiImplicitParam(name = "agreement",value = "协议实体，见下方Model：Agreement",dataType = "Agreement")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Position",response = ResultData.class)})
    public void  addAgreement(Agreement agreement,@RequestParam(value = "file",required = false) MultipartFile[] files,
                              HttpServletRequest request, HttpServletResponse response){
        String path = request.getSession().getServletContext().getRealPath("//upload//agreement");
        String url = "";
        String filename = "";
        if(files!=null && files.length>0){
            File tempFile = new File(path);
            if(!tempFile.exists()){
                tempFile.mkdirs();
            }
            for (MultipartFile file : files) {
                String tempname = file.getOriginalFilename();
                tempname = UUID.randomUUID()+tempname;
                fileUpload(file,path,tempname);
                url = url+"upload/agreement/"+tempname+",";//拼接url
                filename = filename + file.getOriginalFilename() + "、";//拼接文件名
            }
        }
        agreement.setFilename(filename);
        agreement.setUrl(url);
        int i = agreementService.insertSelective(agreement);
        if(i<=0){
            resultData = ResultData.buildFailureResult("添加失败");
            printJSONObject(resultData,response);
            return;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("id",agreement.getId());
        map.put("url",url);
        map.put("filename",filename);
        resultData = ResultData.buildSuccessResult("请求成功",map);
        printJSONObject(resultData,response);
    }
    @PostMapping("agreementById/{id}")
    public void selectAgreementById(@PathVariable(value = "id") Integer id,HttpServletResponse response){
        Agreement agreement = agreementService.selectByPrimaryKey(id);
        if(agreement==null){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",agreement);
        printJSONObject(resultData,response);
    }
    @PostMapping("updateAgreement")
    @ApiOperation(value = "修改协议",httpMethod = "POST")
    @ApiImplicitParam(name="agreement",value = "协议实体",dataType = "Agreement")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Position",response = Agreement.class)})
    public void updateAgreement(Agreement agreement,@RequestParam(value = "file",required = false) MultipartFile[] files,String oldUrl,String oldFilename,HttpServletResponse response,HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("//upload//agreement");
        File tempFile = new File("path");
        if(!tempFile.exists()){
            tempFile.mkdirs();
        }
        String fileNames = "";
        String urls = "";
        if(files!=null && files.length>0){
            for (MultipartFile file:files) {
                String filename = file.getOriginalFilename();
                filename = UUID.randomUUID()+filename;
                fileUpload(file,path,filename);
                fileNames = fileNames+file.getOriginalFilename()+"、";
                urls = urls+"upload/agreement/"+filename+",";
            }
        }
        agreement.setUrl(oldUrl+urls);
        agreement.setFilename(oldFilename+fileNames);
        Integer result = agreementService.updateByPrimaryKeySelective(agreement);
        if(result<=0){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("id",agreement.getId());
        map.put("url",oldUrl+urls);
        map.put("filename",oldFilename+fileNames);
        resultData = ResultData.buildSuccessResult("请求成功",map);
        printJSONObject(resultData,response);
    }
    @PostMapping("deleteAgreement/{id}")
    @ApiOperation(value = "删除协议",httpMethod = "POST")
    public void deleteAgreement(@PathVariable(value = "id") Integer id,HttpServletResponse response){
        Integer result = agreementService.deleteByPrimaryKey(id);
        if(result<=0){
            resultData = ResultData.buildFailureResult("删除失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }
    /**表彰相关
     * 表彰相关
     * @param commend
     * @param files
     * @param request
     * @param response
     */
    @PostMapping("addCommend")
    @ApiOperation(value = "给教师添加表彰",httpMethod = "POST")
    @ApiImplicitParam(name = "commend",value = "表彰信息实体，见下方Model：Commend",required = true,dataType = "Commend")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Position",response = ResultData.class)})
    public void addCommend(Commend commend,@RequestParam(value = "file",required = false) MultipartFile[] files,
                           HttpServletRequest request, HttpServletResponse response){
        String path = request.getSession().getServletContext().getRealPath("//upload//commendFiles");
        String url = "";
        String filename = "";
        //上传
        if(files != null && files.length>0){
            File tempFile = new File(path);
            if(!tempFile.exists()){
                tempFile.mkdirs();
            }
            for (MultipartFile file : files) {
                String tempname = file.getOriginalFilename();
                filename = filename+tempname+"、";
                tempname = UUID.randomUUID()+tempname;
                url = url+"upload/commendFiles/"+tempname+",";
                fileUpload(file,path,tempname);
            }
        }
        commend.setFileName(filename);
        commend.setUrl(url);
        int result = commendService.insertSelective(commend);
        if(result<0){
            resultData = ResultData.buildFailureResult("添加失败");
            printJSONObject(resultData,response);
            return;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("id",commend.getId());
        map.put("url",url);
        map.put("filename",filename);
        resultData = ResultData.buildSuccessResult("添加成功",map);
        printJSONObject(resultData,response);
    }

    @PostMapping("updateEmpPosition")
    @ApiOperation(value = "修改教师的职称信息",httpMethod = "POST")
    public void updateEmpPosition(Integer id,Integer positionId,Integer empId,String getDate,String oldUrl,String oldFilename,
                                  @RequestParam(value = "file",required = false) MultipartFile[] files,HttpServletResponse response,HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("/upload/positionFiles");
        File tempFile = new File(path);
        if(!tempFile.exists()){
            tempFile.mkdirs();
        }
        String newfilename = "";
        String newUrl = "";
        if(files!=null && files.length>0){
            for (MultipartFile file: files) {
                String temp = UUID.randomUUID()+file.getOriginalFilename();
                newUrl = newUrl+"upload/positionFiles/"+temp+",";//如果有多个文件拼接文件路径
                //文件名拼接
                newfilename = newfilename+file.getOriginalFilename()+"、";
                fileUpload(file,path,file.getOriginalFilename());//文件上传操作
            }
        }
        String url = oldUrl+newUrl;
        String fileName = oldFilename+newfilename;
        int result = positionService.updatePositionForEmp(id, positionId, empId, getDate, url, fileName);
        if(result<=0){
            resultData = ResultData.buildFailureResult("修改失败");
            printJSONObject(resultData,response);
            return;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("peId",id);
        map.put("url",url);
        map.put("filename",fileName);
        resultData = ResultData.buildSuccessResult("修改成功",map);
        printJSONObject(resultData,response);
    }
    @PostMapping("addPosition")
    @ApiOperation(value = "给教师添加教师职称",httpMethod = "POST")
    @ApiImplicitParam(name = "position",value = "职称信息实体",required = false,dataType = "Position")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Position",response = ResultData.class)})
    public void addPosition(@ApiParam(name = "empId",value = "员工ID",required = false)Integer empId,
                            @ApiParam(name = "positionId",value = "职称ID",required = false)Integer positionId,
                            @ApiParam(name = "getDate",value = "获取时间",required = false)String getDate,
                            @ApiParam(name = "files",value = "文件上传域",required = false) @RequestParam(name = "file",required = false) MultipartFile[] file,
                            HttpServletResponse response, HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("/upload/positionFiles");
        File tempFile = new File(path);
        if(!tempFile.exists()){
            tempFile.mkdirs();
        }
        String filename = "";
        String url = "";
        if(file!=null && file.length>0){
            for (MultipartFile file1: file) {
                String tempfilename = file1.getOriginalFilename();
                filename = filename+tempfilename+"、";
                tempfilename = UUID.randomUUID()+tempfilename;//文件名拼接
                url = url+"upload/positionFiles/"+tempfilename+",";//如果有多个文件拼接文件路径
                fileUpload(file1,path,tempfilename);//文件上传操作
            }
        }
        Map<String,Object> map = new HashMap<>();
        map.put("id",0);
        map.put("positionId",positionId);
        map.put("empId",empId);
        map.put("getTime",DateUtil.parseDate(getDate,"yyyy-MM-dd"));
        map.put("url",url);
        map.put("fileName",filename);
        int result = positionService.addPositionFroEmp(map);
        if(result<=0){
            resultData = ResultData.buildFailureResult("添加职称失败");
            printJSONObject(resultData,response);
            return;
        }
        Map<String,Object> map1 = new HashMap<>();
        map1.put("peId",map.get("id"));
        map1.put("url",url);
        map1.put("filename",filename);
        resultData = ResultData.buildSuccessResult("添加职称成功",map1);
        printJSONObject(resultData,response);
    }

    @PostMapping("delete/emp/position/{peId}")
    @ApiOperation(value = "删除教师的职称信息",httpMethod = "POST")
    public void deleteEmpPosition(@ApiParam(name = "peId",value = "教师职称关联表的ID")@PathVariable(value = "peId") Integer peId,HttpServletResponse response){
        Integer result = positionService.deletePositionEmp(peId);
        if(result<=0){
            resultData = ResultData.buildFailureResult("删除失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("categorys")
    @ApiOperation(value = "获取职称类别下拉框",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Position",response = ResultData.class)})
    public void getCategory(HttpServletResponse response){
        List<Map<String, Object>> categorys = positionService.findCategory();
        if(categorys==null && categorys.size()<0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",categorys);
        printJSONObject(resultData,response);
    }

    /**
     * 根据职称类别获取职称名称
     */
    @PostMapping("positions")
    @ApiOperation(value = "获取职称名称下拉框",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Position",response = ResultData.class)})
    public void getPosition(@ApiParam(name = "categoryId",value = "职称类别ID",required = true) Integer categoryId,HttpServletResponse response){
        List<Map<String, Object>> positions  =  positionService.findPositionByCate(categoryId);
        if(positions==null && positions.size()>0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",positions);
        printJSONObject(resultData,response);
    }

    @PostMapping("addeducation")
    @ApiOperation(value = "添加教师教育背景",httpMethod = "POST")
    @ApiImplicitParam(name = "education",value = "教育背景实体",required = false,dataType = "EducationBackground")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Employee",response = ResultData.class)})
    public void addEdu(EducationBackground education,HttpServletResponse response){
        allowsCrossDomain(response);
        int result = educationBackgroundService.insertSelective(education);
        Employee employee = employeeService.selectByPrimaryKey(education.getEmpId());
        String edu=null;
        switch(education.getEduLevel()){
            case 0:
                edu="初中";
                break;
            case 1:
                edu="高中";
                break;
            case 2:
                edu="中专";
                break;
            case 3:
                edu="大专";
                break;
            case 4:
                edu="本科";
                break;
            case 5:
                edu="硕士";
                break;
            case 6:
                edu="博士";
                break;
        }
        if(employee.getEduBackground()==null || "".equals(employee.getEduBackground())){
            employee.setEduBackground(edu);
            employeeService.updateByPrimaryKeySelective(employee);
        }else{
            Integer eduint = null;
            String eduBackground = employee.getEduBackground();
            if(eduBackground.equals("初中")){
                eduint=0;
            }else if(eduBackground.equals("高中")){
                eduint=1;
            }else if(eduBackground.equals("中专")){
                eduint=2;
            }else if(eduBackground.equals("大专")){
                eduint=3;
            }else if(eduBackground.equals("本科")){
                eduint=4;
            }else if(eduBackground.equals("硕士")){
                eduint=5;
            }else if(eduBackground.equals("博士")){
                eduint=6;
            }
            if(education.getEduLevel()>eduint){
                employee.setEduBackground(edu);
                employeeService.updateByPrimaryKeySelective(employee);
            }
        }
        if(result<=0){
            resultData = ResultData.buildFailureResult("添加失败");
            printJSONObject(resultData,response);
            return ;
        }
        resultData =ResultData.buildSuccessResult("添加成功",education.getId());
        printJSONObject(resultData,response);
        return ;
    }

    @PostMapping("findEduById/{id}")
    @ApiOperation(value = "查询一条教育信息",httpMethod = "POST")
    @ApiImplicitParam(name = "id",value = "教育背景ID",required = false,dataType = "EducationBackground")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Employee",response = EducationBackground.class)})
    public void selectByPrimaryKey(@PathVariable(value = "id") Integer id,HttpServletResponse response){
        EducationBackground background = educationBackgroundService.selectByPrimaryKey(id);
        if(background==null){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",background);
        printJSONObject(resultData,response);
    }
    @PostMapping("removeedu/{id}")
    @ApiOperation(value = "删除教师教育背景",httpMethod = "POST")
    @ApiImplicitParam(name = "id",value = "教育背景ID",required = true)
    public void eduRemove(@PathVariable(value = "id") Integer id,HttpServletResponse response){
        int result = educationBackgroundService.deleteByPrimaryKey(id);
        if(result<=0){
            resultData = ResultData.buildFailureResult("删除失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("updateEdu")
    @ApiOperation(value = "修改教师教育背景",httpMethod = "POST")
    @ApiImplicitParam(name = "id",value = "教育ID")
    public void eduUpdate(EducationBackground background,Integer eduId,HttpServletResponse response){
        background.setId(eduId);
        int result = educationBackgroundService.updateByPrimaryKeySelective(background);
        Employee employee = employeeService.selectByPrimaryKey(background.getEmpId());
        String edu=null;
        switch(background.getEduLevel()){
            case 1:
                edu="高中";
                break;
            case 2:
                edu="中专";
                break;
            case 0:
                edu="初中";
                break;
            case 3:
                edu="大专";
                break;
            case 4:
                edu="本科";
                break;
            case 5:
                edu="硕士";
                break;
            case 6:
                edu="博士";
                break;
        }
        if(employee.getEduBackground()==null || "".equals(employee.getEduBackground())){
            employee.setEduBackground(edu);
            employeeService.updateByPrimaryKeySelective(employee);
        }else{
            Integer eduint = null;
            String eduBackground = employee.getEduBackground();
            if(eduBackground.equals("初中")){
                eduint=0;
            }else if(eduBackground.equals("中专")){
                eduint=2;
            }else if(eduBackground.equals("高中")){
                eduint=1;
            }else if(eduBackground.equals("大专")){
                eduint=3;
            }else if(eduBackground.equals("博士")){
                eduint=6;
            }else if(eduBackground.equals("硕士")){
                eduint=5;
            }else if(eduBackground.equals("本科")){
                eduint=4;
            }
            if(background.getEduLevel()>eduint){
                employee.setEduBackground(edu);
                employeeService.updateByPrimaryKeySelective(employee);
            }
        }
        if(result<=0){
            resultData = ResultData.buildFailureResult("修改失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("修改成功",background.getId());
        printJSONObject(resultData,response);
    }


    /**@PostMapping("toUpdate/{empId}")
    @ApiOperation(value = "编辑教师信息",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:Employee",response = ResultData.class)})
    public void toUpdate(@ApiParam(value = "员工ID",name = "empId" ,required = true) @PathVariable(value = "empId") Integer empId,HttpServletResponse response){
        allowsCrossDomain(response);
        Employee employee = employeeService.selectByPrimaryKey(empId);
        if(employee == null){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",employee);
        printJSONObject(resultData,response);
    }*/

    @PostMapping("update")
    @ApiOperation(value = "修改教师信息",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功")})
    public void update(@ApiParam(value = "员工ID",name = "employee" ,required = true) Employee employee,String oldPassword, String newPassword,@ApiParam(value = "更改之前的员工号，用来判断员工号是否经过修改",name = "oldEmpNo" ,required = true) String oldEmpNo,HttpServletResponse response){
        allowsCrossDomain(response);
        int result = 0;
        if(newPassword !=null && !"".equals(newPassword) && oldPassword !=null && !"".equals(oldPassword)){
            EncryptUtils encrypt = new EncryptUtils();
            oldPassword = encrypt.encryptToMD5(oldPassword);
            Employee employee1 = employeeService.login(employee.getPhone(),oldPassword);
            if(employee1==null){
                resultData = ResultData.buildFailureResult("原密码错误");
                printJSONObject(resultData,response);
                return;
            }
            newPassword = encrypt.encryptToMD5(newPassword);
            employee.setPassword(newPassword);
        }
        if("".equals(oldEmpNo)|| oldEmpNo==null || oldEmpNo.equals(employee.getEmpNo())){//未修改员工号直接进行修改操作
            result = employeeService.updateByPrimaryKeySelective(employee);
        }else{//如果修改员工号，先判断员工号是否已经存在，如存在则报错，不存在则继续进行修改操作
            if(employeeService.findAllEmpno().contains(employee.getEmpNo())){
                resultData = ResultData.buildFailureResult("员工编号已存在");
                printJSONObject(resultData,response);
                return;
            }
            result = employeeService.updateByPrimaryKeySelective(employee);
        }
        if(result<=0){
            resultData = ResultData.buildFailureResult("修改失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("修改成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("info/{empId}")
    @ApiOperation(value = "查询教师详情",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误",response = EmployeeVO.class),
            @ApiResponse(code = 200,message="请求成功 具体数据见下方Model:EmployeeVO",response = ResultData.class)})
    public void info(@ApiParam(value = "教师ID",name="empId",required = true) @PathVariable(value = "empId") Integer empId, HttpServletResponse response){
        allowsCrossDomain(response);
        EmployeeVO employee = employeeService.selectTeacherInfo(empId);
        if(employee == null){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",employee);
        printJSONObject(resultData,response);
    }

    @PostMapping("updateExamine")
    @ApiOperation(value = "修改一条考核结果",httpMethod = "POST")
    public void updateExamineResult(@ApiParam(value = "考核结果",name = "result") Integer result,@ApiParam(value = "考核ID",name = "id") Integer id,HttpServletResponse response){
        int i = examinService.updateById(result,id);
        if(i<=0){
            resultData = ResultData.buildFailureResult("修改失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("修改成功");
        printJSONObject(resultData,response);
    }


    @RequestMapping("wanwan")
    public void wan(@RequestParam(name="file",required = false)MultipartFile[] files,HttpServletResponse response){
        String filename="";
        for (MultipartFile f :files) {
            filename += f.getOriginalFilename()+"、";
        }
        resultData = ResultData.buildSuccessResult("请求成功",filename);
        printJSONObject(resultData,response);
    }
}
