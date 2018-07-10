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
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="plugins/layui/css/layui.css"/>
    <script src="js/jquery.min.js"></script>
    <style type="text/css">
        .tpl-content-wrapper {
            min-height: 800px;
        }
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
            width: 100px;
            height: 26px;
            margin-left: 10px;
        }
        /*输入框样式*/
        .index-input{
            float: none;
            height: 28px;
            font-size: 14px;
            margin-left: 30px;
            border-radius:4px
        }
        .select-btn{
            font-size: 14px;
            height: 28px;
            width: 80px;
            margin-left: 36px;
            border-radius:10px
        }
        .table-all{
            font-size: 11px;
        }
        .index-check{
            position: relative;
            width: 70px;
        }
        #check-input{
            margin-top: 8px;
            float: left;
        }
        #check-text{
            position: absolute;
            margin-left: 3px;
            margin-top: 3px;
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
            margin-left: 5px;
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
        }
        .select_page_box_right a{
            height:30px;
            float:left;
            padding:0 10px;
            line-height:30px;
            border:1px solid #ccc;
            display:block;
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
        #table_agreement_search td{
            border-right: 1px #e6e6e6 solid ;
            font-size: 13px;
            color: #555555;
        }
        #table_agreement_search th{
            border-right: 1px #e6e6e6 solid ;
            font-size: 13px;
            font-weight: bold;
            color: #555555;
        }
        #table_position_search td{
            border-right: 1px #e6e6e6 solid ;
            font-size: 13px;
            color: #555555;
        }
        #table_position_search th{
            border-right: 1px #e6e6e6 solid ;
            font-size: 13px;
            font-weight: bold;
            color: #555555;
        }
        /*表格上面的操作字体*/
        .manage-text a{
            font-size: 14px;
            color: #3ea0fb;
        }
       .first-manage{ /*第一个字体*/
            margin-left: 10px;
        }
       .after-manage{/*第二个和第三个字体*/
           margin-left: 35px;
       }
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
    </style>
</head>
<body data-type="index">
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
                        <li class="am-text-sm" id="anniu">
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
                    <a href="/growing/toIndex" class="active">
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
                    <a href="/growing/settings">
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
        <%--人事管理列表页面--%>
        <div class="tpl-content-wrapper bigContent" id="indexContext">
            <%--查询导航--%>
            <div class="" id="header">
                <div>
                    <div class="title_pic"></div>
                    <span class="all-text title">人事管理</span>
                </div>
                <div class="ul-div">
                    <ul>
                        <li class="ul-li select-li-font">
                            <span class="select-name">部门</span>
                            <select id="index_deptId" class="dept_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">岗位</span>
                            <select id="index_postId" class="post_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">职称</span>
                            <select id="index_positionId" class="position_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font hide-li">
                            <span class="select-name">性质</span>
                            <select id="index_nature">
                                <option value="">全部</option>
                                <option value="0">在编</option>
                                <option value="1">人事代理</option>
                                <option value="2">非人事代理</option>
                                <option value="3">退休返聘</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">学历</span>
                            <select id="index_eduBackground">
                                <option value="">全部</option>
                                <option value="初中">初中</option>
                                <option value="高中">高中</option>
                                <option value="中专">中专</option>
                                <option value="大专">大专</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font hide-li">
                            <span class="select-name">状态</span>
                            <select name="" id="index_state">
                                <option value="">全部</option>
                                <option value="1">在职</option>
                                <option value="0">离职</option>
                                <option value="2">退休</option>
                                <option value="3">返聘</option>
                            </select>
                        </li>
                    </ul>
                </div>
                <div>
                    <span>
                        <input type="text" value="" id="index-input-all" class="index-input" placeholder="请输入姓名或手机号"/>
                    </span>
                    <input type="button" value="查询" class="select-btn jselect-btn-index">
                </div>
            </div>
            <%--表格数据--%>
            <div class="row-content am-cf">
                <%--提示信息--%>
                <div class="manage-text">
                    <a href="##" class="first-manage jAddEmployee">新增人员</a>
                    <a href="##" class="after-manage j_excel_out_index ">导出信息</a>
                    <a href="##" class="after-manage j_excel_in">导入信息</a>
                    <a href="##" class="after-manage a-agreement">有<lable class="agreement"></lable>人协议即将到期</a>
                    <a href="##" class="after-manage a-positionUp">有<lable class="positionUp"></lable>人具备职称晋升条件</a>
                    <span style="font-size: 14px" class="after-manage">总人数：<lable class="totalNum">0</lable>人</span>
                </div>
                <%--表格数据--%>
                <table class="layui-table" lay-skin="line" id="table_search">
                    <colgroup>
                        <col width="70">
                        <col width="100">
                        <col width="60">
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
                        <th>性别</th>
                        <th>手机号</th>
                        <th>部门</th>
                        <th>岗位</th>
                        <th>职称</th>
                        <th>学历</th>
                        <th>籍贯</th>
                        <th>性质</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="box_neirong_index" class="box_neirong_all">

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
        <%--查询协议状态列表--%>
        <div class="tpl-content-wrapper bigContent" id="agreementContext">
            <%--查询导航--%>
            <div class="" id="header">
                <div>
                    <div class="title_pic"></div>
                    <span class="all-text title">人事管理</span>
                </div>
                <div class="ul-div">
                    <ul>
                        <li class="ul-li select-li-font">
                            <span class="select-name">部门</span>
                            <select id="agreement_deptId"  class="dept_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">岗位</span>
                            <select id="agreement_postId" class="post_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">学历</span>
                            <select id="agreement_eduBackground">
                                <option value="">全部</option>
                                <option value="初中">初中</option>
                                <option value="高中">高中</option>
                                <option value="中专">中专</option>
                                <option value="大专">大专</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font hide-li">
                            <span class="select-name">性质</span>
                            <select id="agreement_nature">
                                <option value="">全部</option>
                                <option value="0">在编</option>
                                <option value="1">人事代理</option>
                                <option value="2">非人事代理</option>
                                <option value="3">退休返聘</option>
                            </select>
                        </li>
                    </ul>
                </div>
                <div>
                    <span>
                        <input type="text" value="" id="index-input-agreement" class="index-input" placeholder="请输入姓名或手机号"  />
                    </span>
                    <input type="button" value="查询" class="select-btn jselect-btn-agreement">
                </div>
            </div>
            <%--表格数据--%>
            <div class="row-content am-cf">
                <%--提示信息--%>
                <div class="manage-text">
                    <a href="##" class="first-manage jAddEmployee">新增人员</a>
                    <a href="##" class="after-manage j_excel_out_agreement">导出信息</a>
                    <a href="##" class="after-manage j_excel_in">导入信息</a>
                    <a href="##" class="after-manage a-agreement">有<lable class="agreement"></lable>人协议即将到期</a>
                    <a href="##" class="after-manage a-positionUp">有<lable class="positionUp"></lable>人具备职称晋升条件</a>
                    <span style="font-size: 14px" class="after-manage">总人数：<lable class="totalNum">0</lable>人</span>
                </div>
                <%--表格数据--%>
                <table class="layui-table" lay-skin="line" id="table_agreement_search">
                    <colgroup>
                        <col width="70">
                        <col width="100">
                        <col width="60">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>
                                <label class="table-all index-check" id="index-check-agreement">
                                    <input type="checkbox" id="check-input-agreement">
                                    <span id="check-text-agreement">全选</span>
                                </label>
                            </th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>手机号</th>
                            <th>部门</th>
                            <th>岗位</th>
                            <th>协议名称</th>
                            <th>协议到期时间</th>
                            <th>学历</th>
                            <th>性质</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody id="box_neirong_agreement" class="box_neirong_all">

                    </tbody>
                </table>
                <%--分页相关--%>
                <div class="select_page_number">
                    <div class="select_page_box">
                        <span>每页显示</span>
                        <select name="rows" id="select_rows_agreement">
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                        </select>
                        <span>条</span>
                    </div>
                    <div class="select_page_box_right">
                        <a id="page_up_agreement">上一页</a>
                        <a id="page_down_agreement">下一页</a>
                    </div>
                </div>
            </div>
        </div>
        <%--查询职称晋升列表--%>
        <div class="tpl-content-wrapper bigContent" id="positionContext">
            <%--查询导航--%>
            <div class="" id="header">
                <div>
                    <div class="title_pic"></div>
                    <span class="all-text title">人事管理</span>
                </div>
                <div class="ul-div">
                    <ul>
                        <li class="ul-li select-li-font">
                            <span class="select-name">部门</span>
                            <select id="deptId"  class="dept_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">岗位</span>
                            <select id="postId"  class="post_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">职称</span>
                            <select id="positionId" class="position_value">
                                <option value="">全部</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font hide-li">
                            <span class="select-name">性质</span>
                            <select id="nature">
                                <option value="">全部</option>
                                <option value="0">在编</option>
                                <option value="1">人事代理</option>
                                <option value="2">非人事代理</option>
                                <option value="3">退休返聘</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font">
                            <span class="select-name">学历</span>
                            <select id="eduBackground">
                                <option value="">全部</option>
                                <option value="初中">初中</option>
                                <option value="高中">高中</option>
                                <option value="中专">中专</option>
                                <option value="大专">大专</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>
                        </li>
                        <li class="ul-li ul-li1 select-li-font hide-li">
                            <span class="select-name">状态</span>
                            <select name="" id="state">
                                <option value="">全部</option>
                                <option value="1">在职</option>
                                <option value="0">离职</option>
                                <option value="2">退休</option>
                                <option value="3">返聘</option>
                            </select>
                        </li>
                    </ul>
                </div>
                <div>
                    <span>
                        <input type="text" value="" id="index-input-position" class="index-input" placeholder="请输入姓名或手机号"  />
                    </span>
                    <input type="button" value="查询" class="select-btn jselect-btn-position">
                </div>
            </div>
            <%--表格数据--%>
            <div class="row-content am-cf">
                <%--提示信息--%>
                <div class="manage-text">
                    <a href="##" class="first-manage jAddEmployee">新增人员</a>
                    <a href="##" class="after-manage j_excel_out_position">导出信息</a>
                    <a href="##" class="after-manage j_excel_in">导入信息</a>
                    <a href="##" class="after-manage a-agreement">有<lable class="agreement"></lable>人协议即将到期</a>
                    <a href="##" class="after-manage a-positionUp">有<lable class="positionUp"></lable>人具备职称晋升条件</a>
                    <span style="font-size: 14px" class="after-manage">总人数：<lable class="totalNum">0</lable>人</span>
                </div>
                <%--表格数据--%>
                <table class="layui-table" lay-skin="line" id="table_position_search">
                    <colgroup>
                        <col width="70">
                        <col width="100">
                        <col width="60">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>
                            <label class="table-all index-check" id="index-check-position">
                                <input type="checkbox" id="check-input-position">
                                <span id="check-text">全选</span>
                            </label>
                        </th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>手机号</th>
                        <th>部门</th>
                        <th>岗位</th>
                        <th>职称</th>
                        <th>学历</th>
                        <th>籍贯</th>
                        <th>性质</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="box_neirong_position" class="box_neirong_all">

                    </tbody>
                </table>
                <%--分页相关--%>
                <div class="select_page_number">
                    <div class="select_page_box">
                        <span>每页显示</span>
                        <select name="rows" id="select_rows_position">
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                        </select>
                        <span>条</span>
                    </div>
                    <div class="select_page_box_right">
                        <a id="page_up_position">上一页</a>
                        <a id="page_down_position">下一页</a>
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
    <script src="${pageContext.request.contextPath}/js/index_agreement.js"></script>
    <script src="js/index_positionUp.js"></script>
    <script>
        $(function(){
            $("#agreementContext").hide()
            $("#positionContext").hide()
            var idList = new Array()
            var chooseId = new Array()
            //选中数据
            $("#check-input-all").change(function(){
                if($("#check-input-all").prop("checked")){
                    $("#box_neirong_index").find(".index_box").css("display","none")
                    $("#box_neirong_index").find(".index_box").prop("checked",true)
                    $("#box_neirong_index").find(".index_box").css("display","block")
                    var trs = $("#box_neirong_index").find("tr[data-id]")
                    for(var i = 0;i<trs.length;i++){
                        var id = $(trs[i]).attr("data-id")
                        removeIndex(idList,id)
                        chooseId.push(id)
                    }
                }else{
                    $(".index_box").prop("checked",false)
                    var trs = $("#box_neirong_index").find("tr[data-id]")
                    for(var i = 0;i<trs.length;i++){
                        var id = $(trs[i]).attr("data-id")
                        removeIndex(chooseId,id)
                        idList.push(id)
                    }
                }
            })
            //反选(未选中数据数组)
            $("#box_neirong_index").on("change",".index_box",function(){
                var id = $(this).parent().parent().attr("data-id")
                if(!$(this).prop("checked")){//取消选中时，把条ID放入数组中
                    idList.push(id)
                    removeIndex(chooseId,id)
                }else{//如果是选中状态，则把该ID从数组中移除
                    chooseId.push(id)
                    removeIndex(idList,id);//获取id在数组中的下标，并删除该下标的元素
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
            $("#anniu").click(function(){
                sessionStorage.clear()
                window.location.href="toLogin";
            })
            //点击查看个人信息
            $("#myInfo").on("click",function(){
                $("#indexContext").show()
                $("#agreementContext").hide()
                $("#positionContext").hide()
                $(".bigContent").load("toMyInfo")
            })
            var page=1;
            var total=0;//总页数
            var deptId = $("#index_deptId").val();
            var postId = $("#index_postId").val();
            var positionId = $("#index_positionId").val()
            var nature = $("#index_nature").val()
            var eduBackground = $("#eduBackground").val()
            var state = $("#index_state").val()
            var nameOrPhone = $("#index-input-all").val()
            var tableBody = "";
            //第一次加载
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/employee/list",
                dataType: "json",
                data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"deptId":deptId,"postId":postId,
                    "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                    "state":state,"nameOrPhone":nameOrPhone},
                success:function(data){
                    for(var i=0;i<data.data.result.length;i++){
                        var state=data.data.result[i].status;
                        var nature=data.data.result[i].nature;
                        if(state=="0"){
                            state="离职";
                        }else if("1"){
                            state="在职";
                        }else if("2"){
                            state="退休";
                        }else if("3"){
                            state="返聘";
                        }
                        if(nature=="0"){
                            nature="在编";
                        }else if("1"){
                            nature="人事代理";
                        }else if("2"){
                            nature="非人事代理";
                        }else if("3"){
                            nature="退休返聘";
                        }
                        tableBody+="<tr data-id='"+data.data.result[i].id+"'><td><input type='checkbox' class='index_box'></td>"+
                            "<td>"+data.data.result[i].name+"</td>"+
                            "<td>"+data.data.result[i].sex+"</td>"+
                            "<td>"+data.data.result[i].phone+"</td>"+
                            "<td>"+data.data.result[i].deptName+"</td>"+
                            "<td>"+data.data.result[i].postName+"</td>"+
                            "<td>"+data.data.result[i].positionName+"</td>"+
                            "<td>"+data.data.result[i].eduBackground+"</td>"+
                            "<td>"+data.data.result[i].navitePlace+"</td>"+
                            "<td>"+nature+"</td>"+
                            "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"                    }
                    page = data.data.pageNumber
                    total=data.data.totalPages;
                    $("#box_neirong_index").html(tableBody)
                    $(".totalNum").html(data.data.totalRows)
                }
            })
            //加载协议到期人数和职称晋升人数
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/employee/alter",
                dataType:"json",
                data:{},
                success:function(data){
                    $(".agreement").html(data.data.agreeCount)
                    $(".positionUp").html(data.data.positionCount)
                }
            })
            //点击下一页
            $("#page_down").click(function(){
                var my_table="";
                if(page<total){
                    page=page+1
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/employee/list",
                        dataType: "json",
                        data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"deptId":deptId,"postId":postId,
                            "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                            "state":state,"nameOrPhone":nameOrPhone},
                        success:function(data){
                            for(var i=0;i<data.data.result.length;i++){
                                var state=data.data.result[i].status;
                                var nature=data.data.result[i].nature;
                                if(state=="0"){
                                    state="离职";
                                }else if("1"){
                                    state="在职";
                                }else if("2"){
                                    state="退休";
                                }else if("3"){
                                    state="返聘";
                                }
                                if(nature=="0"){
                                    nature="在编";
                                }else if("1"){
                                    nature="人事代理";
                                }else if("2"){
                                    nature="非人事代理";
                                }else if("3"){
                                    nature="退休返聘";
                                }
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
                                my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                                    "<td>"+data.data.result[i].name+"</td>"+
                                    "<td>"+data.data.result[i].sex+"</td>"+
                                    "<td>"+data.data.result[i].phone+"</td>"+
                                    "<td>"+data.data.result[i].deptName+"</td>"+
                                    "<td>"+data.data.result[i].postName+"</td>"+
                                    "<td>"+data.data.result[i].positionName+"</td>"+
                                    "<td>"+data.data.result[i].eduBackground+"</td>"+
                                    "<td>"+data.data.result[i].navitePlace+"</td>"+
                                    "<td>"+nature+"</td>"+
                                    "<td>"+state+"</td><td><span style='cursor:pointer'><a href='##' class='but-a' style='color:#3ea0fb'>详情</a></span></td>"
                            }
                            page = data.data.pageNumber
                            $("#box_neirong_index").html(my_table)
                        }
                    })
                }
            })
            //点击上一页
            $("#page_up").click(function(){
                var my_table=""
                if(page>1){
                    page=page-1;
                    $.ajax({
                        type:"POST",
                        url:"${pageContext.request.contextPath}/employee/list",
                        dateType:"json",
                        data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"deptId":deptId,"postId":postId,
                            "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                            "state":state,"nameOrPhone":nameOrPhone},
                        success:function(data){
                            for(var i=0;i<data.data.result.length;i++){
                                var state=data.data.result[i].status;
                                var nature=data.data.result[i].nature;
                                if(state=="0"){
                                    state="离职";
                                }else if("1"){
                                    state="在职";
                                }else if("2"){
                                    state="退休";
                                }else if("3"){
                                    state="返聘";
                                }
                                if(nature=="0"){
                                    nature="在编";
                                }else if("1"){
                                    nature="人事代理";
                                }else if("2"){
                                    nature="非人事代理";
                                }else if("3"){
                                    nature="退休返聘";
                                }
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
                                my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                                    "<td>"+data.data.result[i].name+"</td>"+
                                    "<td>"+data.data.result[i].sex+"</td>"+
                                    "<td>"+data.data.result[i].phone+"</td>"+
                                    "<td>"+data.data.result[i].deptName+"</td>"+
                                    "<td>"+data.data.result[i].postName+"</td>"+
                                    "<td>"+data.data.result[i].positionName+"</td>"+
                                    "<td>"+data.data.result[i].eduBackground+"</td>"+
                                    "<td>"+data.data.result[i].navitePlace+"</td>"+
                                    "<td>"+nature+"</td>"+
                                    "<td>"+state+"</td><td><span style='cursor:pointer'><a href='##' class='but-a' style='color:#3ea0fb'>详情</a></span></td>"                            }
                            page = data.data.pageNumber
                            $("#box_neirong_index").html(my_table)
                        }
                    })
                }else{
                    page=1;
                }
            })
            //查询按钮
            $(".jselect-btn-index").click(function(){
                var my_table="";
                var deptId = $("#index_deptId").val();
                var postId = $("#index_postId").val();
                var positionId = $("#index_positionId").val()
                var nature = $("#index_nature").val()
                var eduBackground = $("#index_eduBackground").val()
                var state = $("#index_state").val()
                var nameOrPhone = $("#index-input-all").val()
                var table_header="<colgroup><col width='70'><col width='100'><col width='60'></colgroup><thead>\n" +
                    "<tr><th><label class='table-all' id='index-check-all'><input type='checkbox' id='check-input'><span id='check-text'>全选</span></label></th>\n" +
                    "<th>姓名</th><th>性别</th><th>手机号</th><th>部门</th><th>岗位</th><th>职称</th><th>学历</th><th>籍贯</th><th>性质</th><th>状态</th><th>操作</th></tr>\n" +
                    "</thead><tbody id='box_neirong_index' class='box_neirong_all'></tbody>";
                $("#table_search").html(table_header);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/employee/list",
                    dataType: "json",
                    data:{"pageNumber":1,"pageSize":$("#select_rows").val(),"deptId":deptId,"postId":postId,
                        "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                        "state":state,"nameOrPhone":nameOrPhone},
                    success:function(data){
                        if(data.success){
                            for(var i=0;i<data.data.result.length;i++){
                                var state=data.data.result[i].status;
                                var nature=data.data.result[i].nature;
                                if(state=="0"){
                                    state="离职";
                                }else if("1"){
                                    state="在职";
                                }else if("2"){
                                    state="退休";
                                }else if("3"){
                                    state="返聘";
                                }
                                if(nature=="0"){
                                    nature="在编";
                                }else if("1"){
                                    nature="人事代理";
                                }else if("2"){
                                    nature="非人事代理";
                                }else if("3"){
                                    nature="退休返聘";
                                }
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
                                my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                                    "<td>"+data.data.result[i].name+"</td>"+
                                    "<td>"+data.data.result[i].sex+"</td>"+
                                    "<td>"+data.data.result[i].phone+"</td>"+
                                    "<td>"+data.data.result[i].deptName+"</td>"+
                                    "<td>"+data.data.result[i].postName+"</td>"+
                                    "<td>"+data.data.result[i].positionName+"</td>"+
                                    "<td>"+data.data.result[i].eduBackground+"</td>"+
                                    "<td>"+data.data.result[i].navitePlace+"</td>"+
                                    "<td>"+nature+"</td>"+
                                    "<td>"+state+"</td><td><span style='cursor:pointer'><a href='##' class='but-a' style='color:#3ea0fb'>详情</a></span></td>"
                            }
                            page = data.data.pageNumber
                            total = data.data.totalPages
                            $("#table_search").find("#box_neirong_index").html(my_table)
                            $(".totalNum").html(data.data.totalRows)
                        }else{
                            page = page;
                            $("#box_neirong_index").html("")
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
            });
            //选择条数
            $("#select_rows").change(function(){
                var my_table="";
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/employee/list",
                    dataType:"json",
                    data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"deptId":deptId,"postId":postId,
                    "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                    "state":state,"nameOrPhone":nameOrPhone},
                    success:function(data){
                        for(var i=0;i<data.data.result.length;i++){
                            var state=data.data.result[i].status;
                            var nature=data.data.result[i].nature;
                            if(state=="0"){
                                state="离职";
                            }else if("1"){
                                state="在职";
                            }else if("2"){
                                state="退休";
                            }else if("3"){
                                state="返聘";
                            }
                            if(nature=="0"){
                                nature="在编";
                            }else if("1"){
                                nature="人事代理";
                            }else if("2"){
                                nature="非人事代理";
                            }else if("3"){
                                nature="退休返聘";
                            }
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
                            my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                                "<td>"+data.data.result[i].name+"</td>"+
                                "<td>"+data.data.result[i].sex+"</td>"+
                                "<td>"+data.data.result[i].phone+"</td>"+
                                "<td>"+data.data.result[i].deptName+"</td>"+
                                "<td>"+data.data.result[i].postName+"</td>"+
                                "<td>"+data.data.result[i].positionName+"</td>"+
                                "<td>"+data.data.result[i].eduBackground+"</td>"+
                                "<td>"+data.data.result[i].navitePlace+"</td>"+
                                "<td>"+nature+"</td>"+
                                "<td>"+state+"</td><td><span style='cursor:pointer'><a href='##' class='but-a' style='color:#3ea0fb'>详情</a></span></td>"                        }
                        page = data.data.pageNumber
                        total = data.data.totalPages
                        $("#box_neirong_index").html(my_table)
                    }
                })
            })
            //点击新增按钮
            $(".jAddEmployee").click(function(){
                $(".bigContent").load("toAddEmployee");
            })
            //导入Excel表格
            $(".j_excel_in").click(function(){
                $("#indexContext").show()
                $("#agreementContext").hide()
                $("#positionContext").hide()
                $(".bigContent").load("toInexcel")
            })
            //导出Excel表格
            $(".j_excel_out_index").click(function(){
                //是否全选
                if($("#check-input-all").prop("checked")){//全选，把未选择的ID数组传入
                    $(".j_excel_out_index").attr("href","${pageContext.request.contextPath}/employee/excleout?notChoose="+idList)
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
                    $(".j_excel_out_index").attr("href","${pageContext.request.contextPath}/employee/excleout?chooseId="+chooseId)
                    // document.getElementsByClassName("j_excel_out_index").onclick();
                }
            })
            //加载部门下拉框
            $.ajax({//部门下拉框
                type:"post",
                url:"${pageContext.request.contextPath}/employee/getDept",
                dataType:"json",
                data:{},
                success:function(data){
                    var value = "<option value=''>全部</option>";
                    for(var i=0;i<data.data.length;i++){
                        value+="<option value='"+data.data[i].id+"'>"+data.data[i].deptName+"</option>"
                    }
                    $(".dept_value").html(value);
                }
            })
            //加载岗位下拉框
            $(".dept_value").change(function(){//加载岗位列表
                var deptId = $(this).val()
                if(deptId==""){
                    $(".post_value").html("<option value=''>全部</option>")
                    return;
                }
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/employee/getPost",
                    dataType:"json",
                    data:{"deptId":deptId},
                    success:function(data){
                        var value="<option value=''>全部</option>";
                        if(data.data!=null){
                            for(var i=0;i<data.data.length;i++){
                                value+="<option value='"+data.data[i].id+"'>"+data.data[i].postName+"</option>"
                                $(".post_value").html(value)
                            }
                        }else{
                            layui.use(['layer'], function(){
                                layer.msg(
                                    '当前部门尚未添加岗位',
                                    {icon: 2, time: 2000}, //2秒关闭（如果不配置，默认是3秒）
                                    function(){
                                    });
                            })
                        }
                    }
                })
            })
            //加载职称下拉框
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/employee/getPosition",
                dataType:"json",
                data:{},
                success:function(data){
                    var value = "<option value=''>全部</option>";
                    for(var i=0;i<data.data.length;i++){
                        value+="<option value='"+data.data[i].id+"'>"+data.data[i].positionName+"</option>"
                    }
                    $(".position_value").html(value);
                }
            })
            //点击查看详情
            $("#box_neirong_index").on('click','.but-a',function(){
                var id=$(this).parent().parent().attr("data-id");
                $("#agreementContext").hide()
                $("#positionContext").hide()
                $("#indexContext").load("toTeacher/"+id)
            })
            $("#box_neirong_agreement").on('click','.but-a',function(){
                var id=$(this).parent().parent().attr("data-id");
                $("#indexContext").hide()
                $("#positionContext").hide()
                $("#agreementContext").load("toTeacher/"+id)
            })
            $("#box_neirong_position").on('click','.but-a',function(){
                var id=$(this).parent().parent().attr("data-id");
                $("#indexContext").hide()
                $("#agreementContext").hide()
                $("#positionContext").load("toTeacher/"+id)
            })
        })
        //获取id在数组中的下标，并删除该下标的元素
        function removeIndex(list,id){
            var i = 0;
            for(; i < list.length; i++) {
                if( list[i] == id) {
                    //删除i坐标的元素
                    list.splice(i,1);
                    return i;
                }
            }
            return -1;
        }
    </script>
</body>
</html>
