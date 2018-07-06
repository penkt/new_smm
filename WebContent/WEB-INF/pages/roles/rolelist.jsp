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
<link rel="stylesheet" type="text/css" href="${ctx}/public/layui/css/layui.css" />
<script type="text/javascript" src="${ctx}/public/layui/layui.js"></script> 
<script type="text/javascript" src="${ctx}/public/js/jquery-1.9.1.min.js"></script> 
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${ctx}" id="basePath">
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>权限分类</th>
      <th>权限名称</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody>
   <c:forEach items="${map.pageInfo.list}" var="role">
    <tr>
      <td>
      <c:forEach items="${map.proles}" var="prole">
          <c:if test="${prole.role_id==role.role_parent}">${prole.role_name}</c:if>
      </c:forEach> 
      </td>
      <td><a href="${ctx}/${role.role_url}"> ${role.role_name}</a></td>
      
      <td> 
        <button  class="layui-btn" onclick="editrole(${role.role_id})">编辑</button>
        <button onclick="delectrole(${role.role_id})" class="layui-btn">删除</button>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
<script type="text/javascript">
function delectrole(role_id){
	var basePath=$("#basePath").val();
	 if(confirm('确定要删除该行信息?')){
		 $.ajax({
			 url:basePath+"login/delrole.do",
			 type:"POST",
			 data:{role_id:role_id},
			 success:function(data){
				 alert(data); 
				 window.location.reload();
			 }
		 });
	 }
}
function editrole(role_id){
	var basePath=$("#basePath").val();
	window.location.href=basePath+"login/addrole.html?role_id="+role_id;
}
</script>
</body>
</html>