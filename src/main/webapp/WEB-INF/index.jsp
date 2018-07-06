<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("ctx",basePath);
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>登陆</title>
        <base href="<%=basePath%>">
        <link rel="stylesheet" href="${ctx}public/layui/css/layui.css">
        <link rel="stylesheet" type="text/css" href="${ctx}public/H-UI/static/h-ui.admin/css/H-ui.admin.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}public/H-UI/static/h-ui.admin/skin/default/skin.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}public/H-UI/static/h-ui.admin/skin/default/skin.css" id="skin" />
        <link rel="stylesheet" type="text/css" href="${ctx}public/H-UI/static/h-ui.admin/css/style.css" />
        <link rel="icon" href="img/6.jpg">
    </head>
    <body>
    <input type="hidden" value="<%=basePath%>" id="basePath">
    <div class="login-main" style="width: 300px;height: 300px;margin: auto;margin-top: 300px;">
    
        <div class="layui-input-inline">
            <input type="text"  name="user_name"  placeholder="用户名" autocomplete="off" class="layui-input" value="weizuqing">
        </div>
        <div class="layui-input-inline">
            <input type="password"  name="user_password" placeholder="密码" autocomplete="off" class="layui-input" value="weizuqing">
        </div>
        <div class="layui-input-inline login-btn">
            <button type="submit" class="layui-btn" onclick="loginin()">登录</button>
        </div>
        <hr/>
        <p><a href="${ctx}zhuce.html" class="fl">立即注册</a></p>
   
</div>
<script src="${ctx}/public/layui/layui.js"></script>
<script src="${ctx}/public/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    layui.use(['form'], function () {
        var form = layui.form, $ = layui.jquery;
    });
    function loginin(){
    	var basePath=$("#basePath").val();
    	var user_name=$("input[name='user_name']").val();
    	var user_password=$("input[name='user_password']").val();
    	if(user_name==null || user_name.trim()=='' || user_password==null ||  user_password.trim()==''){
    		layer.msg("请输入用户名和密码", {
				time : 1000
			});
    	}else{
    		$.ajax({
    			url:basePath+"/login_in",
    			type:"POST",
    			data:{"user_name":user_name,"user_password":user_password},
    			success:function(data) {
    				layer.msg(data.msg,{
						time : 1000
					}, function() {
						if (data.url != null) {
							window.location.href ='/login';
						} 
					}); 
				}
    		});
    	}
    }
</script>
    </body>
</html>