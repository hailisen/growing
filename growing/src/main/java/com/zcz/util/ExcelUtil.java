package com.zcz.util;

import com.zcz.bean.vo.EmployeeWithPage;
import com.zcz.bean.vo.ExamineList;
import com.zcz.bean.vo.ExamineYearVO;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.*;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Excel表格操作
 */
public class ExcelUtil {
    private static Map<Integer,Object> status;
    private static Map<Integer,Object> nature;
    static {
        status = new HashMap<>();
        status.put(0,"离职");
        status.put(1,"在职");
        status.put(2,"退休");
        status.put(3,"返聘");
        nature = new HashMap<>();
        nature.put(0,"在编");
        nature.put(1,"人事代理");
        nature.put(2,"非人事代理");
        nature.put(3,"退休返聘");
    }
    /**
     * 表格导出
     */
    public static File excelOut(List<EmployeeWithPage> list,String path) throws IOException {
        File file = new File(path+"\\教职工信息.xlsx");
        boolean a = file.createNewFile();
        if(!a){
            file = new File(path);
            if(!file.exists()){
                file.mkdirs();
                file.createNewFile();
            }
        }
        //创建工作簿
        XSSFWorkbook workBook = new XSSFWorkbook();
        XSSFSheet sheet = workBook.createSheet("教职员工");
        //行对象
        XSSFRow row = creatTable(sheet);
        row.setHeight((short) 800);
        //创建表头
        String[] heards = new String[]{"姓名","性别","手机号","部门","岗位","职称","学历","籍贯","性质(在编/人事代理/非人事代理/退休返聘)","状态（离职/在职/退休/返聘/）"};
        creatheader(row,heards);
        for(int i=0;i<list.size();i++){
            creatCell(sheet,i,list);
        }
        FileOutputStream outputStream = new FileOutputStream(file);
        workBook.write(outputStream);
        workBook.close();//记得工作簿
        outputStream.close();
        return file;
    }
    /**
     * 考核列表导出
     */
    public static File exmineExcelOut(List<ExamineList> list, String path) throws IOException {
        File file = new File(path+"\\考核信息.xlsx");
        boolean a = file.createNewFile();
        //创建工作簿
        XSSFWorkbook workBook = new XSSFWorkbook();
        XSSFSheet sheet = workBook.createSheet("教职员工");
        //行对象
        XSSFRow row = creatTable(sheet);
        row.setHeight((short) 800);
        //创建表头
        String[] heards = new String[]{"姓名","手机号","部门","岗位","考核年度","考核结果"};
        creatheader(row,heards);
        for(int i=0;i<list.size();i++){
            exmineReatCell(sheet,i,list);
        }
        FileOutputStream outputStream = new FileOutputStream(file);
        workBook.write(outputStream);
        workBook.close();//记得工作簿
        outputStream.close();
        return file;
    }
    /**
     * 考核统计列表导出
     */
    public static File exmineCountExcelOut(List<ExamineYearVO> list, String path) throws IOException {
        File file = new File(path+"\\考核统计.xlsx");
        boolean a = file.createNewFile();
        //创建工作簿
        XSSFWorkbook workBook = new XSSFWorkbook();
        XSSFSheet sheet = workBook.createSheet("考核统计表");
        //行对象
        XSSFRow row = creatTable(sheet);
        row.setHeight((short) 800);
        //创建表头
        String[] heards = new String[]{"姓名","手机号","部门","岗位","优秀","合格","基本合格","不合格"};
        creatheader(row,heards);
        for(int i=0;i<list.size();i++){
            creatExmineCountCell(sheet,i,list);
        }
        FileOutputStream outputStream = new FileOutputStream(file);
        workBook.write(outputStream);
        workBook.close();//记得关闭工作簿
        outputStream.close();
        return file;
    }
    /**
     * 协议表格导出
     */
    public static File excelOutAgreement(List<Map<String,Object>> list,String path) throws IOException {
        File file = new File(path+"\\协议到期人员信息.xlsx");
        file.createNewFile();
        //创建工作簿
        XSSFWorkbook workBook = new XSSFWorkbook();
        XSSFSheet sheet = workBook.createSheet("教职员工");
        //行对象
        XSSFRow row = creatTable(sheet);
        row.setHeight((short) 800);
        //创建单元格，输入第一行的表头内容id 主键,name 姓名,sex 性别,phone 手机号,deptName 部门名称,postName 岗位名称,agreeName 协议名,
        //     * endTime 协议结束时间,eduBackground 教育背景,nature 工作性质,status 工作状态
        creatheader(row,new String[]{"姓名","性别","手机号","部门名称","岗位名称","协议名","协议结束时间","教育背景","工作性质","工作状态"});
        for(int i=0;i<list.size();i++){
            creatAgreementCell(sheet,i,list);
        }
        FileOutputStream outputStream = new FileOutputStream(file);
        workBook.write(outputStream);
        workBook.close();//记得关闭工作簿
        outputStream.close();
        return file;
    }
    /**
     * 职称晋级表格导出
     */
    public static File excelOutPosition(List<Map<String,Object>> list,String path) throws IOException {
        File file = new File(path+"\\职称晋级人员信息.xlsx");
        file.createNewFile();
        //创建工作簿
        XSSFWorkbook workBook = new XSSFWorkbook();
        XSSFSheet sheet = workBook.createSheet("教职员工");
        //行对象
        XSSFRow row = creatTable(sheet);
        row.setHeight((short) 800);
        //创建单元格，输入第一行的表头内容id 主键,name 姓名,sex 性别,phone 手机号,deptName 部门名称,postName 岗位名称,agreeName 协议名,
        //     * endTime 协议结束时间,eduBackground 教育背景,nature 工作性质,status 工作状态
        creatheader(row,new String[]{"姓名","性别","手机号","部门","岗位","职称","学历","籍贯","性质(在编/人事代理/非人事代理/退休返聘)","状态（离职/在职/退休/返聘/）"});
        for(int i=0;i<list.size();i++){
            creatPositionCell(sheet,i,list);
        }
        FileOutputStream outputStream = new FileOutputStream(file);
        workBook.write(outputStream);
        workBook.close();//记得关闭工作簿
        outputStream.close();
        return file;
    }

    public static XSSFRow creatTable(XSSFSheet sheet){
        sheet.setColumnWidth(2, 3500);
        sheet.setColumnWidth(8, 10000);
        sheet.setColumnWidth(9, 10000);
        //创建行
        XSSFRow row = sheet.createRow(0);
        return row;
    }


    /**
     * 表格每行设置值
     * @param sheet
     * @param i
     * @param list
     */
    public static void creatCell(XSSFSheet sheet,int i,List<EmployeeWithPage> list){
        //创建行
        XSSFRow row1 = sheet.createRow(i+1);
        row1.createCell(0, CellType.STRING).setCellValue(list.get(i).getName());
        row1.createCell(1, CellType.STRING).setCellValue(list.get(i).getSex());
        row1.createCell(2, CellType.STRING).setCellValue(list.get(i).getPhone());
        row1.createCell(3, CellType.STRING).setCellValue(list.get(i).getDeptName());
        row1.createCell(4, CellType.STRING).setCellValue(list.get(i).getPostName());
        row1.createCell(5, CellType.STRING).setCellValue(list.get(i).getPositionName());
        row1.createCell(6, CellType.STRING).setCellValue(list.get(i).getEduBackground());
        row1.createCell(7, CellType.STRING).setCellValue(list.get(i).getNavitePlace());
        row1.createCell(8, CellType.STRING).setCellValue((String) status.get(list.get(i).getStatus()));
        row1.createCell(9, CellType.STRING).setCellValue((String) nature.get(list.get(i).getNature()));
    }

    /**
     * 考核表格每行设置值
     * @param sheet
     * @param i
     * @param list
     */
    public static void exmineReatCell(XSSFSheet sheet,int i,List<ExamineList> list){

        XSSFRow row1 = sheet.createRow(i+1);
        row1.createCell(0, CellType.STRING).setCellValue(list.get(i).getName());
        row1.createCell(1, CellType.STRING).setCellValue(list.get(i).getPhone());
        row1.createCell(2, CellType.STRING).setCellValue(list.get(i).getDeptName());
        row1.createCell(3, CellType.STRING).setCellValue(list.get(i).getPostName());
        row1.createCell(4, CellType.STRING).setCellValue(list.get(i).getResult()+"年度");
        String result = "";
        switch(list.get(i).getResult()){
            // 0优秀/1合格/2基本合格/3不合格
            case 0:
                result = "优秀";
                break;
            case 1:
                result = "合格";
                break;
            case 2:
                result = "基本合格";
                break;
            case 3:
                result = "不合格";
                break;
        }
        row1.createCell(5, CellType.STRING).setCellValue(result);
    }
    /**
     * 表格每行设置值
     * @param sheet
     * @param i
     * @param list
     */
    public static void creatExmineCountCell(XSSFSheet sheet,int i,List<ExamineYearVO> list){
        //创建行
        XSSFRow row1 = sheet.createRow(i+1);
        row1.createCell(0, CellType.STRING).setCellValue(list.get(i).getName());
        row1.createCell(1, CellType.STRING).setCellValue(list.get(i).getPhone());
        row1.createCell(2, CellType.STRING).setCellValue(list.get(i).getDeptName());
        row1.createCell(3, CellType.STRING).setCellValue(list.get(i).getPostName());
        row1.createCell(4, CellType.STRING).setCellValue(list.get(i).getExcellent());
        row1.createCell(5, CellType.STRING).setCellValue(list.get(i).getQualified());
        row1.createCell(6, CellType.STRING).setCellValue(list.get(i).getPassMuster());
        row1.createCell(7, CellType.STRING).setCellValue((String) status.get(list.get(i).getUnqualified()));
    }
    /**
     * 协议表格每行设置值
     * @param sheet
     * @param i
     * @param list
     */
    public static void creatAgreementCell(XSSFSheet sheet,int i,List<Map<String,Object>> list){
        //创建行
        XSSFRow row1 = sheet.createRow(i+1);
        row1.createCell(0, CellType.STRING).setCellValue((String) list.get(i).get("name"));
        row1.createCell(1, CellType.STRING).setCellValue((String) list.get(i).get("sex"));
        row1.createCell(2, CellType.STRING).setCellValue((String) list.get(i).get("phone"));
        row1.createCell(3, CellType.STRING).setCellValue((String) list.get(i).get("deptName"));
        row1.createCell(4, CellType.STRING).setCellValue((String) list.get(i).get("postName"));
        row1.createCell(5, CellType.STRING).setCellValue((String) list.get(i).get("agreeName"));
        row1.createCell(6, CellType.STRING).setCellValue(list.get(i).get("endTime").toString());
        row1.createCell(7, CellType.STRING).setCellValue((String) list.get(i).get("eduBackground"));
        row1.createCell(8, CellType.STRING).setCellValue((String) status.get(list.get(i).get("status")));
        row1.createCell(9, CellType.STRING).setCellValue((String) nature.get(list.get(i).get("nature")));
    }

    /**
     * 职称表格每行设置值
     * @param sheet
     * @param i
     * @param list
     */
    private static void creatPositionCell(XSSFSheet sheet, int i, List<Map<String, Object>> list) {
        XSSFRow row1 = sheet.createRow(i+1);
        row1.createCell(0, CellType.STRING).setCellValue((String) list.get(i).get("name"));
        row1.createCell(1, CellType.STRING).setCellValue((String) list.get(i).get("sex"));
        row1.createCell(2, CellType.STRING).setCellValue((String) list.get(i).get("phone"));
        row1.createCell(3, CellType.STRING).setCellValue((String) list.get(i).get("deptName"));
        row1.createCell(4, CellType.STRING).setCellValue((String) list.get(i).get("postName"));
        row1.createCell(5, CellType.STRING).setCellValue((String) list.get(i).get("positionName"));
        row1.createCell(6, CellType.STRING).setCellValue((String) list.get(i).get("eduBackground"));
        row1.createCell(7, CellType.STRING).setCellValue((String) list.get(i).get("navitePlace"));
        row1.createCell(8, CellType.STRING).setCellValue((String) status.get(list.get(i).get("status")));
        row1.createCell(9, CellType.STRING).setCellValue((String) nature.get(list.get(i).get("nature")));
    }

    /**
     * 创建表头
     * @param row
     */
    public static void creatheader(XSSFRow row,String[] strings){
        //创建单元格，输入第一行的表头内容
        for(int i=0;i<strings.length;i++){
            row.createCell(i, CellType.STRING).setCellValue(strings[i]);
        }
    }

}
