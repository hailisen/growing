<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>查看/修改个人信息</title>
    <meta name="description" content="查看/修改个人信息">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <style type="text/css">
        .tpl-content-wrapper {
            min-height: 800px;
        }
        #add-employee{
            margin: 0px auto;
            position: absolute;
            width: 830px;
            border: 1px #cfdee9 solid;
            background-color: #fff;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }
        #title{
            width: 100%;
            height: 50px;
            background-color: #f3f3f3;
        }
        #title-text{ /*新增人员*/
            font-weight: normal;
            font-size: 14px;
            line-height: 60px;
            margin-left: 17px;
            color: #666666;
        }
        .exit{
            float: right;
            margin-right: 10px;
            line-height: 50px;
            font-size: 25px;
            float: right;
            cursor: pointer;
            font-weight: lighter;
            color: #777777;
        }
        #neirong{
            width: 100%;
        }
        #add-from{
            margin: 0 auto;
        }
        #add-table{
            margin: 30px auto;
            width: 52%;
        }
        #add-table td{
            height: 45px;
        }
        .input-text{
            height: 33px;
            width: 328px;
            margin-left: 36px;
            /*border: 0px;*/
        }
        .form-radio{
            margin-left: 38px;
            height: 32px;
            width: 328px;
            margin-top: 12px;
        }
        .radio-1{
            font-weight: lighter;
            font-size: 12px;
            color: #363636;
        }
        #radio-girl{
            margin-left: 20px;
        }
        .left-td{
            font-size:14.6px;
            color: #666666;
        }
        .layui-laydate .layui-this {
            background-color: #48c6ff!important;
            color: #fff!important;
        }
        .form-button{
            margin-left: 165px;
            margin-top: 20px;
            width: 107px;
            font-size: 13px;
            height: 38px;
            background-color: #777777;
            color: #ffffff;
            border-radius: 50px;
            borderadd-employee: none;
        }
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div id="add-employee">
    <div id="title">
        <label id="title-text">个人信息</label>
        <label class="exit jexit">×</label>
    </div>
    <div id="neirong">
        <form action="${pageContext.request.contextPath}/teacher/update" id="add-from" method="post">
            <table id="add-table">
                <tr>
                    <td class="left-td">编号</td>
                    <td class="right-td"><input class="input-text layui-input" type="text" value="${employee.empNo}" id="empNo" name="empNo" placeholder="编号可自动生成" disabled="disabled" style="color: #949494">
                        <input type="hidden" value="${employee.id}" name="id">
                    </td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td class="right-td"><input name="name" id="name" type="text" class="input-text layui-input" value="${employee.name}" placeholder="请输入姓名"></td>
                </tr>
                <tr>
                    <td class="left-td">性别</td>
                    <td class="right-td">
                        <div class="form-radio">
                            <c:choose>
                                <c:when test="${employee.sex=='男'}">
                                    <label class="radio-1">
                                        <input type="radio"  value="男" name="sex" checked="checked"> 男
                                    </label>
                                    <label class="radio-1" id="radio-girl">
                                        <input type="radio" value="女" name="sex"> 女
                                    </label>
                                </c:when>
                                <c:otherwise>
                                    <label class="radio-1">
                                        <input type="radio"  value="男" name="sex"> 男
                                    </label>
                                    <label class="radio-1" id="radio-girl">
                                        <input type="radio" value="女" name="sex" checked="checked"> 女
                                    </label>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">手机号码</td>
                    <td class="right-td"><input name="phone" id="phone" class="input-text layui-input"  type="text" value="${employee.phone}" placeholder="请输入手机号码"></td>
                </tr>
                <tr>
                    <td class="left-td">当前状态</td>
                    <td class="right-td">
                        <select name="status" id="status"  class="input-text">
                            <option value="1">在职</option>
                            <option value="0">离职</option>
                            <option value="2">退休</option>
                            <option value="3">返聘</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">工作性质</td>
                    <td class="right-td">
                        <select name="nature" id="nature" class="input-text">
                            <option value="0">在编</option>
                            <option value="1">人事代理</option>
                            <option value="2">非人事代理</option>
                            <option value="3">退休返聘</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td class="right-td"><input name="oldPassword" id="oldPassword" type="password" class="input-text layui-input" value="" placeholder="修改密码"></td>
                </tr>
                <tr id="newPw" hidden>
                    <td>新密码</td>
                    <td class="right-td"><input name="newPassword" id="newPassword" type="password" class="input-text layui-input" value="" placeholder="请输入新密码"></td>
                </tr>
                <tr id="newPw1" hidden>
                    <td>确认密码</td>
                    <td class="right-td"><input name="" id="newPassword1" type="password" class="input-text layui-input" value="" placeholder="确认密码"></td>
                </tr>
                <tr >
                    <td colspan="2" align="centre">
                        <button type="button" class="form-button">提交</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/amazeui.datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<script>
    layui.use(['laydate','layer'], function(){
        var laydate = layui.laydate;
        var layer = layui.layer;
        laydate.render({
            elem: '#brithday'
        });
        laydate.render({
            elem:'#entry-time'
        });
        //修改密码
        $("#oldPassword").on("keyup",function(){
            $("#newPw").removeAttr("hidden")
        })
        $("#newPassword").on("keyup",function(){
            $("#newPw1").removeAttr("hidden")
        })
        //点击提交
        $(".form-button").click(function(){
            var phone = $("#phone").val()
            var rex = /^1[345678]\d{9}$/;
            var newPassword = $("#newPassword").val()
            var newPassword1 = $("#newPassword1").val()
            var isPhone = rex.test(phone);
            if(newPassword!=newPassword1){
                layer.msg("两次输入密码不一致，请确认！！", {icon : 2,time : 2000},function(){})// time: 2秒关闭（如果不配置，默认是3秒）
                return;
            }
            if($("#phone").val()==""||$("#name").val()==""){
                layer.msg("请填写完整信息", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function() {});
                return;
            } else if(!isPhone){
                layer.msg("手机号格式错误", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function() {});
                return;
            } else{
                $("#add-from").ajaxSubmit(function(message) {
                    console.log(message)
                    if(message.success){
                        layer.msg(message.message, {icon : 1,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                            function(){});
                    }else{
                        layer.msg(message.message, {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                            function(){});
                    }
                });
                return false;
            }
        })
        $("#nature").val("${employee.nature}")
        $("#status").val("${employee.status}")
        //返回主页
        $(".jexit").click(function(){
            window.location.href="toIndex"
        })
    })
</script>
</body>
</html>
