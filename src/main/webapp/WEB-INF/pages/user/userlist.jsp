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
      <th>用户名</th>
      <th>密码</th>
      <th>分组</th>
      <th>状态</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody>
   <c:forEach items="${map.pageInfo.list}" var="user">
    <tr>
      <td>${user.user_name}</td>
      <td>${user.user_password}</td>
      <td>
      <c:forEach items="${map.groups}" var="group">
      <c:if test="${user.user_groupid==group.group_id}">${group.group_name}</c:if>
      </c:forEach>
      </td>
      <td>
       <c:if test="${user.is_flag==-1}">无效</c:if>
       <c:if test="${user.is_flag==0}">待审核</c:if>
       <c:if test="${user.is_flag==1}">正常</c:if>
      </td>
      <td> 
        <button  class="layui-btn" onclick="edituser(${user.user_id})">编辑</button>
        <button onclick="delectuser(${user.user_id})" class="layui-btn">删除</button>
      </td>
    </tr>
    </c:forEach>
    
  </tbody>
</table>
<script type="text/javascript">
function delectuser(user_id){
	var basePath=$("#basePath").val();
	 if(confirm('确定要删除该行信息?')){
		 $.ajax({
			 url:basePath+"login/deluser.do",
			 data:{user_id:user_id},
			 type:"POST",
			 success:function(data){
				 alert(data.msg); 
				 window.location.reload();
			 }
		 });
	 }
}
function edituser(user_id){
	var basePath=$("#basePath").val();
	window.location.href=basePath+"login/adduser.html?user_id="+user_id;
}
</script>
</body>
</html>