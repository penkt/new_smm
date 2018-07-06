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
<title>addrole</title>
<link rel="stylesheet" type="text/css" href="${ctx}/public/layui/css/layui.css" />
<script type="text/javascript" src="${ctx}/public/layui/layui.js"></script> 
<script type="text/javascript" src="${ctx}/public/js/jquery-1.9.1.min.js"></script> 
</head>
<body>


<form class="layui-form layui-form-pane" action="<c:if test="${empty role}">${ctx}/login/role</c:if><c:if test="${!empty role}">${ctx}/login/role/${role.role_id}</c:if>" method="post">
  <c:if test="${! empty role}"> <input type="hidden" name="_method" value="PUT"></c:if>
  
   <div class="layui-form-item">
    <label class="layui-form-label">权限分类</label>
    <div class="layui-input-inline">
      <select id="role_parent"   name="role_parent" class="layui-input"  required lay-verify="required">
        <c:forEach items="${proles}" var="prole">
        <option value="${prole.role_id}"  ${prole.role_id==role.role_parent?'selected':''}>   ${prole.role_name}</option>
        </c:forEach>
      </select>
       </div>
  </div>    
    <div class="layui-form-item">
    <label class="layui-form-label">权限名称</label>
    <div class="layui-input-inline">
      <input type="text" value="${role.role_name}" name="role_name" required lay-verify="required" placeholder="请输入权限名称" autocomplete="off" class="layui-input">
    </div>
    </div>
    
   <div class="layui-form-item">
    <label class="layui-form-label">权限链接</label>
    <div class="layui-input-inline">
      <input type="text" value="${role.role_url}" name="role_url" required lay-verify="required" placeholder="请输入权限链接" autocomplete="off" class="layui-input">
    </div>
    </div>
  
   <div class="layui-form-item">
    <div class="layui-input-block">
     <c:if test="${empty role}"> <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button></c:if>
     <c:if test="${! empty role}"> <button class="layui-btn" lay-submit lay-filter="formDemo">立即修改</button></c:if>
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
<script type="text/javascript">

</script>
</body>
</html>