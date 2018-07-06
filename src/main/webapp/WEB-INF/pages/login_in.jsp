<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("ctx",basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui.admin/skin/default/skin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/public/H-UI/static/h-ui.admin/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/public/layui/css/layui.css"/>
<title>H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">HI  ${user_Info.user_name} </a> 
		

		<input type="hidden" value="${ctx}" id="basePath">
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>${group_Info.group_name}</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">${map.group_Info.group_name} <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="${ctx}/loginout">退出</a></li>
				</ul>
			</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="layui-icon-theme" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
	
	<c:forEach items="${map.role_pinfos}" var="prole">
	<dl id="menu-article">
			<dt  onclick="selectroles(${prole.role_id})"><i class="Hui-iconfont">&#xe616;</i> ${prole.role_name }<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd id="dd${prole.role_id}">
		 </dd>
	</dl>
	</c:forEach>
	<c:if test="${! empty map.other_roles}">
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i> 其他权限<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
			<c:forEach items="${map.other_roles}" var="otherrole">
			<ul>
					<li><a data-href="${ctx}/${otherrole.role_url}" data-title="${otherrole.role_name}" href="javascript:void(0)">${otherrole.role_name}</a></li>
			</ul>
			</c:forEach>
		</dd>
	</dl>
	</c:if>
	
	<dl id="menu-article">
			<dt ><i class="Hui-iconfont">&#xe616;</i> 个人信息<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
			<ul>
			<li><a data-href="${ctx}/login/myself.html?user_id=${user_Info.user_id}" data-title="我的信息" href="javascript:void(0)">我的信息</a></li>
			</ul>
			<ul>
			<li><a data-href="${ctx}/login/upmypic.html?user_id=${user_Info.user_id}" data-title="修改头像" href="javascript:void(0)">修改头像</a></li>
			</ul>
			</dd>
		 </dd>
	</dl>
	
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="login/mynewslist.html">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="login/mynewslist.html"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<script type="text/javascript">
function selectroles(role_id){
	var basePath=$("#basePath").val();
	$("#dd"+role_id).empty();
	$.ajax({
		url:basePath+"login/selectroles.do",
		data:{"role_parent":role_id},
		type:"POST",
		success:function(data){
			
			for (var i = 0; i < data.length; i++) {
				var role_name=data[i].role_name;
				var role_url=data[i].role_url;
				$("#dd"+role_id).append("<ul><li><a data-href='"+role_url+"' data-title='"+role_name+"'>"+role_name+"</a></li></ul>");
			}
		 
		}
	});
}

</script>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/public/js/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="${ctx}/public/H-UI/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/public/H-UI/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx}/public/H-UI/static/h-ui.admin/js/H-ui.admin.js"></script> 
</body>
</html>