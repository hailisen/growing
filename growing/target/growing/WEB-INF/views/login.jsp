<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>登录</title>
	<meta name="description" content="登录页面">
	<meta name="keywords" content="index">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<link rel="icon" type="image/png" href="images/i/favicon.png">
	<link rel="apple-touch-icon-precomposed" href="images/i/app-icon72x72@2x.png">
	<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/amazeui.min.css" />
	<link rel="stylesheet" href="css/amazeui.datatables.min.css" />
	<link rel="stylesheet" href="css/app.css">
	<script src="js/jquery.min.js"></script>
	<style type="text/css">
		.am-icon-cog:before, .am-icon-gear:before {
			content: "\f013";
			margin-top: 10px;
		}
	</style>
</head>
<body data-type="login">
<script src="js/theme.js"></script>
	<div class="am-g tpl-g">
	<!-- 风格切换 -->
	<div class="tpl-skiner">
		<div class="tpl-skiner-toggle am-icon-cog">
		</div>
		<div class="tpl-skiner-content">
			<div class="tpl-skiner-content-title">
				选择主题
			</div>
			<div class="tpl-skiner-content-bar">
				<span class="skiner-color skiner-white" data-color="theme-white"></span>
				<span class="skiner-color skiner-black" data-color="theme-black"></span>
			</div>
		</div>
	</div>
	<div class="tpl-login">
		<div class="tpl-login-content">
			<div class="tpl-login-logo">
			</div>
			<form class="am-form tpl-form-line-form">
				<div class="am-form-group">
					<input type="text" class="tpl-form-input" id="phone" placeholder="请输入手机号">
				</div>
				<div class="am-form-group">
					<input type="password" class="tpl-form-input" id="password" placeholder="请输入密码">
				</div>
				<div class="am-form-group tpl-login-remember-me">
					<input id="remember-me" type="checkbox" value=""/>
					<label for="remember-me">
						记住密码
					</label>
				</div>
				<div class="am-form-group">
					<button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">登录</button>
				</div>
			</form>
		</div>
	</div>
</div>
	<script src="js/amazeui.min.js"></script>
	<script src="js/app.js"></script>
	<script src="plugins/layui/layui.js"></script>
	<script>
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer,$ = layui.jquery,form = layui.from;
        //Enter键登录
        document.onkeydown=function(even){
            if(even.keyCode==13){
                $(".tpl-login-btn").click()
            }
        }
        //记住密码功能
        $(document).ready(function(){
            var str = getCookie("loginInfo")
            str = str.substring(0,str.length);
            var phone = "";
            var password = "";
            if(str==""){
                $("#remember-me").val("");
                $("#remember-me").prop("checked",false);
                // form.render('checkbox');
            }else{
                phone = str.split("#")[0];
                password = str.split("#")[1];
                $("#remember-me").val("1");
                $("#remember-me").prop("checked",true);
                // form.render('checkbox');
                //自动填充用户名和密码
                $("#phone").val(phone);
                $("#password").val(password);
            }
        })
        //获取cookie
        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i=0; i<ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1);
                if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
            }
            return "";
        }
        // //监听事件
        $("#remember-me").change(function(){
            var isChecked = ($("#remember-me").is(":checked")?"true":"false");
            if(isChecked=="true"){//如果选中设置idChecked为true,并且设置为选中状态
                //cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
                var conFlag = confirm("记录密码功能不宜在公共场所使用,以防密码泄露.您确定要使用此功能吗?");
                if(conFlag){
                    $("#remember-me").val("1");
                    //设置checkbox为选中状态
                    $("#remember-me").prop("checked",true);
                }else{
                    $("#remember-me").val("");
                    //设置checkbox为不选中状态
                    $("#remember-me").prop("checked",false);
                }
            }else{
                $("#remember-me").val("");
            }
        });

        //点击登录
        $(".tpl-login-btn").on("click",function(){
            var phone = $("#phone").val();
            var password = $("#password").val();
            var rememberMe = $("#remember-me").prop("checked");
            var rex = /^1[345678]\d{9}$/;
            var isPhone = rex.test(phone);
            if(phone == null || phone =="" ){
                layer.msg(
                    '手机号不能为空',
                    {
                        icon: 2,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    },
                    function(){
                    });
                return;
            }
            if(password == null || password ==""){
                layer.msg(
                    '密码不能为空',
                    {
                        icon: 2,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    },
                    function(){
                    });
                return;
            }
            if(!isPhone){
                layer.msg(
                    '手机号格式错误',
                    {icon: 2, time: 2000}, //2秒关闭（如果不配置，默认是3秒）
                    function(){
                    });
                return;
            }
            //AJAX登录操作
            $.ajax({
                type : "post",
                url : "employee/login",
                dateType : "json",
                data: {"rememberMe":rememberMe,"phone":phone,"password" : password},
                success:function(data){
                    if(data.success){
                        console.log(data)
                        window.location.href="toIndex";
                    }else{
                        layer.msg(data.message,{icon: 2, time: 2000 },//time：2秒关闭（如果不配置，默认是3秒）
                            function(){
                            });
                    }
                }
            })
        })
    })//layUI的form
</script>
</body>
</html>