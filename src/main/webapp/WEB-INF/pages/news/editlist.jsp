<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("ctx",basePath);
%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
      <th>新闻名称</th>
      <th>发布作者</th>
      <th>发布时间</th>
      <th>状态</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody>
   <c:forEach items="${map.news}" var="new_info">
    <tr>
      <td>${new_info.news_name}</td>
      <td>${new_info.user_name}</td>
      <td><fmt:formatDate value="${new_info.create_time}"/></td>
      <td><c:if test="${new_info.is_flag==1}">通过</c:if><c:if test="${new_info.is_flag==0}">待审</c:if><c:if test="${new_info.is_flag==-1}">拒审</c:if> </td>
      <td> 
        <button  class="layui-btn" onclick="editnews(${new_info.news_id})">编辑 </button>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
<script type="text/javascript">
function editnews(news_id){
	var basePath=$("#basePath").val();
	window.location.href=basePath+"login/addnews.html?news_id="+news_id;
}
</script>
</body>
</html>