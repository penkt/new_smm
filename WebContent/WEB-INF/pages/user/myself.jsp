<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("ctx",basePath);
%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addUser</title>
<link rel="stylesheet" type="text/css" href="${ctx}/public/layui/css/layui.css" />
<script type="text/javascript" src="${ctx}/public/layui/layui.js"></script> 
<script type="text/javascript" src="${ctx}/public/js/jquery-1.9.1.min.js"></script> 
</head>
<body>
<input value="${ctx}" type="hidden" id="basepath">
<form class="layui-form layui-form-pane" action="${ctx}/login/user/${user.user_id}" method="post">
  <c:if test="${! empty user}"> <input type="hidden" name="_method" value="PUT"></c:if>
   <input type="hidden" value="${roles}" id="roles">
   <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-inline">
      <input type="text" value="${user.user_name}" name="user_name" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">我的头像</label>
    <div class="layui-input-inline">
      <img style="width: 100x;height: 100px;" alt="" src="${ctx}/upload/${user.user_img}">
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
      <input type="text" value="${group.group_name}" class="layui-input">
     </div>不可修改
  </div>

<c:if test="${! empty role_Infos}">
  <div class="layui-form-item">
    <label class="layui-form-label">其他权限</label>
    <div class="layui-input-block">
      <c:forEach items="${role_Infos}" var="role_Info">
           <input type="checkbox" name="user_roles" value="${role_Info.role_id}" ${role==role_Info.role_id ? 'checked':''} title="${role_Info.role_name}">
      </c:forEach>
    </div>
  </div>
  </c:if>
  
    <div class="layui-form-item">
    <div class="layui-input-block">
     <c:if test="${empty user}"> <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button></c:if>
     <c:if test="${! empty user}"> <button class="layui-btn" lay-submit lay-filter="formDemo">立即修改</button></c:if>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  
  </form>

<script type="text/javascript">
layui.use('form', function(){
	var form = layui.form();
	//监听提交
	form.on('submit(formDemo)', function(data){
	layer.msg(JSON.stringify(data.field));
	return false;
	});
	});
	
</script>
</body>
</html>