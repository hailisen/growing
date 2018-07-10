//教师详情---添加人员变动
layui.use(['upload','laydate','layer'], function(){
    var layer = layui.layer;
    //点击新增按钮
    $(".jadd-changed").click(function(){
        $("#countDiv").hide()
        $("#addChange").show()
        $("#change-title-text").html("新增变动")
        $("#change-update-from").attr("action","teacher/change");
        $(".jagreement-form-button").attr("id","addChangeButn");
    })
    //点击修改按钮
    $("#box_neirong_changed").on("click","#change-update",function(){
        $("#countDiv").hide()
        $("#addChange").show()
        $("#change-title-text").html("修改变动")
        $("#change-update-from").attr("action","teacher/updateChange");
        $(".jagreement-form-button").attr("id","changeChangeButn");
        //把信息填充到变更表单中
        var id = $(this).parent().parent().attr("data-id")
        $("#update-changeId").attr("value",id)
        $.ajax({
            type:"POST",
            url:"teacher/findOneChanged/"+id,
            dataType:"json",
            data:{},
            success:function(data){
                console.log(data)
                $("#change-dept").val(data.data.deptId)
                var postId = data.data.changed.postId;
                $.ajax({
                    type:"POST",
                    url:"employee/getPost",
                    dataType:"json",
                    data:{"deptId":data.data.deptId},
                    success:function(data){
                        var value = "<option value=''>请选择岗位...</option>"
                        for(var i = 0;i<data.data.length;i++){
                            if(data.data[i].id==postId){
                                value+="<option value='"+data.data[i].id+"' selected>"+data.data[i].postName+"</option>"
                            }else{
                                value+="<option value='"+data.data[i].id+"'>"+data.data[i].postName+"</option>"
                            }
                        }
                        $("#change-post").html(value)
                    }
                })
                $("#change-status").val(data.data.changed.status)
                $("#change-nature").val(data.data.changed.nature)
                $("#changeTime").val(timeStamp2String(data.data.changed.changeTime.time))
            }
        })
    })
    //修改提交
    $("#change-update-from").on("click","#changeChangeButn",function(){
        var deptId = $("#change-dept").val()
        var postId = $("#change-post").val()
        var deptName = $("#change-dept").find("option:selected").text();
        var postName = $("#change-post").find("option:selected").text();
        var status = $("#change-status").find("option:selected").text();
        var nature = $("#change-nature").find("option:selected").text();
        var changeTime = $("#changeTime").val()
        if(deptId==""||postId==""||changeTime==""){
            layer.msg("请填写完整信息",{icon:5,time:1500},function(){})
            return;
        }
        $("#change-update-from").ajaxSubmit(function(data){
            console.log(data)
            if(data.success){
                var id = data.data;
                //将yyyy-MM-dd改为yyyy年MM月dd日的格式
                var reg = /(\d{4})\-(\d{2})\-(\d{2})/;
                changeTime = changeTime.replace(reg,"$1年$2月$3日")
                $("#box_neirong_changed").find("tr[data-id="+id+"]").remove()
                var value = "<tr data-id='"+id+"'><td>"+changeTime+"</td><td>"+deptName+"</td><td>"+postName+"</td><td>"+nature+"</td><td>"+status+"</td>" +
                    "<td><a href='##' id='change-update' style='cursor: pointer;'>修改</a>&nbsp;  <a href='##' id='change-remove' style='cursor: pointer;'>删除</a></td></tr>";
                $("#box_neirong_changed").append(value);
                layer.msg(data.message,{icon:1,time:1500},function(){})
            }else{
                layer.msg(data.message,{icon:1,time:1500},function(){})
            }
        })
    })
    //新增提交
    $("#change-update-from").on("click","#addChangeButn",function(){
        var deptId = $("#change-dept").val()
        var postId = $("#change-post").val()
        var deptName = $("#change-dept").find("option:selected").text();
        var postName = $("#change-post").find("option:selected").text();
        var status = $("#change-status").find("option:selected").text();
        var nature = $("#change-nature").find("option:selected").text();
        var changeTime = $("#changeTime").val()
        if(deptId==""||postId==""||changeTime==""){
            layer.msg("请填写完整信息",{icon:5,time:1500},function(){})
            return;
        }
        $("#change-update-from").ajaxSubmit(function(data){
            console.log(data)
            if(data.success){
                layer.msg(data.message,{icon:1,time:1000},function(){})
                //将yyyy-MM-dd改为yyyy年MM月dd日的格式
                var reg = /(\d{4})\-(\d{2})\-(\d{2})/;
                changeTime = changeTime.replace(reg,"$1年$2月$3日")
                var value = "<tr data-id='"+data.data+"'><td>"+changeTime+"</td><td>"+deptName+"</td><td>"+postName+"</td><td>"+nature+"</td><td>"+status+"</td>" +
                    "<td><a href='##' id='change-update' style='cursor: pointer;'>修改</a>&nbsp;  <a href='##' id='change-remove' style='cursor: pointer;'>删除</a></td></tr>";
                $("#box_neirong_changed").append(value)
            }else{
                layer.msg(data.message,{icon:2,time:2000},function(){})
            }
        })
    })
    //点击删除按钮
    $("#box_neirong_changed").on("click","#change-remove",function(){
        var id = $(this).parent().parent().attr("data-id")
        layer.confirm('确认删除该条信息？', {
                btn: ['确定','取消'] //按钮,
                ,area: ['300px', '180px']
            },function(index){
                layer.close(index)
                $.ajax({
                type:"POST",
                url:"teacher/deleteChange/"+id,
                dateType:"json",
                data:{},
                success:function(data){
                    if(data.success){
                        $("#box_neirong_changed").find("tr[data-id="+id+"]").remove()
                        layer.msg(data.message,{icon:1,time:1000},function(){})
                    }else{
                        layer.msg(data.message,{icon:2,time:1000},function(){})
                    }
                }
            })
            },function(index){
                layer.close(index)
        })
    })
    //加载部门列表
    $.ajax({
        type:"POST",
        url:"employee/getDept",
        dataType:"json",
        data:{},
        success:function(data){
            var value = "<option value=''>请选择部门...</option>"
            for(var i = 0;i<data.data.length;i++){
                value+="<option value='"+data.data[i].id+"'>"+data.data[i].deptName+"</option>"
            }
            $("#change-dept").html(value)
        }
    })
    //加载岗位列表
    $.ajax({
        type:"POST",
        url:"employee/getPost",
        dataType:"json",
        success:function(data){
            console.log(data)
            if(data.success){
                var value = "<option value=''>请选择岗位...</option>"
                for(var i = 0;i<data.data.length;i++){
                    value+="<option value='"+data.data[i].id+"'>"+data.data[i].postName+"</option>"
                }
                $("#change-post").html(value)
            }else{
                var value = "<option value=''>请选择岗位...</option>"
                $("#change-post").html(value)
            }
        }
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
})