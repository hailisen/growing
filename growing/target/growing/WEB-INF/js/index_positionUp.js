$(function(){
    var page_p=1;
    var total_p=0;//总页数
    var deptId = $("#deptId").val();
    var postId = $("#postId").val();
    var positionId = $("#positionId").val()
    var nature = $("#nature").val()
    var eduBackground = $("#eduBackground").val()
    var state = $("#state").val()
    var nameOrPhone = $("#index-input-position").val()
    var tableBody = "";
    var idList = new Array()
    var chooseId = new Array()
    //选中数据
    $("#check-input-position").change(function(){
        if($("#check-input-position").prop("checked")){
            $("#box_neirong_position").find(".position_box").css("display","none")
            $("#box_neirong_position").find(".position_box").prop("checked",true)
            $("#box_neirong_position").find(".position_box").css("display","block")
            var trs = $("#box_neirong_position").find("tr[data-id]")
            for(var i = 0;i<trs.length;i++){
                var id = $(trs[i]).attr("data-id")
                removeIndex(idList,id)
                chooseId.push(id)
            }
        }else{
            $(".position_box").prop("checked",false)
            var trs = $("#box_neirong_position").find("tr[data-id]")
            for(var i = 0;i<trs.length;i++){
                var id = $(trs[i]).attr("data-id")
                removeIndex(chooseId,id)
                idList.push(id)
            }
        }
    })
    //反选(未选中数据数组)
    $("#box_neirong_position").on("change",".position_box",function(){
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
    $(".j_excel_out_position").click(function(){
        //是否全选
        if($("#check-input-position").prop("checked")){//全选，把未选择的ID数组传入
            $(".j_excel_out_position").attr("href","employee/excleout/position?notChoose="+idList)
            document.getElementsByClassName("j_excel_out_position").onclick();
        }else{//非全选，选择列表传给接口
            var checkeds = $("#box_neirong_position").find("input[type=checkbox]:checked")
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
            $(".j_excel_out_position").attr("href","employee/excleout/position?chooseId="+chooseId)
            document.getElementsByClassName("j_excel_out_position").onclick();
        }
    })

    //点击查看职称到期的列表
    $(".a-positionUp").click(function(){
        var mytable="";
        $("#indexContext").hide();
        $("#agreementContext").hide();
        $("#positionContext").show();
        $.ajax({
            type:"POST",
            url:"employee/position",
            dataType:"json",
            data:{"pageNumber":page_p,"pageSize":$("#select_rows_position").val(),"deptId":deptId,"postId":postId,
                "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                "state":state,"nameOrPhone":nameOrPhone},
            success:function(data){
                for(var i=0;i<data.data.result.length;i++) {
                    var state = data.data.result[i].status;
                    var nature = data.data.result[i].nature;
                    if (state == "0") {
                        state = "离职";
                    } else if ("1") {
                        state = "在职";
                    } else if ("2") {
                        state = "退休";
                    } else if ("3") {
                        state = "返聘";
                    }
                    if (nature == "0") {
                        nature = "在编";
                    } else if ("1") {
                        nature = "人事代理";
                    } else if ("2") {
                        nature = "非人事代理";
                    } else if ("3") {
                        nature = "退休返聘";
                    }
                    mytable+="<tr data-id='"+data.data.result[i].id+"'><td><input type='checkbox' class='position_box'></td>"+
                        "<td>"+data.data.result[i].name+"</td>"+
                        "<td>"+data.data.result[i].sex+"</td>"+
                        "<td>"+data.data.result[i].phone+"</td>"+
                        "<td>"+data.data.result[i].deptName+"</td>"+
                        "<td>"+data.data.result[i].postName+"</td>"+
                        "<td><font color='#00811f'>"+data.data.result[i].positionName+"（可晋级）</font></td>"+
                        "<td>"+data.data.result[i].eduBackground+"</td>"+
                        "<td>"+data.data.result[i].navitePlace+"</td>"+
                        "<td>"+nature+"</td>"+
                        "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                }
                $("#box_neirong_position").html(mytable)
                page_p=data.data.pageNumber;
                total_p=data.data.totalPages;
            }
        })
    })
    //点击查询按钮
    $(".jselect-btn-position").click(function(){
        var mytable=""
        var deptId = $("#deptId").val();
        var postId = $("#postId").val();
        var positionId = $("#positionId").val()
        var nature = $("#nature").val()
        var eduBackground = $("#eduBackground").val()
        var state = $("#state").val()
        var nameOrPhone = $("#index-input-position").val()
        $.ajax({
            type:"POST",
            url:"employee/position",
            dataType:"json",
            data:{"pageNumber":page_p,"pageSize":$("#select_rows_position").val(),"deptId":deptId,"postId":postId,
                "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                "state":state,"nameOrPhone":nameOrPhone},
            success:function(data){
                for(var i=0;i<data.data.result.length;i++) {
                    var state = data.data.result[i].status;
                    var nature = data.data.result[i].nature;
                    if (state == "0") {
                        state = "离职";
                    } else if ("1") {
                        state = "在职";
                    } else if ("2") {
                        state = "退休";
                    } else if ("3") {
                        state = "返聘";
                    }
                    if (nature == "0") {
                        nature = "在编";
                    } else if ("1") {
                        nature = "人事代理";
                    } else if ("2") {
                        nature = "非人事代理";
                    } else if ("3") {
                        nature = "退休返聘";
                    }
                    var checkbox = ""
                    if($("#check-input-position").prop("checked")){//全选，判断idList中被取消的checkbox
                        var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                        for(var j=0; j<idList.length;j++){
                            if(idList[j]==data.data.result[i].id){
                                b = true;
                            }
                        }
                        if(b){
                            checkbox="<input type='checkbox' class='position_box'>"
                        }else{
                            checkbox="<input type='checkbox' class='position_box' checked='checked'>"
                        }
                    }else{//没有全选,判断chooseId中选取的checkbox,加入到
                        var b = false;
                        for(var j=0; j<chooseId.length;j++){
                            if(chooseId[j]==data.data.result[i].id){
                                b = true;
                            }
                        }
                        if(b){
                            checkbox="<input type='checkbox' class='position_box' checked='checked'>"
                        }else{
                            checkbox="<input type='checkbox' class='position_box'>"
                        }
                    }
                    mytable+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                        "<td>"+data.data.result[i].name+"</td>"+
                        "<td>"+data.data.result[i].sex+"</td>"+
                        "<td>"+data.data.result[i].phone+"</td>"+
                        "<td>"+data.data.result[i].deptName+"</td>"+
                        "<td>"+data.data.result[i].postName+"</td>"+
                        "<td><font color='#00811f'>"+data.data.result[i].positionName+"（可晋级）</font></td>"+
                        "<td>"+data.data.result[i].eduBackground+"</td>"+
                        "<td>"+data.data.result[i].navitePlace+"</td>"+
                        "<td>"+nature+"</td>"+
                        "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                }
                $("#box_neirong_position").html(mytable)
                page_p=data.data.pageNumber;
                total_p=data.data.totalPages;
            }
        })
    })
    //更改每页显示的数量
    $("#select_rows_position").change(function(){
        var my_table=""
        $.ajax({
            type:"POST",
            url:"employee/position",
            dataType:"json",
            data:{"pageNumber":page_p,"pageSize":$("#select_rows_position").val(),"deptId":deptId,"postId":postId,
                "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                "state":state,"nameOrPhone":nameOrPhone},
            success:function(data){
                console.log(data)
                for(var i=0;i<data.data.result.length;i++) {
                    var state = data.data.result[i].status;
                    var nature = data.data.result[i].nature;
                    if (state == "0") {
                        state = "离职";
                    } else if ("1") {
                        state = "在职";
                    } else if ("2") {
                        state = "退休";
                    } else if ("3") {
                        state = "返聘";
                    }
                    if (nature == "0") {
                        nature = "在编";
                    } else if ("1") {
                        nature = "人事代理";
                    } else if ("2") {
                        nature = "非人事代理";
                    } else if ("3") {
                        nature = "退休返聘";
                    }
                    var checkbox = ""
                    if($("#check-input-position").prop("checked")){//全选，判断idList中被取消的checkbox
                        var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                        for(var j=0; j<idList.length;j++){
                            if(idList[j]==data.data.result[i].id){
                                b = true;
                            }
                        }
                        if(b){
                            checkbox="<input type='checkbox' class='position_box'>"
                        }else{
                            checkbox="<input type='checkbox' class='position_box' checked='checked'>"
                        }
                    }else{//没有全选,判断chooseId中选取的checkbox,加入到
                        var b = false;
                        for(var j=0; j<chooseId.length;j++){
                            if(chooseId[j]==data.data.result[i].id){
                                b = true;
                            }
                        }
                        if(b){
                            checkbox="<input type='checkbox' class='position_box' checked='checked'>"
                        }else{
                            checkbox="<input type='checkbox' class='position_box'>"
                        }
                    }
                    my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                        "<td>"+data.data.result[i].name+"</td>"+
                        "<td>"+data.data.result[i].sex+"</td>"+
                        "<td>"+data.data.result[i].phone+"</td>"+
                        "<td>"+data.data.result[i].deptName+"</td>"+
                        "<td>"+data.data.result[i].postName+"</td>"+
                        "<td><font color='#00811f'>"+data.data.result[i].positionName+"（可晋级）</font></td>"+
                        "<td>"+data.data.result[i].eduBackground+"</td>"+
                        "<td>"+data.data.result[i].navitePlace+"</td>"+
                        "<td>"+nature+"</td>"+
                        "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                }
                $("#box_neirong_position").html(my_table)
                page_p=data.data.pageNumber;
                total_p=data.data.totalPages;
            }
        })
    })
    //点击上一页
    $("#page_up_position").click(function(){
        var my_table="";
        if(page_p>1){
            page_p-=1
            $.ajax({
                type:"POST",
                url:"employee/position",
                dataType:"json",
                data:{"pageNumber":page_p,"pageSize":$("#select_rows_position").val(),"deptId":deptId,"postId":postId,
                    "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                    "state":state,"nameOrPhone":nameOrPhone},
                success:function(data){
                    console.log(data)
                    for(var i=0;i<data.data.result.length;i++) {
                        var state = data.data.result[i].status;
                        var nature = data.data.result[i].nature;
                        if (state == "0") {
                            state = "离职";
                        } else if ("1") {
                            state = "在职";
                        } else if ("2") {
                            state = "退休";
                        } else if ("3") {
                            state = "返聘";
                        }
                        if (nature == "0") {
                            nature = "在编";
                        } else if ("1") {
                            nature = "人事代理";
                        } else if ("2") {
                            nature = "非人事代理";
                        } else if ("3") {
                            nature = "退休返聘";
                        }
                        var checkbox = ""
                        if($("#check-input-position").prop("checked")){//全选，判断idList中被取消的checkbox
                            var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                            for(var j=0; j<idList.length;j++){
                                if(idList[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='position_box'>"
                            }else{
                                checkbox="<input type='checkbox' class='position_box' checked='checked'>"
                            }
                        }else{//没有全选,判断chooseId中选取的checkbox,加入到
                            var b = false;
                            for(var j=0; j<chooseId.length;j++){
                                if(chooseId[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='position_box' checked='checked'>"
                            }else{
                                checkbox="<input type='checkbox' class='position_box'>"
                            }
                        }
                        my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                            "<td>"+data.data.result[i].name+"</td>"+
                            "<td>"+data.data.result[i].sex+"</td>"+
                            "<td>"+data.data.result[i].phone+"</td>"+
                            "<td>"+data.data.result[i].deptName+"</td>"+
                            "<td>"+data.data.result[i].postName+"</td>"+
                            "<td><font color='#00811f'>"+data.data.result[i].positionName+"（可晋级）</font></td>"+
                            "<td>"+data.data.result[i].eduBackground+"</td>"+
                            "<td>"+data.data.result[i].navitePlace+"</td>"+
                            "<td>"+nature+"</td>"+
                            "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                    }
                    $("#box_neirong_position").html(my_table)
                    page_p=data.data.pageNumber;
                }
            })
        }else{
            page_p=1
        }
    })
    //点击下一页
    $("#page_down_position").click(function(){
        var my_table=""
        if(page_p<total_p){
            page_p+=1
            $.ajax({
                type:"POST",
                url:"employee/position",
                dataType:"json",
                data:{"pageNumber":page_p,"pageSize":$("#select_rows_position").val(),"deptId":deptId,"postId":postId,
                    "positionId":positionId,"nature":nature,"eduBackground":eduBackground,
                    "state":state,"nameOrPhone":nameOrPhone},
                success:function(data){
                    console.log(data)
                    for(var i=0;i<data.data.result.length;i++) {
                        var state = data.data.result[i].status;
                        var nature = data.data.result[i].nature;
                        if (state == "0") {
                            state = "离职";
                        } else if ("1") {
                            state = "在职";
                        } else if ("2") {
                            state = "退休";
                        } else if ("3") {
                            state = "返聘";
                        }
                        if (nature == "0") {
                            nature = "在编";
                        } else if ("1") {
                            nature = "人事代理";
                        } else if ("2") {
                            nature = "非人事代理";
                        } else if ("3") {
                            nature = "退休返聘";
                        }
                        var checkbox = ""
                        if($("#check-input-position").prop("checked")){//全选，判断idList中被取消的checkbox
                            var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                            for(var j=0; j<idList.length;j++){
                                if(idList[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='position_box'>"
                            }else{
                                checkbox="<input type='checkbox' class='position_box' checked='checked'>"
                            }
                        }else{//没有全选,判断chooseId中选取的checkbox,加入到
                            var b = false;
                            for(var j=0; j<chooseId.length;j++){
                                if(chooseId[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='position_box' checked='checked'>"
                            }else{
                                checkbox="<input type='checkbox' class='position_box'>"
                            }
                        }
                        my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                            "<td>"+data.data.result[i].name+"</td>"+
                            "<td>"+data.data.result[i].sex+"</td>"+
                            "<td>"+data.data.result[i].phone+"</td>"+
                            "<td>"+data.data.result[i].deptName+"</td>"+
                            "<td>"+data.data.result[i].postName+"</td>"+
                            "<td><font color='#00811f'>"+data.data.result[i].positionName+"（可晋级）</font></td>"+
                            "<td>"+data.data.result[i].eduBackground+"</td>"+
                            "<td>"+data.data.result[i].navitePlace+"</td>"+
                            "<td>"+nature+"</td>"+
                            "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                    }
                    $("#box_neirong_position").html(my_table)
                    page_p=data.data.pageNumber;
                }
            })
        }else{
            page_p=total_p
        }
    })
})