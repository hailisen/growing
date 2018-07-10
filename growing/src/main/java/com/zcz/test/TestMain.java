package com.zcz.test;

import com.zcz.bean.Employee;
import com.zcz.dao.EducationBackgroundMapper;
import com.zcz.service.*;
import com.zcz.util.AddressUtil;
import com.zcz.util.Operate;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import static java.lang.System.out;

/**
 * Created by Administrator on 2018/2/6.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring.xml")
public class TestMain {
    @Autowired
    private EducationBackgroundMapper educationBackgroundMapper;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IDeptService deptService;
    @Autowired
    private IPostService postService;
    @Autowired
    private IPositionService positionService;
    @Autowired
    private ICommendService commendService;
    @Autowired
    private IUserService userService;
    public IDeptService getDeptService() {
        return deptService;
    }

    public void setDeptService(IDeptService deptService) {
        this.deptService = deptService;
    }

    public IEmployeeService getEmployeeService() {
        return employeeService;
    }

    public void setEmployeeService(IEmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public IPostService getPostService() {
        return postService;
    }

    public void setPostService(IPostService postService) {
        this.postService = postService;
    }

    public IPositionService getPositionService() {
        return positionService;
    }

    public void setPositionService(IPositionService positionService) {
        this.positionService = positionService;
    }

    public EducationBackgroundMapper getEducationBackgroundMapper() {
        return educationBackgroundMapper;
    }

    public void setEducationBackgroundMapper(EducationBackgroundMapper educationBackgroundMapper) {
        this.educationBackgroundMapper = educationBackgroundMapper;
    }

    public ICommendService getCommendService() {
        return commendService;
    }

    public void setCommendService(ICommendService commendService) {
        this.commendService = commendService;
    }

    @Test
    public void test(){
//        boolean b = AddressUtil.save(new Operate("",""),"root","root","kinder_crm",null);
        boolean b = AddressUtil.rollback(new Operate("","C:\\Users\\mm\\数据库备份\\20180629113105199.sql"),"root","root","kinder_crm");
        out.println(b);
    }

    /**
     * Excel表格批量添加
     */
    @Test
    public void  batchAdd (){
        //根据路径获取Excel表格的文件对象
        File excelFile = new File("G:\\","添加教师模板.xls");
        String filename = excelFile.getName();
        String filetype = filename.substring(filename.lastIndexOf(".")+1);
        //查询所有员工编号集合
        List<String> emponList = employeeService.findAllEmpno();
        try {
            InputStream is = new FileInputStream(excelFile);//获取Excel文件输入流
            //根据文件输入流获取xls格式的excel文件对象
            HSSFWorkbook hssfWorkbook = null;
            //根据文件输入流获取xlsx格式的excel文件对象
            XSSFWorkbook xssfWorkbook = null;
            int rowNum = 0;
            HSSFSheet hssfSheet = null;
            XSSFSheet xssfSheet = null;
            if(filetype.equals("xlsx")){
                xssfWorkbook = new XSSFWorkbook(is);
                xssfSheet = xssfWorkbook.getSheetAt(0);
                rowNum = xssfSheet.getLastRowNum();
            }else{
                hssfWorkbook = new HSSFWorkbook(is);
                /*hssfWorkbook.getNumberOfSheets();//获取该Excel文档的工作表格数量，这里只有一个所以写死，不确定的情况下可以用for循环来运算。
                  获取第0个表格对象*/
                hssfSheet= hssfWorkbook.getSheetAt(0);
                rowNum = hssfSheet.getLastRowNum();
            }
            for(int i = 1;i<=rowNum;i++){
                String name = "";
                String sex = "";//row.getCell(1).getStringCellValue()//获取该单元格里面的内容
                String phone = "";//row.getCell(2).getStringCellValue()
                String deptName = "";//row.getCell(3).getStringCellValue()
                String postName = "";//row.getCell(4).getStringCellValue()
                String positionName = "";//row.getCell(5).getStringCellValue();//获取职称名
                String eduBackground = "";//学历
                String navitePlace = "";//籍贯
                String stringNature = "";//性质   0在编/ 1人事代理/ 2非人事代理/ 3退休返聘
                String stringStatus = "";//状态   0/离职  1/在职  2/退休  3/返聘/  row.getCell(9).getStringCellValue()
                if("xls".equals(filetype)){
                    HSSFRow row = hssfSheet.getRow(i);//获取每行的对象
                    name = row.getCell(0).getStringCellValue();
                    deptName = row.getCell(3).getStringCellValue();
                    postName = row.getCell(4).getStringCellValue();
                    positionName = row.getCell(5).getStringCellValue();//获取职称名
                    eduBackground = row.getCell(6).getStringCellValue();//学历
                    navitePlace = row.getCell(7).getStringCellValue();//籍贯
                    stringNature = row.getCell(8).getStringCellValue();
                    stringStatus = row.getCell(9).getStringCellValue();
                    sex = row.getCell(1).getStringCellValue();
                    row.getCell(2).setCellType(CellType.STRING);
                    phone = row.getCell(2).toString();
                }else{
                    XSSFRow row = xssfSheet.getRow(i);//获取每行的对象
                    name = row.getCell(0).getStringCellValue();
                    deptName = row.getCell(3).getStringCellValue();
                    postName = row.getCell(4).getStringCellValue();
                    positionName = row.getCell(5).getStringCellValue();//获取职称名
                    eduBackground = row.getCell(6).getStringCellValue();//学历
                    navitePlace = row.getCell(7).getStringCellValue();//籍贯
                    stringNature = row.getCell(8).getStringCellValue();
                    stringStatus = row.getCell(9).getStringCellValue();
                    sex = row.getCell(1).getStringCellValue();
                    XSSFCell cell = row.getCell(2);
                    cell.setCellType(CellType.STRING);
                    phone = row.getCell(2).toString();
                }
                //性质   0在编/ 1人事代理/ 2非人事代理/ 3退休返聘
                int nature = 0;
                if("在编".equals(stringNature)){
                    nature=0;
                }else if("人事代理".equals(stringNature)){
                    nature=1;
                }else if("非人事代理".equals(stringNature)){
                    nature=2;
                }else if(stringNature.equals("退休返聘")){
                    nature=3;
                }else{
                    System.out.println("第"+(i+1)+"行信息，工作性质格式错误，请检查");
                    return;
                }
                //状态   0/离职  1/在职  2/退休  3/返聘/
                int status = 1;
                if(stringStatus.equals("离职")){
                    status=0;
                }else if(stringStatus.equals("在职")){
                    status=1;
                }else if(stringStatus.equals("退休")){
                    status=2;
                }else if("返聘".equals(stringStatus)){
                    status=3;
                }else{
                    System.out.println("第"+(i+1)+"行信息，工作状态格式错误，请检查");
                    return;
                }
                //根据部门和岗位名查找岗位ID
                Integer postId = postService.findIdByName(deptName,postName);
                if(postId<=0 || postId==null){
                    System.out.println("第"+(i+1)+"行信息，部门或岗位名查询不到，请检查");
                    return;
                }
                Employee employee = new Employee();
                employee.setName(name);
                employee.setSex(sex);
                employee.setPhone(phone);
                employee.setPostId(postId);//设置岗位ID
                employee.setEduBackground(eduBackground);//学历
                employee.setNavitePlace(navitePlace);//籍贯
                employee.setNature(nature);
                employee.setStatus(status);
                employee.setEntryDay(new Date());
                Integer positionId = positionService.findIdByName(positionName);//根据职称名称查找职称ID
                if (positionId<=0 || positionId == null){
                    System.out.println("第"+i+"行职称查询不到，请查证");
                }
                System.out.println(employee.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }
}
