<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("ctx",basePath);
%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>登陆</title>
        <base href="<%=basePath%>">
        <link rel="stylesheet" href="${ctx}public/layui/css/layui.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui.admin/css/H-ui.admin.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui.admin/skin/default/skin.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui.admin/skin/default/skin.css" id="skin" />
        <link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui.admin/css/style.css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="img/6.jpg">
    </head>
    <body>
    <input type="hidden" value="<%=basePath%>" id="basePath">
    <div  style="width:310px;height: 300px;margin: auto;margin-top: 300px;">
    <form action="${ctx}login/userzc" class="layui-form layui-form-pane" method="post">
			<input type="hidden" value="${roles}" id="roles">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" value="${user.user_name}" name="user_name" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" value="${user.user_password}" name="user_password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">用户分组</label>
				<div class="layui-input-inline">
					<select id="user_groupid" name="user_groupid" class="layui-input">
						<c:forEach items="${group_infos}" var="group_info">
							<option _index="-1" value="${group_info.group_id}"> ${group_info.group_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" onclick="userzc();return false;" lay-submit lay-filter="formDemo">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>

		</form>
       
        <p>已有账号：<a href="${ctx}/" class="fl">立即登录</a>
   
</div>
<script src="public/layui/layui.js"></script>
<script src="public/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    layui.use(['form'], function () {
        var form = layui.form(), $ = layui.jquery;
    });
    function userzc(){
    	var basePath=$("#basePath").val();
    	var user_name=$("input[name='user_name']").val();
    	var user_password=$("input[name='user_password']").val();
    	var user_groupid=$("#user_groupid option:selected").val();
    	if(user_name==null || user_name.trim()=='' || user_password==null ||  user_password.trim()==''){
    		layer.msg("请输入用户名和密码", {
				time : 1000
			});
    	}else{
    		$("form").submit();
    	}
   }
</script>
    </body>
</html>