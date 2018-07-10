<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新增表彰</title>
    <meta name="description" content="新增表彰">
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
        .tpl-content-wrapper {
            min-height: 800px;
        }
        #add-commend{
            margin: 0px auto;
            position: absolute;
            width: 830px;
            border: 1px #cfdee9 solid;
            background-color: #fff;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
        #title{
            width: 100%;
            height: 50px;
            background-color: #f3f3f3;
        }
        #title-text{ /*新增人员*/
            font-weight: normal;
            font-size: 14px;
            line-height: 54px;
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
            width: 328px !important;
            margin-left: 36px;
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
            borderadd-employee: none;
        }
        .empMenu {
            width : 244px;
            height : 220px;
            background-color: #ffffff;
            border: 1px #c8c8c8 solid;
            display: block;
            position: absolute;
            margin-left: 625px;
            z-index: 999;
        }
        .layui-input, .layui-textarea {
            display: block;
            width: 88%;
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
        #menuDept{
            position: relative;
            width: 50%;
            height: 100%;
            border: 1px #f2f2f2 solid;
            float: left;
            overflow: auto;
        }
        #deptEmp{
            background-color: #fff;
            position: relative;
            width: 50%;
            height: 100%;
            float: left;
            overflow: auto;
        }
        ::-webkit-scrollbar{
            display:none;
        }
        .menuDept_1{
            width: 100%;
            height: 43px;
            line-height: 43px;
            font-weight: lighter;
            font-size: 13px;
            text-align: center;
        }
        .menuEmp_1{
            width: 100%;
            height: 43px;
            line-height: 43px;
            font-weight: lighter;
            font-size: 13px;
            text-align: center;
        }
        .menuEmp_1 i{
            width: 15px !important;
            height: 15px;
        }
        #emp-tag{
            margin-left: 36px;
            height: 80px;
            overflow: auto;
            width: 330px;
        }
        /*.menuEmp_1.isText::after{*/
        /*content: "&#xe605";*/
        /*}*/
        /*选择人员后的图标*/
        .name-tag{
            width: 72px;
            height: 33px;
            background-color: #f2f2f2;
            display: inline-block;
            margin-top: 5px;
            margin-left: 5px;
            text-align: center;
            line-height: 33px;
            border-radius: 3px;
            position: relative;
        }
        /*图片上的删除按钮*/
        .name-tag-img{
            width: 15px;height: 15px;
            position: absolute;
            top: -6px;
            right: -3px;
        }
    </style>
</head>
<body>
<div class="" id="header">
    <div>
        <div class="title_pic"></div>
        <span class="all-text title">表彰统计</span>
    </div>
</div>
<div id="add-commend">
    <div id="title">
        <label id="title-text">修改表彰</label>
        <label class="exit jexitcomment">×</label>
    </div>
    <div id="neirong">
        <form action="${pageContext.request.contextPath}/commend/update" id="add-from" method="post">
            <table id="add-table">
                <tr style="display: none;">
                    <td id="oldfile"></td>
                </tr>
                <tr>
                    <td class="left-td">表彰人员</td>
                    <td class="right-td">
                        <input class="input-text layui-input" type="text" name="name" id="commend_name" readonly value="${name}">
                        <input class="input-text layui-input" type="hidden" name="id" id="commend_id" readonly value="${id}">
                        <input type="hidden" name="empId" id="empId" value="">
                    </td>
                </tr>
                <tr>
                    <td class="left-td">表彰级别</td>
                    <td class="right-td">
                        <select name="level" id="level" class="input-text layui-input layui-unselect">
                            <option value="园级">园级</option>
                            <option value="区级">区级</option>
                            <option value="省级">省级</option>
                            <option value="国家级">国家级</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">表彰名称</td>
                    <td class="right-td"><input name="commendName" id="commendName" class="input-text layui-input"  type="text" value=""></td>
                </tr>
                <tr>
                    <td class="left-td">获得时间</td>
                    <td class="right-td">
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input type="text" class="input-text layui-input" id="getTime" name="getTime" value="" placeholder="请选择日期">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="left-td">表彰描述</td>
                    <td class="right-td"><textarea placeholder="请输入描述" style="margin-left: 36px; margin-top: 6px;" id="commend-note" class="layui-textarea" name="note"></textarea></td>
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
                        <button type="button" class="form-button" id="testListAction">提交</button>
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
    layui.use(['laydate','layer','upload'], function() {
        var laydate = layui.laydate;
        var layer = layui.layer;
        var upload = layui.upload
        laydate.render({
            elem: '#getTime'
        });
        //加载该条数据
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/commend/findone",
            dataType:"json",
            data:{"id":${id}},
            success:function(data){
                console.log(data);
                $("#level").val(data.data.level);
                $("#commendName").val(data.data.commendName);
                $("#getTime").val(dateFormat(data.data.getTime.time));
                $("#commend-note").val(data.data.note);
                $("#empId").val(data.data.empId)
                var strUrl = data.data.url;
                var strFilename = data.data.fileName
                var filenames = strFilename.split("、")
                var urls = strUrl.split(",")
                var file_table = ""
                var num = ""
                for(var i = 0;i<urls.length-1;i++){
                    num+=1;
                    file_table+="<tr data-num='"+num+"'><td class='beforeAgreementFile' data-url='"+urls[i]+"'>"+filenames[i]+"</td>" +
                        "<td>未知</td><td style='color: #5fb878'>已上传</td><td><button class='layui-btn-mini demo-reload layui-hide'>重传</button>" +
                        "<button class='layui-btn-mini layui-btn-danger demo-delete my_remove_commend'>删除</button></td></tr>";
                }
                $("#demoList").html(file_table);
                $("#oldfile").html("<input type='hidden' value='"+strUrl+"' id='oldUrlInPut' name='oldUrl'/>" +
                    "<input type='hidden' name='oldFilename' value='"+strFilename+"' id='oldFilenameInPut'/>")
            }
        })
        //删除已上传文件列表
        $("#demoList").on("click",".my_remove_commend",function(){
            var num = $(this).parent().parent().attr("data-num");
            $("#demoList").find("tr[data-num="+num+"]").remove()
        })
        //修改提交
        $("#testListAction").click(function(){
            var level = $("#level").val();var commendName = $("#commendName").val();
            var getTime = $("#getTime").val(); var note = $("#commend-note").val();
            if(level=="" || commendName=="" || getTime=="" || note==""){
                layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
                return;
            }
            $("#add-from").ajaxSubmit(function(data){
                if(data.success){
                    layer.msg(data.message,{icon:1,time:2000},function(){})
                    window.location.href="commends"
                }else{
                    layer.msg(data.message,{icon:2,time:2000},function(){})
                }
            })
        })
        //多文件列表示例
        var demoListView = $('#demoList'),uploadListIns = upload.render({
            elem: '#testList'
            ,url: 'teacher/wanwan'
            ,accept: 'file'
            ,multiple: true
            ,auto: false
            ,bindAction: '#testListAction'
            ,choose: function(obj){
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function(index, file, result){
                    var tr = $(['<tr id="upload-'+ index +'">'
                        ,'<td>'+ file.name +'</td>'
                        ,'<td>'+ (file.size/1024).toFixed(1) +'kb</td>'
                        ,'<td>等待上传</td>'
                        ,'<td>'
                        ,'<button class="layui-btn-mini demo-reload layui-hide">重传</button>'
                        ,'<button class="layui-btn-mini layui-btn-danger demo-delete">删除</button>'
                        ,'</td>'
                        ,'</tr>'].join(''));
                    //单个重传
                    tr.find('.demo-reload').on('click', function(){
                        obj.upload(index, file);
                    });
                    //删除
                    tr.find('.demo-delete').on('click', function(){
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });
                    demoListView.append(tr);
                });
            }
            ,done: function(res, index, upload){
                var empIds = $("#empIds").val(); var deptIds = $("#deptIds").val(); var level = $("#level").val();
                var commendName = $("#commendName").val(); var getTime = $("#getTime").val(); var note = $("#commend-note").val();
                if(empIds=="" && deptIds==""){
                    layer.msg("请选择表彰人员",{icon:2,time:2000},function(){})
                    return;
                }
                if(level=="" || commendName=="" || getTime=="" || note==""){
                    layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
                    return;
                }else{
                    var tr = demoListView.find('tr#upload-'+ index)
                        ,tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
            }
            ,error: function(index, upload){
                var empIds = $("#empIds").val(); var deptIds = $("#deptIds").val(); var level = $("#level").val();
                var commendName = $("#commendName").val(); var getTime = $("#getTime").val(); var note = $("#commend-note").val();
                if(empIds=="" && deptIds==""){
                    layer.msg("请选择表彰人员",{icon:2,time:2000},function(){})
                    return;
                }
                if(level=="" || commendName=="" || getTime=="" || note==""){
                    layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
                    return;
                }else{
                    var tr = demoListView.find('tr#upload-'+ index)
                        ,tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
            }
        });
        //返回主页
        $(".jexitcomment").click(function(){
            window.location.href="commends"
        })
    })
    function dateFormat(time){
        var dateTime = new Date();
        dateTime.setTime(time);
        var year = dateTime.getFullYear()
        var month = dateTime.getMonth() + 1 < 10 ? "0" + (dateTime.getMonth() + 1) : dateTime.getMonth() + 1;
        var day = dateTime.getDate() < 10 ? "0" + dateTime.getDate() : dateTime.getDate();
        return year + "-" + month + "-" + day;
    }
</script>
</body>
</html>
