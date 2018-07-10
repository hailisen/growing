<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>职称管理</title>
    <meta name="description" content="表彰统计页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="images/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="images/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="plugins/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.webui-popover.css"/>
    <script src="js/jquery.min.js"></script>
    <style type="text/css">
        #logo{
            border-right: 1px #cccccc solid;
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
        /*表格上面的操作字体*/
        .manage-text a{
            font-size: 14px;
            color: #3ea0fb;
        }
        .first-manage{
            margin-left: 8px;
        }
        .after-manage{/*第二个和第三个字体*/
            margin-left: 20px;
        }
        .row-content {
            padding: 20px;
        }
        #table_search td{
            border-right: 1px #e6e6e6 solid ;
            font-size: 13px;
            color: #555555;
        }
        #table_search th{
            border-right: 1px #e6e6e6 solid ;
            font-size: 13px;
            font-weight: bold;
            color: #555555;
        }
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
    </style>
</head>
<body data-type="widgets">
<script src="js/theme.js"></script>
<div class="am-g tpl-g">
    <!-- 头部 -->
    <header>
        <!-- logo -->
        <div class="am-fl tpl-header-logo" id="logo">
            <a href="javascript:;"><img src="images/log.png" alt="" style="width: 100%;height: 56px"></a>
        </div>
        <!-- 右侧内容 -->
        <div class="tpl-header-fluid">
            <!-- 其它功能-->
            <div class="am-fr tpl-header-navbar">
                <ul>
                    <!-- 个人信息 -->
                    <li class="am-text-sm" id="myInfo">
                        <a href="javascript:;">
                            <span class="am-icon-smile-o" id="userinfo"></span> 个人信息
                        </a>
                    </li>
                    <!-- 退出 -->
                    <li class="am-text-sm">
                        <a href="javascript:;">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <!-- 风格切换 -->
    <div class="tpl-skiner">
        <div class="tpl-skiner-toggle am-icon-cog">
        </div>
        <div class="tpl-skiner-content">
            <div class="tpl-skiner-content-title">
                选择主题
            </div>
            <div class="tpl-skiner-content-bar">
                <span class="skiner-color skiner-white" data-color="theme-white"></span>
                <span class="skiner-color skiner-black" data-color="theme-black"></span>
            </div>
        </div>
    </div>
    <!-- 侧边导航栏 -->
    <div class="left-sidebar">
        <!-- 菜单 -->
        <ul class="sidebar-nav">
            <li class="sidebar-nav-heading">欢迎您，<span class="sidebar-nav-heading-info"> ${employee.name}</span></li>
            <li class="sidebar-nav-link">
                <a href="/growing/toIndex">
                    <i class="am-icon-male sidebar-nav-link-logo"></i> 人事管理
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/examines">
                    <i class="am-icon-bar-chart sidebar-nav-link-logo"></i> 年度考核
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/commends">
                    <i class="am-icon-trophy sidebar-nav-link-logo"></i> 表彰统计
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/depts">
                    <i class="am-icon-users sidebar-nav-link-logo"></i> 部门管理
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/posts">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 岗位管理
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/positions"  class="active">
                    <i class="am-icon-black-tie sidebar-nav-link-logo"></i> 职称管理
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/settings">
                    <i class="am-icon-gears sidebar-nav-link-logo"></i> 系统管理
                </a>
            </li>
        </ul>
    </div>
    <!-- 内容区域 -->
    <div class="tpl-content-wrapper bigContent">
        <%--查询导航--%>
        <div class="" id="header">
            <div>
                <div class="title_pic"></div>
                <span class="all-text title">表彰统计</span>
            </div>
        </div>
        <%--表格数据--%>
        <div class="row-content am-cf">
            <%--提示信息--%>
            <div class="manage-text">
                <a href="##" class="first-manage jAddCategory">新增职称类别</a>
                <a href="##" class="after-manage jAddPosition">新增职称</a>
                <a href="##" class="after-manage manageCategory">职称类别</a>
            </div>
            <%--表格数据--%>
            <table class="layui-table" lay-skin="line" id="table_search" style="margin: 15px auto;">
                <colgroup>
                    <col width="285">
                    <col width="220">
                    <col width="200">
                    <col width="220">
                    <col width="275">
                </colgroup>
                <thead>
                <tr>
                    <th>分类名称</th>
                    <th>职称名称</th>
                    <th>人数</th>
                    <th>晋级年限</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="position-tbody" class="box_neirong_all">

                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="js/moment.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="plugins/layui/layui.js"></script>
<script src="js/app.js"></script>
<script>
    layui.use(['laydate','layer'], function(){
        var layer = layui.layer
        //点击查看个人信息
        $("#myInfo").on("click",function(){
            $(".bigContent").load("toMyInfo")
        })
        //第一次加载
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/position/list",
            success:function(data){
                console.log(data)
                var value = "";
                if(data.success){
                    for(var i=0;i<data.data.length;i++){
                        value+="<tr data-id='"+data.data[i].id+"'><td>"+data.data[i].cateName+"</td><td>"+data.data[i].positionName+"</td>" +
                            "<td>"+data.data[i].empNum+"</td><td>"+data.data[i].timeLimit+"</td>" +
                            "<td><a href='##' class='post-update'>修改</a>&nbsp;  <a href='##' class='post-remove'>删除</a></td></tr>"
                    }
                }
                $("#position-tbody").html(value)
            }
        })
        //点击删除按钮
        $("#position-tbody").on("click",".post-remove",function(){
            var id = $(this).parent().parent().attr("data-id")
            layer.confirm('确定删除该条信息？',{btn: ['确定','取消'] //按钮,
                ,area: ['300px', '180px']},
            function(index){
                layer.close(index)
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/position/deletePosition",
                    data:{"id":id},
                    success:function(data){
                        if(data.success){
                            $("#position-tbody").find("tr[data-id="+id+"]").remove()
                            layer.msg(data.message,{icon:1,time:1000},function(){})
                        }else{
                            layer.msg(data.message,{icon:2,time:2000},function(){})
                        }
                    }
                })
            },function(index){
                layer.close(index)
            })
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/position/deletePosition",
                data:{"id":id},
                success:function(data){
                    if(data.success){
                        $("#position-tbody").find("tr[data-id="+id+"]").remove()
                        layer.msg(data.message,{icon:1,time:1000},function(){})
                    }else{
                        layer.msg(data.message,{icon:2,time:2000},function(){})
                    }
                }
            })
        })
        //点击新增职称按钮
        $(".jAddPosition").on("click",function(){
            $(".bigContent").load("toAddPosition")
        })
        //点击修改按钮
        $("#position-tbody").on("click",".post-update",function(){
            var id = $(this).parent().parent().attr("data-id")
            $(".bigContent").load("toUpdatePosition/"+id)
        })
        //点击添加职称分类
        $(".jAddCategory").on("click",function(){
            $(".bigContent").load("toAddCategory")
        })
        //点击职称类别
        $(".manageCategory").on("click",function(){
            $(".bigContent").load("toCategory")
        })
    })
</script>
</body>
</html>
