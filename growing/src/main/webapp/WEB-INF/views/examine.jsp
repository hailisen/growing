<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>考核管理</title>
    <meta name="description" content="这是一个 index 页面">
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
        #header{
            padding-top: 15px;
            position: relative;
        }
        /*标题前的小图片 类 每个页面都有的*/
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
        }
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
            width: 110px;
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
        .after-manage{/*第二个和第三个字体*/
            margin-left: 20px;
        }
        .row-content {
            padding: 5px;
        }
        .examine-tongji{
            float: right;
        }
        .examine_no{
            margin-right: 25px;
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
                <li class="sidebar-nav-heading">欢迎您，<span class="sidebar-nav-heading-info">${employee.name}</span></li>
                <li class="sidebar-nav-link">
                    <a href="/growing/toIndex">
                        <i class="am-icon-male sidebar-nav-link-logo"></i> 人事管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/growing/examines" class="active">
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
                    <a href="/growing/settings">
                        <i class="am-icon-gears sidebar-nav-link-logo"></i> 系统管理
                    </a>
                </li>
            </ul>
        </div>
        <!-- 内容区域 -->
        <div class="tpl-content-wrapper baseDiv">
            <%--查询导航--%>
            <div class="" id="header">
                <div>
                    <div class="title_pic"></div>
                    <span class="all-text title">年度考核</span>
                </div>
                <div class="ul-div">
                    <ul>
                        <li class="ul-li select-li-font">
                            <span class="select-name">年度</span>
                            <select id="examine_year" class="year_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">考核结果</span>
                            <select id="examine_result" class="post_value">
                                <option value="">全部</option>
                                <option value="0">优秀</option>
                                <option value="1">合格</option>
                                <option value="2">基本合格</option>
                                <option value="3">不合格</option>
                            </select>
                        </li>
                    </ul>
                    <input type="button" value="查询" class="select-btn jselect-btn-examine">
                </div>
            </div>
            <%--表格数据--%>
            <div class="row-content am-cf">
                <%--提示信息--%>
                <div class="manage-text">
                    <a href="##" class="first-manage j_excel_out_index">导出列表</a>
                    <a href="##" class="after-manage j_add-examine">新增年度考核</a>
                    <a href="##" class="after-manage j_examine_totle">考核统计</a>
                    <span style="font-size: 14px" class="after-manage examine-tongji examine_no">不合格：<lable class="noNum">0</lable>人</span>
                    <span style="font-size: 14px" class="after-manage examine-tongji examine_genera">基本合格：<lable class="generalNum">0</lable>人</span>
                    <span style="font-size: 14px" class="after-manage examine-tongji examine_hege">合格：<lable class="hegeNum">0</lable>人</span>
                    <span style="font-size: 14px" class="after-manage examine-tongji examine_youxiu">优秀：<lable class="goodNum">0</lable>人</span>
                    <span style="font-size: 14px" class="after-manage examine-tongji examine_totle">总人数：<lable class="totalNum">0</lable>人</span>
                </div>
                <%--表格数据--%>
                <table class="layui-table" lay-skin="line" id="table_search" style="margin: 15px auto;">
                    <colgroup>
                        <col width="100">
                        <col width="150">
                        <col width="230">
                        <col width="180">
                        <col width="180">
                        <col width="180">
                        <col width="180">
                        <col width="180">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>
                            <label class="table-all index-check" id="index-check-all">
                                <input type="checkbox" id="check-input-all">
                                <span id="check-text-all">全选</span>
                            </label>
                        </th>
                        <th>姓名</th>
                        <th>手机号</th>
                        <th>部门</th>
                        <th>岗位</th>
                        <th>考核年度</th>
                        <th>考核结果</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="examine-tbody" class="box_neirong_all">

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
    <script src="js/jquery.webui-popover.js"></script>
    <script>
        $(function(){
            // 人数统计
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/examine/getCount",
                success:function(data){
                    console.log(data)
                    if(data.success){
                        $(".noNum").html(data.data.unqualified);
                        $(".generalNum").html(data.data.passMuster);
                        $(".hegeNum").html(data.data.qualified);
                        $(".goodNum").html(data.data.excellent);
                        $(".totalNum").html(data.data.count);
                    }
                }
            })
            //点击查看个人信息
            $("#myInfo").on("click",function(){
                $(".baseDiv").load("toMyInfo")
            })
            //点击新增按钮
            $(".j_add-examine").click(function(){
                $(".baseDiv").load("toAddExamine");
            })
            $(".j_examine_totle").on("click",function(){
                $(".baseDiv").load("toCount");
            })
            var page=1;
            var total=0;//总页数
            var year = $("#examine_year").val()
            var result = $("#examine_result").val()
            var tableBody = "";
            //点击修改
            var examineId = 0;
            $("#examine-tbody").on("click",".j-update-examine",function(){
                $(".j-update-examine").webuiPopover({width:138,height:141,animation:'pop'})
                examineId=$(this).parent().parent().attr("data-id")
            })
            $("#examine-tbody").delegate(".examine_btna","click",function(){

            })
            var idList = new Array()
            var chooseId = new Array()
            //选中数据
            $("#check-input-all").change(function(){
                if($("#check-input-all").prop("checked")){
                    $("#examine-tbody").find(".index_box").css("display","none")
                    $("#examine-tbody").find(".index_box").prop("checked",true)
                    $("#examine-tbody").find(".index_box").css("display","block")
                    var trs = $("#examine-tbody").find("tr[data-id]")
                    for(var i = 0;i<trs.length;i++){
                        var id = $(trs[i]).attr("data-id")
                        removeIndex(idList,id)
                        chooseId.push(id)
                    }
                }else{
                    $(".index_box").prop("checked",false)
                    var trs = $("#examine-tbody").find("tr[data-id]")
                    for(var i = 0;i<trs.length;i++){
                        var id = $(trs[i]).attr("data-id")
                        removeIndex(chooseId,id)
                        idList.push(id)
                    }
                }
            })
            //反选(未选中数据数组)
            $("#examine-tbody").on("change",".index_box",function(){
                var id = $(this).parent().parent().attr("data-id")
                if(!$(this).prop("checked")){//取消选中时，把条ID放入数组中
                    idList.push(id)
                    removeIndex(chooseId,id)
                }else{//如果是选中状态，则把该ID从数组中移除
                    chooseId.push(id)
                    removeIndex(idList,id);//获取id在数组中的下标，并删除该下标的元素
                }
            })
            //导出Excel表格
            $(".j_excel_out_index").click(function(){
                //是否全选
                if($("#check-input-all").prop("checked")){//全选，把未选择的ID数组传入
                    $(".j_excel_out_index").attr("href","${pageContext.request.contextPath}/examine/excleout?notChoose="+idList)
                    document.getElementsByClassName("j_excel_out_index").onclick();
                }else{//非全选，选择列表传给接口
                    var checkeds = $("#box_neirong_index").find("input[type=checkbox]:checked")
                    if(chooseId.length<=0 && checkeds.length<=0){
                        layui.use(['layer'], function(){
                            layer.msg(
                                '请选择导出数据',
                                {icon: 2, time: 2000}, //2秒关闭（如果不配置，默认是3秒）
                                function(){
                                });
                        })
                        return;
                    }
                    $(".j_excel_out_index").attr("href","${pageContext.request.contextPath}/examine/excleout?chooseId="+chooseId)
                    // document.getElementsByClassName("j_excel_out_index").onclick();
                }
            })

            //第一次加载考核列表
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/examine/examinelist",
                dytaType:"json",
                data:{"pageNumber":page,"pageSize":$("#select_rows").val()},
                success:function(data){
                    var my_table=""
                    if(data.success){
                        for(var i = 0;i<data.data.result.length;i++){
                            var result = data.data.result[i].result
                            if(result==0){
                                result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>优秀</td>"
                            }else if(result==1){
                                result="<td style='background-color: #f2f2f2'>合格</td>"
                            }else if(result==2){
                                result="<td style='background-color: #f2f2f2'>基本合格</td>"
                            }else if(result==3){
                                result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>不合格</td>"
                            }
                            var div="<div class='webui-popover-content'>" +
                                "<input type='radio' value='0' name='result' checked=true>优秀</input><br/>" +
                                "<input type='radio' value='1' name='result' style='margin-top: 8px'>合格</input><br/>" +
                                "<input type='radio' value='2' name='result' style='margin-top: 8px'>基本合格</input><br/>" +
                                "<input type='radio' value='3' name='result' style='margin-top: 8px'>不合格</input><br/>" +
                                "<input type='button' value='确认' class='examine_btna' onclick='update("+data.data.result[i].id+")' style='margin-top: 8px; float: right;'/>" +
                                "</div>"
                            my_table+="<tr data-id='"+data.data.result[i].id+"'>" +
                                "<td><input type='checkbox' class='index_box'></td><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                                "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].year+"年度</td>" + result+
                                "<td><a href='###' class='j-update-examine'>修改状态</a>"+div+"</td></tr>"
                        }
                    }
                    total = data.data.totalPages;
                    page = data.data.pageNumber
                    $("#examine-tbody").html(my_table)
                }
            })
            //点击查询按钮
            $(".jselect-btn-examine").on("click",function(){
                var year = $("#examine_year").val()
                var result = $("#examine_result").val()
                var my_table=""
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/examine/examinelist",
                    dataType:"json",
                    data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"year":year,"result":result},
                    success:function(data){
                        if(data.success){
                            for(var i = 0;i<data.data.result.length;i++){
                                var result = data.data.result[i].result
                                if(result==0){
                                    result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>优秀</td>"
                                }else if(result==1){
                                    result="<td style='background-color: #f2f2f2'>合格</td>"
                                }else if(result==2){
                                    result="<td style='background-color: #f2f2f2'>基本合格</td>"
                                }else if(result==3){
                                    result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>不合格</td>"
                                }
                                var div="<div class='webui-popover-content'>" +
                                    "<input type='radio' value='0' name='result' checked=true>优秀</input><br/>" +
                                    "<input type='radio' value='1' name='result' style='margin-top: 8px'>合格</input><br/>" +
                                    "<input type='radio' value='2' name='result' style='margin-top: 8px'>基本合格</input><br/>" +
                                    "<input type='radio' value='3' name='result' style='margin-top: 8px'>不合格</input><br/>" +
                                    "<input type='button' value='确认' class='examine_btna' onclick='update("+data.data.result[i].id+")' style='margin-top: 8px; float: right;'/>" +
                                    "</div>"
                                var checkbox = ""
                                if($("#check-input-all").prop("checked")){//全选，判断idList中被取消的checkbox
                                    var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                                    for(var j=0; j<idList.length;j++){
                                        if(idList[j]==data.data.result[i].id){
                                            b = true;
                                        }
                                    }
                                    if(b){
                                        checkbox="<input type='checkbox' class='index_box'>"
                                    }else{
                                        checkbox="<input type='checkbox' class='index_box' checked='checked'>"
                                    }
                                }else{//没有全选,判断chooseId中选取的checkbox,加入到
                                    var b = false;
                                    for(var j=0; j<chooseId.length;j++){
                                        if(chooseId[j]==data.data.result[i].id){
                                            b = true;
                                        }
                                    }
                                    if(b){
                                        checkbox="<input type='checkbox' class='index_box' checked='checked'>"
                                    }else{
                                        checkbox="<input type='checkbox' class='index_box'>"
                                    }
                                }
                                my_table+="<tr data-id='"+data.data.result[i].id+"'>" +
                                    "<td>"+checkbox+"</td><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                                    "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].year+"年度</td>" + result+
                                    "<td><a href='###' class='j-update-examine'>修改状态</a>"+div+"</td></tr>"
                            }
                            total = data.data.totalPages;
                            page = data.data.pageNumber;
                            $("#examine-tbody").html(my_table)
                        }else{
                            page = page;
                            $("#examine-tbody").html("")
                            layui.use(['layer', 'form'], function(){
                                layer.msg(
                                    '无数据',
                                    {icon: 2, time: 2000}, //2秒关闭（如果不配置，默认是3秒）
                                    function(){
                                    });
                            })
                        }
                    }
                })
            })
            //点击上一页
            $("#page_up").on("click",function(){
                var year = $("#examine_year").val()
                var result = $("#examine_result").val()
                var my_table = '';
                if(page>1){
                    page = page-1;
                    $.ajax({
                        type:'POST',
                        url:"${pageContext.request.contextPath}/examine/examinelist",
                        dataType:"json",
                        data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"year":year,"result":result},
                        success:function(data){
                            for(var i = 0;i<data.data.result.length;i++){
                                var result = data.data.result[i].result
                                if(result==0){
                                    result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>优秀</td>"
                                }else if(result==1){
                                    result="<td style='background-color: #f2f2f2'>合格</td>"
                                }else if(result==2){
                                    result="<td style='background-color: #f2f2f2'>基本合格</td>"
                                }else if(result==3){
                                    result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>不合格</td>"
                                }
                                var div="<div class='webui-popover-content'>" +
                                    "<input type='radio' value='0' name='result' checked=true>优秀</input><br/>" +
                                    "<input type='radio' value='1' name='result' style='margin-top: 8px'>合格</input><br/>" +
                                    "<input type='radio' value='2' name='result' style='margin-top: 8px'>基本合格</input><br/>" +
                                    "<input type='radio' value='3' name='result' style='margin-top: 8px'>不合格</input><br/>" +
                                    "<input type='button' value='确认' class='examine_btna' onclick='update("+data.data.result[i].id+")' style='margin-top: 8px; float: right;'/>" +
                                    "</div>"
                                var checkbox = ""
                                if($("#check-input-all").prop("checked")){//全选，判断idList中被取消的checkbox
                                    var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                                    for(var j=0; j<idList.length;j++){
                                        if(idList[j]==data.data.result[i].id){
                                            b = true;
                                        }
                                    }
                                    if(b){
                                        checkbox="<input type='checkbox' class='index_box'>"
                                    }else{
                                        checkbox="<input type='checkbox' class='index_box' checked='checked'>"
                                    }
                                }else{//没有全选,判断chooseId中选取的checkbox,加入到
                                    var b = false;
                                    for(var j=0; j<chooseId.length;j++){
                                        if(chooseId[j]==data.data.result[i].id){
                                            b = true;
                                        }
                                    }
                                    if(b){
                                        checkbox="<input type='checkbox' class='index_box' checked='checked'>"
                                    }else{
                                        checkbox="<input type='checkbox' class='index_box'>"
                                    }
                                }
                                my_table+="<tr data-id='"+data.data.result[i].id+"'>" +
                                    "<td>"+checkbox+"</td><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                                    "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].year+"年度</td>" + result+
                                    "<td><a href='###' class='j-update-examine'>修改状态</a>"+div+"</td></tr>"
                            }
                            total = data.data.totalPages;
                            page = data.data.pageNumber;
                            $("#examine-tbody").html(my_table)
                        }
                    })
                }else{
                    page=1;
                }
            })
            //点击下一页
            $("#page_down").on("click",function(){
                var my_table="";
                var year = $("#examine_year").val()
                var result = $("#examine_result").val()
                if(page<total){
                    page = page+1
                    $.ajax({
                        type:'POST',
                        url:'${pageContext.request.contextPath}/examine/examinelist',
                        dataType:"json",
                        data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"year":year,"result":result},
                        success:function(data){
                            for(var i = 0;i<data.data.result.length;i++){
                                var result = data.data.result[i].result
                                if(result==0){
                                    result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>优秀</td>"
                                }else if(result==1){
                                    result="<td style='background-color: #f2f2f2'>合格</td>"
                                }else if(result==2){
                                    result="<td style='background-color: #f2f2f2'>基本合格</td>"
                                }else if(result==3){
                                    result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>不合格</td>"
                                }
                                var div="<div class='webui-popover-content'>" +
                                    "<input type='radio' value='0' name='result' checked=true>优秀</input><br/>" +
                                    "<input type='radio' value='1' name='result' style='margin-top: 8px'>合格</input><br/>" +
                                    "<input type='radio' value='2' name='result' style='margin-top: 8px'>基本合格</input><br/>" +
                                    "<input type='radio' value='3' name='result' style='margin-top: 8px'>不合格</input><br/>" +
                                    "<input type='button' value='确认' class='examine_btna' onclick='update("+data.data.result[i].id+")' style='margin-top: 8px; float: right;'/>" +
                                    "</div>"
                                var checkbox = ""
                                if($("#check-input-all").prop("checked")){//全选，判断idList中被取消的checkbox
                                    var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                                    for(var j=0; j<idList.length;j++){
                                        if(idList[j]==data.data.result[i].id){
                                            b = true;
                                        }
                                    }
                                    if(b){
                                        checkbox="<input type='checkbox' class='index_box'>"
                                    }else{
                                        checkbox="<input type='checkbox' class='index_box' checked='checked'>"
                                    }
                                }else{//没有全选,判断chooseId中选取的checkbox,加入到
                                    var b = false;
                                    for(var j=0; j<chooseId.length;j++){
                                        if(chooseId[j]==data.data.result[i].id){
                                            b = true;
                                        }
                                    }
                                    if(b){
                                        checkbox="<input type='checkbox' class='index_box' checked='checked'>"
                                    }else{
                                        checkbox="<input type='checkbox' class='index_box'>"
                                    }
                                }
                                my_table+="<tr data-id='"+data.data.result[i].id+"'>" +
                                    "<td>"+checkbox+"</td><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                                    "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].year+"年度</td>" + result+
                                    "<td><a href='###' class='j-update-examine'>修改状态</a><div class='webui-popover-content'>"+
                                "<input type='radio' value='0' name='result' checked=true>优秀</input><br/>" +
                                "<input type='radio' value='1' name='result' style='margin-top: 8px'>合格</input><br/>" +
                                "<input type='radio' value='2' name='result' style='margin-top: 8px'>基本合格</input><br/>" +
                                "<input type='radio' value='3' name='result' style='margin-top: 8px'>不合格</input><br/>" +
                                "<input type='button' value='确认' class='examine_btna' onclick='update("+data.data.result[i].id+")' style='margin-top: 8px; float: right;'/>" +
                                "</div>"+"</td></tr>"
                            }
                            total = data.data.totalPages;
                            page = data.data.pageNumber;
                            $("#examine-tbody").html(my_table)
                        }
                    })
                }else{
                    page=total
                }
            })
            //页数改变
            $("#select_rows").on("change",function(){
                var year = $("#examine_year").val()
                var result = $("#examine_result").val()
                var my_table = '';
                $.ajax({
                    type:'POST',
                    url:'${pageContext.request.contextPath}/examine/examinelist',
                    dataType:"json",
                    data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"year":year,"result":result},
                    success:function(data){
                        for(var i = 0;i<data.data.result.length;i++){
                            var result = data.data.result[i].result
                            if(result==0){
                                result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>优秀</td>"
                            }else if(result==1){
                                result="<td style='background-color: #f2f2f2'>合格</td>"
                            }else if(result==2){
                                result="<td style='background-color: #f2f2f2'>基本合格</td>"
                            }else if(result==3){
                                result="<td style='background-color: #e3e3e3;border-bottom-color: #cbcbcb'>不合格</td>"
                            }
                            var div="<div class='webui-popover-content'>" +
                                "<input type='radio' value='0' name='result' checked=true>优秀</input><br/>" +
                                "<input type='radio' value='1' name='result' style='margin-top: 8px'>合格</input><br/>" +
                                "<input type='radio' value='2' name='result' style='margin-top: 8px'>基本合格</input><br/>" +
                                "<input type='radio' value='3' name='result' style='margin-top: 8px'>不合格</input><br/>" +
                                "<input type='button' value='确认' class='examine_btna' onclick='update("+data.data.result[i].id+")' style='margin-top: 8px; float: right;'/>" +
                                "</div>"
                            var checkbox = ""
                            if($("#check-input-all").prop("checked")){//全选，判断idList中被取消的checkbox
                                var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                                for(var j=0; j<idList.length;j++){
                                    if(idList[j]==data.data.result[i].id){
                                        b = true;
                                    }
                                }
                                if(b){
                                    checkbox="<input type='checkbox' class='index_box'>"
                                }else{
                                    checkbox="<input type='checkbox' class='index_box' checked='checked'>"
                                }
                            }else{//没有全选,判断chooseId中选取的checkbox,加入到
                                var b = false;
                                for(var j=0; j<chooseId.length;j++){
                                    if(chooseId[j]==data.data.result[i].id){
                                        b = true;
                                    }
                                }
                                if(b){
                                    checkbox="<input type='checkbox' class='index_box' checked='checked'>"
                                }else{
                                    checkbox="<input type='checkbox' class='index_box'>"
                                }
                            }
                            my_table+="<tr data-id='"+data.data.result[i].id+"'>" +
                                "<td>"+checkbox+"</td><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                                "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].year+"年度</td>" + result+
                                "<td><a href='###' class='j-update-examine'>修改状态</a><div class='webui-popover-content'>"+
                                "<input type='radio' value='0' name='result' checked=true>优秀</input><br/>" +
                                "<input type='radio' value='1' name='result' style='margin-top: 8px'>合格</input><br/>" +
                                "<input type='radio' value='2' name='result' style='margin-top: 8px'>基本合格</input><br/>" +
                                "<input type='radio' value='3' name='result' style='margin-top: 8px'>不合格</input><br/>" +
                                "<input type='button' value='确认' class='examine_btna' onclick='update("+data.data.result[i].id+")' style='margin-top: 8px; float: right;'/>" +
                                "</div>"+"</td></tr>"
                        }
                        total = data.data.totalPages;
                        page = data.data.pageNumber;
                        $("#examine-tbody").html(my_table)
                    }
                })
            })
            //加载年度下拉列表
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/examine/getYear",
                dataType:"json",
                data:{},
                success:function(data){
                    var value="<option value=''>全部</option>"
                    for(var i=0;i<data.data.length;i++){
                        value+="<option value='"+data.data[i]+"'>"+data.data[i]+"年度</option>"
                    }
                    $("#examine_year").html(value)
                }
            })
            //Enter键查询
            document.onkeydown=function(even){
                if(even.keyCode==13){
                    $(".jselect-btn-index").click()
                    $(".jselect-btn-agreement").click()
                    $(".jselect-btn-position").click()
                }
            }
            //退出按钮
            $(".am-text-sm").click(function(){
                window.location.href="toLogin";
            })
        })
        function update(id){
            var result = $("input[name='result']:checked").val()
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/teacher/updateExamine",
                dataType:"json",
                data:{"result":result,"id":id},
                success:function(data){
                    if(data.success){
                        var tds = $("#examine-tbody").find("tr[data-id="+id+"]").children("td")
                        var r = "";
                        if(result==0){
                            r = "优秀";
                            $(tds[6]).css("background-color","#e3e3e3");
                        }else if(result==1){
                            $(tds[6]).css("background-color","#f2f2f2");
                            r = "合格";
                        }else if(result==2){
                            $(tds[6]).css("background-color","#f2f2f2");
                            r = "基本合格";
                        }else{
                            $(tds[6]).css("background-color","#e3e3e3");
                            r = "不合格";
                        }
                        $(tds[6]).html(r)
                    }
                }
            })
        }
    </script>
</body>
</html>
