<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>添加考核</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="images/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="images/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="plugins/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.webui-popover.css"/>
    <script src="js/jquery.min.js"></script>
    <style type="text/css">
        .tpl-content-wrapper {
            min-height: 800px;
        }
        #add-employee{
            margin: 0px auto;
            position: absolute;
            width: 600px;
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
            width: 75%;
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
        .form-button{
            margin-left: 165px;
            margin-top: 45px;
            width: 107px;
            font-size: 13px;
            height: 38px;
            background-color: #777777;
            color: #ffffff;
            border-radius: 50px;
            borderadd-employee: none;
            border: 0px;
        }
        #alertDiv{
            color:#666666;
            margin: 30px auto 0px;
            text-align: center;
            font-size: 14.5px;
        }
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="" id="header">
        <div>
            <div class="title_pic"></div>
            <span class="all-text title">年度考核</span>
        </div>
    </div>
    <div id="add-employee">
        <div id="title">
            <label id="title-text">新增年度考核</label>
            <label class="exit jexit">×</label>
        </div>
        <div id="neirong">
            <form action="${pageContext.request.contextPath}/examine/add" id="add-from" method="post">
                <div id="alertDiv" >
                    <i class="layui-icon layui-icon-tips" style="font-size: 20px"></i>&nbsp;  &nbsp;  默认全部人员考核结果相同，可在新增后至年度考核列表修改
                </div>
                <table id="add-table">
                    <tr>
                        <td class="left-td">考核年度</td>
                        <td class="right-td">
                            <select class="input-text layui-input" name="year" id="select-year">

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">考核状态</td>
                        <td class="right-td">
                            <div class="form-radio">
                                <label class="radio-1">
                                    <input type="radio"  value="0" name="result" checked="checked"> 优秀
                                </label>
                                <label class="radio-1 radio-2" id="" style="margin-left: 158px;">
                                    <input type="radio" value="1" name="result"> 合格
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="form-radio">
                                <label class="radio-1">
                                    <input type="radio"  value="2" name="result"> 基本合格
                                </label>
                                <label class="radio-1 radio-2">
                                    <input type="radio" value="3" name="result" style="margin-left: 135px;"> 不合格
                                </label>
                            </div>
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
        $(function(){
            $(".form-button").on("click",function(){
                $("#add-from").ajaxSubmit(function(data){
                    console.log(data)
                    if(data.success){
                        layui.use(['layer'], function(){
                            var layer = layui.layer
                            layer.msg(
                                data.message,
                                {icon: 1, time: 2000}, //2秒关闭（如果不配置，默认是3秒）
                                function(){
                                });
                        })
                        window.location.href="examines";
                    }else{
                        layui.use(['layer'], function(){
                            layer.msg(
                                data.message,
                                {icon: 2, time: 2000}, //2秒关闭（如果不配置，默认是3秒）
                                function(){
                                });
                        })
                    }
                })
            })
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/examine/getYear",
                success:function(data) {
                    var year = data.data[0]
                    var year1 = data.data[0]+1
                    var year2 = data.data[0]+2
                    $("#select-year").html("<option value='"+year+"'>"+year+"年度</option>" +
                        "<option value='"+year1+"' selected>"+year1+"年度</option>" +
                        "<option value='"+year2+"'>"+year2+"年度</option>")
                }
            })
            //返回主页
            $(".jexit").click(function(){
                window.location.href="examines"
            })
        })
    </script>
</body>
</html>
