<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Excel表格信息导入</title>
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
    <script src="../js/jquery.min.js"></script>
    <style type="text/css">
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
        .tpl-content-wrapper {
            min-height: 800px;
        }
        #in-excel{
            margin: 0px auto;
            position: absolute;
            width: 850px;
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
        #title-text{ /*Excel导入*/
            font-weight: normal;
            font-size: 14px;
            line-height: 60px;
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
        /*内容div*/
        #big-count{
            margin-top: 35px;
        }
        .format-note{
            width: 760px;
            margin: 0px auto;
        }
        .download{
            float: right;
        }
        /*小标题文字格式*/
        .text-style{
            color: #555555;
            font-size: 13px;
        }
        .a-style{/*a标签样式*/
            color: #3e92fa;
            font-size: 13px;
            font-weight: lighter;
            cursor: pointer;
        }
        #table-demo{
            width: 760px;
            margin: 20px auto;
        }
        #table-demo th{
            border-right: 1px #d6d6d6 solid ;
            font-size: 14px;
            font-weight: bold;
            color: #555555;
        }
        #table-demo td{
            border-right: 1px #e6e6e6 solid ;
            font-size: 14px;
            color: #555555;
        }
        .upload{/*上传文字*/
            margin-left: 45px;
            margin-top: 40px;
            font-weight: normal;
        }
        #file-upload{/*上传域大小*/
            margin-left: 45px;
            width:400px;
            height: 200px;
            margin-top: 20px;
            margin-bottom: 80px;
            padding-top: 53px;
        }
        .layui-upload-drag .layui-icon {
            font-size: 50px;
            color:#b2b4b5;
        }
    </style>
</head>
<body>
    <div id="in-excel">
        <div id="title">
            <label id="title-text">Excel导入</label>
            <label class="exit jexit">×</label>
        </div>
        <div id="big-count">
            <div class="format-note">
                <span class="text-style">格式</span><label class="download a-style">下载Excel模板</label>
            </div>
            <table class="layui-table" lay-skin="line" id="table-demo">
                <colgroup>
                    <col width="80">
                    <col width="60">
                    <col width="100">
                </colgroup>
                <thead>
                    <tr>
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
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>李晓明</td>
                        <td>女</td>
                        <td>xxxxxxxxxxx</td>
                        <td>保教处</td>
                        <td>老师</td>
                        <td>助理级</td>
                        <td>初中</td>
                        <td>河南 郑州</td>
                        <td>在编</td>
                        <td>在职</td>
                    </tr>
                </tbody>
            </table>
            <div class="text-style upload">上传文件</div>
            <div class="layui-upload-drag" id="file-upload" name="file">
                <i class="layui-icon"></i>
                <p>点击上传，或将文件拖拽到此处</p>
            </div>
        </div>
    </div>
    <script src="../js/amazeui.min.js"></script>
    <script src="../js/amazeui.datatables.min.js"></script>
    <script src="../js/dataTables.responsive.min.js"></script>
    <script src="../js/app.js"></script>
    <script src="../js/jquery.form.js"></script>
    <script src="../plugins/layui/layui.js"></script>
    <script>
        layui.use(['upload','layer'],function(){
            $(".jexit").click(function(){
                window.location.href="toIndex"
            })
            var upload = layui.upload;
            var layer = layui.layer
            // 拖拽上传
            upload.render({
                elem: '#file-upload',
                url:'${pageContext.request.contextPath}/employee/batchadd',
                size:999999,//限制文件大小，单位kb
                exts: 'xls|xlsx',//允许上传文件的后缀
                //accept:'audio',文件类型 audio音频  video视频   file 普通文件
                done: function(data){
                    console.log(data)
                    if(data.success){
                        layer.msg(
                            '导入成功',
                            {
                                icon: 1,
                                time: 3000 //2秒关闭（如果不配置，默认是3秒）
                            },
                            function(){
                            });
                    }else{
                        layer.msg(
                            data.message,
                            {
                                icon: 2,
                                time: 5000 //2秒关闭（如果不配置，默认是3秒）
                            },
                            function(){
                            });
                    }
                }
            })
            //下载模板
            $(".download").click(function(){
                window.open("${pageContext.request.contextPath}/upload/employee/template.xls")
            })
        })
    </script>
</body>
</html>