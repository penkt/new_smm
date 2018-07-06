<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("ctx", basePath);
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form action="${ctx}/login/upimg/${user_id}" method="post" enctype="multipart/form-data">
		<input name="flie_name" type="file">
		<input type="submit" value="保存">
	</form>


</body>
</html>