<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>修改部门</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="images/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="images/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="js/echarts.min.js"></script>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="plugins/layui/css/layui.css"/>
    <link rel="stylesheet" href="css/app.css">
    <script src="js/jquery.min.js"></script>
    <style type="text/css">
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
        .tpl-content-wrapper {
            min-height: 800px;
        }
        #header{
            padding-top: 15px;
            position: relative;
        }
        .title_pic{
            float: left;
            height: 18px;
            width: 4.5px;
            background-color: #737373;
            margin-left: 30px;
        }
        .title{/*标题每个页面都有 */
            font-size: 14px;
            font-weight: bolder;
            margin-left: 8px;
            line-height: 1.4;
        }
        #add-dept{
            margin: 0px auto;
            position: absolute;
            width: 630px;
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
            line-height: 54px;
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
        /*表单*/
        #add-from{
            margin: 0 auto;
        }
        #add-table{
            margin: 30px auto;
            width: 70%;
        }
        #add-table td{
            height: 45px;
        }
        .input-text{
            height: 33px;
            width: 328px !important;
            margin-left: 36px;
        }
        .left-td{
            font-size:14.6px;
            color: #666666;
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
        .layui-input, .layui-textarea {
            display: block;
            width: 86.5%;
        }
    </style>
</head>
<body>
    <div class="" id="header">
        <div>
            <div class="title_pic"></div>
            <span class="all-text title">部门管理</span>
        </div>
    </div>
    <div id="add-dept">
        <div id="title">
            <label id="title-text">修改部门</label>
            <label class="exit jexit">×</label>
        </div>
        <div id="neirong">
            <form action="${pageContext.request.contextPath}/dept/update" id="add-from" method="post">
                <table id="add-table">
                    <tr>
                        <td class="left-td">部门名称</td>
                        <td class="right-td">
                            <input class="input-text layui-input" type="text" name="deptName" id="deptName" value="${dept.deptName}"  placeholder="请输入名称">
                            <input type="hidden" name="id" id="deptId" value="${dept.id}">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">表彰描述</td>
                        <td class="right-td"><textarea placeholder="请输入描述" style="margin-left: 36px; margin-top: 6px;" id="dept-note" class="layui-textarea" name="note">${dept.note}</textarea></td>
                    </tr>
                    <tr >
                        <td colspan="2" align="centre">
                            <button type="button" class="form-button" id="testListAction">提交</button>
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
    layui.use(['laydate','layer','upload'], function() {
        //点击提交
        $("#testListAction").on("click",function(data){
            var deptName = $("#deptName").val()
            if(deptName == ""){
                layer.msg("名称不能为空",{icon:2,time:2000},function(){})
                return;
            }
            $("#add-from").ajaxSubmit(function(data){
                console.log(data)
                if(data.success){
                    window.location.href="depts"
                    layer.msg(data.message,{icon:1,time:2000},function(){})
                }else{
                    layer.msg(data.message,{icon:2,time:2000},function(){})
                }
            })
        })
        //返回主页
        $(".jexit").click(function(){
            window.location.href="depts"
        })
    })
</script>
</body>
</html>
