package com.zcz.interceptor;

import com.zcz.bean.Employee;
import com.zcz.controller.BaseController;
import com.zcz.util.JWTUtil;
import com.zcz.util.ResultData;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

/**
 * Spring 拦截器
 */
public class TokenInterceptor extends BaseController implements HandlerInterceptor{

    /**
     * 拦截每一个请求
     * @param request
     * @param response
     * @param object
     * @return
     * @throws Exception
     * 每次访问需要带header中添加参数token和phone
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //获取session
        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("employee");
        if(employee!=null){
            return true;
        }
        response.sendRedirect(request.getContextPath()+"/toLogin");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }


    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    /**
     *
    token验证
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
    //接受前端请求头中的token和phone，解析token中的phone判断是否和前端发的phone匹配
    String token = request.getHeader("token");
    if(token==null ||"".equals(token)){
    token = request.getParameter("token");
    }
    if(token==null){
    resultData = ResultData.buildFailureResult("认证信息失败");
    printJSONObject(resultData,response);
    return false;
    }
    String phone = request.getParameter("phone");
    Map<String,Object> map = JWTUtil.unsign(token, Map.class);
    if(map!=null && phone!=null && !"".equals(phone)){
    if(map.get("phone").equals(phone)){//当token解析出来的phone和前端发的phone一样时，继续下一步
    return true;
    }
    }
    System.out.println("被拦截");
    resultData = ResultData.buildFailureResult("认证信息失败");
    printJSONObject(resultData,response);
    return false;
    }
     */
}
