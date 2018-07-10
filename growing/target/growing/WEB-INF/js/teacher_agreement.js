//协议增删改 js
layui.use(['upload','laydate','layer'], function(){
    var upload = layui.upload;
    var layer = layui.layer;
    /**点击新增协议按钮*/
    $(".jadd-agreement").click(function(){
        $("#countDiv").hide()
        $("#addAgreement").show()
        $("#agreement-title-text").html("新签协议")
        $("#agreement-update-from").attr("action","teacher/addAgreement")
        $(".jagreement-form-button").attr("id","addAgreementButn")
    })
    /**新增协议提交*/
    $("#agreement-update-from").on("click","#addAgreementButn",function(){
        var agreeName = $("#agreement-agreeName").val()
        var startTime = $("#agreementStartTime").val()
        var endTime = $("#agreementEndTime").val()
        if(agreeName=="" ||startTime=="" || endTime==""){
            layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
            return;
        }
        $("#agreement-update-from").ajaxSubmit(function(data){
            if(data.success){
                var id = data.data.id
                var returnFilename = data.data.filename
                var returnUrl = data.data.url
                var filenames = returnFilename.split("、");
                var urls = returnUrl.split(",");
                var a = "";
                for(var i = 0 ; i<urls.length-1;i++){
                    if(i<urls.length-2){
                        a+="<a href='"+urls[i]+"' download=''>"+filenames[i]+"</a>、"
                    }else{
                        a+="<a href='"+urls[i]+"' download=''>"+filenames[i]+"</a>"
                    }
                }
                var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
                startTime = startTime.replace(reg,"$1年$2月$3日");
                endTime = endTime.replace(reg,"$1年$2月$3日");
                $("#box_neirong_agreement").append("<tr data-id='"+id+"'><td>"+agreeName+"</td><td>"+startTime+"</td><td>"+endTime+"</td>" +
                    "<td>"+a+"</td><td><a href='##' id='agreement-update'>修改</a>&nbsp; <a href='##' id='agreement-remove'>删除</a></td></tr>")
                layer.msg(data.message,{icon:1,time:2000},function(){})
            }else{
                layer.msg(data.message,{icon:2,time:2000},function(){})
            }
        })
    })
    /**点击修改按钮*/
    $("#box_neirong_agreement").on("click","#agreement-update",function(){
        $("#countDiv").hide()
        $("#addAgreement").show()
        $("#agreement-title-text").html("修改协议")
        $("#agreement-update-from").attr("action","teacher/updateAgreement");
        $(".jagreement-form-button").attr("id","updateAgreement");
        //获取该条协议的ID
        var id  = $(this).parent().parent().attr("data-id");
        $("#update-agreementId").attr("value",id);
        $.ajax({
            type:"POST",
            url:"teacher/agreementById/"+id,
            dataType:"json",
            data:{},
            success:function(data){
                if(data.success){
                    $("#agreement-agreeName").val(data.data.agreeName)
                    $("#agreementStartTime").val(timeStamp2String(data.data.startTime.time))
                    $("#agreementEndTime").val(timeStamp2String(data.data.endTime.time))
                    //demoListAgreement  添加附件表格列表
                    var returnFilename = data.data.filename
                    var returnUrl = data.data.url
                    var filenames = returnFilename.split("、")
                    var urls = returnUrl.split(",")
                    var file_table = ""
                    var num = ""
                    for(var i = 0;i<urls.length-1;i++){
                        num+=1;
                        file_table+="<tr data-num='"+num+"'><td class='beforeAgreementFile' data-url='"+urls[i]+"'>"+filenames[i]+"</td>" +
                            "<td>未知</td><td style='color: #5fb878'>已上传</td><td><button class='layui-btn-mini demo-reload layui-hide'>重传</button>" +
                            "<button class='layui-btn-mini layui-btn-danger demo-delete' id='my_remove_agreement'>删除</button></td></tr>";
                    }
                    $("#demoListAgreement").html(file_table)
                    $("#agreement-oldfile").html("<input type='hidden' value='"+returnUrl+"' id='agreementOldUrlInPut' name='oldUrl'/>" +
                        "<input type='hidden' name='oldFilename' value='"+returnFilename+"' id='agreementOldFilenameInPut'/>")
                }else{
                    layer.msg("查询信息失败，请重试",{icon:2,time:2000},function(){})
                }
            }
        })
    })
    $("#demoListAgreement").on("click","#my_remove_agreement",function(){
        var num = $(this).parent().parent().attr("data-num");
        $("#demoListAgreement").find("tr[data-num="+num+"]").remove()
    })
    /**修改提交*/
    $("#agreement-update-from").on("click","#updateAgreement",function(){

        var agreeName = $("#agreement-agreeName").val()
        var startTime = $("#agreementStartTime").val()
        var endTime = $("#agreementEndTime").val()
        if(agreeName=="" ||startTime=="" || endTime==""){
            layer.msg("请填写完整信息",{icon:2,time:2000},function(){})
            return;
        }
        var tds = $("#demoListAgreement").find(".beforeAgreementFile")
        var oldUrl = ""
        var oldFilename = ""
        for(var i = 0;i<tds.length;i++){
            var url = $(tds[i]).attr("data-url")
            var filename = $(tds[i]).html();
            oldUrl +=url+",";
            oldFilename+=filename+"、";
        }
        $("#update-agreement-table").find("#agreementOldUrlInPut").val(oldUrl)
        $("#update-agreement-table").find("#agreementOldFilenameInPut").val(oldFilename)
        $("#agreement-update-from").ajaxSubmit(function(data){
            if(data.success){
                var id = data.data.id
                var returnUrl = data.data.url
                var returnFilename = data.data.filename
                var urls = returnUrl==null?"":returnUrl.split(",")
                var filenames = returnFilename==null?"":returnFilename.split("、")
                var a = ""
                for(var i = 0;i<urls.length-1;i++){
                    if(i<urls.length-2){
                        a+="<a href='"+urls[i]+"' download=''>"+filenames[i]+"</a>、"
                    }else{
                        a+="<a href='"+urls[i]+"' download=''>"+filenames[i]+"</a>"
                    }
                }
                var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
                startTime = startTime.replace(reg,"$1年$2月$3日");
                endTime = endTime.replace(reg,"$1年$2月$3日");
                $("#box_neirong_agreement").find("tr[data-id="+id+"]").remove()
                $("#box_neirong_agreement").append("<tr data-id='"+id+"'><td>"+agreeName+"</td><td>"+startTime+"</td><td>"+endTime+"</td>" +
                    "<td>"+a+"</td><td><a href='##' id='agreement-update'>修改</a>&nbsp;  <a href='##' id='agreement-remove'>删除</a></td></tr>")
                layer.msg(data.message,{icon:1,time:2000},function(){})
            }else{
                layer.msg(data.message,{icon:1,time:2000},function(){})
            }
        })
    })
    /**删除*/
    $("#box_neirong_agreement").on("click","#agreement-remove",function(){
        var id = $(this).parent().parent().attr("data-id");
        layer.confirm('确认删除该条信息？', {
                btn: ['确定','取消'] //按钮,
                ,area: ['300px', '180px']
            },function(index){
                layer.close(index)
                $.ajax({
                type:"POST",
                url:"teacher/deleteAgreement/"+id,
                dataType:"json",
                data:{},
                success:function(data){
                    if(data.success){
                        layer.msg(data.message,{icon:1,time:2000},function(){})
                        $("#box_neirong_agreement").find("tr[data-id="+id+"]").remove()
                    }else{
                        layer.msg(data.message,{icon:2,time:2000},function(){})
                    }
                }
            })
            },function(index){
                layer.close(index)
        })
    })
    //多文件列表示例
    var demoListView = $('#demoListAgreement'),uploadListIns = upload.render({
        elem: '#testListAgreement'
        ,url: 'teacher/wanwan'
        ,accept: 'file'
        ,multiple: true
        ,auto: false
        ,bindAction: '#testListActionAgreement'
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
            var agreeName = $("#agreement-agreeName").val()
            var startTime = $("#agreementStartTime").val()
            var endTime = $("#agreementEndTime").val()
            if(agreeName=="" ||startTime=="" || endTime==""){
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
            var agreeName = $("#agreement-agreeName").val()
            var startTime = $("#agreementStartTime").val()
            var endTime = $("#agreementEndTime").val()
            if(agreeName=="" ||startTime=="" || endTime==""){
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