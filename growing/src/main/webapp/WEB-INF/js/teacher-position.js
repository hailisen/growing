//教师详情---添加职称
layui.use(['upload','laydate','layer'], function(){
    var num = 0;
    var upload = layui.upload
    var laydate = layui.laydate;
    var layer = layui.layer;
    //删除职称信息
    $("#box_neirong_position").on('click','#position-remove',function(){
        var peId = $(this).parent().parent().attr("data-peId");//职称员工关联表ID
        layer.confirm('确认删除该条信息？', {
                btn: ['确定','取消'] //按钮,
                ,area: ['300px', '180px']
            },function(index){
                layer.close(index)
                $.ajax({
                type:"POST",
                url:"teacher/delete/emp/position/"+peId,
                dataType:"json",
                data:{},
                success:function(data){
                    if(data.success){
                        layer.msg(data.message,{icon : 1,time : 2000},function(){});
                        $("#box_neirong_position").find("tr[data-peId="+peId+"]").remove()
                    }else{
                        layer.msg(data.message,{icon:2,time:2000},function(){});
                    }
                }
            })
            },function(index){
                layer.close(index)
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
            var category = $("#category").val()
            var positionGetDate = $("#positionGetDate").val()
            var positionId = $("#teacher_positionName").val()
            if(category=="" || positionGetDate=="" || positionId==""){
                layer.msg("请填写完整信息", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function(){});
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
            var category = $("#category").val()
            var positionGetDate = $("#positionGetDate").val()
            var positionId = $("#teacher_positionName").val()
            if(category=="" || positionGetDate=="" || positionId==""){
                layer.msg("请填写完整信息", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function(){});
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
    //点击修改按钮  teacher/updateEmpPosition
    $("#box_neirong_position").on("click","#position-update",function(){
        $("#addedu").hide()
        $("#countDiv").hide()
        $("#addPosition").show()
        $(".jposition-form-button").attr("id","updatePositionButn")
        $("#position-update-from").attr("action","teacher/updateEmpPosition")
        $("#addposition-title-text").hide()
        $("#resetposition-title-text").show()
        var positionId = $(this).parent().parent().attr("data-id")
        var peId = $(this).parent().parent().attr("data-peId")
        $("#update-positionId").attr("value",peId)//把员工职称关系表的ID放入到隐藏表单域中
        var tds = $(this).parent().prevAll();//获取该<td>的所有兄弟元素
        var date = $(tds[1]).html()
        var dateArray = date.split("年")
        var year = dateArray[0]
        dateArray = dateArray[1].split("月")
        var month = dateArray[0]
        var day = dateArray[1].split("日")[0]
        $("#positionGetDate").val(year+"-"+month+"-"+day);
        $("#category").find("option:contains('"+$(tds[3]).html()+"')").attr("selected",true)//设置职称类别选中
        var cateId= $("#category").val()
        $.ajax({//加载职称名称下拉框
            type:"POST",
            url:"teacher/positions",
            dataType:"json",
            data:{"categoryId":cateId},
            success:function(data){
                var value="<option value=''>请选择职称...</option>"
                for(var i = 0;i<data.data.length;i++){
                    if(data.data[i].id==positionId){
                        value+="<option value='"+data.data[i].id+"' selected>"+data.data[i].positionName+"</option>"
                    }else{
                        value+="<option value='"+data.data[i].id+"'>"+data.data[i].positionName+"</option>"
                    }
                }
                $("#teacher_positionName").html(value)
            }
        })
        var childs_a = $(tds[0]).find("a")//所有的a标签
        //遍历所有a标签，给这添加新的html $("#demoList")
        var file_values = ""
        var urls = "";
        var filenames = "";
        for(var i = 0; i<childs_a.length; i++){
            num=num+1;
            var filename = $(childs_a[i]).html();
            filenames+=filename;
            var url = $(childs_a[i]).attr("data-url");
            urls+=url
            file_values+="<tr data-num='"+num+"'><td class='beforePositionFile' data-url='"+url+"'>"+filename+"</td><td>未知</td><td style='color: #5fb878'>已上传</td>" +
                "<td><button class='layui-btn-mini demo-reload layui-hide'>重传</button>" +
                "<button class='layui-btn-mini layui-btn-danger demo-delete' id='my_remove'>删除</button></td></tr>"
        }
        $("#demoList").html(file_values)
        $("#position-oldfile").html("<input type='hidden' value='"+urls+"' id='oldUrlInPut' name='oldUrl'/>" +
            "<input type='hidden' name='oldFilename' id='oldFilenameInPut'/>")
    })
    $("#demoList").on("click","#my_remove",function(){
        var num = $(this).parent().parent().attr("data-num")
        $("#demoList").find("tr[data-num="+num+"]").remove()
    })//删除文件
    /**点击提交修改按钮*/
    $("#position-update-from").on("click","#updatePositionButn",function(){
        //表单验证
        var category = $("#category").val()
        var positionGetDate = $("#positionGetDate").val()
        var positionId = $("#teacher_positionName").val()
        if(category=="" || positionGetDate=="" || positionId==""){
            layer.msg("请填写完整信息", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                function(){});
            return;
        }
        var oldUrl = "";
        var oldFilename = "";
        //获取文件表格demoList的 class为beforePositionFile的td
        var tds = $("#demoList").find(".beforePositionFile")
        for(var i = 0;i<tds.length;i++) {
            var url = $(tds[i]).attr("data-url")
            var filename = $(tds[i]).html();
                oldUrl = oldUrl+url+","
                oldFilename = oldFilename+filename+"、"
        }
        $("#update-position-table").find("#oldUrlInPut").val(oldUrl);
        $("#update-position-table").find("#oldFilenameInPut").val(oldFilename);
        $("#position-update-from").ajaxSubmit(function(data){
            console.log(data)
            if(data.success) {
                layer.msg("修改成功", {icon : 1,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function(){});
                var peId = data.data.peId;
                var cateName = $("#category").find("option:selected").text()//职称类别名称
                var postionName = $("#teacher_positionName").find("option:selected").text()
                //将yyyy-MM-dd改为yyyy年MM月dd日的格式
                var reg = /(\d{4})\-(\d{2})\-(\d{2})/;
                positionGetDate = positionGetDate.replace(reg, "$1年$2月$3日");
                var urls = data.data.url.split(",")
                var filenames = data.data.filename.split("、");
                var a = ""
                for (var i = 0; i < urls.length - 1; i++) {
                    if (i < urls.length - 2) {
                        a += "<a href='${pageContext.request.contextPath}/" + urls[i] + "' data-url='" + urls[i] + "'download='' >" + filenames[i] + "</a>、"
                    } else {
                        a += "<a href='${pageContext.request.contextPath}/" + urls[i] + "' data-url='" + urls[i] + "' download=''>" + filenames[i] + "</a>"
                    }
                }
                $("#box_neirong_position").find("tr[data-peId=" + peId + "]").remove()
                $("#box_neirong_position").append("<tr data-id='" + positionId + "' data-peId='" + peId + "'>" +
                    "<td>"+cateName+"</td><td>"+postionName+"</td><td>"+positionGetDate+"</td><td>"+a+"</td>" +
                    "<td><a href='##' id='position-update'>修改</a>&nbsp;  <a href='##' id='position-remove'>删除</a></td></tr>>")
            }else{
                layer.msg("修改失败", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function(){});
            }
        })
    })
    //点击添加提交按钮
    $("#position-update-from").on("click","#addPositionButn",function(type){
        var category = $("#category").val()
        var positionGetDate = $("#positionGetDate").val()
        var positionId = $("#teacher_positionName").val()
        if(category=="" || positionGetDate=="" || positionId==""){
            layer.msg("请填写完整信息", {icon : 2,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                function(){});
            return;
        }
        $("#position-update-from").ajaxSubmit(function(data){
            if(data.success){
                layer.msg(data.message, {icon : 1,time : 2000},//2秒关闭（如果不配置，默认是3秒）
                    function(){});
                //如果添加成功  $("#box_neirong_position")给职称列表添加一条新数据
                category = $("#category").find("option:selected").text()//职称类别
                //将yyyy-MM-dd改为yyyy年MM月dd日的格式
                var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
                positionGetDate = positionGetDate.replace(reg,"$1年$2月$3日");
                var positionName = $("#teacher_positionName").find("option:selected").text();//职称名称
                var url = data.data.url;
                var fileName = data.data.filename;
                var a = ""
                if(url!=null && fileName !=null){
                    var urls = url.split(',')
                    var fileNames = fileName.split("、");
                    for(var j=0;j<urls.length-1;j++){
                        if(j<urls.length-2){
                            a+="<a href='"+urls[j]+"' download='' data-url='"+urls[j]+"'>"+fileNames[j]+"</a>、"
                        }else{
                            a+="<a href='"+urls[j]+"' download='' data-url='"+urls[j]+"'>"+fileNames[j]+"</a>"
                        }
                    }
                }
                var value = "<tr data-id='"+positionId+"' data-peId='"+data.data.peId+"'><td>"+category+"</td><td>"+positionName+"</td><td>"+positionGetDate+"</td>" +
                    "<td>"+a+"</td><td><a href='##' id='position-update'>修改</a>&nbsp;  <a href='##' id='position-remove'>删除</a></td></tr>"
                $("#box_neirong_position").append(value)
            }
        })
    })
    //点击按钮，跳转到新增页面
    $(".jadd-position").on('click',function(type){
        $("#addedu").hide()
        $("#countDiv").hide()
        $("#addPosition").show()
        $(".jposition-form-button").attr("id","addPositionButn")
        $("#position-update-from").attr("action","teacher/addPosition")
        $("#jposition_title_text").html("添加职称")
        $("#addposition-title-text").show()
        $("#resetposition-title-text").hide()
    })
    //获取职称类别下拉框
    $.ajax({
        type:"POST",
        url:"teacher/categorys",
        dataType:"json",
        success:function(data){
            var value = "<option value=''>请选择职称...</option>"
            for(var i=0;i<data.data.length;i++){
                value+="<option value='"+data.data[i].id+"'>"+data.data[i].cateName+"</option>"
            }
            $("#category").html(value);
        }
    })
    $("#category").on('change',function(){
        var cateId = $("#category").val()
        if(cateId==""){
            $("#teacher_positionName").html("<option value=''>请选择职称...</option>")
        }else{
            $.ajax({
                type:"POST",
                url:"teacher/positions",
                dataType:"json",
                data:{"categoryId":cateId},
                success:function(data){
                    var value="<option value=''>请选择职称...</option>"
                    for(var i = 0;i<data.data.length;i++){
                        value+="<option value='"+data.data[i].id+"'>"+data.data[i].positionName+"</option>"
                    }
                    $("#teacher_positionName").html(value)
                }
            })
        }
    })
})