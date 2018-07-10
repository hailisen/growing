<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新增职称类别</title>
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
            width: 660px;
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
            height: 50px;
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
<div id="abc">
<div class="" id="header">
    <div>
        <div class="title_pic"></div>
        <span class="all-text title">职称管理</span>
    </div>
</div>
<div id="add-dept">
    <div id="title">
        <label id="title-text">新增职称类别</label>
        <label class="exit jexit">×</label>
    </div>
    <div id="neirong">
        <form action="${pageContext.request.contextPath}/position/updateCategory" id="add-from" method="post">
            <table id="add-table">
                <tr>
                    <td class="left-td">类别名称</td>
                    <td class="right-td">
                        <input class="input-text layui-input" type="text" name="cateName" id="cateName" value=""  placeholder="请输入名称">
                    </td>
                </tr>
                <tr>
                    <td class="left-td">类别描述</td>
                    <td class="right-td">
                        <textarea placeholder="请输入描述" style="margin-left: 36px; margin-top: 6px;width: 328px;" id="cateNote" class="layui-textarea" name="note"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">职称级别数量</td>
                    <td class="right-td">
                        <select name="levelNum" id="levelNum" class="input-text layui-input layui-unselect">
                            <option value="">请选择职称级别数量</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </td>
                </tr>
                <tr style="height: 20px" id="sign">
                    <td class="left-td" style="height: 20px"></td>
                    <td class="right-td" style="height: 20px;margin-left: 36px;">
                        <p>
                            <span style="font-size: 12px;color:#ff0000; margin-left: 36px;">* 默认一级职称为最高级</span>
                        </p>
                    </td>
                </tr>
                <tr hidden>
                    <td>职称级别名称和级别年限</td>
                    <td>
                        <input class='input-text layui-input' type='text' name='levelNames' id='levelNames' value=''>
                        <input class='input-text layui-input' type='text' name='limitTimes' id='limitTimes' value=''>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="centre">
                        <button type="button" class="form-button" id="testListAction">提交</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
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
            $("#abc").load("toCategory")
        })
        //点击提交按钮
        $("#testListAction").on("click",function(){
            var cateName = $("#cateName").val()
            var note = $("#cateNote").val()
            var levelNum = $("#levelNum").val()
            //表单验证
            if(cateName=="" || note=="" || levelNum==""){
                layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
                return
            }
            var cateLevels = $("#add-table").find("tr[data-cateLevel=1]");
            var levelNames = ""
            var limitTimes = ""
            for(var i=0;i<cateLevels.length;i++){
                var inputs = $(cateLevels[i]).find("input")
                //表单验证
                for(var j=0;j<inputs.length;j++){
                    if($(inputs[j]).val()=="") {
                        layer.msg("请填写完整信息", {icon: 2, time: 2000}, function () {})
                        return;
                    }
                }
                //把职称级别名称和晋级年限拼接放入到 levelNames limitTimes 中
                var levelName = $(inputs[0]).val()
                var limitTime = $(inputs[1]).val()
                levelNames = levelNames+levelName+"，"
                limitTimes = limitTimes+limitTime+"，"
            }
            $("#levelNames").val(levelNames)
            $("#limitTimes").val(limitTimes)
            $("#add-from").ajaxSubmit(function(data){
                if(data.success){
                    layer.msg(data.message,{icon:1,time:1000},function(){})
                    $("#abc").load("toCategory")
                }else{
                    layer.msg(data.message,{icon:2,time:2000},function(){})
                }
            })
        })
        // 选择职称数量后加载处相同数量的职称级别输入框
        $("#levelNum").on("change",function(){
            var cateLevels = $("#add-table").find("tr[data-cateLevel=1]");
            for(var i=0;i<cateLevels.length;i++){
                $(cateLevels[i]).remove()
            }
            var levelNum = $("#levelNum").val()
            var leftTd = ""
            var value = ""
            for(var i = 1;i<=levelNum;i++){
                switch(i){
                    case 1:
                        leftTd="一级职称";
                        break;
                    case 2:
                        leftTd="二级职称";
                        break;
                    case 3:
                        leftTd="三级职称";
                        break;
                    case 4:
                        leftTd="四级职称";
                        break;
                    case 5:
                        leftTd="五级职称";
                        break;
                }
                value+="<tr data-cateLevel='1'><td>"+leftTd+"</td><td>" +
                    "<input class='input-text layui-input' type='text' name='levelName' class='levelName' value='' style='display: inline-block;width: 150px !important;' placeholder='请输入名称'>" +
                    "<span style='display: inline;margin-left: 38px;'>晋级年限</span>" +
                    "<input class='input-text layui-input' onKeyUp='value=value.replace(/[^\\d]/g,\"\")' type='text' name='timeLimit' class='timeLimit' value='' style='display: inline-block;width: 42px !important;margin-left: 15px;'>" +
                    " &nbsp; 年</td></tr>"
            }
            $("#sign").after(value)
        })
    })
</script>
</body>
</html>
