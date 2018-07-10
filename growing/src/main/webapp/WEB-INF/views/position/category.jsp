<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>职称类别</title>
    <meta name="description" content="这是一个 index 页面">
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
        .am-icon-cog:before, .am-icon-gear:before {
            content: "\f013";
            margin-top: 10px;
        }
        .tpl-content-wrapper {
            min-height: 700px;
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
        #add-dept{
            margin: 0px auto;
            position: absolute;
            width: 750px;
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
            padding: 20px 35px 50px 35px;
        }
    </style>
</head>
<div class="" id="header">
    <div>
        <div class="title_pic"></div>
        <span class="all-text title">职称类别管理</span>
    </div>
</div>
<div id="add-dept">
    <div id="title">
        <label id="title-text">职称类别</label>
        <label class="exit jexit">×</label>
    </div>
    <div id="neirong">
        <%--表格数据--%>
        <table class="layui-table" lay-skin="line" id="table_search" style="margin: 15px auto;">
            <colgroup>
                <col width="215">
                <col width="330">
                <col width="190">
                <col width="190">
            </colgroup>
            <thead>
            <tr>
                <th>分类名称</th>
                <th>分类描述</th>
                <th>职称数量</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="position-tbody" class="box_neirong_all">

            </tbody>
        </table>
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
        var layer = layui.layer
        //返回主页
        $(".jexit").click(function(){
            window.location.href="positions"
        })
        // 加载职称分类列表
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/position/categoryList",
            success:function(data){
                console.log(data)
                var value = ""
                for(var i = 0;i<data.data.length;i++){
                    value+="<tr data-id='"+data.data[i].id+"'><td>"+data.data[i].cateName+"</td><td>"+data.data[i].note+"</td>" +
                        "<td>"+data.data[i].empNum+"</td>" +
                        "<td><a href='##' class='cate-update'>修改</a>&nbsp;  <a href='##' class='cate-remove'>删除</a></td></tr>"
                }
                $("#position-tbody").html(value)
            }
        })
        //删除
        $("#position-tbody").on("click",".cate-remove",function(){
            var id = $(this).parent().parent().attr("data-id")
            layer.confirm('确定删除该条信息？',{btn: ['确定','取消'] //按钮,
                    ,area: ['300px', '180px']},
                function(index){
                    console.log(index)
                    $.ajax({
                        type:"POST",
                        url:"${pageContext.request.contextPath}/position/deleteCategory/"+id,
                        success:function(data){
                            if(data.success){
                                $("#position-tbody").find("tr[data-id="+id+"]").remove()
                                layer.msg(data.message,{icon:"1",time:"2000"},function(){})
                            }else{
                                layer.msg(data.message,{icon:"2",time:"2000"},function(){})
                            }
                        }
                    })
                },function(index){
                    console.log(index)
                })
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/position/deleteCategory/"+id,
                success:function(data){
                    if(data.success){
                        $("#position-tbody").find("tr[data-id="+id+"]").remove()
                        layer.msg(data.message,{icon:"1",time:"2000"},function(){})
                    }else{
                        layer.msg(data.message,{icon:"2",time:"2000"},function(){})
                    }
                }
            })
        })
        //修改
        $("#position-tbody").on("click",".cate-update",function(){
            var id = $(this).parent().parent().attr("data-id")
            $(".bigContent").load("toUpdateCategory/"+id)
        })
    })

</script>
</body>
</html>
