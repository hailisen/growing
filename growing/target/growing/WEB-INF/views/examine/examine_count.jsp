<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>考核统计</title>
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
            margin-left: 0px;
        }
        /*标题前的小图片 类 每个页面都有的*/
        .title_pic{
            float: left;
            height: 18px;
            width: 4.5px;
            background-color: #737373;
            margin-left: 270px;
        }
        .title{/*标题每个页面都有 */
            font-size: 14px;
            font-weight: bolder;
            margin-left: 8px;
        }
        .heard{
            padding-top: 15px;
        }
        /*选择日期DIV*/
        #choose-year{
            margin: 0px auto;
            position: absolute;
            width: 600px;
            border: 1px #cfdee9 solid;
            background-color: #fff;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }
        #cad_title{
            width: 100%;
            height: 42px;
            background-color: #f3f3f3;
        }
        #title-text{ /*新增人员*/
            font-weight: normal;
            font-size: 14px;
            line-height: 47px;
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
        .count-button{
            margin: 62px 142px 20px;
            width: 107px;
            font-size: 13px;
            height: 38px;
            background-color: #777777;
            color: #ffffff;
            border-radius: 50px;
            borderadd-employee: none;
            border: 0px;
        }
        .input-text {
            width: 170px;
            display: block;
            height: 33px;
            margin-top: 20px;
            float: left
        }
        .chooseText{
            display: block;
            margin-top: 55px;
            color: #666666;
        }
       #neirong{
           padding-left: 100px;
       }
        .layui-laydate .layui-this {
            background-color: #48c6ff!important;
            color: #fff!important;
        }
        #countNum{
            float: left;
            margin-top: 90px;
            margin-left: -222px;
        }
        #countlist{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="tpl-content-wrapper examint-count-list">
        <div class="heard">
            <div class="title_pic"></div>
            <span class="all-text title">年度考核</span>
        </div>
        <div id="countlist" style="margin-left: 275px; padding-right: 30px;">
            <h2 align="center" style="font-weight: bolder;"><span id="title_startYear">&nbsp; &nbsp; </span>年至<span id="title_endYear">&nbsp; &nbsp; </span>年考核统计</h2>
            <div>
                <span><a style="color:#3e92fa; cursor: pointer" class="excle_out">导出列表</a></span>
                <span style="margin-left: 15px;" class="jCountReturn"><a style="color:#3e92fa;cursor: pointer">返回</a></span>
            </div>
            <%--表格数据--%>
            <table class="layui-table" lay-skin="line" id="table_search" style="margin: 15px auto;">
                <colgroup>
                    <col width="100">
                    <col width="230">
                    <col width="185">
                    <col width="185">
                    <col width="170">
                    <col width="170">
                    <col width="170">
                    <col width="170">
                </colgroup>
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>手机号</th>
                    <th>部门</th>
                    <th>岗位</th>
                    <th>优秀</th>
                    <th>合格</th>
                    <th>基本合格</th>
                    <th>不合格</th>
                </tr>
                </thead>
                <tbody id="examineCount-tbody" class="box_neirong_all">

                </tbody>
            </table>
            <%--分页相关--%>
            <div class="select_page_number">
                <div class="select_page_box" style="margin-left: 0px">
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
        <div id="choose-year">
            <div id="cad_title">
                <label id="title-text">新增年度考核</label>
                <label class="exit jexit">×</label>
            </div>
            <div id="neirong">
                <span class="chooseText">选择时间段</span>
                <div class="neirong-input">
                    <input name="startYear" type="text" class="input-text layui-input" id="startYear" value="" placeholder="选择年份">
                    <span style="display: block; margin: 27px 20px 0px 20px; float: left">至</span>
                    <input type="text" class="input-text layui-input" id="endYear" name="endYear" lay-key="3" value="" placeholder="选择年份" style="float: bottom">
                </div>
                <div id="countNum">
                    共<label id="countNum_lable" >&nbsp;  &nbsp;  </label> 年
                </div>
                <button type="button" class="count-button">提交</button>
            </div>
        </div>
    </div>
</body>
<script>
    layui.use(['laydate','layer'], function(){
        var laydate = layui.laydate;
        var layer = layui.layer;
        $("#countlist").hide()
        //点击返回按钮
        $(".jCountReturn").click(function(){
            $("#countlist").hide()
            $("#choose-year").show()
        })
        laydate.render({
            elem: '#startYear',
            type:'year',
            done:function(value){
                if($("#endYear").val()!=""){
                    if($("#endYear").val()<value){
                        layer.msg("开始时间不能大于结束时间",{icon:"2",time:2000})
                    }else{
                        $("#countNum_lable").html(" "+($("#endYear").val()-value+1))
                    }
                }
            }
        });
        laydate.render({
            elem: '#endYear',
            type:'year',
            done:function(value){
                if($("#startYear").val()!=""){
                    if($("#startYear").val()>value){
                        layer.msg("开始时间不能大于结束时间",{icon:"2",time:2000})
                    }else{
                        $("#countNum_lable").html(" "+(value-$("#startYear").val()+1))
                    }
                }
            }
        });
        var page=1;
        var total=0;
        //查询按钮提交
        $(".count-button").on("click",function(){
            var startYear = $("#startYear").val()
            var endYear = $("#endYear").val()
            if(startYear=="" || endYear ==""){
                layer.msg("请选择时间段",{icon:2,time:2000},function(){})
                return;
            }
            if(startYear>endYear){
                layer.msg("开始时间不能大于结束时间",{icon:"2",time:2000})
                return;
            }
            $("#title_startYear").html(startYear)
            $("#title_endYear").html(endYear)
            $("#choose-year").hide()
            $("#countlist").show()
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/examine/statistics",
                data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"startYear":startYear,"endYear":endYear},
                success:function(data){
                    console.log(data)
                    var my_table = "";
                    for(var i = 0;i<data.data.result.length;i++){
                        my_table+="<tr><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                            "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].excellent+"</td>" +
                            "<td>"+data.data.result[i].qualified+"</td><td>"+data.data.result[i].passMuster+"</td><td>"+data.data.result[i].unqualified+"</td></tr>"
                    }
                    page=data.data.pageNumber;
                    total=data.data.totalPages;
                    $("#examineCount-tbody").html(my_table)
                }
            })
        })
        //点击下一页
        $("#page_down").on("click",function(){
            var startYear = $("#startYear").val()
            var endYear = $("#endYear").val()
            if(page<total){
                page+=1;
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/examine/statistics",
                    data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"startYear":startYear,"endYear":endYear},
                    success:function(data){
                        console.log(data)
                        var my_table = "";
                        for(var i = 0;i<data.data.result.length;i++){
                            my_table+="<tr><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                                "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].excellent+"</td>" +
                                "<td>"+data.data.result[i].qualified+"</td><td>"+data.data.result[i].passMuster+"</td><td>"+data.data.result[i].unqualified+"</td></tr>"
                        }
                        page=data.data.pageNumber;
                        total=data.data.totalPages;
                        $("#examineCount-tbody").html(my_table)
                    }
                })
            }else{
                page=total
            }
        })
        //点击上一页
        $("#page_up").on("click",function(){
            var startYear = $("#startYear").val()
            var endYear = $("#endYear").val()
            if(page>1){
                page-=1;
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/examine/statistics",
                    data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"startYear":startYear,"endYear":endYear},
                    success:function(data){
                        console.log(data)
                        var my_table = "";
                        for(var i = 0;i<data.data.result.length;i++){
                            my_table+="<tr><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                                "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].excellent+"</td>" +
                                "<td>"+data.data.result[i].qualified+"</td><td>"+data.data.result[i].passMuster+"</td><td>"+data.data.result[i].unqualified+"</td></tr>"
                        }
                        page=data.data.pageNumber;
                        total=data.data.totalPages;
                        $("#examineCount-tbody").html(my_table)
                    }
                })
            }else{
                page=1
            }
        })
        //更换条数
        $("#select_rows").on("change",function(){
            var startYear = $("#startYear").val()
            var endYear = $("#endYear").val()
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/examine/statistics",
                data:{"pageNumber":page,"pageSize":$("#select_rows").val(),"startYear":startYear,"endYear":endYear},
                success:function(data){
                    console.log(data)
                    var my_table = "";
                    for(var i = 0;i<data.data.result.length;i++){
                        my_table+="<tr><td>"+data.data.result[i].name+"</td><td>"+data.data.result[i].phone+"</td>" +
                            "<td>"+data.data.result[i].deptName+"</td><td>"+data.data.result[i].postName+"</td><td>"+data.data.result[i].excellent+"</td>" +
                            "<td>"+data.data.result[i].qualified+"</td><td>"+data.data.result[i].passMuster+"</td><td>"+data.data.result[i].unqualified+"</td></tr>"
                    }
                    page=data.data.pageNumber;
                    total=data.data.totalPages;
                    $("#examineCount-tbody").html(my_table)
                }
            })
        })
        //返回主页
        $(".jexit").click(function(){
            window.location.href="examines";
        })
        //导出列表
        $(".excle_out").click(function(){
            //询问框
            layer.confirm('确认导出该员工信息吗', {
                btn: ['确认','取消'] //按钮
            }, function(){
                $(".excle_out").attr("href","${pageContext.request.contextPath}/examine/countExcleOut");
                console.log(document.getElementsByClassName("excle_out"))
                $(".excle_out").trigger("click")
                layer.closeAll();
            }, function(){
                layer.closeAll();
            });
        })
    })
</script>
</html>
