<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("ctx", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	当前第${map.page.pageNo}页|共${map.page.totalPage}页|共${map.page.totalCount}条记录
	<c:forEach items="${map.page.showPages}" var="page">
		<button class="layui-btn">
			<a href="${ctx}/${map.page.pageUrl}?pageNo=${page}">${page}</a>
		</button>
	</c:forEach>

</body>
</html>