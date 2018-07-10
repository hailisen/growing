package com.zcz.controller;

import com.zcz.bean.User;
import com.zcz.util.ResultData;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ApiIgnore
@RestController
@RequestMapping("/user/")
@Api(value = "user-用户相关", tags = {"User接口"})
public class UsersController extends BaseController{



     @RequestMapping("list")
     public void test(User user, HttpServletRequest request, HttpServletResponse response){
         resultData = ResultData.buildSuccessResult("OK",user);
         printJSONObject(resultData,response);
         System.out.println(user);
     }

    /**
     * - @Api()用于类名
     - @ApiOperation()用于方法说明
     - @ApiParam()用于参数说明
     - @ApiModel()用于实体类
     - @ApiModelProperty用于实体类属性
     //swagger返回值注解
     @ApiResponses(value = {
     @ApiResponse(code = 500, message = "系统错误"),
     @ApiResponse(code = 200, message = "0 成功,其它为错误,返回格式：{code:0,data[{}]},data中的属性参照下方Model", response = UserVo.class) })
     */

//    /**
//     * swagger返回值注解
//     * 获取信息
//     * @param id 主键
//     * @return
//     */
//    @ApiResponses(value = {
//            @ApiResponse(code = 500, message = "系统错误"),
//            @ApiResponse(code = 200, message = "成功", response = User.class) })
//    @ApiOperation(value = "传输信息", notes = "滴~滴滴", httpMethod = "GET", response = String.class)
//    @ApiImplicitParams(value = {@ApiImplicitParam(name = "id" ,value = "主键ID", required = true, dataType = "Integer"),
//            @ApiImplicitParam(name = "name" ,value = "姓名", required = true, dataType = "String")})
//    @PostMapping("say/{id}")
//    public User say(@PathVariable("id") Integer id,String name,@ApiParam(name = "password",value = "密码") String password){
//        User user = new User();
//        user.setId(id);
//        user.setPassword("1325w468");
//        user.setUsername("张三丰");
//        return user;
//    }

}
