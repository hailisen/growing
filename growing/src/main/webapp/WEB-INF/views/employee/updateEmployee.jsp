<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>编辑基本信息</title>
    <meta name="description" content="编辑基本信息">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="../images/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="../images/i/app-icon72x72@2x.png">
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
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
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
            border: none;
        }
    </style>
</head>
<body>
<div id="add-employee">
    <div id="title">
        <label id="title-text">新增人员</label>
        <label class="exit jexit">×</label>
    </div>
    <div id="neirong">
        <form action="${pageContext.request.contextPath}/employee/add" id="add-from" method="post">
            <table id="add-table">
                <tr>
                    <td class="left-td">编号</td>
                    <td class="right-td"><input class="input-text layui-input" type="text" value="" id="empNo" name="empNo" placeholder="编号可自动生成"></td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td class="right-td"><input name="name" id="name" type="text" class="input-text layui-input" value="" placeholder="请输入姓名"></td>
                </tr>
                <tr>
                    <td class="left-td">性别</td>
                    <td class="right-td">
                        <div class="form-radio">
                            <label class="radio-1">
                                <input type="radio"  value="男" name="sex" checked="checked"> 男
                            </label>
                            <label class="radio-1" id="radio-girl">
                                <input type="radio" value="女" name="sex"> 女
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">出生年月</td>
                    <td class="right-td">
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input name="brithday" type="text" class="input-text layui-input" id="brithday" value="" placeholder="请选择日期">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">身份证号</td>
                    <td class="right-td"><input name="persionId" id="persionId" class="input-text layui-input"  type="text" value="" placeholder="请输入身份证号"></td>
                </tr>
                <tr>
                    <td class="left-td">手机号码</td>
                    <td class="right-td"><input name="phone" id="phone" class="input-text layui-input"  type="text" value="" placeholder="请输入手机号码"></td>
                </tr>
                <tr>
                    <td class="left-td">籍贯</td>
                    <td class="right-td"><input name="navitePlace" id="navitePlace" class="input-text layui-input" type="text" value="" placeholder="请输入籍贯"></td>
                </tr>
                <tr>
                    <td class="left-td">入职日期</td>
                    <td class="right-td">
                        <div class="layui-input-inline">
                            <input name="entryDay" id="entry-time" type="text" value="" class="input-text layui-input" placeholder="请选择日期">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">部门</td>
                    <td class="right-td">
                        <select name="deptId" id="select-dept" class="input-text layui-unselect">
                            <option value="">请选择...</option>
                        </select>
                </tr>
                <tr>
                    <td class="left-td">岗位</td>
                    <td class="right-td">
                        <select name="postId" id="select-post" class="input-text layui-unselect">
                            <option value="">请选择...</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">职称</td>
                    <td class="right-td">
                        <select name="positionId" id="select-position" class="input-text">
                            <option value="">请选择...</option>
                        </select>

                    </td>
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
        //点击提交
        $(".form-button").click(function(){
            var phone = $("#phone").val()
            var rex = /^1[345678]\d{9}$/;
            var isPhone = rex.test(phone);
            rex = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
            var isPersionID = rex.test($("#persionId").val())
            if($("#phone").val()==""||$("#persionId").val()==""||$("#name").val()==""||$("#brithday").val()==""||$("#persionId").val()==""||
                $("#navitePlace").val()==""||$("#entry-time").val()==""||$("#select-dept").val()==""
                ||$("#select-post").val()==""||$("#select-position").val()==""||$("#status").val()==""||$("#nature").val()==""){
                layer.msg("请填写完整信息", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function() {});
                return;
            } else if(!isPhone){
                layer.msg("手机号格式错误", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function() {});
                return;
            } else if(!isPersionID){
                layer.msg("身份证 号格式错误", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function() {});
                return;
            }else{
                var empNo = $("#empNo").val()
                var format = true;
                for (var i = 0; i < empNo.length; i++) {
                    if(!isNaN(empNo.charAt(i))) {
                        format=false;
                    }
                }
                if(!format && empNo.length!=6 ||empNo.length!=0){
                    layer.msg("员工号格式为6位数字，如：000001", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                        function() {});
                    return;
                }
                // $("#add-from").submit();
                // jquery 表单提交
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
        $.ajax({//部门下拉框
            type:"post",
            url:"${pageContext.request.contextPath}/employee/getDept",
            dataType:"json",
            data:{},
            success:function(data){
                var value = "<option value=''>请选择...</option>";
                for(var i=0;i<data.data.length;i++){
                    value+="<option value='"+data.data[i].id+"'>"+data.data[i].deptName+"</option>"
                }
                $("#select-dept").html(value);
            }
        })
        $("#select-dept").change(function(){//加载岗位列表
            var deptId = $("#select-dept").val()
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/employee/getPost",
                dataType:"json",
                data:{"deptId":deptId},
                success:function(data){
                    var value="<option value=''>请选择...</option>";
                    if(data.data!=null){
                        for(var i=0;i<data.data.length;i++){
                            value+="<option value='"+data.data[i].id+"'>"+data.data[i].postName+"</option>"
                            $("#select-post").html(value)
                        }
                    }else{
                        $("#select-post").html("<option value=''>请选择...</option>")
                        layer.msg("当前部门尚未添加岗位",{icon: 2, time: 1000 },//time：2秒关闭（如果不配置，默认是3秒）
                            function(){
                            });
                    }

                }
            })
        })
        $.ajax({//查询职称下拉框列表
            type:"post",
            url:"${pageContext.request.contextPath}/employee/getPosition",
            dataType:"json",
            data:{},
            success:function(data){
                var value = "<option value=''>请选择...</option>";
                for(var i=0;i<data.data.length;i++){
                    value+="<option value='"+data.data[i].id+"'>"+data.data[i].positionName+"</option>"
                }
                $("#select-position").html(value)
            }
        })
        //返回主页
        $(".jexit").click(function(){
            window.location.href="toIndex"
        })
    })
</script>
</body>
</html>
