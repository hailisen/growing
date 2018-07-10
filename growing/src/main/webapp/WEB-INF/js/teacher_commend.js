//教师详情---添加职称
layui.use(['upload','laydate','layer'], function(){
    var upload = layui.upload;
    var layer = layui.layer;
    /**点击修改表彰跳到修改页面*/
    $("#box_neirong_commend").on("click","#commend_update",function(){
        $("#countDiv").hide()
        $("#addCommend").show()
        $("#addcommend-title-text").html("修改奖彰")
        //点击修改，把form表单的提交路径改掉
        $("#commend-update-from").attr("action","commend/update");
        $(".jposition-form-button").attr("id","update-commend-butn");//把提交按钮设置为修改的按钮
        //获取该条表彰的ID信息
        var commendId = $(this).parent().parent().attr("data-id");
        $("#update-commendId").attr("value",commendId)
        //填充信息
        $.ajax({
            type:"POST",
            url:"commend/findone",
            dataType:"json",
            data:{"id":commendId},
            success:function(data){
                if(data.success){
                    $("#comment-level").val(data.data.level);
                    $("#commend-commendName").val(data.data.commendName);
                    $("#commendGetDate").val(timeStamp2String(data.data.getTime.time));
                    $("#commend-note").val(data.data.note);
                    //$("#demoListCommend") 给这货添加新的<tr></tr>
                    var returnFilename = data.data.fileName;
                    var returnUrl = data.data.url;
                    var urls = returnUrl.split(",")
                    var filenames = returnFilename.split("、")
                    var filevalue = ""
                    var num=0;
                    for(var i = 0;i<urls.length-1;i++){
                        num+=1;
                        filevalue+="<tr data-num='"+num+"'><td class='beforeCommendFile' data-url='"+urls[i]+"'>"+filenames[i]+"</td><td>未知</td><td style='color: #5fb878'>已上传</td>" +
                            "<td><button class='layui-btn-mini demo-reload layui-hide'>重传</button>" +
                            "<button class='layui-btn-mini layui-btn-danger demo-delete' id='my_remove_commend'>删除</button></td></tr>"
                    }
                    $("#demoListCommend").html(filevalue);
                    $("#commend-oldfile").html("<input type='hidden' value='"+urls+"' id='commendOldUrlInPut' name='oldUrl'/>" +
                        "<input type='hidden' name='oldFilename' id='commemdOldFilenameInPut'/>")
                }
            }
        })
    })
    $("#demoListCommend").on("click","#my_remove_commend",function(){
        var num = $(this).parent().parent().attr("data-num")
        $("#demoListCommend").find("tr[data-num="+num+"]").remove()
    })
    /**修改提交*/
    $("#commend-update-from").on("click","#update-commend-butn",function(){
        var level = $("#comment-level").val();
        var commendName = $("#commend-commendName").val();
        var commendGetDate = $("#commendGetDate").val();
        var note = $("#commend-note").val();
        if(level==""||commendName==""||commendGetDate==""){
            layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
            return;
        }
        var oldUrl = ""
        var oldFilename=""
        var tds = $("#demoListCommend").find(".beforeCommendFile")
        for(var i = 0;i<tds.length;i++){
            alert(tds.length);
            var url = $(tds[i]).attr("data-url")
            var filename = $(tds[i]).html()
            oldUrl=oldUrl+url+","
            oldFilename=oldFilename+filename+"、"
        }
        $("#update-commend-table").find("#commendOldUrlInPut").val(oldUrl)
        $("#update-commend-table").find("#commemdOldFilenameInPut").val(oldFilename)
        //修改form提交
        $("#commend-update-from").ajaxSubmit(function(data){
            if(data.success){
                layer.msg("修改成功", {icon : 1,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function(){});
                //删除data-id=id的一条tr
                //把新填入的信息填入到新的一条
                var returnUrl = data.data.urls;
                var returnFilename = data.data.filenames;
                var urls = returnUrl.split(",");
                var filenames = returnFilename.split("、");
                var a = "";
                for(var i = 0;i<urls.length-1;i++){
                    if(i<urls.length-2){
                        a+="<a href='"+urls[i]+"' download=''>"+filenames[i]+"</a>、"
                    }else{
                        a+="<a href='"+urls[i]+"' download=''>"+filenames[i]+"</a>"
                    }
                }
                $("#box_neirong_commend").find("tr[data-id="+data.data.id+"]").remove()
                $("#box_neirong_commend").append("<tr data-id='"+data.data.id+"'><td>"+level+"</td><td>"+commendName+"</td><td>"+note+"</td>" +
                    "<td>"+a+"</td><td><a href='##' id='commend_update'>修改</a>&nbsp; <a href='##' id='commend_remove'>删除</a></td></tr>")
            }else{
                layer.msg("修改失败", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function(){});
            }
        })
    })
    /**删除表彰*/
    $("#box_neirong_commend").on("click","#commend_remove",function(){
        var commendId = $(this).parent().parent().attr("data-id");
        layer.confirm('确认删除该条信息？', {
                btn: ['确定','取消'] //按钮,
                ,area: ['300px', '180px']
            },function(index){
                layer.close(index)
                $.ajax({
                type:"POST",
                url:"commend/delete/"+commendId,
                dataType:"json",
                data:{},
                success:function(data){
                    if(data.success){
                        layer.msg(data.message,{icon : 1,time : 2000},function(){});
                        $("#box_neirong_commend").find("tr[data-id="+commendId+"]").remove()
                    }else{
                        layer.msg(data.message,{icon:2,time:2000},function(){});
                    }
                }
            })
            },function(index){
                layer.close(index)
        })
    })
    /** 点击新增表彰按钮*/
    $(".jadd-commend").click(function(){
        $("#countDiv").hide()
        $("#addCommend").show()
        $("#addcommend-title-text").html("新增奖彰")
        $("#commend-update-from").attr("action","teacher/addCommend");
        $(".jposition-form-button").attr("id","addCommendButn");
    })
    /**新增表彰提交*/
    $("#commend-update-from").on("click","#addCommendButn",function(){
        var level = $("#comment-level").val();
        var commendName = $("#commend-commendName").val();
        var commendGetDate = $("#commendGetDate").val();
        var note = $("#commend-note").val();
        if(level==""||commendName==""||commendGetDate==""){
            layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
            return;
        }
        $("#commend-update-from").ajaxSubmit(function(data){
            if(data.success){
                layer.msg(data.message,{icon:1,time:2000},function(){})
                //给教师简历中动态添加一条数据
                var a = "";
                var newurl = data.data.url;
                var newfileName = data.data.filename;
                var urls = newurl.split(",");
                var filenames = newfileName.split("、");
                for(var i = 0;i<urls.length-1;i++){
                    if(i<urls.length-2){
                        a+="<a href='"+urls[i]+"' download=''>"+filenames[i]+"</a>、"
                    }else{
                        a+="<a href='"+urls[i]+"' download=''>"+filenames[i]+"</a>"
                    }
                }
                var xinxi = "<tr data-id='"+data.data.id+"'><td>"+level+"</td><td>"+commendName+"</td><td>"+note+"</td><td>"+a+"</td>" +
                    "<td><a href='##' id='commend_update'>修改</a>&nbsp; <a href='##' id='commend_remove'>删除</a></td></tr>"
                $("#box_neirong_commend").append(xinxi)
            }
        })
    })
    //多文件列表示例
    var demoListView = $('#demoListCommend'),uploadListIns = upload.render({
        elem: '#testListcommend'
        ,url: 'teacher/wanwan'
        ,accept: 'file'
        ,multiple: true
        ,auto: false
        ,bindAction: '#testListActioncommend'
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
            var level = $("#comment-level").val();
            var commendName = $("#commend-commendName").val();
            var commendGetDate = $("#commendGetDate").val();
            if(level==""||commendName==""||commendGetDate==""){
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
            var level = $("#comment-level").val();
            var commendName = $("#commend-commendName").val();
            var commendGetDate = $("#commendGetDate").val();
            var note = $("#commend-note").val();
            if(level==""||commendName==""||commendGetDate==""){
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