<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>岗位管理</title>
    <meta name="description" content="岗位管理页面">
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
    #logo{
        border-right: 1px #cccccc solid;
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
    /*下拉框*/
    .ul-div{
        height: 32px;
        margin-top: 30px;
        margin-left: 28px;
    }
    .ul-li{
        float: left;
        font-size: 14px;
    }
    .ul-li select{
        width: 100px;
        height: 26px;
        margin-left: 10px;
    }
    .row-content {
        padding: 5px;
    }
    /*表格上面的操作字体*/
    .manage-text{
        margin-left: 20px;
        margin-top: 10px;
    }
    .manage-text a{
        font-size: 14px;
        color: #3ea0fb;
    }
    /*表格*/
    #table_search td,#table_search th{
        border: 1px #cacaca solid ;
        font-size: 13px;
        color: #555555;
        position: relative;
        padding: 9px 15px;
        min-height: 20px;
        line-height: 20px;
    }
    #table_search th{
        font-weight: bold;
        border-bottom: 2px #cacaca solid;
        background-color: #fff;
    }
    .layui-table{
        width: 97%;
    }
    .am-icon-cog:before, .am-icon-gear:before {
        content: "\f013";
        margin-top: 10px;
    }
</style>
</head>
<body data-type="chart">
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
            <li class="sidebar-nav-heading">欢迎您， <span class="sidebar-nav-heading-info"> ${employee.name}</span></li>
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
                <a href="/growing/posts" class="active">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 岗位管理

                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/positions">
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
                <span class="all-text title">岗位管理</span>
            </div>
        </div>
        <%--表格数据--%>
        <div class="row-content am-cf">
            <%--提示信息--%>
            <div class="manage-text">
                <a href="##" class="first-manage j_add_post">＋新增岗位</a>
            </div>
            <%--表格数据--%>
            <table class="layui-table" lay-skin="line" id="table_search" style="margin: 8px auto 15px;">
                <colgroup>
                    <col width="305">
                    <col width="260">
                    <col width="575">
                    <col width="260">
                </colgroup>
                <thead>
                <tr>
                    <th>岗位名称</th>
                    <th>岗位人数</th>
                    <th>岗位描述</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="commend-tbody">

                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<script src="js/amazeui.min.js"></script>
<script src="js/amazeui.datatables.min.js"></script>
<script src="js/dataTables.responsive.min.js"></script>
<script src="plugins/layui/layui.js"></script>
<script src="js/app.js"></script>
<script>
    layui.use(['laydate','layer'], function(){
        //点击查看个人信息
        $("#myInfo").on("click",function(){
            $(".bigContent").load("toMyInfo")
        })
        //第一次加载岗位列表
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/post/list",
            success:function(data){
                console.log(data)
                var value = ""
                for(var i = 0;i<data.data.length;i++){
                    if(data.data[i].note==undefined ||data.data[i].note=="" ||data.data[i].note==null){
                        value+="<tr data-id="+data.data[i].id+" data-order="+data.data[i].orderNum+"><td>"+data.data[i].postName+"</td>" +
                            "<td>"+data.data[i].empNum+"</td><td>暂无描述</td>" +
                            "<td><a href='##' class='post-up'>上移</a>&nbsp;  <a href='##' class='post-update'>修改</a>&nbsp;  <a href='##' class='post-remove'>删除</a></td></tr>"
                    }else{
                        value+="<tr data-id="+data.data[i].id+" data-order="+data.data[i].orderNum+"><td>"+data.data[i].postName+"</td>" +
                            "<td>"+data.data[i].empNum+"</td><td>"+data.data[i].note+"</td>" +
                            "<td><a href='##' class='post-up'>上移</a>&nbsp;  <a href='##' class='post-update'>修改</a>&nbsp;  <a href='##' class='post-remove'>删除</a></td></tr>"
                    }

                }
                $("#commend-tbody").html(value)
            }
        })
        //点击添加
        $(".j_add_post").on("click",function(){
            $(".bigContent").load("toAddPost")
        })
        //点击上移
        $("#commend-tbody").on("click",".post-up",function(){
            var post = $(this).parent().parent()
            var thisOrdel = post.attr("data-order")
            var postId = post.attr("data-id")
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/post/order",
                data:{"thisOrdel":thisOrdel,"postId":postId},
                success:function(data){
                    console.log(data)
                    if(data.success){
                        reload();
                        layer.msg(data.message,{icon:1,time:1000},function(){})
                    }else {
                        layer.msg(data.message,{icon:2,time:2000},function(){})
                    }
                }
            })
        })
        //点击删除
        $("#commend-tbody").on("click",".post-remove",function(){
            var post = $(this).parent().parent()
            var tds = post.find("td")
            var orderNum = post.attr("data-order")
            var postId = post.attr("data-id")
            var empNum = $(tds[1]).html()
            //询问框
            layer.confirm('确认删除该条信息？', {
                    btn: ['确定','取消'] //按钮,
                    ,area: ['300px', '180px']
                },function(index){
                    layer.close(index);
                    $.ajax({
                        type:"POST",
                        url:"${pageContext.request.contextPath}/post/delete",
                        data:{"postId":postId,"orderNum":orderNum,"empNum":empNum},
                        success:function(data){
                            if(data.success){
                                $("#commend-tbody").find("tr[data-id="+postId+"]").remove()
                                layer.msg(data.message,{icon:1,time:1000},function(){})
                            }else{
                                layer.msg(data.message,{icon:2,time:1000},function(){})
                            }
                        }
                    })
                },function(index){
                    layer.close(index);
                })

        })
        //点击修改
        $("#commend-tbody").on("click",".post-update",function(){
            var id = $(this).parent().parent().attr("data-id")
            $(".bigContent").load("toUpdatePost/"+id)
        })
    })
    //重新加载岗位数据
    function reload(deptId){
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/post/list",
            data:{"deptId":deptId},
            success:function(data){
                console.log(data)
                var value = ""
                for(var i = 0;i<data.data.length;i++){
                    if(data.data[i].note==undefined ||data.data[i].note=="" ||data.data[i].note==null){
                        value+="<tr data-id="+data.data[i].id+" data-order="+data.data[i].orderNum+"><td>"+data.data[i].postName+"</td>" +
                            "<td>"+data.data[i].empNum+"</td><td>暂无描述</td>" +
                            "<td><a href='##' class='post-up'>上移</a>&nbsp;  <a href='##' class='post-update'>修改</a>&nbsp;  <a href='##' class='post-remove'>删除</a></td></tr>"
                    }else{
                        value+="<tr data-id="+data.data[i].id+" data-order="+data.data[i].orderNum+"><td>"+data.data[i].postName+"</td>" +
                            "<td>"+data.data[i].empNum+"</td><td>"+data.data[i].note+"</td>" +
                            "<td><a href='##' class='post-up'>上移</a>&nbsp;  <a href='##' class='post-update'>修改</a>&nbsp;  <a href='##' class='post-remove'>删除</a></td></tr>"
                    }

                }
                $("#commend-tbody").html(value)
            }
        })
    }
</script>
</body>
</html>
