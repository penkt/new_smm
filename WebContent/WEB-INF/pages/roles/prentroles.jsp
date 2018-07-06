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
    </tr> 
  </thead>
  <tbody>
   <c:forEach items="${proles}" var="role">
    <tr>
      <td> ${role.role_name}</td>
    </tr>
    </c:forEach>
        
        <tr>
			<form class="layui-form layui-form-pane" action="${ctx}/login/role" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">权限分组</label>
					<div class="layui-input-inline">
						<input type="text"  name="role_name" required lay-verify="required" placeholder="请输入权限分组" autocomplete="off" class="layui-input">
					</div>
				</div>
			    <div class="layui-form-item">
                   <div class="layui-input-block">
			           <button class="layui-btn" lay-submit lay-filter="formDemo">添加权限分组</button>
			       </div>
			    </div>
			</form>
			</tr>
			
		</tbody>
</table>
<script type="text/javascript">

</script>
</body>
</html>