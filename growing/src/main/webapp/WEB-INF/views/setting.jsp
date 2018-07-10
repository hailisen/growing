<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>省实验幼儿园人事管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="images/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="images/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <!--图标：：等待删除-->
    <script src="js/echarts.min.js"></script>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/amazeui.datatables.min.css" />
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
        .layui-upload-drag .layui-icon {
            font-size: 65px;
        }
    </style>
</head>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>系统管理</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="images/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="images/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <!--图标：：等待删除-->
    <script src="js/echarts.min.js"></script>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="plugins/layui/css/layui.css"/>
    <script src="js/jquery.min.js"></script>
    <style type="text/css">
        #logo{
            border-right: 1px #cccccc solid;
        }
        .row-content {
            padding: 20px;
        }
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
        #test10{
            position: absolute;
            margin-left: 127px;
            margin-top: 67px;
        }
        #index_div{
            width: 100%;
            height: 100%;
            background-color: #fff;
            z-index: -10;
        }
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
    </style>
</head>
<body data-type="index" id="setting_body">
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
        <!-- 侧边菜单栏 -->
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
                <a href="/growing/posts">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 岗位管理
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/positions">
                    <i class="am-icon-black-tie sidebar-nav-link-logo"></i> 职称管理
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="/growing/settings" class="active">
                    <i class="am-icon-gears sidebar-nav-link-logo"></i> 系统管理
                </a>
            </li>
            <%--<li class="sidebar-nav-heading">Page<span class="sidebar-nav-heading-info"> 常用页面</span></li>--%>
            <%--<li class="sidebar-nav-link">--%>
            <%--<a href="javascript:;" class="sidebar-nav-sub-title">--%>
            <%--<i class="am-icon-table sidebar-nav-link-logo"></i> 数据列表--%>
            <%--<span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>--%>
            <%--</a>--%>
            <%--<ul class="sidebar-nav sidebar-nav-sub">--%>
            <%--<li class="sidebar-nav-link">--%>
            <%--<a href="table-list.html">--%>
            <%--<span class="am-icon-angle-right sidebar-nav-link-logo"></span> 文字列表--%>
            <%--</a>--%>
            <%--</li>--%>

            <%--<li class="sidebar-nav-link">--%>
            <%--<a href="table-list-img.html">--%>
            <%--<span class="am-icon-angle-right sidebar-nav-link-logo"></span> 图文列表--%>
            <%--</a>--%>
            <%--</li>--%>
            <%--</ul>--%>
            <%--</li>--%>
            <%--<li class="sidebar-nav-link">--%>
            <%--<a href="sign-up.html">--%>
            <%--<i class="am-icon-clone sidebar-nav-link-logo"></i> 注册--%>
            <%--<span class="am-badge am-badge-secondary sidebar-nav-link-logo-ico am-round am-fr am-margin-right-sm">6</span>--%>
            <%--</a>--%>
            <%--</li>--%>
            <%--<li class="sidebar-nav-link">--%>
            <%--<a href="login.html">--%>
            <%--<i class="am-icon-key sidebar-nav-link-logo"></i> 登录--%>
            <%--</a>--%>
            <%--</li>--%>
            <%--<li class="sidebar-nav-link">--%>
            <%--<a href="404.html">--%>
            <%--<i class="am-icon-tv sidebar-nav-link-logo"></i> 404错误--%>
            <%--</a>--%>
            <%--</li>--%>

        </ul>
    </div>
    <!-- 内容区域 -->
    <div class="tpl-content-wrapper bigContent">
        <%--查询导航--%>
        <div class="" id="header">
            <div>
                <div class="title_pic"></div>
                <span class="all-text title">系统管理</span>
            </div>
            <%--表格数据--%>
            <div class="row-content am-cf">
                <%--提示信息--%>
                <div class="manage-text">
                    <a href="##" class="first-manage jdb_save">数据备份</a>
                    <a href="##" class="after-manage jdb_roolback">数据恢复</a>
                </div>
                <%--表格数据--%>
                <table class="layui-table" lay-skin="line" id="table_search" style="margin: 15px auto;">
                    <colgroup>
                        <col width="70">
                        <col width="185">
                        <col width="180">
                        <col width="280">
                        <col width="335">
                        <col width="150">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>备份时间</th>
                        <th>操作人员</th>
                        <th>文件名</th>
                        <th>保存路径</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="dbsave-tbody" class="box_neirong_all">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
<div class="row-content am-cf disDiv hiddenFile" id="index_div">
    <div class="layui-upload-drag" id="test10">
        <i class="layui-icon layui-icon-upload" style="color:#b2b4b5;">&#xe67c;</i>
        <p>点击上传，或将文件拖拽到此处</p>
    </div>
</div>
<script src="js/amazeui.min.js"></script>
<script src="js/amazeui.datatables.min.js"></script>
<script src="js/dataTables.responsive.min.js"></script>
<script src="plugins/layui/layui.js"></script>
<script src="js/app.js"></script>
<script>['laydate','layer']
    layui.use(['upload','layer'], function(){
        var layer = layui.layer;
        var upload = layui.upload;
        $(".hiddenFile").hide()
        //点击查看个人信息
        $("#myInfo").on("click",function(){
            $(".bigContent").load("toMyInfo")
        })
        //点击数据备份
        $(".jdb_save").on("click",function(){
            //询问框
            var xunwen = layer.confirm('此操作可能需要一些时间，确定要继续吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                //加载层
                var jiazai = layer.msg('加载中...', {
                    icon: 16
                    ,shade: 0.01
                });
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/database/save",
                    async:false,
                    success:function(data){
                        if(data.success){
                            layer.close(jiazai);
                            layer.msg("备份成功",{icon:1,time:2000},function(){})
                            window.location.href="settings";
                        }else{
                            layer.close(jiazai);
                            layer.msg("备份失败",{icon:2,time:2000},function(){})
                        }
                    }
                })
            }, function(){

            });
        })
        //点击恢复数据
        $(".jdb_roolback").on("click",function(){
            //询问框
            var xunwen = layer.confirm('此操作可能需要一些时间，确定要继续吗？',{
                btn: ['确定','取消'] //按钮
            }, function(){
                //页面层
                layer.open({
                    type: 1,
                    title: false,
                    closeBtn: 0,
                    area: ['550px','300px'],
                    skin: 'layui-layer-nobg', //没有背景色
                    shadeClose: true,
                    content: $("#index_div"),
                    success:function(index,data){
                        $("#index_div").removeClass("hiddenFile")
                    }
                });
            }, function(){

            });

        })
        //第一次加载数据
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/database/list",
            success:function(data){
                console.log(data)
                var value=""
                for(var i=0;i<data.data.length;i++){
                    value+="<tr data-id='"+data.data[i].id+"'><td>"+(i+1)+"</td><td>"+timeStamp2String(data.data[i].saveTime.time)+"</td><td>"+data.data[i].empName+"</td>" +
                        "<td>"+data.data[i].filename+"</td><td>"+data.data[i].filepath+"</td><td><a href='##' class='removedb'>刪除</a></td></tr>"
                }
                $("#dbsave-tbody").html(value)
            }
        })
        //点击删除
        $("#dbsave-tbody").on("click",".removedb",function(){
            var id = $(this).parent().parent().attr("data-id")
            //询问框
            layer.confirm('确认删除该条信息？', {
                    btn: ['确定','取消'] //按钮,
                    ,area: ['300px', '180px']
                },function(index){
                    layer.close(index)
                    $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/database/delete/"+id,
                    success:function(data){
                        if(data.success){
                            $("#dbsave-tbody").find("tr[data-id="+id+"]").remove()
                            layer.msg(data.message,{icon:1,time:2000},function(){})
                        }else{
                            layer.msg(data.message,{icon:2,time:2000},function(){})
                        }
                    }
                })
            },function(index){
                    layer.close(index)
            })
        })
        //拖拽上传
        upload.render({
            elem: '#test10'
            ,url: '${pageContext.request.contextPath}/database/roolback'
            ,accept: 'file'
            ,before:function(){
                //加载层
                var roolbackjz = layer.msg('数据恢复中...', {
                    icon: 16
                    ,time:0//不自动关闭
                    ,shade: 0.01
                });
            }
            ,done: function(data){
                if(data.success){
                    layer.closeAll("loading");
                    layer.msg(data.message,{icon:1,time:2000},function(){})
                }else{
                    layer.msg(data.message,{icon:2,time:2000},function(){})
                }
            }
        });
    })
    //在Jquery里格式化Date日期时间数据
    function timeStamp2String(time){
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var day = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        return year + "-" + month + "-" + day;
    }
</script>

</body>
</html>
