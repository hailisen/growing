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
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
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
            <label id="title-text">新增表彰</label>
            <label class="exit jexit">×</label>
        </div>
        <div id="neirong">
            <form action="${pageContext.request.contextPath}/commend/add" id="add-from" method="post">
                <table id="add-table">
                    <tr>
                        <td class="left-td">表彰人员</td>
                        <td class="right-td">
                            <input class="input-text layui-input" type="text" name="empNos" id="empNos_input" readonly value=""  placeholder="选择人员">
                            <input type="hidden" value="" name="empIds" id="empIds">
                            <input type="hidden" value="" name="deptIds" id="deptIds">
                        </td>
                        <div class="empMenu" id="empNos">
                            <div id="menuDept">
                                <div class="menuDept_1 jmenuDept_all jmenuDept_1" data-dId="">
                                    全部
                                </div>
                            </div>
                            <div id="deptEmp">
                                <div class="menuEmp_1 jmenuEmp_all">
                                全部
                                </div>
                            </div>
                        </div>
                    </tr>
                    <tr id="add_tag">
                        <td class="left-td"></td>
                        <td class="right-td">
                            <div id="emp-tag">

                            </div>
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
            //添加提交
            $("#testListAction").click(function(){
                //获取员工ID信息填入到empIds文本框中，获取部门Id信息填入到deptId文本框中
                var spanDepts = $("#emp-tag").find("span[data_deptid]");
                var spanEmps = $("#emp-tag").find("span[data-empid]");
                var depeIds = ""
                var empIds = ""
                for(var i = 0;i<spanDepts.length;i++){
                    depeIds+=$(spanDepts[i]).attr("data_deptid")+",";
                }//获取所选部门ID和员工ID并填入到文本框
                for(var j = 0;j<spanEmps.length;j++){
                    empIds+=$(spanEmps[j]).attr("data-empid")+",";
                }
                $("#empIds").val(empIds)
                $("#deptIds").val(depeIds)
                var empIds = $("#empIds").val(); var deptIds = $("#deptIds").val(); var level = $("#level").val();
                var commendName = $("#commendName").val(); var getTime = $("#getTime").val(); var note = $("#commend-note").val();
                if(empIds=="" && deptIds==""){
                    layer.msg("请选择表彰人员",{icon:2,time:2000},function(){})
                    return;
                }
                if(level=="" || commendName=="" || getTime=="" || note==""){
                    layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
                    return;
                }
                $("#add-from").ajaxSubmit(function(data){
                    console.log(data);
                    if(data.success){
                        layer.msg(data.message,{icon:1,time:2000},function(){})
                        window.location.href="commends"
                    }else{
                        layer.msg(data.message,{icon:2,time:2000},function(){})
                    }
                })
            })
            $("#add_tag").hide()//标签框隐藏
            $(".empMenu").hide()//员工选择框隐藏
            $("#empNos_input").on("click",function(){
                $(".empMenu").show()
                $(document).one("click",
                    function() { //对document绑定一个影藏Div方法
                        $(".empMenu").hide();
                    });
                event.stopPropagation();//阻止事件向上冒泡
            })
            $(".empMenu").click(function(event) {
                event.stopPropagation(); //阻止事件向上冒泡
            });
            var jsonObject =[];
            //点击x删除选择的员工
            $("#emp-tag").on("click",".jname-tag-img",function(){
                $(this).parent().remove();
                var data_empid = $(this).parent().attr("data-empid");
                var data_deptid = $(this).parent().attr("data_deptid");
                if(data_empid!="" && data_empid!=null){
                    $("#deptEmp").find("div[data_empid="+data_empid+"]").removeClass("isText")
                    $("#deptEmp").find("div[data_empid="+data_empid+"]").find("i").removeClass("layui-icon-ok")
                    $("#deptEmp").find("div[data_empid="+data_empid+"]").find("i").html("")
                }
                if(data_deptid!="" && data_deptid!=null){
                    var deptId = $("#deptEmp").attr("data_deptid")
                    if(deptId==data_deptid){
                        var divs = $("#deptEmp").find("div")
                        for(var i = 1;i<divs.length;i++){
                            $(divs[0]).removeClass("isText");
                            $(divs[0]).find("i").removeClass("layui-icon-ok")
                            $(divs[0]).find("i").html("")
                        }
                    }
                }
                //判断是否还有标签，如果没有则隐藏
                var spans = $("#emp-tag").find("span");
                if(spans.length<=0){
                    $("#add_tag").hide()
                }
            })
            //选择员工
            $("#deptEmp").on("click",".jmenuEmp_1",function(){
                $("#add_tag").show()
                if($(this).hasClass("isText")){
                    $(this).removeClass("isText")
                    $(this).find("i").removeClass("layui-icon-ok")
                    $(this).find("i").html("")
                    var empName = $(this).html()
                    empName = empName.split("<",1);
                    var data_empid = $(this).attr("data_empid")
                    var spans = $("#emp-tag").find("span[data-empId="+data_empid+"]")
                    $("#emp-tag").find("span[data-empId="+data_empid+"]").remove()
                    //判断是否还有标签，如果没有则隐藏
                    var spans = $("#emp-tag").find("span");
                    if(spans.length<=0){
                        $("#add_tag").hide()
                    }
                }else{
                    $(this).find("i").addClass("layui-icon-ok")
                    $(this).find("i").html("  &#xe605;")
                    $(this).addClass("isText");
                    var empName = $(this).html()
                    empName = empName.split("<",1);
                    var data_empid = $(this).attr("data_empid")
                    var spans = $("#emp-tag").find("span[data-empId="+data_empid+"]")
                    if(spans.length<=0){
                        var value = "<span class='name-tag'data-empId="+data_empid+">"+empName+
                            "<img src='${pageContext.request.contextPath}/images/close-circle.png' title='' class='name-tag-img jname-tag-img'/></span>"
                        $("#emp-tag").append(value)
                    }
                }
            })
            //选择全部员工
            $("#deptEmp").on("click",".jmenuEmp_all",function(){
                $("#add_tag").show()
                if($("#deptEmp").find(".jmenuEmp_all").hasClass("isText")){
                    $("#deptEmp").find(".jmenuEmp_all").removeClass("isText")
                    $("#deptEmp").find(".jmenuEmp_1").removeClass("isText")
                    $("#deptEmp").find("i").removeClass("layui-icon-ok")
                    $("#deptEmp").find("i").html("")
                    //点击选择全部员工，先获取员工的部门ID，然后根据部门ID属性，获取部门id对应的部门名称
                    var data_deptId = $(this).parent().attr("data_deptId")
                    //如果data_deptId==null,则说明选择了所有部门,把部门该属性data_deptId的标签删除
                    $("#emp-tag").find("span[data_deptId]").remove()
                }else{
                    $("#deptEmp").find(".jmenuEmp_all").addClass("isText")
                    $("#deptEmp").find(".jmenuEmp_1").addClass("isText")
                    $("#deptEmp").find("i").addClass("layui-icon-ok")
                    $("#deptEmp").find("i").html("  &#xe605;")
                    //点击选择全部员工，先获取员工的部门ID，然后根据部门ID属性，获取部门id对应的部门名称
                    var data_deptId = $(this).parent().attr("data_deptId")
                    //如果data_deptId==null或""  说明选择的是全部部门则将全部部门添加
                    if(data_deptId=="" || data_deptId==null){
                        var value=""
                        var deptDivs = $("#menuDept").find("div")
                        for(var j = 1;j<deptDivs.length;j++){
                            var deptName = $(deptDivs[j]).html()
                            data_deptId = $(deptDivs[j]).attr("data-did")
                            var value="<span class='name-tag'data_deptId="+data_deptId+">"+deptName+
                                "<img src='${pageContext.request.contextPath}/images/close-circle.png' title='' class='name-tag-img jname-tag-img'/></span>"
                            $("#emp-tag").append(value)
                        }
                    }else{
                        var deptName = $("#menuDept").find("div[data-did="+data_deptId+"]").html()
                        var spans = $("#emp-tag").find("span[data_deptId="+data_deptId+"]")
                        if(spans.length<=0){
                            var value = "<span class='name-tag'data_deptId="+data_deptId+">"+deptName+
                                "<img src='${pageContext.request.contextPath}/images/close-circle.png' title='' class='name-tag-img jname-tag-img'/></span>"
                            $("#emp-tag").append(value)
                        }
                    }

                }
            })
            //选择全部部门
            $("#menuDept").on("click",".jmenuDept_all",function(){
                $(".menuDept_1").css("background-color","#f2f2f2");
            })
            //选择部门加载员工列表
            $("#menuDept").on("click",".jmenuDept_1",function(){
                $(".menuDept_1").css("background-color","#fff");
                $(this).css("background-color","#f2f2f2")
                var data_dId =  $(this).attr("data-dId")//获取部门ID
                var empJson = [];
                var value="<div class='menuEmp_1 jmenuEmp_all'>全部</div>";
                for(var i = 0;i<jsonObject.length;i++){
                    if(data_dId==""){
                        empJson = jsonObject[i].emps;
                        for(var j = 0;j<empJson.length;j++){
                            value+="<div class='menuEmp_1 jmenuEmp_1' data_empid='"+empJson[j].empId+"'>"+empJson[j].name+"<i class='layui-icon'></i></div>"
                        }
                    }else{
                        if(data_dId==jsonObject[i].id){
                            empJson = jsonObject[i].emps;
                            for(var j = 0;j<empJson.length;j++){
                                value+="<div class='menuEmp_1 jmenuEmp_1' data_empid='"+empJson[j].empId+"'>"+empJson[j].name+"<i class='layui-icon'></i></div>"
                            }
                        }
                    }
                }
                $("#deptEmp").attr("data_deptId",data_dId);
                $("#deptEmp").html(value)
            })
            //加载部门列表
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/employee/findEmpByDept",
                success:function(data){
                    jsonObject = data.data;
                    var value = "<div class='menuDept_1 jmenuDept_all jmenuDept_1' data-dId=''>全部</div>";
                    for(var i = 0; i<data.data.length;i++){
                        value+="<div class='menuDept_1 jmenuDept_1' data-dId='"+data.data[i].id+"'>"+data.data[i].deptName+"</div>"
                    }
                    $("#menuDept").html(value);
                }
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
            $(".jexit").click(function(){
                window.location.href="commends"
            })
        })
    </script>
</body>
</html>
