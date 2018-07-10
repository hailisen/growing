package com.zcz.controller;

import com.zcz.bean.Agreement;
import com.zcz.bean.Employee;
import com.zcz.bean.User;
import com.zcz.bean.vo.DeptEmp;
import com.zcz.bean.vo.EmployeeWithPage;
import com.zcz.service.IEmployeeService;
import com.zcz.util.*;
import io.swagger.annotations.*;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

@RestController
@RequestMapping("/employee/")
@Api(value = "employee 用户及相关", tags = "用户及相关")
public class EmployeeController extends BaseController{

    @GetMapping("excleout")
    @ApiOperation(value = "Excle表格导出",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功")})
    public void excleOut(HttpServletResponse response,HttpServletRequest request,Integer[] notChoose,Integer[] chooseId){
        String path = request.getSession().getServletContext().getRealPath("upload//teacher");
        List<EmployeeWithPage> list = new ArrayList<>();
        Page<EmployeeWithPage> page = employeeService.findByPage(null,null,null,null,null,null,null,1,99999);
        if(chooseId==null || chooseId.length<=0){//如果chooseId为null，说明是全选，获取为选取的Id列表
            if(notChoose!=null && notChoose.length>0){
                for (Integer notChooseId :notChoose) {
                    for (EmployeeWithPage employee:page.getResult()){
                        if(employee.getId()!=notChooseId)
                            list.add(employee);
                    }
                }
            }else{
                list = page.getResult();
            }
        }else{
            for (Integer choose :chooseId) {
                for (EmployeeWithPage employee:page.getResult()){
                    if(employee.getId()==choose)
                        list.add(employee);
                }
            }
        }
        try {
            File file = ExcelUtil.excelOut(list,path);
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

    @GetMapping("excleout/agreement")
    @ApiOperation(value = "Excle表格导出",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功")})
    public void agreementExcleOut(HttpServletResponse response,HttpServletRequest request,Integer[] notChoose,Integer[] chooseId){
        String path = request.getSession().getServletContext().getRealPath("upload//teacher");
        List<Map<String,Object>> list = new ArrayList<>();
        Page<Map<String, Object>> page = employeeService.agreementTime(null,null,null,null, null,1,99999);
//        Page<EmployeeWithPage> page = employeeService.findByPage(null,null,null,null,null,null,null,1,99999);
        if(chooseId==null || chooseId.length<=0){//如果chooseId为null，说明是全选，获取为选取的Id列表
            if(notChoose!=null && notChoose.length>0){
                for (Integer notChooseId :notChoose) {
                    for (Map<String,Object> map:page.getResult()){
                        if(map.get("id")!=notChooseId)
                            list.add(map);
                    }
                }
            }else{
                list = page.getResult();
            }
        }else{
            for (Integer choose :chooseId) {
                for (Map<String,Object> map:page.getResult()){
                    if(map.get("id")==choose)
                        list.add(map);
                }
            }
        }
        try {
            File file = ExcelUtil.excelOutAgreement(list,path);
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

    @GetMapping("excleout/position")
    @ApiOperation(value = "Excle表格导出",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功")})
    public void positionExcleOut(HttpServletResponse response,HttpServletRequest request,Integer[] notChoose,Integer[] chooseId){
        String path = request.getSession().getServletContext().getRealPath("upload//teacher");
        List<Map<String,Object>> list = new ArrayList<>();
        Page<Map<String,Object>> page = employeeService.positionAlter(null,null,null,null,null,null,null,1,99999);
        if(chooseId!=null){//如果chooseId为null，说明是全选，获取为选取的Id列表
            if(chooseId.length>0){
            for (Integer choose :chooseId) {
                for (Map<String,Object> map:page.getResult()){
                    if(map.get("id")==choose)
                        list.add(map);
                }
            }
            }
        }else{
            if(notChoose.length>0 && notChoose!=null){
                for (Integer notChooseId :notChoose) {
                    for (Map<String,Object> map:page.getResult()){
                        if(notChooseId!=map.get("id"))
                            list.add(map);
                    }
                }
            }else{
                list = page.getResult();
            }

        }
        try {
            File file = ExcelUtil.excelOutPosition(list,path);
            // 设置响应头，控制浏览器下载该文件
            response.setHeader("content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF-8"));
            FileInputStream inputStream = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            //缓冲区
            int len = 0;
            byte[] b = new byte[1024];
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

    @PostMapping("position")
    @ApiOperation(value = "获取职称晋级人员")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功 name,sex,phone,deptName,tp.post_name as tp.postName,positionName, eduBackground,navitePlace,nature,status")})
    public void position(Integer postId,Integer positionId,String eduBackground,Integer status,Integer nature,String nameOrPhone,Integer pageNumber,Integer pageSize,
                         HttpServletResponse response){
        Page<Map<String,Object>> page = employeeService.positionAlter(null,postId,positionId,eduBackground,status,nature,nameOrPhone,pageNumber,pageSize);
        if(page.getResult().size()>0&&page.getResult()!=null){
            resultData = ResultData.buildSuccessResult("请求成功",page);
            printJSONObject(resultData,response,"getTime");
            return;
        }
        resultData = ResultData.buildFailureResult("无数据");
        printJSONObject(resultData,response);
    }

    @PostMapping("agreement")
    @ApiOperation(value = "获取协议即将到期的人员信息 提前一个月")
    /**
     * id 主键,name 姓名,sex 性别,phone 手机号,deptName 部门名称,postName 岗位名称,agreeName 协议名,
     * endTime 协议结束时间,eduBackground 教育背景,nature 工作性质,status 工作状态
     */
    public void agreement(Employee employee,String nameOrPhone,Integer pageNumber,Integer pageSize,HttpServletResponse response){
        Page<Map<String, Object>> page = employeeService.agreementTime(null,employee.getPostId(),employee.getEduBackground(),employee.getNature(), nameOrPhone,pageNumber,pageSize);
        if(page.getResult()==null && page.getResult().size()<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",page);
        printJSONObject(resultData,response);
    }

    @PostMapping("alter")
    @ApiOperation(value = "智能提醒协议即将到期人数及职称晋级人数")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功")})
    public void smartAlter(HttpServletResponse response){
        int position = employeeService.positionAlterCount();
        int agree = employeeService.agreementTimeCount();
        Map<String,Integer> map = new HashMap<>();
        map.put("positionCount",position);
        map.put("agreeCount",agree);
        resultData = ResultData.buildSuccessResult("请求成功",map);
        printJSONObject(resultData,response);
    }

    @PostMapping("findEmpByDept")
    @ApiOperation(value = "部门员工联动选择框",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = DeptEmp.class)})
    public void findEmpByDept(HttpServletResponse response){
        List<DeptEmp> list = employeeService.findEmpByDept();
        if(list == null || list.size()<=0){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",list);
        printJSONObject(resultData,response);
    }

    @PostMapping("batchadd")
    @ApiOperation(value = "Excel表格批量添加",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    @ApiImplicitParam(name="file",value = "文件上传域的name",required = true)
    public void batchAdd(@RequestParam(value = "file",required = false) MultipartFile file, HttpServletRequest request,HttpServletResponse response){
        allowsCrossDomain(response);
        String path = request.getSession().getServletContext().getRealPath("//upload//teacher");
        String filename = file.getOriginalFilename();
        String filetype = filename.substring(filename.lastIndexOf(".")+1);
        filename = UUID.randomUUID()+filename;
        //文件上传操作
        boolean b = fileUpload(file,path,filename);
        if(!b){
            resultData = ResultData.buildFailureResult("上传失败,请重试");
            printJSONObject(resultData,response);
            return;
        }
        //根据路径获取Excel表格的文件对象
        File excelFile = new File(path,filename);
        //查询所有员工编号集合
        List<String> emponList = employeeService.findAllEmpno();
        ResultData resultData = employeeService.batchInsert(excelFile,filetype,emponList);
        if(resultData!=null && !resultData.isSuccess()){
            printJSONObject(resultData,response);
            return;
        }
        Map<String,String> map = new HashMap<>();
        map.put("filePath","E:/workspace/growing/target/growing/upload/teacher/"+filename);
        resultData = ResultData.buildSuccessResult("上传成功",map);
        printJSONObject(resultData,response);
    }

    @PostMapping("add")
    @ApiOperation(value = "添加教师",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
            @ApiResponse(code = 200,message="请求成功",response = ResultData.class)})
    @ApiImplicitParam(name = "employee",value = "员工实体,见下方Model",required = true,dataType = "Employee")
    public void addEmployee(Employee employee,String name, @ApiParam(name = "positionId",value = "职称ID",required = false) Integer positionId,HttpServletResponse response){
        List<String> empnoList = employeeService.findAllEmpno();//查询出数据库的所有编号列表
        if(employee.getEmpNo()!=null) {
            if (empnoList.contains(employee.getEmpNo())) {
                resultData = ResultData.buildFailureResult("该员工编号已存在，请重新输入");
                printJSONObject(resultData, response);
                return;
            }
        }
        int i = employeeService.insertSelective(employee,positionId,empnoList);
        if(i<=0){
            resultData = ResultData.buildFailureResult("添加失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("添加成功");
        printJSONObject(resultData,response);

    }

    @PostMapping("login")
    @ApiOperation(value = "登陆接口", notes = "", httpMethod = "POST", response = Employee.class)
    @ApiResponses(value = {@ApiResponse(code = 500,message = "系统错误"),
                        @ApiResponse(code = 200,message="请求成功!data.data中的数据见下方model:Employee",response = ResultData.class)})
    @ApiImplicitParams(value = {@ApiImplicitParam(name ="phone" ,value = "手机号",required = true,dataType = "string"),
            @ApiImplicitParam(name ="remFlag" ,value = "是否记住密码，1为记住密码",required = false,dataType = "string")})
    public void login(String phone, @ApiParam(name="password",value="密码",required = true) String password, HttpServletResponse response, HttpServletRequest request, HttpSession session){
//        allowsCrossDomain(response);
        EncryptUtils encryptUtils = new EncryptUtils();
        String pass = encryptUtils.encryptToMD5(password);
        Employee employee = employeeService.login(phone,pass);
        if(employee==null){
            resultData = ResultData.buildFailureResult("用户名或密码错误");
            printJSONObject(resultData,response);
            return;
        }
        //记住用户名、密码功能(注意：cookie存放密码会存在安全隐患)                                                              //token验证   生成Token
        String rememberMe = request.getParameter("rememberMe");                                                              //Map<String,Object> map = new HashMap<>();
        String loginInfo;                                                                                                       //map.put("phone",phone);
        if("true".equals(rememberMe)){ //"true"表示用户勾选记住密码                                                             //String token = JWTUtil.sign(map,1000L*60*60*24*7);//token有效期为7天
            loginInfo = phone+"#"+password;                                                                                     //String loginInfo = "";
        }else{                                                                                                                  //if("true".equals(rememberMe)){ //"true"表示用户勾选记住密码
            loginInfo = "";                                                                                                     //   loginInfo = phone+"#"+password+"#"+token;
        }                                                                                                                       //}else{
        Cookie cookie = new Cookie("loginInfo",loginInfo);                                                               //    loginInfo = phone+"#"+token;
        cookie.setPath("/");
        cookie.setMaxAge(60*60*24*7);//cookie有效期7天
        response.addCookie(cookie);
        session.setAttribute("employee",employee);//当前用户信息添加到session
        resultData = ResultData.buildSuccessResult("登陆成功",employee);
        printJSONObject(resultData,response);
    }

    @RequestMapping("list")
    @ApiOperation(value = "分页查询教师列表",notes = "分页查询",httpMethod = "POST",response = EmployeeWithPage.class)
    @ApiImplicitParams(value = {@ApiImplicitParam(name ="deptId" ,value = "部门ID",required = false,dataType = "integer"),
                                @ApiImplicitParam(name ="postId" ,value = "岗位ID",required = false,dataType = "integer"),})
    @ApiResponses(value = {@ApiResponse(code = 200,message = "请求成功，data.data里面的数据见下方Page，page里的result模型为EmployeeWithPage",response = Page.class)})
    public void getList(@RequestParam(value = "deptId",required = false)Integer deptId,@RequestParam(value = "postId",required = false)Integer postId,
                        @ApiParam(name = "positionId",value = "职称ID",required = false)@RequestParam(value = "positionId",required = false) Integer positionId,
                                                      @ApiParam(name = "eduBackground",value = "学历",required = false) @RequestParam(value = "eduBackground",required = false) String eduBackground,
                                                      @ApiParam(name = "status",value = "工作状态 0/离职  1/在职  2/退休  3/返聘/",required = false) @RequestParam(value = "status",required = false)Integer status,
                                                      @ApiParam(name = "nature",value = "工作性质 0在编/ 1人事代理/ 2非人事代理/ 3退休返聘",required = false) @RequestParam(value = "nature",required = false)Integer nature,
                                                      @ApiParam(name = "nameOrPhone",value = "姓名或手机号",required = false) @RequestParam(value = "nameOrPhone",required = false)String nameOrPhone,
                                                      @ApiParam(name = "pageNumber",value = "当前页数",required = false) @RequestParam(value = "pageNumber",required = false)Integer pageNumber,
                                                      @ApiParam(name = "pageSize",value = "每页显示数据数",required = false)@RequestParam(value = "pageSize",required = false)Integer pageSize,HttpServletResponse response){
//        allowsCrossDomain(response);
        Page<EmployeeWithPage> page = employeeService.findByPage(deptId,postId,positionId,eduBackground,status,nature,nameOrPhone,pageNumber,pageSize);
        if(page.getResult()==null || page.getResult().size()<=0){
            resultData = ResultData.buildFailureResult("当前无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",page);
        printJSONObject(resultData,response);
    }

    @PostMapping("getDept")
    @ApiOperation(value = "查询部门下拉框列表",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 200,message = "请求成功，data.data里的数据---deptName部门名称，id:id",response = ResultData.class)})
    public void getDept(HttpServletResponse response){

        List<Map<String, Object>> maps = deptService.findDept();
        if(maps==null || maps.size()<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",maps);
        printJSONObject(resultData,response);
    }

    @PostMapping("getPost")
    @ApiOperation(value="查询岗位下拉框列表",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 200,message = "请求成功，data.data里的数据---postName岗位名称，id:id",response = ResultData.class)})
    public void getPost(HttpServletResponse response){
        allowsCrossDomain(response);
        List<Map<String, Object>> maps = postService.getPostByDept();
        if(maps==null || maps.size()<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",maps);
        printJSONObject(resultData,response);
    }

    @PostMapping("getPosition")
    @ApiOperation(value = "查询职称下拉框列表",notes = "",httpMethod = "POST")
    @ApiResponses(value = {@ApiResponse(code = 200,message = "请求成功，data.data里的数据---positionName岗位名称，id:id",response = ResultData.class)})
    public void getPosition(HttpServletResponse response){
        allowsCrossDomain(response);
        List<Map<String, Object>> maps = positionService.findPosition();
        if(maps==null || maps.size()<=0){
            resultData = ResultData.buildFailureResult("无数据");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",maps);
        printJSONObject(resultData,response);
    }
}
