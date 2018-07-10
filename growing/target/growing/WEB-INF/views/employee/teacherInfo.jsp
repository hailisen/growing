<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>教师详情</title>
    <meta name="description" content="新增人员">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateteacher.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.webui-popover.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <style>
        #countDiv{
            border: 1px #f6fffe solid;
            background-color: #ffffff;
            width: 70%;
            height: auto;
            margin: 35px auto;
            padding-left: 50px;
            padding-right: 20px;
        }

        #baseInfo{
            width: 100%;
            height: auto;
            float: none;
        }
        #header{/*头部*/
            padding-top: 43px;
        }
        .text-style{/*文字样式*/
            font-size: 14px;
        }
        .a-text-style{
            float: right;
            color: #3e92fa;
            font-size: 14px;
            margin-right: 15px;
            cursor: pointer;
        }
        #xinxi{/*人员信息*/
            width: 100%;
            margin-top: 10px;
        }
        #xinxi div{/*人员信息下的三列DIV*/
            float: left;
            width: 33.3%;
        }
        .xinxi-ul{
            width: 100%;
        }
        .xinxi-ul li{
            width: 100%;
        }
        .xinxi-title{
            width: 30%;
            color: #666666;
        }
        .xinxi-value{
            width: 70%;
        }
        .xinxi-text{
            display: block;
            float: left;
            line-height: 30px;
            font-size: 14px;
        }
        .cont-value{/*教师其他信息*/
            width: 100%;
            margin-top: 155px;
        }
        /*人员信息*/
        .title_pic{
            height: 15px;
            width: 4.5px;
            background-color: #949494;
            margin-left: 0px;
        }
        .title{/*标题每个页面都有 */
            font-size: 14px;
            font-weight: bolder;
            margin-left: 8px;
        }
        .addbut{/*新增教师关联信息按钮*/
            color: #363636;
            float: right;
            margin-right: 45px;
            cursor:pointer;
        }
        .table-style{
            margin-left: 20px;
            margin-top: 10px;
        }
        .box_title tr{
            height: 40px;
            border-bottom: 2px #cbcbcb solid;
        }
        .box_neirong_all tr{
            height: 36px;
            border-bottom: 1px #cbcbcb solid;
        }
        .fuJiaXinXiDiv{/*职称评定等信息样式*/
            width: 100%;
            margin-top: 35px;
        }
        #testList{
            display: inline-block;
            width: 80px;
            height: 28px;
            line-height: 28px;
            background-color: #ccc;
            color: #000;
            text-align: left;
            font-size: 12px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }
        #testListcommend{
            display: inline-block;
            width: 80px;
            height: 28px;
            line-height: 28px;
            background-color: #ccc;
            color: #000;
            text-align: left;
            font-size: 12px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }
        #testListAgreement{
            display: inline-block;
            width: 80px;
            height: 28px;
            line-height: 28px;
            background-color: #ccc;
            color: #000;
            text-align: left;
            font-size: 12px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }
        .layui-table tr{
            height: 10px;
        }
        .layui-table td, .layui-table th {
            white-space: nowrap;
            /*white-space: pre-wrap;*/
            position: relative;
            padding: 9px 15px;
            min-height: 10px;
            line-height: 3px;
            font-size: 12px;
        }
        .layui-btn-danger {
            background-color: #ffffff;
        }
        .layui-btn-mini{
            height: 30px;
            white-space: nowrap;
            text-align: left;
            font-size: 12px;
        }
        .demo-delete{
            color: red;
            border: 0px;
        }
        .left-td{
            width: 60px;
        }
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
    </style>
</head>
<body id="teacherInfobody">
    <%--个人简历--%>
    <div id="countDiv">
        <%--人员基本信息--%>
        <div id="baseInfo">
            <div id="header">
                <span style="font-size: 18px;font-weight: bolder" id="xinxi-name">${teacher.name}</span>
                <span style="margin-left: 35px;" class="text-style" id="xinxi-sex">${teacher.sex}</span>
                <span class="a-text-style" style="margin-right: 42px" id="return">返回</span>
                <span class="a-text-style jinfo_out" style="margin-right: 10px">导出员工信息</span>
                <span class="a-text-style" id="update">编辑</span>
            </div>
            <%--三列信息--%>
            <div id="xinxi">
                <div>
                    <ul class="xinxi-ul">
                        <li><span class="xinxi-title xinxi-text">编号</span><span class="xinxi-value xinxi-text" id="xinxi-empNo">${teacher.empNo}</span></li>
                        <li><span class="xinxi-title xinxi-text">身份证号</span><span class="xinxi-value xinxi-text" id="xinxi-persionId">${teacher.persionId}</span></li>
                        <li><span class="xinxi-title xinxi-text">入职日期</span><span class="xinxi-value xinxi-text" id="xinxi-entryDay">${teacher.entryDay}</span></li>
                        <li><span class="xinxi-title xinxi-text">职称</span><span class="xinxi-value xinxi-text">${requestScope.positionName}</span></li>
                    </ul>
                </div>
                <div>
                    <ul class="xinxi-ul">
                        <li><span class="xinxi-title xinxi-text">出生年月</span><span class="xinxi-value xinxi-text" id="xinxi-brithday">${teacher.brithday }</span></li>
                        <li><span class="xinxi-title xinxi-text">籍贯</span><span class="xinxi-value xinxi-text" id="xinxi-navitePlace">${teacher.navitePlace}</span></li>
                        <li><span class="xinxi-title xinxi-text">部门</span><span class="xinxi-value xinxi-text">${teacher.deptName}</span></li>
                        <li><span class="xinxi-title xinxi-text">性质</span><span class="xinxi-value xinxi-text">
                            <c:choose>
                                <c:when test="${teacher.nature==0}">
                                    在编
                                </c:when>
                                <c:when test="${teacher.nature==1}">
                                    人事代理
                                </c:when>
                                <c:when test="${teacher.nature==2}">
                                    非人事代理
                                </c:when>
                                <c:otherwise>
                                    退休返聘
                                </c:otherwise>
                            </c:choose>
                        </span></li>
                    </ul>
                </div>
                <div>
                    <ul class="xinxi-ul">
                        <li><span class="xinxi-title xinxi-text">手机号码</span><span class="xinxi-value xinxi-text" id="xinxi-phone">${teacher.phone}</span></li>
                        <li><span class="xinxi-title xinxi-text">学历</span><span class="xinxi-value xinxi-text">${teacher.eduBackground}</span></li>
                        <li><span class="xinxi-title xinxi-text">岗位</span><span class="xinxi-value xinxi-text">${teacher.postName}</span></li>
                        <li><span class="xinxi-title xinxi-text">状态</span><span class="xinxi-value xinxi-text">
                            <c:choose>
                                <c:when test="${teacher.status==0}">
                                    离职
                                </c:when>
                                <c:when test="${teacher.status==1}">
                                    在职
                                </c:when>
                                <c:when test="${teacher.status==2}">
                                    退休
                                </c:when>
                                <c:otherwise>
                                    返聘
                                </c:otherwise>
                            </c:choose>
                        </span></li>
                    </ul>
                </div>
            </div>
        </div>
        <%--教育信息--%>
        <div id="eduInfo" class="cont-value">
            <div class="title_pic"></div>
            <span class="all-text title">毕业院校</span>
            <span class="addbut jadd-edu"> + &nbsp; 新增学历</span>
            <%--表格数据--%>
            <table id="table_edu" class="table-style">
                <colgroup>
                    <col width="200">
                    <col width="130">
                    <col width="80">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                    <col width="100">
                </colgroup>
                <thead class="box_title">
                <tr>
                    <th>院校</th>
                    <th>专业</th>
                    <th>学历</th>
                    <th>入学日期</th>
                    <th>毕业日期</th>
                    <th>备注</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="box_neirong_edu" class="box_neirong_all">
                    <c:forEach var="edu" items="${teacher.educationBackgrounds}">
                        <tr data-id="${edu.id}">
                            <td><c:out value="${edu.school}"/></td>
                            <td><c:out value="${edu.major}"/> </td>
                            <td>
                            <c:choose>
                                <c:when test="${edu.eduLevel==0}">
                                    初中
                                </c:when>
                                <c:when test="${edu.eduLevel==1}">
                                    高中
                                </c:when>
                                <c:when test="${edu.eduLevel==2}">
                                    中专
                                </c:when>
                                <c:when test="${edu.eduLevel==3}">
                                    大专
                                </c:when>
                                <c:when test="${edu.eduLevel==4}">
                                    本科
                                </c:when>
                                <c:when test="${edu.eduLevel==5}">
                                    硕士
                                </c:when>
                                <c:when test="${edu.eduLevel==6}">
                                    博士
                                </c:when>
                            </c:choose>
                            </td>
                            <td><fmt:formatDate value="${edu.entryDate}" pattern="yyyy年MM月dd日" /></td>
                            <td><fmt:formatDate value="${edu.graduationDate}" pattern="yyyy年MM月dd日"/></td>
                            <td><c:out value="${edu.remark}"/> </td>
                            <td>
                                <a href="##" id="edu-update">修改</a>
                                <a href="##" id="edu-remove">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%--职称信息--%>
        <div id="positionInfo" class="fuJiaXinXiDiv">
            <div class="title_pic"></div>
            <span class="all-text title">职称评定</span>
            <span class="addbut jadd-position"> + &nbsp; 新增职称</span>
            <%--职称数据--%>
            <table id="table_position" class="table-style">
                <colgroup>
                    <col width="200">
                    <col width="180">
                    <col width="170">
                    <col width="235">
                    <col width="120">
                </colgroup>
                <thead class="box_title">
                    <tr>
                        <th>职称类别</th>
                        <th>职称名称</th>
                        <th>晋级日期</th>
                        <th>附件</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody id="box_neirong_position" class="box_neirong_all">

                </tbody>
            </table>
        </div>
        <%--表彰信息--%>
        <div id="commendInfo" class="fuJiaXinXiDiv">
            <div class="title_pic"></div>
            <span class="all-text title">表彰信息</span>
            <span class="addbut jadd-commend"> + &nbsp; 新增表彰</span>
            <%--表彰数据--%>
            <table id="table_position" class="table-style">
                <colgroup>
                    <col width="200">
                    <col width="160">
                    <col width="190">
                    <col width="235">
                    <col width="120">
                </colgroup>
                <thead class="box_title">
                <tr>
                    <th>表彰级别</th>
                    <th>表彰名称</th>
                    <th>描述</th>
                    <th>附件</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="box_neirong_commend" class="box_neirong_all">

                </tbody>
            </table>
        </div>
        <%--协议--%>
        <div id="agreementInfo" class="fuJiaXinXiDiv">
            <div class="title_pic"></div>
            <span class="all-text title">协议</span>
            <span class="addbut jadd-agreement"> + &nbsp; 新增协议</span>
            <%--协议--%>
            <table id="table_position" class="table-style">
                <colgroup>
                    <col width="200">
                    <col width="180">
                    <col width="170">
                    <col width="235">
                    <col width="120">
                </colgroup>
                <thead class="box_title">
                <tr>
                    <th>协议名称</th>
                    <th>开始日期</th>
                    <th>结束日期</th>
                    <th>附件</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="box_neirong_agreement" class="box_neirong_all">

                </tbody>
            </table>
        </div>
        <%--工作变动--%>
        <div id="changedInfo" class="fuJiaXinXiDiv">
            <div class="title_pic"></div>
            <span class="all-text title">工作变动</span>
            <span class="addbut jadd-changed"> + &nbsp; 新增变动</span>
            <%--表格数据--%>
            <table id="table_chenged" class="table-style">
                <colgroup>
                    <col width="200">
                    <col width="150">
                    <col width="100">
                    <col width="170">
                    <col width="170">
                    <col width="120">
                </colgroup>
                <thead class="box_title">
                <tr>
                    <th>日期</th>
                    <th>部门</th>
                    <th>岗位</th>
                    <th>工作性质</th>
                    <th>工作状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="box_neirong_changed" class="box_neirong_all">
                    <c:forEach var="changed" items="${teacher.changeds}">
                        <tr data-id="${changed.id}">
                            <td><fmt:formatDate value="${changed.changeTime}" pattern="yyyy年MM月dd日"/></td>
                            <td><c:out value="${changed.map.deptName}"/></td>
                            <td><c:out value="${changed.map.postName}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${changed.nature==0}">
                                        在编
                                    </c:when>
                                    <c:when test="${changed.nature==1}">
                                        人事代理
                                    </c:when>
                                    <c:when test="${changed.nature==2}">
                                        非人事代理
                                    </c:when>
                                    <c:otherwise>
                                        退休返聘
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${changed.status==0}">
                                        离职
                                    </c:when>
                                    <c:when test="${changed.status==1}">
                                        在职
                                    </c:when>
                                    <c:when test="${changed.status==2}">
                                        退休
                                    </c:when>
                                    <c:otherwise>
                                        返聘
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="##" style="cursor: pointer;" id="change-update">修改</a>
                                <a href="##" style="cursor: pointer;" id="change-remove">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%--年度考核--%>
        <div id="examineInfo" class="fuJiaXinXiDiv">
            <div class="title_pic"></div>
            <span class="all-text title">年度考核</span>
            <%--表格数据--%>
            <table id="table_examine" class="table-style">
                <colgroup>
                    <col width="260">
                    <col width="240">
                    <col width="240">
                    <col width="170">
                </colgroup>
                <thead class="box_title">
                <tr>
                    <th>姓名</th>
                    <th>考核年度</th>
                    <th>考核结果</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="box_neirong_examine" class="box_neirong_all">
                    <c:forEach var="examine" items="${teacher.examines}">
                        <tr data-id="${examine.id}">
                            <td><c:out value="${examine.name}"/></td>
                            <td><c:out value="${examine.year}"/>年度</td>
                            <td>
                                <c:choose>
                                    <c:when test="${examine.result==0}">
                                        优秀
                                    </c:when>
                                    <c:when test="${examine.result==1}">
                                        合格
                                    </c:when>
                                    <c:when test="${examine.result==2}">
                                        基本合格
                                    </c:when>
                                    <c:when test="${examine.result==3}">
                                        不合格
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <a href="#" style="cursor: pointer;" class="a_examine">修改</a>
                                <div class="webui-popover-content">
                                    <input type="radio" value="0" name="result">优秀</input><br/>
                                    <input type="radio" value="1" name="result" style="margin-top: 8px">合格</input><br/>
                                    <input type="radio" value="2" name="result" style="margin-top: 8px">基本合格</input><br/>
                                    <input type="radio" value="3" name="result" style="margin-top: 8px">不合格</input><br/>
                                    <input type="button" value="确认" class="examine_btn" style="margin-top: 8px; float: right;"/>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="fuJiaXinXiDiv" style="height: 30px"></div>
    </div>
    <%--修改教师基本信息--%>
    <div id="updateTeacher" class="all-from">
        <div class="update-title">
            <label class="title-text">编辑基本信息</label>
            <label class="exit jexit">×</label>
        </div>
        <div class="neirong">
            <form action="${pageContext.request.contextPath}/teacher/update" id="teacher-update-from" class="update-from" method="post">
                <table class="update-table">
                    <tr>
                        <td class="left-td">编号</td>
                        <td class="right-td"><input class="input-text layui-input" type="text" value="${teacher.empNo}" id="empNo" name="empNo" placeholder="编号可自动生成">
                            <input  type="hidden" value="${teacher.empNo}" id="oldEmpNo" name="oldEmpNo">
                            <input  type="hidden" value="${teacher.id}" id="" name="id">
                        </td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td class="right-td"><input name="name" id="name" type="text" class="input-text layui-input" value="${teacher.name}" placeholder="请输入姓名"></td>
                    </tr>
                    <tr>
                        <td class="left-td">性别</td>
                        <td class="right-td">
                            <div class="form-radio" id="teacher-from-radio">
                                <c:choose>
                                    <c:when test="${teacher.sex=='男'}">
                                        <label class="radio-1">
                                            <input type="radio"  value="男" name="sex" checked="checked"> 男
                                        </label>
                                        <label class="radio-1" id="radio-girl">
                                            <input type="radio" value="女" name="sex"> 女
                                        </label>
                                    </c:when>
                                    <c:otherwise>
                                        <label class="radio-1">
                                            <input type="radio"  value="男" name="sex"> 男
                                        </label>
                                        <label class="radio-1" id="radio-girl">
                                            <input type="radio" value="女" name="sex" checked="checked"> 女
                                        </label>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">出生年月</td>
                        <td class="right-td">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input name="brithday" type="text" class="input-text layui-input" id="brithday" value="${teacher.brithday }" placeholder="请选择日期">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">身份证号</td>
                        <td class="right-td"><input name="persionId" id="persionId" class="input-text layui-input"  type="text" value="${teacher.persionId }" placeholder="请输入身份证号"></td>
                    </tr>
                    <tr>
                        <td class="left-td">手机号码</td>
                        <td class="right-td"><input name="phone" id="phone" class="input-text layui-input"  type="text" value="${teacher.phone}" placeholder="请输入手机号码"></td>
                    </tr>
                    <tr>
                        <td class="left-td">籍贯</td>
                        <td class="right-td"><input name="navitePlace" id="navitePlace" class="input-text layui-input" type="text" value="${teacher.navitePlace}" placeholder="请输入籍贯"></td>
                    </tr>
                    <tr>
                        <td class="left-td">入职日期</td>
                        <td class="right-td">
                            <div class="layui-input-inline">
                                <input name="entryDay" id="entry-time" type="text" value="${teacher.entryDay}" class="input-text layui-input" placeholder="请选择日期">
                            </div>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" align="centre">
                            <button type="button" class="jteacher-form-button form-button">提交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <%--给人员添加学历--%>
    <div id="addedu" class="all-from">
        <div class="update-title">
            <label class="title-text">编辑学历信息</label>
            <label class="exit jexit">×</label>
        </div>
        <div class="neirong">
            <form action="${pageContext.request.contextPath}/teacher/addeducation" id="edu-update-from" class="update-from" method="post">
                <table class="update-table">
                    <tr>
                        <td class="left-td">院校名称</td>
                        <td class="right-td">
                            <input class="input-text layui-input" type="text" value="" id="edu-school" name="school" placeholder="请输入院校">
                            <input type="hidden" value="${teacher.id}" name="empId"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">专业</td>
                        <td class="right-td"><input name="major" id="edu-major" type="text" class="input-text layui-input" value="" placeholder="请输入专业"></td>
                    </tr>
                    <tr>
                        <td class="left-td">学历</td>
                        <td class="right-td">
                            <select name="eduLevel" id="edu-eduLevel" class="input-text layui-unselect">
                                <option value="">请选择学历...</option>
                                <option value="0">初中</option>
                                <option value="1">高中</option>
                                <option value="2">中专</option>
                                <option value="3">大专</option>
                                <option value="4">本科</option>
                                <option value="5">硕士</option>
                                <option value="6">博士</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">开始日期</td>
                        <td class="right-td">
                            <input name="entryDate" type="text" class="input-text layui-input" id="edu-entryDate" value="" placeholder="请选择日期">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">结束日期</td>
                        <td class="right-td">
                            <input name="graduationDate" type="text" class="layui-input input-text" id="edu-graduationDate" value="" placeholder="请选择日期">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">备注</td>
                        <td class="right-td">
                            <textarea placeholder="请输入备注" style="margin-left: 36px; margin-top: 6px;" id="edu-remark" class="layui-textarea" name="remark"></textarea>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" align="centre">
                            <button type="button" class="jedu-form-button form-button">提交</button>
                        </td>
                    </tr>
                    <input type="hidden" id="update-edu" value="" name="eduId">
                </table>
            </form>
        </div>
    </div>
    <%--新增/修改职称--%>
    <div id="addPosition" class="all-from">
        <div class="update-title">
            <label class="title-text jposition_title_text" id="addposition-title-text">新增职称</label>
            <label class="title-text jposition_title_text" id="resetposition-title-text">修改职称</label>
            <label class="exit jexit">×</label>
        </div>
        <div class="neirong">
            <form action="${pageContext.request.contextPath}/teacher/addPosition" id="position-update-from" class="update-from" method="post" enctype="multipart/form-data">
                <table class="update-table" id="update-position-table">
                    <tr style="display: none">
                        <td id="position-oldfile">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">姓名</td>
                        <td class="right-td">
                            <input class="input-text layui-input" type="text" value="${teacher.name}" id="position-empName" name="empName" readonly>
                            <input type="hidden" value="${teacher.id}" name="empId"/><%--员工ID--%>
                            <%--职称员工关系表ID--%>
                            <input type="hidden" id="update-positionId" value="" name="id">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">获取日期</td>
                        <td class="right-td">
                            <input name="getDate" type="text" class="input-text layui-input" id="positionGetDate" value="" placeholder="请选择日期">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">职称类别</td>
                        <td class="right-td">
                            <select name="category" id="category" class="input-text layui-unselect">
                                <option value="">请选择职称...</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">职称名称</td>
                        <td class="right-td">
                            <select name="positionId" id="teacher_positionName" class="input-text layui-unselect">
                                <option value="">请选择职称...</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">附件</td>
                        <td>
                            <div class="layui-upload" name="file" style="margin-left: 36px;margin-top: 10px;">
                                <button type="button" class="layui-btn layui-btn-normal" id="testList">选择文件</button>
                                <div class="layui-upload-list">
                                    <table class="layui-table" >
                                        <thead>
                                        <tr><th>文件名</th>
                                            <th>大小</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr></thead>
                                        <tbody id="demoList">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" align="centre">
                            <button type="button" class="jposition-form-button form-button" id="testListAction">提交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <%--新增/修改奖彰信息--%>
    <div id="addCommend" class="all-from">
        <div class="update-title">
            <label class="title-text jposition_title_text" id="addcommend-title-text">新增奖彰</label>
            <label class="exit jexit">×</label>
        </div>
        <div class="neirong">
            <form action="${pageContext.request.contextPath}/teacher/addCommend" id="commend-update-from" class="update-from" method="post" enctype="multipart/form-data">
                <table class="update-table" id="update-commend-table">
                    <tr style="display: none">
                        <td id="commend-oldfile"></td>
                    </tr>
                    <tr>
                        <td class="left-td">姓名</td>
                        <td class="right-td">
                            <input class="input-text layui-input" type="text" value="${teacher.name}" id="position-empName" name="empName" readonly>
                            <input type="hidden" value="${teacher.id}" name="empId"/><%--员工ID--%>
                            <%--表彰ID 点击修改后给他复制--%>
                            <input type="hidden" id="update-commendId" value="" name="id">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">表彰级别</td>
                        <td class="right-td">
                            <select name="level" id="comment-level" class="input-text layui-unselect">
                                <option value="">请选择表彰级别...</option>
                                <option value="园级">园级</option>
                                <option value="区级">区级</option>
                                <option value="市级">市级</option>
                                <option value="省级">省级</option>
                                <option value="国家级">国家级</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">表彰名称</td>
                        <td class="right-td">
                            <input name="commendName" type="text" class="input-text layui-input" id="commend-commendName" value="" placeholder="请输入表彰名称">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">获得日期</td>
                        <td class="right-td">
                            <input name="getTime" type="text" class="input-text layui-input" id="commendGetDate" value="" placeholder="请选择日期">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">表彰描述</td>
                        <td class="right-td">
                            <textarea style="margin-left: 36px; margin-top: 6px;" id="commend-note" class="layui-textarea" name="note"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">附件</td>
                        <td>
                            <div class="layui-upload" name="file" style="margin-left: 36px;margin-top: 10px;">
                                <button type="button" class="layui-btn layui-btn-normal" id="testListcommend">选择文件</button>
                                <div class="layui-upload-list">
                                    <table class="layui-table" >
                                        <thead>
                                        <tr><th>文件名</th>
                                            <th>大小</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr></thead>
                                        <tbody id="demoListCommend">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" align="centre">
                            <button type="button" class="jposition-form-button form-button" id="testListActioncommend">提交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <%--新增/修改协议信息--%>
    <div id="addAgreement" class="all-from">
        <div class="update-title">
            <label class="title-text jposition_title_text" id="agreement-title-text">新增奖彰</label>
            <label class="exit jexit">×</label>
        </div>
        <div class="neirong">
            <form action="${pageContext.request.contextPath}/teacher/addCommend" id="agreement-update-from" class="update-from" method="post" enctype="multipart/form-data">
                <table class="update-table" id="update-agreement-table">
                    <tr style="display: none;">
                        <td id="agreement-oldfile"></td>
                    </tr>
                    <tr>
                        <td class="left-td">姓名</td>
                        <td class="right-td">
                            <input class="input-text layui-input" type="text" value="${teacher.name}" id="agreement-empName" name="empName" readonly>
                            <input type="hidden" value="${teacher.id}" name="empId"/><%--员工ID--%>
                            <%--协议ID 点击修改后给他复制--%>
                            <input type="hidden" id="update-agreementId" value="" name="id">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">协议名称</td>
                        <td class="right-td">
                            <input name="agreeName" type="text" class="input-text layui-input" id="agreement-agreeName" value="" placeholder="请输入表彰名称">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">开始日期</td>
                        <td class="right-td">
                            <input name="startTime" type="text" class="input-text layui-input" id="agreementStartTime" value="" placeholder="请输入表彰名称">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">结束日期</td>
                        <td class="right-td">
                            <input name="endTime" type="text" class="input-text layui-input" id="agreementEndTime" value="" placeholder="请选择日期">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">附件</td>
                        <td>
                            <div class="layui-upload" name="file" style="margin-left: 36px;margin-top: 10px;">
                                <button type="button" class="layui-btn layui-btn-normal" id="testListAgreement">选择文件</button>
                                <div class="layui-upload-list">
                                    <table class="layui-table" >
                                        <thead>
                                        <tr><th>文件名</th>
                                            <th>大小</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr></thead>
                                        <tbody id="demoListAgreement">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" align="centre">
                            <button type="button" class="jagreement-form-button form-button" id="testListActionAgreement">提交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <%--新增/修改变动信息--%>
    <div id="addChange" class="all-from">
        <div class="update-title">
            <label class="title-text jchange_title_text" id="change-title-text">新增变动</label>
            <label class="exit jexit">×</label>
        </div>
        <div class="neirong">
            <form action="${pageContext.request.contextPath}/teacher/change" id="change-update-from" class="update-from" method="post" enctype="multipart/form-data">
                <table class="update-table" id="update-change-table">
                    <tr>
                        <td class="left-td">姓名</td>
                        <td class="right-td">
                            <input class="input-text layui-input" type="text" value="${teacher.name}" id="change-empName" name="empName" readonly>
                            <input type="hidden" value="${teacher.id}" name="empId"/><%--员工ID--%>
                            <%--变动ID 点击修改后给他复制--%>
                            <input type="hidden" id="update-changeId" value="" name="id">
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">部门</td>
                        <td class="right-td">
                            <select name="deptId" id="change-dept" class="input-text layui-unselect">
                                <option value="">请选择部门...</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">岗位</td>
                        <td class="right-td">
                            <select name="postId" id="change-post" class="input-text layui-unselect">
                                <option value="">请选择岗位...</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">工作性质</td>
                        <td class="right-td">
                            <select name="nature" id="change-nature" class="input-text layui-unselect">
                                <option value="0">在编</option>
                                <option value="1">人事代理</option>
                                <option value="2">非人事代理</option>
                                <option value="3">退休返聘</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">工作状态</td>
                        <td class="right-td">
                            <select name="status" id="change-status" class="input-text layui-unselect">
                                <option value="1">在职</option>
                                <option value="0">离职</option>
                                <option value="2">退休</option>
                                <option value="3">返聘</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left-td">生效时间</td>
                        <td class="right-td">
                            <input name="changeTime" type="text" class="input-text layui-input" id="changeTime" value="" placeholder="请选择日期">
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" align="centre">
                            <button type="button" class="jagreement-form-button form-button" id="testListActionChange">提交</button>
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
    <script src="${pageContext.request.contextPath}/js/teacher-position.js"></script>
    <script src="${pageContext.request.contextPath}/js/teacher_commend.js"></script>
    <script src="${pageContext.request.contextPath}/js/teacher_agreement.js"></script>
    <script src="${pageContext.request.contextPath}/js/teacher-changed.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.webui-popover.js"></script>
    <script src="${pageContext.request.contextPath}/js/jspdf.debug.js"></script>
    <script src="${pageContext.request.contextPath}/js/html2canvas.js"></script>
    <script>
        layui.use(['laydate','layer'], function(){
            $("#updateTeacher").hide()
            $("#addedu").hide()
            $("#addPosition").hide()
            $("#addCommend").hide()
            $("#addAgreement").hide()
            $("#addChange").hide()
            var laydate = layui.laydate;
            var layer = layui.layer;

            /** 导出员工信息 */
            $(".jinfo_out").click(function(){
                //询问框
                layer.confirm('确认导出该员工信息吗', {
                    btn: ['确认','取消'] //按钮
                }, function(){
                    $(".addbut").hide()
                    $(".a-text-style").hide()
                    var pdf = new jsPDF('p','pt','a4');
                    // 设置打印比例 越大打印越小
                    pdf.internal.scaleFactor = 0;
                    var options = {
                        pagesplit: false, //设置是否自动分页
                        "background": '#FFFFFF'   //如果导出的pdf为黑色背景，需要将导出的html模块内容背景 设置成白色。
                    };
                    var printHtml = $('#countDiv').get(0);   // 页面某一个div里面的内容，通过id获取div内容
                    pdf.addHTML(printHtml,0, 0, options,function() {
                        pdf.save('${teacher.name}个人资料.pdf');
                    });
                    $(".addbut").show()
                    $(".a-text-style").show()
                    layer.closeAll();
                }, function(){
                    layer.closeAll();
                });
            })
            /** 日期控件 */
            laydate.render({
                elem: '#brithday'
            });
            laydate.render({
                elem:'#entry-time'
            });
            laydate.render({
                elem:'#edu-entryDate'
            })
            laydate.render({
                elem:'#edu-graduationDate'
            })
            laydate.render({
                elem:'#positionGetDate'
            })
            laydate.render({
                elem:'#commendGetDate'
            })
            laydate.render({
                elem:'#agreementStartTime'
            })
            laydate.render({
                elem:'#agreementEndTime'
            })
            laydate.render({
                elem:'#changeTime'
            })
            $("#return").click(function(){
                window.location.href="toIndex"
            })
            /**学历相关**/
            //点击添加学历按钮
            $(".jadd-edu").click(function(){
                $("#countDiv").hide()
                $("#addedu").show()
                $("#updateTeacher").hide()
                //按钮的ID更改为$添加的ID
                $(".jedu-form-button").attr("id","addEduBtu")
            })
            // 添加学历提交
            $("#edu-update-from").on('click','#addEduBtu',function(){
                var edu_school = $("#edu-school").val()
                var edu_major = $("#edu-major").val()
                var edu_eduLevel = $("#edu-eduLevel").val()
                var edu_entryDate = $("#edu-entryDate").val()
                var edu_graduationDate = $("#edu-graduationDate").val()
                var edu_remark = $("#edu-remark").val()
                if(edu_school==""||edu_major==""||edu_eduLevel==""||edu_entryDate==""||edu_graduationDate=="" ){
                    layer.msg("请填写完整信息", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                        function(){});
                    return;
                }
                $("#edu-update-from").ajaxSubmit(function(message){
                    if(message.success){
                        layer.msg(message.message, {icon : 1,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                            function(){});
                        if(edu_eduLevel=='0'){
                            edu_eduLevel="初中"
                        }else if(edu_eduLevel=='1'){
                            edu_eduLevel="高中"
                        }else if(edu_eduLevel=='2'){
                            edu_eduLevel="中专"
                        }else if(edu_eduLevel=='3'){
                            edu_eduLevel="大专"
                        }else if(edu_eduLevel=='4'){
                            edu_eduLevel="本科"
                        }else if(edu_eduLevel=='5'){
                            edu_eduLevel="硕士"
                        }else{
                            edu_eduLevel="博士"
                        }
                        //将yyyy-MM-dd改为yyyy年MM月dd日的格式
                        var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
                        edu_entryDate = edu_entryDate.replace(reg,"$1年$2月$3日");
                        edu_graduationDate = edu_graduationDate.replace(reg,"$1年$2月$3日");
                        $("#box_neirong_edu").append("<tr data-id='"+message.data+"'><td>"+edu_school+"</td>" +
                            "<td>"+edu_major+"</td><td>"+edu_eduLevel+"</td><td>"+edu_entryDate+"</td><td>"+edu_graduationDate+"</td><td>"+edu_remark+"</td>" +
                            "<td><a href='##' id='edu-update'>修改</a><a href='##' id='edu-remove' style='margin-left: 5px'>删除</a></td></tr>")
                    }else{
                        layer.msg(message.message, {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                            function(){});
                    }
                })
            })
            //点击删除学历
            $("#box_neirong_edu").on('click','#edu-remove',function(){
                var id=$(this).parent().parent().attr("data-id");
                //询问框
                layer.confirm('确认删除该条信息？', {
                        btn: ['确定','取消'] //按钮,
                        ,area: ['300px', '180px']
                    },function(index){
                        layer.close(index)
                        $.ajax({
                        type:"POST",
                        url:"${pageContext.request.contextPath}/teacher/removeedu/"+id,
                        dateType:"json",
                        data:{},
                        success:function(data){
                            if(data.success){
                                layer.msg("删除成功", {icon : 1,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                                    function(){});
                                // 父元素找到指定id的tr子元素进行remove操作
                                $("#box_neirong_edu").find("tr[data-id="+id+"]").remove()
                            }else{
                                layer.msg("删除失败", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                                    function(){});
                            }
                        }
                    })
                    },function(index){
                        layer.close(index)
                })
            })
            //点击修改学历
            $("#box_neirong_edu").on("click","#edu-update",function(){
                //个人信息隐藏
                $("#countDiv").show()
                //添加教育背景信息DIV显示
                $("#addedu").hide()
                //教师基本信息修改DIV隐藏
                $("#updateTeacher").hide()
                var eduId = $(this).parent().parent().attr("data-id")//获取教育背景ID
                $("#update-edu").attr("value",eduId)
                //from表单的url更改为修改的url
                $("#edu-update-from").attr("action","${pageContext.request.contextPath}/teacher/updateEdu")
                //按钮的ID更改为$修改的ID
                $(".jedu-form-button").attr("id","updateEduBtu")
                //根据教育背景ID获取该条教育背景信息,并填充到from表单中
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/teacher/findEduById/"+eduId,
                    dataType:"json",
                    success:function(data){
                        $("#edu-school").val(data.data.school)
                        $("#edu-major").val(data.data.major)
                        $("#edu-eduLevel").val(data.data.eduLevel)
                        $("#edu-entryDate").val(timeStamp2String(data.data.entryDate.time))
                        $("#edu-graduationDate").val(timeStamp2String(data.data.graduationDate.time))
                        $("#edu-remark").val(data.data.remark)
                    }
                })
            })
            //修改点击提交按钮
            $("#edu-update-from").on('click','#updateEduBtu',function(){
                var edu_school = $("#edu-school").val()
                var edu_major = $("#edu-major").val()
                var edu_eduLevel = $("#edu-eduLevel").val()
                var edu_entryDate = $("#edu-entryDate").val()
                var edu_graduationDate = $("#edu-graduationDate").val()
                var edu_remark = $("#edu-remark").val()
                if(edu_school==""||edu_major==""||edu_eduLevel==""||edu_entryDate==""||edu_graduationDate=="" ){//验证输入信息
                    layer.msg("请填写完整信息", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                        function(){});
                    return;
                }
                $("#edu-update-from").ajaxSubmit(function(data){
                    if(data.success){
                        layer.msg(data.message, {icon : 1,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                            function(){});
                        if(edu_eduLevel=='0'){
                            edu_eduLevel="初中"
                        }else if(edu_eduLevel=='1'){
                            edu_eduLevel="高中"
                        }else if(edu_eduLevel=='2'){
                            edu_eduLevel="中专"
                        }else if(edu_eduLevel=='3'){
                            edu_eduLevel="大专"
                        }else if(edu_eduLevel=='4'){
                            edu_eduLevel="本科"
                        }else if(edu_eduLevel=='5'){
                            edu_eduLevel="硕士"
                        }else{
                            edu_eduLevel="博士"
                        }
                        //将yyyy-MM-dd改为yyyy年MM月dd日的格式
                        var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
                        edu_entryDate = edu_entryDate.replace(reg,"$1年$2月$3日");
                        edu_graduationDate = edu_graduationDate.replace(reg,"$1年$2月$3日");
                        // 找到教育背景ID，然后操作data-id为该id的tr删除掉他，在添加一条更改后的信息
                        var eduId = $("#update-edu").attr("value");
                        $("#box_neirong_edu").find("tr[data-id="+eduId+"]").remove()
                        $("#box_neirong_edu").append("<tr data-id='"+data.data+"'><td>"+edu_school+"</td>" +
                            "<td>"+edu_major+"</td><td>"+edu_eduLevel+"</td><td>"+edu_entryDate+"</td><td>"+edu_graduationDate+"</td><td>"+edu_remark+"</td>" +
                            "<td><a href='##' id='edu-update'>修改</a><a href='##' id='edu-remove' style='margin-left: 5px'>删除</a></td></tr>")
                    }
                })
            })
            /**
             * 编辑个人基本信息相关
             */
            //点击编辑个人信息按钮
            $("#update").click(function(){
                $("#countDiv").hide()
                $("#updateTeacher").show()
            })
            //编辑个人信息退出按钮
            $(".jexit").click(function(){
                $(this).parent().parent().hide()
                $("#countDiv").show()
            })
            //提交编辑用户基本信息
            $(".jteacher-form-button").click(function(){
                var phone = $("#phone").val()
                var rex = /^1[345678]\d{9}$/;
                var isPhone = rex.test(phone);
                rex = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
                var isPersionID = rex.test($("#persionId").val())
                if($("#phone").val()==""||$("#name").val()==""||$("#brithday").val()==""||$("#persionId").val()==""||
                    $("#navitePlace").val()==""||$("#entry-time").val()==""||$("#empNo").val==""){
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
                        if(isNaN(empNo.charAt(i))) {
                            format=false;
                        }
                    }
                    if(empNo.length!=6 && empNo.length!=0){
                        layer.msg("1员工号格式为6位数字，如：000001", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                            function() {});
                        return;
                    }else if(empNo.length==6){
                        if(!format){
                            layer.msg("2员工号格式为6位数字，如：000001", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                                function() {});
                            return;
                        }
                    }
                    // $("#add-from").submit();
                    // jquery 表单提交
                    $("#teacher-update-from").ajaxSubmit(function(message) {//提交修改基本信息的表单
                        if(message.success){
                            layer.msg(message.message, {icon : 1,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                                function(){});
                            $("#xinxi-name").html($("#name").val())
                            $("#xinxi-sex").html($("input[type='radio']:checked").val())
                            $("#xinxi-empNo").html($("#empNo").val())
                            $("#xinxi-persionId").html($("#persionId").val())
                            $("#xinxi-entryDay").html($("#entry-time").val())
                            $("#xinxi-brithday").html($("#brithday").val())
                            $("#xinxi-navitePlace").html($("#navitePlace").val())
                            $("#xinxi-phone").html($("#phone").val())
                            $("#countDiv").show()
                            $("#updateTeacher").hide()
                        }else{
                            layer.msg(message.message, {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                                function(){});
                        }
                    });
                    return false;
                }
            })
            //第一次刷新
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/teacher/info/"+${id},
                dataType:"json",
                data:{},
                success:function(data){
                    console.log(data)
                    commendName:"优秀教师将";empId:0;fileName:"优秀教师荣誉证书.pdf";
                    ;getTime:Object;id:2;level:"省级";note:"河南省第十八届优秀教师评比";url:"upload/commend/";
                    var agrement_table = "";
                    /**协议列表加载*/
                    for(var i = 0; i<data.data.agreements.length;i++){
                        var agreement = data.data.agreements[i]
                        var returnFilename = agreement.filename
                        var returnUrl = agreement.url
                        var filenames = returnFilename==null?"":returnFilename.split("、")
                        var urls = returnUrl==null?"":returnUrl.split(",")
                        var a = ""
                        for(var j = 0;j<urls.length-1;j++){
                            if(j<urls.length-2){
                                a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"'  download=''>"+filenames[j]+"</a>、"
                            }else{
                                a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"'  download=''>"+filenames[j]+"</a>"
                            }
                        }
                        //将yyyy-MM-dd改为yyyy年MM月dd日的格式
                        var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
                        var startTime = timeStamp2String(agreement.startTime.time);
                        startTime = startTime.replace(reg,"$1年$2月$3日");
                        var endTime = timeStamp2String(agreement.endTime.time);
                        endTime = endTime.replace(reg,"$1年$2月$3日");
                        agrement_table+="<tr data-id='"+agreement.id+"'><td>"+agreement.agreeName+"</td><td>"+startTime+"</td><td>"+endTime+"</td>" +
                            "<td>"+a+"</td><td><a href='##' id='agreement-update'>修改</a>&nbsp;  <a href='##' id='agreement-remove'>删除</a></td></tr>"
                    }
                    $("#box_neirong_agreement").html(agrement_table)
                    var commend_table="";
                    /**表彰列表加载*/
                    for(var i = 0;i<data.data.commends.length;i++){
                        var a = ""
                        var url = data.data.commends[i].url
                        var fileName = data.data.commends[i].fileName
                        if(url!=null &&fileName!=null){
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
                        commend_table+="<tr data-id='"+data.data.commends[i].id+"'>" +
                            "<td>"+data.data.commends[i].level+"</td><td>"+data.data.commends[i].commendName+"</td><td>"+data.data.commends[i].note+"</td>" +
                            "<td>"+a+"</td><td><a href='##' id='commend_update'>修改</a>&nbsp; <a href='##' id='commend_remove'>删除</a></td></tr>"
                    }
                    $("#box_neirong_commend").html(commend_table)
                    var position_table="";
                    /**职称列表加载*/
                    for(var i=0;i<data.data.positions.length;i++){
                        var position = data.data.positions[i];
                        var url = position.positionUrl;
                        var fileName = position.fileName;
                        var a = ""
                        if(url!=null && fileName !=null){
                            var urls = url.split(',')
                            var fileNames = fileName.split("、");
                            for(var j=0;j<urls.length-1;j++){
                                if(j<urls.length-2){
                                    a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' data-url='"+urls[j]+"'download='' >"+fileNames[j]+"</a>、"
                                }else{
                                    a+="<a href='${pageContext.request.contextPath}/"+urls[j]+"' data-url='"+urls[j]+"' download=''>"+fileNames[j]+"</a>"
                                }
                            }
                        }
                        //将yyyy-MM-dd改为yyyy年MM月dd日的格式
                        var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
                        var positionGetDate = timeStamp2String(position.positionGetTime.time);
                        positionGetDate = positionGetDate.replace(reg,"$1年$2月$3日");
                        position_table+="<tr data-id='"+data.data.positions[i].id+"' data-peId='"+position.peId+"'><td>"+position.cateName+"</td><td>"+position.positionName+"</td>" +
                            "<td>"+positionGetDate+"</td><td>" + a + "</td>" +
                            "<td><a href='##' id='position-update'>修改</a>&nbsp;  <a href='##' id='position-remove'>删除</a></td>"
                    }
                    $("#box_neirong_position").html(position_table);
                }
            })
            //修改考核结果
            var examineId=0;
            $('.a_examine').webuiPopover({width:138,height:141,animation:'pop'});
            $(".a_examine").on("click",function(){
                examineId=$(this).parent().parent().attr("data-id")
            })
            $(".examine_btn").on("click",function(){
                var result = $("input[name='result']:checked").val()
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/teacher/updateExamine",
                    dataType:"json",
                    data:{"result":result,"id":examineId},
                    success:function(data){
                        if(data.success){
                            var tds = $("#box_neirong_examine").find("tr[data-id="+examineId+"]").children("td")
                            var r = "";
                            if(result==0){
                                r = "优秀";
                            }else if(result==1){
                                r = "合格";
                            }else if(result==1){
                                r = "基本合格";
                            }else{
                                r = "不合格";
                            }
                            $(tds[2]).html(r)
                        }
                    }
                })
            })
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
