<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新增职称</title>
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
            min-height: 700px;
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
<div class="" id="header">
    <div>
        <div class="title_pic"></div>
        <span class="all-text title">职称管理</span>
    </div>
</div>
<div id="add-dept">
    <div id="title">
        <label id="title-text">新增职称</label>
        <label class="exit jexit">×</label>
    </div>
    <div id="neirong">
        <form action="${pageContext.request.contextPath}/position/addPosition" id="add-from" method="post">
            <table id="add-table">
                <tr>
                    <td class="left-td">职称名称</td>
                    <td class="right-td">
                        <input class="input-text layui-input" type="text" name="positionName" id="positionName" value=""  placeholder="请输入名称">
                    </td>
                </tr>
                <tr>
                    <td class="left-td">所属类别</td>
                    <td class="right-td">
                        <select name="category" id="category" class="input-text layui-input layui-unselect">
                            <option value="">请选择职称类别</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">职称级别</td>
                    <td class="right-td">
                        <select name="categoryId" id="categoryId" class="input-text layui-input layui-unselect">
                            <option value="">请选择职称级别</option>
                        </select>
                    </td>
                </tr>
                <td class="left-td">晋级年限</td>
                <td class="right-td">
                    <input class="input-text layui-input" readonly type="text" name="deptName" id="timeLimit" value="" >
                </td>
                <tr>
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
        var layer = layui.layer
        //返回主页
        $(".jexit").click(function(){
            window.location.href="positions"
        })
        //加载职称类别下拉框
        $.ajax({
            type:"POST",
            url:"teacher/categorys",
            dataType:"json",
            success:function(data){
                var value = "<option value=''>请选择职称类别</option>"
                for(var i=0;i<data.data.length;i++){
                    value+="<option value='"+data.data[i].id+"'>"+data.data[i].cateName+"</option>"
                }
                $("#category").html(value);
            }
        })
        //加载职称级别下拉框
        $("#category").on("change",function(){
            var cateId = $("#category").val()
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/position/getSelectLevel",
                data:{"cateId":cateId},
                success:function(data){
                    console.log(data)
                    var value = "<option value=''>请选择职称级别</option>"
                    for(var i = 0;i<data.data.length;i++){
                        value+="<option value='"+data.data[i].id+"' data-time='"+data.data[i].timeLimit+"'>"+data.data[i].level+"</option>"
                    }
                    $("#categoryId").html(value)
                }
            })
        })
        $("#categoryId").on("change",function(){
            var year = $("#categoryId").find("option:selected").attr("data-time")
            $("#timeLimit").val(year);
        })
        $("#timeLimit").on("click",function(){
            layer.msg("请到职称类别修改年限",{icon:4,time:2000},function(){})
        })
        //点击提交按钮
        $("#testListAction").on("click",function(){
            var positionName = $("#positionName").val()
            var categoryId = $("#categoryId").val()
            if(positionName=="" || categoryId==""){
                layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
                return
            }
            $("#add-from").ajaxSubmit(function(data){
                $("#add-from").ajaxSubmit(function(data){
                    if(data.success){
                        layer.msg(data.message,{icon:1,time:1000},function(){})
                        window.location.href="examines"
                    }else{
                        layer.msg(data.message,{icon:2,time:2000},function(){})
                    }
                })
            })
        })
    })

</script>
</body>
</html>
