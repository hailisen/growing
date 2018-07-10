package com.zcz.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.zcz.bean.Employee;
import com.zcz.service.*;
import com.zcz.util.ResultData;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonBeanProcessor;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

public abstract class BaseController {
	/**
	 * 把所有的Service注入给BaseController
	 */
	@Autowired
	protected IEmployeeService employeeService;
	@Autowired
	protected IDeptService deptService;
	@Autowired
	protected IPositionService positionService;
	@Autowired
	protected IPostService postService;
	@Autowired
	protected IEducationBackgroundService educationBackgroundService;
	@Autowired
	protected ICommendService commendService;
	@Autowired
	protected IAgreementService agreementService;
	@Autowired
	protected IChangeService changeService;
	@Autowired
	protected IExaminService examinService;
	@Autowired
	protected ICategoryService categoryService;
	@Autowired
	protected IDbSaveService dbSaveService;
	public IEmployeeService getEmployeeService() {
		return employeeService;
	}
	public void setEmployeeService(IEmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public IDeptService getDeptService() {
		return deptService;
	}
	public void setDeptService(IDeptService deptService) {
		this.deptService = deptService;
	}
	public IPositionService getPositionService() {
		return positionService;
	}
	public void setPositionService(IPositionService positionService) {
		this.positionService = positionService;
	}
	public IPostService getPostService() {
		return postService;
	}
	public void setPostService(IPostService postService) {
		this.postService = postService;
	}
	public IEducationBackgroundService getEducationBackgroundService() {
		return educationBackgroundService;
	}
	public void setEducationBackgroundService(IEducationBackgroundService educationBackgroundService) {
		this.educationBackgroundService = educationBackgroundService;
	}
	public ICommendService getCommendService() {
		return commendService;
	}
	public void setCommendService(ICommendService commendService) {
		this.commendService = commendService;
	}
	public IChangeService getChangeService() {
		return changeService;
	}
	public void setChangeService(IChangeService changeService) {
		this.changeService = changeService;
	}
	public IAgreementService getAgreementService() {
		return agreementService;
	}
	public void setAgreementService(IAgreementService agreementService) {
		this.agreementService = agreementService;
	}
	public IExaminService getExaminService() {
		return examinService;
	}
	public void setExaminService(IExaminService examinService) {
		this.examinService = examinService;
	}
	public ICategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public IDbSaveService getDbSaveService() {
		return dbSaveService;
	}
	public void setDbSaveService(IDbSaveService dbSaveService) {
		this.dbSaveService = dbSaveService;
	}

	/**
	 * 封装响应信息
	 */
	protected ResultData resultData;

	/**
	 * 用于接收分页页码
	 */
	protected Long page = 1L;

	/**
	 * 记录数
	 */
	protected Long rows = 20L;

	public ResultData getResultData() {
		return resultData;
	}

	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}

	/**
	 * 获取到当前登录用户的信息
	 * @return
	 */
	protected Employee getCurrentUser(HttpServletRequest request){
		HttpSession session = request.getSession();
		return (Employee)session.getAttribute("employee");
	}

	public Long getPage() {
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getRows() {
		return rows;
	}

	public void setRows(Long rows) {
		this.rows = rows;
	}

	/**
	 * 把对象转换为json格式并且输出至客户端
	 * @param obj
	 * @throws IOException
	 */
	protected void printJSONObject(Object obj,HttpServletResponse response){
		printJSONObject(obj,response, new String[]{});
	}

	/**
	 * 将对象转换为json格式并且输出至客户端
	 * @param obj
	 * @param excludeProperties -将会被配置属性
	 * @throws IOException
	 */
	public static void printJSONObject(Object obj,HttpServletResponse response,String... excludeProperties){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		JsonConfig config = new JsonConfig();
		config.setExcludes(excludeProperties);
		JSONObject json = JSONObject.fromObject(obj, config);
		out.print(json.toString());
		out.flush();
		out.close();
	}

	/**
	 * 文件上传操作
	 * @param file
	 * @param path
	 * @param filename
	 */
	public boolean  fileUpload(MultipartFile file,String path,String filename){
		if (file != null){
			File temp = new File(path);
			if(!temp.exists()){
				temp.mkdirs();
			}
			File myFile = new File(path,filename);
			try {
				file.transferTo(myFile);//上传操作
				return true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * 设置允许跨域访问
	 * @param response
	 */
	public static void allowsCrossDomain(HttpServletResponse response){
		//设置允许所有域名访问，如果只是允许某个域名访问将"*"换成对应的域名
		response.setHeader("Access-Control-Allow-Origin", "*");
		//设置接接受传输的方式
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE, PUT");
		//The Access-Control-Max-Age 这个响应首部表示 preflight request  （预检请求）的返回结果（即 Access-Control-Allow-Methods 和Access-Control-Allow-Headers 提供的信息） 可以被缓存多久
		response.setHeader("Access-Control-Max-Age", "3600");
	}

}
