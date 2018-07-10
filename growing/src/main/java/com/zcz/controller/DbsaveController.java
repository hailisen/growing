package com.zcz.controller;

import com.zcz.bean.DbSave;
import com.zcz.bean.Employee;
import com.zcz.util.AddressUtil;
import com.zcz.util.Operate;
import com.zcz.util.ResultData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/database/")
@Api(value = "数据库备份相关", tags = "奖彰统计及相关")
public class DbsaveController extends BaseController{

    @PostMapping("list")
    @ApiOperation(value = "数据库备份记录列表",httpMethod = "POST")
    public void list(HttpServletResponse response){
        List<DbSave> list = dbSaveService.selectDbSaceList();
        if(list==null && list.size()<=0){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("请求成功",list);
        printJSONObject(resultData,response);
    }

    @PostMapping("save")
    @ApiOperation(value = "数据库备份",httpMethod = "POST")
    public void saveDb(HttpServletRequest request, HttpSession session, HttpServletResponse response){
//        Employee employee = (Employee) session.getAttribute("employee");
        DbSave dbSave = new DbSave();
//        dbSave.setEmpName(employee.getName());
        dbSave.setEmpName("张亮");
        int result = dbSaveService.insertSelective(dbSave);
        if(result<=0){
            resultData = ResultData.buildFailureResult("请求失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("备份成功");
        printJSONObject(resultData,response);
    }

    @PostMapping("roolback")
    @ApiOperation(value = "恢复数据",httpMethod = "POST")
    public void roolBack(HttpServletResponse response, HttpServletRequest request, @RequestParam(value = "file") MultipartFile file){
        String path = request.getSession().getServletContext().getRealPath("upload//dbsaves");
        File temp = new File(path);
        if(!temp.exists()){
            temp.mkdirs();
        }
        String filename ="";
        if(file!=null){
            filename = file.getOriginalFilename();
            filename+= UUID.randomUUID()+filename;
            fileUpload(file,path,filename);
        }
        Operate operate = new Operate("",path+"//"+filename);
        boolean b = AddressUtil.rollback(operate,"root","root","kinder_crm");
        if(b){
            resultData = ResultData.buildSuccessResult("恢复成功");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildFailureResult("恢复失败");
        printJSONObject(resultData,response);
    }

    @PostMapping("delete/{id}")
    public void deleteDb(@PathVariable(value = "id") Integer id, HttpServletResponse response){
        int result = dbSaveService.deleteByPrimaryKey(id);
        if(result<=0){
            resultData = ResultData.buildFailureResult("删除失败");
            printJSONObject(resultData,response);
            return;
        }
        resultData = ResultData.buildSuccessResult("删除成功");
        printJSONObject(resultData,response);
    }
}
