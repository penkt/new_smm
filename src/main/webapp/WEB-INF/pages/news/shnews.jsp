<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="${ctx}/public/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="${ctx}/public/layui/css/layui.css">
<script src="${ctx}/public/layui/layui.js"></script>
<title>审核新闻</title>
</head>
<body>
   
	<form class="layui-form" id="adnews" method="post">
		<input type="hidden" value="${ctx}" id="basepath">
		<input type="hidden" name="_method" value="PUT">
		<input type="hidden" name="user_id" value="${map.news_Info.user_id}">
		<input type="hidden" value="${map.nextpage}" id="nextpage">
		<div class="layui-form-item">
			<label class="layui-form-label">新闻标题</label>
			<div class="layui-input-block">
				<input type="text" name="news_name" readonly="readonly" value="${map.news_Info.news_name}" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布时间</label>
			<div class="layui-input-inline">
				<input type="text" name="create_time" readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${map.news_Info.create_time}"/>' class="layui-input">
			</div>
			<label class="layui-form-label">发布作者</label>
			<div class="layui-input-block">
				
			</div>
		</div>
         <div class="layui-form-item">
			<label class="layui-form-label">新闻内容</label>
			<div class="layui-input-block">
			<div style="border: solid 1px #e6e6e6;">  ${map.news_Info.news_content}</div>
			</div>
		</div>
		<div class="layui-form-item">
		    <label  class="layui-form-label">更改状态</label>
			<div class="layui-input-block">
				<input type="radio" name="is_flag" _index="-1" title="拒审" ${map.news_Info.is_flag==-1?'checked':''}>
			    <input type="radio" name="is_flag" _index="0" title="待审" ${map.news_Info.is_flag==0?'checked':''}>
			    <input type="radio" name="is_flag" _index="1" title="通过" ${map.news_Info.is_flag==1?'checked':''}>
			</div>
			<button onclick="shnews_info(${map.news_Info.news_id});return false" class="layui-btn"  type="submit">立即修改</button>
			<c:if test="${map.prevpage!=null}"><a href="${ctx}/login/shnews/${map.prevpage}">上一篇</a></c:if>
			<c:if test="${map.nextpage!=null}"><a href="${ctx}/login/shnews/${map.nextpage}">下一篇</a></c:if>
		</div>
	</form>
</body>
<script type="text/javascript">
layui.use('form', function(){
	var form = layui.form;
	form.on('submit(formDemo)', function(data){
	});
});
function shnews_info(news_id){
	var basepath=$("#basepath").val();
	var nextpage=$("#SelectNextPage").val();
	var is_flag =$('.layui-input-block input[name="is_flag"]:checked ').attr("_index");
	$.ajax({
		url:basepath+"login/shnewinfo.do",
		data:{"news_id":news_id,"is_flag":is_flag},
		success:function(data){
			if (data) {
				if(nextpage>0){
					window.location.href=basepath+"/login/shnews/"+nextpage;
				}else{
					window.location.reload();
				}
			}else{
				alert("修改失败!");
			}
		}
	})
}
</script>
</html>