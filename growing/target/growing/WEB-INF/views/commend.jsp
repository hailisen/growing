<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>表彰统计</title>
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
        .row-content {
            padding: 5px;
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
        /*下拉框*/
        .ul-div{
            height: 55px;
            margin-top: 20px;
            margin-left: 33px;
        }
        .ul-li{
            float: left;
            margin-left: -5px;
            margin-top: 10px;
            font-size: 14px;
        }
        .ul-li1{
            margin-left: 35px;
        }
        .ul-li select{
            width: 100px;
            height: 26px;
            margin-left: 10px;
        }
        /*按钮*/
        .select-btn{
            font-size: 14px;
            height: 28px;
            width: 80px;
            margin-left: 45px;
            border-radius:10px;
            margin-top:9px;
        }
        /*表格上面的操作字体*/
        .manage-text a{
            font-size: 14px;
            color: #3ea0fb;
        }
        .first-manage{ /*第一个字体*/
            margin-left: 25px;
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
        .layui-table{
            width: 98%;
        }
        /*分页工具*/
        .select_page_number{
            height:30px;
            width:100%;
            line-height:30px;
            margin-top:10px;
        }
        .select_page_box{
            height:30px;
            line-height:30px;
            float:left;
            margin-left: 15px;
            font-size: 14px;
        }
        .select_page_box select{
            height:30px;
            width:80px;
            line-height:30px;
            display:inline-block;
        }
        .select_page_box_right{
            float:right;
            width:150px;
            cursor:pointer;
            margin-right: -9px;
        }
        .select_page_box_right a{
            height:30px;
            float:left;
            padding:0 10px;
            line-height:30px;
            border:1px solid #ccc;
            display:block;
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
                <a href="/growing/commends" class="active">
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
            <div class="ul-div">
                <ul>
                    <li class="ul-li select-li-font">
                        <span class="select-name">年份</span>
                        <select id="commentGetTime" class="commendGetYear">
                            <option value="">全部</option>
                        </select>
                    </li>
                    <li class="ul-li ul-li1 select-li-font">
                        <span class="select-name">表彰级别</span>
                        <select id="index_level" name="level" class="post_value">
                            <option value="">全部</option>
                            <option value="园级">园级</option>
                            <option value="区级">区级</option>
                            <option value="市级">市级</option>
                            <option value="省级">省级</option>
                            <option value="国家级">国家级</option>
                        </select>
                    </li>
                </ul>
                <input type="button" value="查询" class="select-btn jselect-btn-commend">
            </div>
        </div>
        <%--表格数据--%>
        <div class="row-content am-cf">
            <%--提示信息--%>
            <div class="manage-text">
                <a href="##" class="first-manage j_add_commend">新增表彰</a>
            </div>
            <%--表格数据--%>
            <table class="layui-table" lay-skin="line" id="table_search" style="margin: 15px auto;">
                <colgroup>
                    <col width="115">
                    <col width="180">
                    <col width="120">
                    <col width="120">
                    <col width="140">
                    <col width="160">
                    <col width="140">
                    <col width="200">
                    <col width="135">
                    <col width="120">
                </colgroup>
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>手机号</th>
                    <th>部门</th>
                    <th>岗位</th>
                    <th>表彰名称</th>
                    <th>表彰描述</th>
                    <th>表彰级别</th>
                    <th>附件</th>
                    <th>获得日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="commend-tbody">

                </tbody>
            </table>
            <%--分页相关--%>
            <div class="select_page_number">
                <div class="select_page_box">
                    <span>每页显示</span>
                    <select name="rows" id="select_rows">
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                    </select>
                    <span>条</span>
                </div>
                <div class="select_page_box_right">
                    <a id="page_up">上一页</a>
                    <a id="page_down">下一页</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/amazeui.min.js"></script>
<script src="js/amazeui.datatables.min.js"></script>
<script src="js/dataTables.responsive.min.js"></script>
<script src="js/app.js"></script>
<script src="plugins/layui/layui.js"></script>
<script src="js/index_agreement.js"></script>
<script src="js/index_positionUp.js"></script>
<script>
    layui.use(['laydate','layer'], function(){
        var laydate = layui.laydate;
        var layer = layui.layer;
        var page=1;
        var total=0;
        //点击查看个人信息
        $("#myInfo").on("click",function(){
            $(".bigContent").load("toMyInfo")
        })
        //第一次加载表格
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/commend/commendList",
            data:{"pageNum":page,"pageSize":$("#select_rows").val()},
            success:function(data){
                console.log(data)
                var my_table = "";
                for(var i = 0;i<data.data.result.length;i++){
                    var a = ""
                    var url = data.data.result[i].url
                    var fileName = data.data.result[i].fileName
                    if(url!=null && fileName!=null){
                        var urls = url.split(",")
                        var fileNames = fileName.split("、")
                        for(var j=0;j<urls.length-1;j++){
                            if(j<urls.length-2){
                                a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download='' >"+fileNames[j]+"</a>、"
                            }else{
                                a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download=''>"+fileNames[j]+"</a>"
                            }
                        }
                    }
                    my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td><td>"+data.data.result[i].deptName+"</td>" +
                        "<td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].commendName+"</td>" +
                        "<td>"+data.data.result[i].note+"</td><td>"+data.data.result[i].level+"</td><td>"+a+"</td><td>"+data.data.result[i].getTime+"</td>" +
                        "<td><a href='##' class='commend_update'>修改</a>&nbsp;  <a href='##' class='commend_delete'>删除</a></td></tr>"
                }
                $("#commend-tbody").html(my_table)
                page = data.data.pageNumber
                total = data.data.totalPages
            }
        })
        //点击下一页
        $("#page_down").on("click",function(){
            var getYear = $("#commentGetTime").val()
            var level = $("#index_level").val()
            if(page<total){
                page+=1;
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/commend/commendList",
                    dataType:"json",
                    data:{"pageNum":page,"pageSize":$("#select_rows").val(),"getYear":getYear,"level":level},
                    success:function(data){
                        console.log(data)
                        var my_table = "";
                        for(var i = 0;i<data.data.result.length;i++){
                            var a = ""
                            var url = data.data.result[i].url
                            var fileName = data.data.result[i].fileName
                            if(url!=null && fileName!=null){
                                var urls = url.split(",")
                                var fileNames = fileName.split("、")
                                for(var j=0;j<urls.length-1;j++){
                                    if(j<urls.length-2){
                                        a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download='' >"+fileNames[j]+"</a>、"
                                    }else{
                                        a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download=''>"+fileNames[j]+"</a>"
                                    }
                                }
                            }
                            my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td><td>"+data.data.result[i].deptName+"</td>" +
                                "<td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].commendName+"</td>" +
                                "<td>"+data.data.result[i].note+"</td><td>"+data.data.result[i].level+"</td><td>"+a+"</td><td>"+data.data.result[i].getTime+"</td>" +
                                "<td><a href='##' class='commend_update'>修改</a>&nbsp;  <a href='##' class='commend_delete'>删除</a></td></tr>"
                        }
                        $("#commend-tbody").html(my_table)
                        page = data.data.pageNumber
                        total = data.data.totalPages
                    }
                })
            }else{
                page=total
            }
        })
        //点击上一页
        $("#page_up").on("click",function(){
            var getYear = $("#commentGetTime").val()
            var level = $("#index_level").val()
            if(page>1){
                page-=1;
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/commend/commendList",
                    dataType:"json",
                    data:{"pageNum":page,"pageSize":$("#select_rows").val(),"getYear":getYear,"level":level},
                    success:function(data){
                        console.log(data)
                        var my_table = "";
                        for(var i = 0;i<data.data.result.length;i++){
                            var a = ""
                            var url = data.data.result[i].url
                            var fileName = data.data.result[i].fileName
                            if(url!=null && fileName!=null){
                                var urls = url.split(",")
                                var fileNames = fileName.split("、")
                                for(var j=0;j<urls.length-1;j++){
                                    if(j<urls.length-2){
                                        a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download='' >"+fileNames[j]+"</a>、"
                                    }else{
                                        a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download=''>"+fileNames[j]+"</a>"
                                    }
                                }
                            }
                            my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td><td>"+data.data.result[i].deptName+"</td>" +
                                "<td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].commendName+"</td>" +
                                "<td>"+data.data.result[i].note+"</td><td>"+data.data.result[i].level+"</td><td>"+a+"</td><td>"+data.data.result[i].getTime+"</td>" +
                                "<td><a href='##' class='commend_update'>修改</a>&nbsp;  <a href='##' class='commend_delete'>删除</a></td></tr>"
                        }
                        $("#commend-tbody").html(my_table)
                        page = data.data.pageNumber
                        total = data.data.totalPages
                    }
                })
            }else{
                page=1;
            }
        })
        //点击查询按钮
        $(".jselect-btn-commend").on("click",function(){
            var getYear = $("#commentGetTime").val()
            var level = $("#index_level").val()
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/commend/commendList",
                dataType:"json",
                data:{"pageNum":page,"pageSize":$("#select_rows").val(),"getYear":getYear,"level":level},
                success:function(data){
                    console.log(data)
                    var my_table = "";
                    for(var i = 0;i<data.data.result.length;i++){
                        var a = ""
                        var url = data.data.result[i].url
                        var fileName = data.data.result[i].fileName
                        if(url!=null && fileName!=null){
                            var urls = url.split(",")
                            var fileNames = fileName.split("、")
                            for(var j=0;j<urls.length-1;j++){
                                if(j<urls.length-2){
                                    a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download='' >"+fileNames[j]+"</a>、"
                                }else{
                                    a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download=''>"+fileNames[j]+"</a>"
                                }
                            }
                        }
                        my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td><td>"+data.data.result[i].deptName+"</td>" +
                            "<td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].commendName+"</td>" +
                            "<td>"+data.data.result[i].note+"</td><td>"+data.data.result[i].level+"</td><td>"+a+"</td><td>"+data.data.result[i].getTime+"</td>" +
                            "<td><a href='##' class='commend_update'>修改</a>&nbsp;  <a href='##' class='commend_delete'>删除</a></td></tr>"
                    }
                    $("#commend-tbody").html(my_table)
                    page = data.data.pageNumber
                    total = data.data.totalPages
                }
            })
        })
        //每页数据量改变
        $("#select_rows").on("change",function(){
            var getYear = $("#commentGetTime").val()
            var level = $("#index_level").val()
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/commend/commendList",
                dataType:"json",
                data:{"pageNum":page,"pageSize":$("#select_rows").val(),"getYear":getYear,"level":level},
                success:function(data){
                    console.log(data)
                    var my_table = "";
                    for(var i = 0;i<data.data.result.length;i++){
                        var a = ""
                        var url = data.data.result[i].url
                        var fileName = data.data.result[i].fileName
                        if(url!=null && fileName!=null){
                            var urls = url.split(",")
                            var fileNames = fileName.split("、")
                            for(var j=0;j<urls.length-1;j++){
                                if(j<urls.length-2){
                                    a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download='' >"+fileNames[j]+"</a>、"
                                }else{
                                    a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' download=''>"+fileNames[j]+"</a>"
                                }
                            }
                        }
                        my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td><td>"+data.data.result[i].deptName+"</td>" +
                            "<td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].commendName+"</td>" +
                            "<td>"+data.data.result[i].note+"</td><td>"+data.data.result[i].level+"</td><td>"+a+"</td><td>"+data.data.result[i].getTime+"</td>" +
                            "<td><a href='##' class='commend_update'>修改</a>&nbsp;  <a href='##' class='commend_delete'>删除</a></td></tr>"
                    }
                    $("#commend-tbody").html(my_table)
                    page = data.data.pageNumber
                    total = data.data.totalPages
                }
            })
        })
        //点击删除一条数据
        $("#commend-tbody").on("click",".commend_delete",function(){
            var data_id = $(this).parent().parent().attr("data-id")
            //询问框
            layer.confirm('确认删除该条信息？', {
                btn: ['确定','取消'] //按钮,
                ,area: ['300px', '180px']
            },
            function(index){
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/commend/delete/"+data_id,
                    dataType:"json",
                    data:{},
                    success:function(data){
                        if(data.success){
                            layer.close(index);
                            layer.msg(data.message,{icon:1,time:2000},function(){});
                            $("#commend-tbody").find("tr[data-id="+data_id+"]").remove();
                        }else{
                            layer.close(index);
                            layer.msg(data.message,{icon:2,time:2000},function(){})
                        }
                    }
                })
            },function(index){
                layer.close(index);
            })
        })
        //点击修改
        $("#commend-tbody").on("click",".commend_update",function(){
            var data_id = $(this).parent().parent().attr("data-id")
            var tds = $(this).parent().parent().find("td")
            var name = $(tds[0]).html()
            $(".bigContent").load("toUpdateCommend/"+data_id+"/"+name)
        })
        // 获取年度下拉框
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/commend/year",
            success:function(data){
                console.log(data)
                if(data.success){
                    var value="<option value=''>全部</option>";
                    for(var i = 0;i<data.data.length;i++){
                        value+="<option value='"+data.data[i]+"'>"+data.data[i]+"年度</option>"
                    }
                    $("#commentGetTime").html(value)
                }
            }
        })
        //点击新增按钮
        $(".j_add_commend").on("click",function(){
            $(".bigContent").load("toAddCommend")
        })
    })
</script>
</body>
</html>
