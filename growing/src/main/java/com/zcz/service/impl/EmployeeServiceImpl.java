package com.zcz.service.impl;

import com.zcz.bean.Changed;
import com.zcz.bean.Employee;
import com.zcz.bean.Post;
import com.zcz.bean.vo.ChangedVO;
import com.zcz.bean.vo.DeptEmp;
import com.zcz.bean.vo.EmployeeVO;
import com.zcz.bean.vo.EmployeeWithPage;
import com.zcz.dao.*;
import com.zcz.service.IEmployeeService;
import com.zcz.util.DateUtil;
import com.zcz.util.Page;
import com.zcz.util.ResultData;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.*;

/**
 * 教师服务层
 */
@Service("employeeService")
public class EmployeeServiceImpl implements IEmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private PositionMapper positionMapper;
    @Autowired
    private AgreementMapper agreementMapper;
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private DeptMapper deptMapper;
    public EmployeeMapper getEmployeeMapper() {
        return employeeMapper;
    }

    public void setEmployeeMapper(EmployeeMapper employeeMapper) {
        this.employeeMapper = employeeMapper;
    }

    public PositionMapper getPositionMapper() {
        return positionMapper;
    }

    public void setPositionMapper(PositionMapper positionMapper) {
        this.positionMapper = positionMapper;
    }

    public AgreementMapper getAgreementMapper() {
        return agreementMapper;
    }

    public void setAgreementMapper(AgreementMapper agreementMapper) {
        this.agreementMapper = agreementMapper;
    }

    public PostMapper getPostMapper() {
        return postMapper;
    }

    public void setPostMapper(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

    public DeptMapper getDeptMapper() {
        return deptMapper;
    }

    public void setDeptMapper(DeptMapper deptMapper) {
        this.deptMapper = deptMapper;
    }

    /**
     * 查询某部门的所有员工ID
     * @param deptId
     * @return
     */
    @Override
    public List<Integer> findEmpIdInDept(Integer deptId) {
        return employeeMapper.findEmpIdInDept(deptId);
    }

    /**
     * 职称年限人员信息
     * name,sex,phone,deptName,tp.post_name as tp.postName,positionName, eduBackground,navitePlace,nature,status,getTime,timeLimit
     * @return
     */
    @Override
    public Page<Map<String,Object>> positionAlter(Integer deptId,Integer postId,Integer positionId,
                                                   String eduBackground,Integer status,Integer nature,
                                                   String nameOrPhone,Integer pageNum,Integer pageSize) {
        String regExp = "^((13[0-9])|(15[0-9])|(18[0-9])|(17[0-9])|(14[3,6,7,9]))\\d{8}$";
        boolean b = false;
        if(nameOrPhone!=null && !"".equals(nameOrPhone)){
            b = nameOrPhone.matches(regExp);
        }
        List<Map<String,Object>> list;
        if(b){//为手机号时
            list = employeeMapper.positionAlter(deptId,postId,positionId,eduBackground,status,nature,null,nameOrPhone);
        }else{//为姓名时
            list = employeeMapper.positionAlter(deptId,postId,positionId,eduBackground,status,nature,nameOrPhone,null);
        }
        Calendar calendar = Calendar.getInstance();//获取日历类对象
        List<Map<String,Object>> results = new ArrayList<>();
        for (Map<String,Object> map:list) {
            //根据职称获取时间
            Date date = (Date) map.get("getTime");
            Integer timeLimit = (Integer) map.get("timeLimit");
            calendar.setTime(date);
            //获取职称到期的年份
            int year = calendar.get(Calendar.YEAR)+timeLimit;
            calendar.set(year,calendar.get(Calendar.MONTH),calendar.get(Calendar.DAY_OF_MONTH));
            date = calendar.getTime();//职称到期时间
            //如果小于当前时间加一个月及加入提醒；即提前一个月提醒
            if(date.getTime()<=(new Date().getTime())){
                results.add(map);
            }
        }
        List<Map<String,Object>> listByPage = new ArrayList<>();
        if (((pageNum-1)*pageSize+pageSize)>results.size()){
            for(int i = (pageNum-1)*pageSize;i<results.size();i++){
                listByPage.add(results.get(i));
            }
        }else{
            for(int i=(pageNum-1)*pageSize;i<(pageNum-1)*pageSize+pageSize;i++){
                listByPage.add(results.get(i));
            }
        }
        Page<Map<String,Object>> page = new Page<>();
        page.setResult(listByPage);
        page.setPageNumber(pageNum.longValue());
        page.setPageSize(pageSize.longValue());
        page.setTotalRows(new Long(results.size()));
        return page;
    }

    /**
     * 职称晋级人数提醒
     * @return
     */
    @Override
    public Integer positionAlterCount() {
        int result=0;
        //所有员工的最新职称信息 name,positionName,cateName,levelName,getTime,timeLimit
        List<Map<String,Object>> list = employeeMapper.positionAlter(null,null,null,null,null,null,null,null);
        Calendar calendar = Calendar.getInstance();//获取日历类对象
        for (Map<String,Object> map:list) {
            //获取得到职称的时间
            Date date = (Date) map.get("getTime");
            Integer timeLimit = (Integer) map.get("timeLimit");
            calendar.setTime(date);
            //获取职称到期的年份
            int year = calendar.get(Calendar.YEAR)+timeLimit;
            calendar.set(year,calendar.get(Calendar.MONTH),calendar.get(Calendar.DAY_OF_MONTH));
            date = calendar.getTime();//职称到期时间
            //如果小于当前时间加一个月加入提醒列表；即提前一个月提醒
            if(date.getTime()<=(new Date().getTime())){
                result++;
            }
        }
        return result;
    }

    /**
     * 获取协议即将到期的人员信息 提前一个月
     * @param deptId 部门ID
     * @param postId 岗位ID
     * @param eduBackground 教育背景
     * @param nature 工作性质
     * @param nameOrPhone 姓名或手机号
     * @param pageNum 当前页数
     * @param pageSize 每页长度
     * @return
     */
    @Override
    public Page<Map<String, Object>> agreementTime(Integer deptId,Integer postId, String eduBackground, Integer nature, String nameOrPhone, Integer pageNum, Integer pageSize) {

        String regExp = "^((13[0-9])|(15[0-9])|(18[0-9])|(17[0-9])|(14[3,6,7,9]))\\d{8}$";
        boolean b = false;
        if(nameOrPhone!=null && !"".equals(nameOrPhone)){
            b = nameOrPhone.matches(regExp);
        }
        List<Map<String,Object>> list;
        if(b){//为手机号时
            list = employeeMapper.agreementTime(deptId,postId,eduBackground,nature,null,nameOrPhone,(pageNum-1)*pageSize,pageSize);
        }else{//为姓名时
            list = employeeMapper.agreementTime(deptId,postId,eduBackground,nature,nameOrPhone,null,(pageNum-1)*pageSize,pageSize);
        }
        Integer count =0;
        if(b){//为手机号时
            count = employeeMapper.agreementTimeCount(deptId,postId,eduBackground,nature,null,nameOrPhone);
        }else{//为姓名时
            count = employeeMapper.agreementTimeCount(deptId,postId,eduBackground,nature,nameOrPhone,null);
        }
        for (Map<String,Object> map : list) {
            Date date = (Date) map.get("endTime");
            map.put("endTime",DateUtil.formatDate(date,"yyyy-MM-dd"));
        }
        Page<Map<String,Object>> page = new Page<>();
        page.setPageNumber(pageNum.longValue());
        page.setPageSize(pageSize.longValue());
        page.setResult(list);
        page.setTotalRows(count.longValue());
        return page;
    }

    /**
     * 获取协议即将到期的数
     * name,deptName,postName,agreeName,endTime
     * @return
     */
    @Override
    public Integer agreementTimeCount() {
        return employeeMapper.agreementTimeCount(null,null,null,null,null,null);
    }
    /**
     * 根据部门查询员工
     * @return id -- name
     */
    @Override
    public List<DeptEmp> findEmpByDept() {
        return employeeMapper.findEmpByDept();
    }

    /**
     * 查询所有员工ID
     * @return
     */
    @Override
    public List<Integer> findAllId() {
        return employeeMapper.findAllId();
    }

    /**
     * 根据ID查询员工信息
     * @param id
     * @return
     */
    @Override
    public Employee selectByPrimaryKey(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    /**
     * 修改員工教師信息
     * @param record
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(Employee record) {
        return employeeMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * 教师详细信息
     * @param empId
     * @return
     */
    @Override
    public EmployeeVO selectTeacherInfo(Integer empId) {
        EmployeeVO vo = employeeMapper.selectTeacherInfo(empId);
        for (ChangedVO c:vo.getChangeds()) {
            Post post = postMapper.selectByPrimaryKey(c.getPostId());
            Map<String,Object> map = new HashMap<>();
            map.put("postName",post.getPostName());
            map.put("deptName",deptMapper.selectByPrimaryKey(c.getDeptId()).getDeptName());
            c.setMap(map);
        }
        return vo;
    }

    /**
     * 自动生成员工编号
     * @return
     */
    public String getEmpNo(List<String> empnoList){
        String empno = "";
        Integer tempNo = employeeMapper.autoEmpno();//从数据库查询出基数
        tempNo++;
        employeeMapper.updateEmpno(tempNo);
        int length = tempNo.toString().length();
        switch(length){
            case 1:
                empno = "00000"+tempNo;
                break;
            case 2:
                empno = "0000"+tempNo;
                break;
            case 3:
                empno = "000"+tempNo;
                break;
            case 4:
                empno = "00"+tempNo;
                break;
            case 5:
                empno = "0"+tempNo;
                break;
        }
        if(empnoList.contains(empno)){
            getEmpNo(empnoList);
        }
        return empno;
    }

    @Override
    @Transactional
    public ResultData batchInsert(File excelFile, String filetype,List<String> emponList) {
        try {
            InputStream is = new FileInputStream(excelFile);//获取Excel文件输入流
            //根据文件输入流获取xls格式的excel文件对象
            HSSFWorkbook hssfWorkbook = null;
            //根据文件输入流获取xlsx格式的excel文件对象
            XSSFWorkbook xssfWorkbook = null;
            int rowNum = 0;
            HSSFSheet hssfSheet = null;
            XSSFSheet xssfSheet = null;
            if("xls".equals(filetype)){
                hssfWorkbook = new HSSFWorkbook(is);
                hssfSheet= hssfWorkbook.getSheetAt(0);
                rowNum = hssfSheet.getLastRowNum();
            }else{
                xssfWorkbook = new XSSFWorkbook(is);
                xssfSheet = xssfWorkbook.getSheetAt(0);
                rowNum = xssfSheet.getLastRowNum();
            }
            /*hssfWorkbook.getNumberOfSheets();//获取该Excel文档的工作表格数量，这里只有一个所以写死，不确定的情况下可以用for循环来运算。
            获取第0个表格对象*/
            for(int i = 1;i<=rowNum;i++){
                XSSFRow row1 = null;
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
                    sex = row.getCell(1).getStringCellValue();
                    row.getCell(2).setCellType(CellType.STRING);
                    phone = row.getCell(2).toString();
                    deptName = row.getCell(3).getStringCellValue();
                    postName = row.getCell(4).getStringCellValue();
                    positionName = row.getCell(5).getStringCellValue();//获取职称名
                    eduBackground = row.getCell(6).getStringCellValue();//学历
                    navitePlace = row.getCell(7).getStringCellValue();//籍贯
                    stringNature = row.getCell(8).getStringCellValue();
                    stringStatus = row.getCell(9).getStringCellValue();
                }else{
                    XSSFRow row = xssfSheet.getRow(i);//获取每行的对象
                    name = row.getCell(0).getStringCellValue();
                    sex = row.getCell(1).getStringCellValue();
                    XSSFCell cell = row.getCell(2);
                    cell.setCellType(CellType.STRING);
                    phone = cell.getStringCellValue();
                    deptName = row.getCell(3).getStringCellValue();
                    postName = row.getCell(4).getStringCellValue();
                    positionName = row.getCell(5).getStringCellValue();//获取职称名
                    eduBackground = row.getCell(6).getStringCellValue();//学历
                    navitePlace = row.getCell(7).getStringCellValue();//籍贯
                    stringNature = row.getCell(8).getStringCellValue();
                    stringStatus = row.getCell(9).getStringCellValue();
                }
                //性质   0在编/ 1人事代理/ 2非人事代理/ 3退休返聘
                int nature = 0;
                if("在编".equals(stringNature)){
                    nature=0;
                }else if("人事代理".equals(stringNature)){
                    nature=1;
                }else if("非人事代理".equals(stringNature)){
                    nature=2;
                }else if("退休返聘".equals(stringNature)){
                    nature=3;
                }else{
                    ResultData resultData = ResultData.buildFailureResult("第"+(i+1)+"行信息，工作性质格式错误，请检查");
                    return resultData;
                }
                //状态   0/离职  1/在职  2/退休  3/返聘/
                int status = 1;
                if("离职".equals(stringStatus)){
                    status=0;
                }else if("在职".equals(stringStatus)){
                    status=1;
                }else if("退休".equals(stringStatus)){
                    status=2;
                }else if("返聘".equals(stringStatus)){
                    status=3;
                }else{
                    ResultData resultData = ResultData.buildFailureResult("第"+(i+1)+"行信息，工作状态格式错误，请检查");
                    return resultData;
                }
                //根据部门和岗位名查找岗位ID
                Integer postId = postMapper.findIdByName(deptName,postName);
                if(postId<=0 || postId==null){
                    ResultData resultData = ResultData.buildFailureResult("第"+(i+1)+"行信息，部门或岗位名查询不到，请检查");
                    return resultData;
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
                Integer positionId = positionMapper.findIdByName(positionName);//根据职称名称查找职称ID
                if (positionId<=0 || positionId == null){
                    ResultData resultData = ResultData.buildFailureResult("第"+i+"行职称查询不到，请查正");
                    return resultData;
                }
                insertSelective(employee,positionId,emponList);
                is.close();
            }
        } catch (Exception e) {
            ResultData resultData = ResultData.buildFailureResult("无法解析文件");
            return resultData;
        }
        return null;
    }

    /**
     * 添加教职员工信息
     * @param record
     * @param positionId
     * @return
     */
    @Override
    @Transactional
    public int insertSelective(Employee record, Integer positionId,List<String> empnoList) {
        String empno = record.getEmpNo();
        if(empno==null || "".equals(empno)){//用户没有输入员工编号则自动生成一个
            empno = getEmpNo(empnoList);
        }
        record.setEmpNo(empno);
        //添加员工
        int i = employeeMapper.insertSelective(record);
        //添加成功后获取自动生成的ID
        int empId = record.getId();
        if(positionId!=null &&positionId>0){
            Map<String,Object> map = new HashMap<>();
            map.put("id",0);
            map.put("positionId",positionId);
            map.put("empId",empId);
            map.put("getTime", new Date());
            map.put("url",null);
            map.put("fileName",null);
            //给员工添加职称
            int positionEmpResult = positionMapper.addPositionFroEmp(map);
            return i+positionEmpResult;
        }
        return i;
    }

    /**
     * 查询所有的员工编号集合
     * @return
     */
    @Override
    public List<String> findAllEmpno() {
        return employeeMapper.findAllEmpno();
    }

    /**
     * 登录
     * @param phone
     * @param password
     * @return
     */
    @Override
    public Employee login(String phone, String password) {
        return employeeMapper.login(phone,password);
    }

    /**
     * 分页查询教师列表
     * @param deptId
     * @param postId
     * @param positionId
     * @param eduBackground
     * @param status
     * @param nature
     * @param nameOrPhone
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    public Page<EmployeeWithPage> findByPage(Integer deptId, Integer postId, Integer positionId, String eduBackground, Integer status, Integer nature, String nameOrPhone, Integer pageNum, Integer pageSize) {
        Page<EmployeeWithPage> page = new Page<>();
        String regExp = "^((13[0-9])|(15[0-9])|(18[0-9])|(17[0-9])|(14[3,6,7,9]))\\d{8}$";
        boolean b = false;
        if(nameOrPhone!=null && !"".equals(nameOrPhone)){
            b = nameOrPhone.matches(regExp);
        }
        List<EmployeeWithPage> employeeList = new ArrayList<>();
        if(b){//为手机号时
            employeeList = employeeMapper.findByPage(deptId,postId,positionId,eduBackground,status,nature,null,nameOrPhone,(pageNum-1)*pageSize,pageSize);
        }else{//为姓名时
            employeeList = employeeMapper.findByPage(deptId,postId,positionId,eduBackground,status,nature,nameOrPhone,null,(pageNum-1)*pageSize,pageSize);
        }
        Integer count =0;
        if(b){//为手机号时
            count = employeeMapper.findCount(deptId,postId,positionId,eduBackground,status,nature,null,nameOrPhone);
        }else{//为姓名时
            count = employeeMapper.findCount(deptId, postId, positionId, eduBackground, status, nature, nameOrPhone, null);
        }
        page.setPageNumber(pageNum.longValue());
        page.setPageSize(pageSize.longValue());
        page.setResult(employeeList);
        page.setTotalRows(count.longValue());
        return page;
    }
}
