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
      <th>所属分组</th>
      <th>分组名称</th>
      <th>分组权限</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody>
   <c:forEach items="${groups}" var="group">
    <tr>
      <td> ${group.role_name} </td>
      <td>${group.group_name}</td>
      <td>${group.role_names}</td>
      <td> 
        <button  class="layui-btn" onclick="editgroup(${group.group_id})">编辑</button>
        <button onclick="delectgroup(${group.group_id})" class="layui-btn">删除</button>
      </td>
    </tr>
   </c:forEach>
  </tbody>
</table>
<script type="text/javascript">
function delectgroup(group_id){
	var basePath=$("#basePath").val();
	 if(confirm('确定要删除该行信息?')){
		 $.ajax({
			 url:basePath+"login/delgroup.do",
			 type:"POST",
			 data:{group_id:group_id},
			 success:function(data){
				 alert(data); 
				 window.location.reload();
			 }
		 });
	 }
}
function editgroup(group_id){
	var basePath=$("#basePath").val();
	window.location.href=basePath+"login/addgroup.html?group_id="+group_id;
}
</script>
</body>
</html>