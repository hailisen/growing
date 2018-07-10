$(function(){
    var page_a=1;
    var total_a=0;//总页数
    var deptId = $("#index_deptId").val();
    var postId = $("#index_postId").val();
    var nature = $("#index_nature").val()
    var eduBackground = $("#eduBackground").val()
    var nameOrPhone = $("#index-input-agreement").val()
    var idList = new Array()
    var chooseId = new Array()
    //选中数据
    $("#check-input-agreement").change(function(){
        if($("#check-input-agreement").prop("checked")){
            $("#box_neirong_agreement").find(".agreement_box").css("display","none")
            $("#box_neirong_agreement").find(".agreement_box").prop("checked",true)
            $("#box_neirong_agreement").find(".agreement_box").css("display","block")
            var trs = $("#box_neirong_agreement").find("tr[data-id]")
            for(var i = 0;i<trs.length;i++){
                var id = $(trs[i]).attr("data-id")
                removeIndex(idList,id)
                chooseId.push(id)
            }
        }else{
            $(".agreement_box").prop("checked",false)
            var trs = $("#box_neirong_agreement").find("tr[data-id]")
            for(var i = 0;i<trs.length;i++){
                var id = $(trs[i]).attr("data-id")
                removeIndex(chooseId,id)
                idList.push(id)
            }
        }
    })
    //反选(未选中数据数组)
    $("#box_neirong_agreement").on("change",".agreement_box",function(){
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
    $(".j_excel_out_agreement").click(function(){
        //是否全选
        if($("#check-input-agreement").prop("checked")){//全选，把未选择的ID数组传入
            $(".j_excel_out_agreement").attr("href","employee/excleout/agreement?notChoose="+idList)
            document.getElementsByClassName("j_excel_out_agreement").onclick();
        }else{//非全选，选择列表传给接口
            var checkeds = $("#box_neirong_agreement").find("input[type=checkbox]:checked")
            if(chooseId.length<=0 || checkeds.length<=0){
                layui.use(['layer'], function(){
                    layer.msg(
                        '请选择导出数据',
                        {icon: 2, time: 2000}, //2秒关闭（如果不配置，默认是3秒）
                        function(){
                        });
                })
                return;
            }
            $(".j_excel_out_agreement").attr("href","employee/excleout/agreement?chooseId="+chooseId)
            document.getElementsByClassName("j_excel_out_agreement").onclick();
        }
    })
    //协议列表相关
    $(".a-agreement").click(function(){
        var mytable="";
        $("#agreementContext").show()
        $("#indexContext").hide()
        $.ajax({
            type: "POST",
            url: "employee/agreement",
            dataType: "json",
            data:{"pageNumber":page_a,"pageSize":$("#select_rows_agreement").val(),"deptId":deptId,"postId":postId,
                "nature":nature,"eduBackground":eduBackground, "nameOrPhone":nameOrPhone},
            success:function(data){
                console.log(data)
                for(var i=0;i<data.data.result.length;i++){
                    var state=data.data.result[i].status
                    var nature=data.data.result[i].nature
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
                    mytable+="<tr data-id='"+data.data.result[i].id+"'><td><input type='checkbox' class='agreement_box'></td>"+
                        "<td>"+data.data.result[i].name+"</td>"+
                        "<td>"+data.data.result[i].sex+"</td>"+
                        "<td>"+data.data.result[i].phone+"</td>"+
                        "<td>"+data.data.result[i].deptName+"</td>"+
                        "<td>"+data.data.result[i].postName+"</td>"+
                        "<td>"+data.data.result[i].agreeName+"</td>"+
                        "<td><font color='red'>"+data.data.result[i].endTime+"</font></td>"+
                        "<td>"+data.data.result[i].eduBackground+"</td>"+
                        "<td>"+nature+"</td>"+
                        "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='#'style='color:#3ea0fb'>详情</a></span></td>"
                }
                page_a = data.data.pageNumber
                total_a=data.data.totalPages;
                $("#box_neirong_agreement").html(mytable)
            }
        })
    })
    //点击协议表内的查询按钮
    $(".jselect-btn-agreement").click(function(){
        var my_table="";
        var deptId = $("#index_deptId").val();
        var postId = $("#index_postId").val();
        var nature = $("#index_nature").val()
        var eduBackground = $("#eduBackground").val()
        var nameOrPhone = $("#index-input-agreement").val()
        var table_header="<colgroup><col width='70'><col width='100'><col width='60'></colgroup>\n" +
            "<thead><tr><th><label class='table-all index-check' id='index-check-agreement'><input type='checkbox' id='check-input-agreement'><span id='check-text-agreement'>全选</span></label></th>\n" +
            "<th>姓名</th><th>性别</th><th>手机号</th><th>部门</th><th>岗位</th><th>协议名称</th><th>协议到期时间</th><th>学历</th><th>性质</th><th>状态</th><th>操作</th></tr>\n" +
            "</thead><tbody id='box_neirong_agreement' class='box_neirong_all'></tbody>";
        $("#table_agreement_search").html(table_header);
        $.ajax({
            type: "POST",
            url: "employee/agreement",
            dataType: "json",
            data:{"pageNumber":page,"pageSize":$("#select_rows_agreement").val(),"deptId":deptId,"postId":postId,
                "nature":nature,"eduBackground":eduBackground,"nameOrPhone":nameOrPhone},
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
                        if($("#check-input-agreement").prop("checked")){//全选，判断idList中被取消的checkbox
                            var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                            for(var j=0; j<idList.length;j++){
                                if(idList[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='agreement_box'>"
                            }else{
                                checkbox="<input type='checkbox' class='agreement_box' checked='checked'>"
                            }
                        }else{//没有全选,判断chooseId中选取的checkbox,加入到
                            var b = false;
                            for(var j=0; j<chooseId.length;j++){
                                if(chooseId[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='agreement_box' checked='checked'>"
                            }else{
                                checkbox="<input type='checkbox' class='agreement_box'>"
                            }
                        }
                        my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                            "<td>"+data.data.result[i].name+"</td>"+
                            "<td>"+data.data.result[i].sex+"</td>"+
                            "<td>"+data.data.result[i].phone+"</td>"+
                            "<td>"+data.data.result[i].deptName+"</td>"+
                            "<td>"+data.data.result[i].postName+"</td>"+
                            "<td>"+data.data.result[i].agreeName+"</td>"+
                            "<td><font color='red'>"+data.data.result[i].endTime+"</font></td>"+
                            "<td>"+data.data.result[i].eduBackground+"</td>"+
                            "<td>"+nature+"</td>"+
                            "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                    }
                    page_a = data.data.pageNumber
                    total_a = data.data.totalPages
                    $("#box_neirong_agreement").html(my_table)
                    $(".totalNum").html(data.data.totalRows)
                }else{
                    page_a = page;
                    $("#box_neirong_agreement").html("")
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
    //更改页数
    $("#select_rows_agreement").change(function(){
        var my_table="";
        $.ajax({
            type: "POST",
            url: "employee/agreement",
            dataType: "json",
            data:{"pageNumber":page_a,"pageSize":$("#select_rows_agreement").val(),"deptId":deptId,"postId":postId,
                "nature":nature,"eduBackground":eduBackground, "nameOrPhone":nameOrPhone},
            success:function(data){
                for(var i=0;i<data.data.result.length;i++){
                    var state=data.data.result[i].status
                    var nature=data.data.result[i].nature
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
                    if($("#check-input-agreement").prop("checked")){//全选，判断idList中被取消的checkbox
                        var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                        for(var j=0; j<idList.length;j++){
                            if(idList[j]==data.data.result[i].id){
                                b = true;
                            }
                        }
                        if(b){
                            checkbox="<input type='checkbox' class='agreement_box'>"
                        }else{
                            checkbox="<input type='checkbox' class='agreement_box' checked='checked'>"
                        }
                    }else{//没有全选,判断chooseId中选取的checkbox,加入到
                        var b = false;
                        for(var j=0; j<chooseId.length;j++){
                            if(chooseId[j]==data.data.result[i].id){
                                b = true;
                            }
                        }
                        if(b){
                            checkbox="<input type='checkbox' class='agreement_box' checked='checked'>"
                        }else{
                            checkbox="<input type='checkbox' class='agreement_box'>"
                        }
                    }
                    my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                        "<td>"+data.data.result[i].name+"</td>"+
                        "<td>"+data.data.result[i].sex+"</td>"+
                        "<td>"+data.data.result[i].phone+"</td>"+
                        "<td>"+data.data.result[i].deptName+"</td>"+
                        "<td>"+data.data.result[i].postName+"</td>"+
                        "<td>"+data.data.result[i].agreeName+"</td>"+
                        "<td><font color='red'>"+data.data.result[i].endTime+"</font></td>"+
                        "<td>"+data.data.result[i].eduBackground+"</td>"+
                        "<td>"+nature+"</td>"+
                        "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                }
                page_a = data.data.pageNumber
                total_a=data.data.totalPages;
                $("#box_neirong_agreement").html(my_table)
            }
        })
    })
    //上一页
    $("#page_up_agreement").click(function(){
        var my_table=""
        if(page_a>1){
            page_a-=1
            $.ajax({
                type:"POST",
                url:"employee/agreement",
                dataType:"json",
                data:{"pageNumber":page_a,"pageSize":$("#select_rows_agreement").val(),"deptId":deptId,"postId":postId,
                    "nature":nature,"eduBackground":eduBackground, "nameOrPhone":nameOrPhone},
                success:function(data){
                    for(var i=0;i<data.data.result.length;i++){
                        var state=data.data.result[i].status
                        var nature=data.data.result[i].nature
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
                        if($("#check-input-agreement").prop("checked")){//全选，判断idList中被取消的checkbox
                            var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                            for(var j=0; j<idList.length;j++){
                                if(idList[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='agreement_box'>"
                            }else{
                                checkbox="<input type='checkbox' class='agreement_box' checked='checked'>"
                            }
                        }else{//没有全选,判断chooseId中选取的checkbox,加入到
                            var b = false;
                            for(var j=0; j<chooseId.length;j++){
                                if(chooseId[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='agreement_box' checked='checked'>"
                            }else{
                                checkbox="<input type='checkbox' class='agreement_box'>"
                            }
                        }
                        my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                            "<td>"+data.data.result[i].name+"</td>"+
                            "<td>"+data.data.result[i].sex+"</td>"+
                            "<td>"+data.data.result[i].phone+"</td>"+
                            "<td>"+data.data.result[i].deptName+"</td>"+
                            "<td>"+data.data.result[i].postName+"</td>"+
                            "<td>"+data.data.result[i].agreeName+"</td>"+
                            "<td><font color='red'>"+data.data.result[i].endTime+"</font></td>"+
                            "<td>"+data.data.result[i].eduBackground+"</td>"+
                            "<td>"+nature+"</td>"+
                            "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                    }
                    page_a = data.data.pageNumber
                    total_a=data.data.totalPages;
                    $("#box_neirong_agreement").html(my_table)
                }
            })
        }else{
            page_a=1
        }
    })
    //下一页
    $("#page_down_agreement").click(function(){
        var my_table=""
        if(page_a<total_a){
            page_a+=1
            $.ajax({
                type:"POST",
                url:"employee/agreement",
                dataType:"json",
                data:{"pageNumber":page_a,"pageSize":$("#select_rows_agreement").val(),"deptId":deptId,"postId":postId,
                    "nature":nature,"eduBackground":eduBackground, "nameOrPhone":nameOrPhone},
                success:function(data){
                    console.log(data)
                    for(var i=0;i<data.data.result.length;i++){
                        var state=data.data.result[i].status
                        var nature=data.data.result[i].nature
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
                        if($("#check-input-agreement").prop("checked")){//全选，判断idList中被取消的checkbox
                            var b = false; //循环数组idList，根据该数组中的ID与data.data.result[i].id相同，则设置该条数据的checked为false,即不选择这条数据
                            for(var j=0; j<idList.length;j++){
                                if(idList[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='agreement_box'>"
                            }else{
                                checkbox="<input type='checkbox' class='agreement_box' checked='checked'>"
                            }
                        }else{//没有全选,判断chooseId中选取的checkbox,加入到
                            var b = false;
                            for(var j=0; j<chooseId.length;j++){
                                if(chooseId[j]==data.data.result[i].id){
                                    b = true;
                                }
                            }
                            if(b){
                                checkbox="<input type='checkbox' class='agreement_box' checked='checked'>"
                            }else{
                                checkbox="<input type='checkbox' class='agreement_box'>"
                            }
                        }
                        my_table+="<tr data-id='"+data.data.result[i].id+"'><td>"+checkbox+"</td>"+
                            "<td>"+data.data.result[i].name+"</td>"+
                            "<td>"+data.data.result[i].sex+"</td>"+
                            "<td>"+data.data.result[i].phone+"</td>"+
                            "<td>"+data.data.result[i].deptName+"</td>"+
                            "<td>"+data.data.result[i].postName+"</td>"+
                            "<td>"+data.data.result[i].agreeName+"</td>"+
                            "<td><font color='red'>"+data.data.result[i].endTime+"</font></td>"+
                            "<td>"+data.data.result[i].eduBackground+"</td>"+
                            "<td>"+nature+"</td>"+
                            "<td>"+state+"</td><td><span style='cursor:pointer' class='but-a'><a href='##' style='color:#3ea0fb'>详情</a></span></td>"
                    }
                    page_a = data.data.pageNumber
                    total_a=data.data.totalPages;
                    $("#box_neirong_agreement").html(my_table)
                }
            })
        }else{
            page_a=total_a
        }
    })
})