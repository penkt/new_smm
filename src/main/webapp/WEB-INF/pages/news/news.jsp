<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<script src="${ctx}/public/js/jquery-1.9.1.min.js"></script>
	<link rel="stylesheet" href="${ctx}/public/layui/css/layui.css">
	<script src="${ctx}/public/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/public/baiduedit/ueditor.config.js"></script>
	<script type="text/javascript" src="${ctx}/public/baiduedit/ueditor.all.js"></script>
	<script type="text/javascript" src="${ctx}/public/js/jquery-1.9.1.min.js"></script>
	<title>添加新闻</title>
	<style type="text/css">
		form input, form textarea {
			width: 600px;
			line-height: 20px;
			height: 20px;
			margin-bottom: 10px;
		}
	</style>
</head>
<body>

<form  action="<c:if test='${! empty news_Info}'>${ctx}/login/news_Info/${news_Info.news_id}</c:if><c:if test='${empty news_Info}'>${ctx}/login/news_Info</c:if>" id="adnews" method="post">
	<c:if test="${! empty news_Info}"> <input type="hidden" name="_method" value="PUT"></c:if>
	新闻标题:<input name="news_name" value="${news_Info.news_name}"><br>
	&nbsp;关键词:<input name="news_keywords" value="${news_Info.news_keywords}"><br>
	<br> 发布时间:<jsp:useBean id="now" class="java.util.Date" scope="page" />
	<input type="text" readonly="readonly" 	value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm"/>">
	<br>
		<div>
	<script style="width:700px" id="news_content" name="news_content" type="text/plain">${news_Info.news_content}</script>

            </div>
    <input type="button" onclick="addnews();return false;" value="保存">
        </form>
        <script type="text/javascript">
                $(document).ready(function(){  var ue = UE.getEditor('news_content');});

    function addnews(){
        var news_name=$("input[name='news_name']").val();
        if (news_name==null || news_name.trim()=='') {
            alert("请输入新闻标题")
            return false;
        }else{
            $("#adnews").submit();
        }
    }
	</script>
</body>

</html>