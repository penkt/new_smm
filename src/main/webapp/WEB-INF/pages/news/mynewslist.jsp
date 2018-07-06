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
<title>我的主页</title>
    <link rel="stylesheet" type="text/css" href="/public/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="/public/css/admin.css"/>
</head>
<body>
<input type="hidden" value="${ctx}" id="basePath">
<%--<div class="wrap-container welcome-container">
    <div class="row">
        <div class="welcome-left-container col-lg-9">
            <div class="data-show">
                <ul class="clearfix">
                    <li class="col-sm-12 col-md-6 col-xs-12">
                        <a href="javascript:;" class="clearfix">
                            <div class="icon-bg bg-org f-l">
                                <span class="iconfont">&#xe606;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">会员数</p>
                                <p><span class="color-org">89</span>数据<span class="iconfont">&#xe628;</span></p>
                            </div>
                        </a>
                    </li>
                    <li class="col-sm-12 col-md-6 col-xs-12">
                        <a href="javascript:;" class="clearfix">
                            <div class="icon-bg bg-blue f-l">
                                <span class="iconfont">&#xe602;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">文章数</p>
                                <p><span class="color-blue">189</span>数据<span class="iconfont">&#xe628;</span></p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <!--图表-->
            <div class="chart-panel panel panel-default">
                <div class="panel-body" id="chart" style="height: 376px;">
                </div>
            </div>
            <!--服务器信息-->
            <div class="server-panel panel panel-default">
                <div class="panel-header">服务器信息</div>
                <div class="panel-body clearfix">
                    <div class="col-md-2">
                        <p class="title">服务器环境</p>
                        <span class="info">Apache/2.4.4 (Win32) PHP/5.4.16</span>
                    </div>
                    <div class="col-md-2">
                        <p class="title">服务器IP地址</p>
                        <span class="info">127.0.0.1   </span>
                    </div>
                    <div class="col-md-2">
                        <p class="title">服务器域名</p>
                        <span class="info">localhost </span>
                    </div>
                    <div class="col-md-2">
                        <p class="title"> PHP版本</p>
                        <span class="info">5.4.16</span>
                    </div>
                    <div class="col-md-2">
                        <p class="title">数据库信息</p>
                        <span class="info">5.6.12-log </span>
                    </div>
                    <div class="col-md-2">
                        <p class="title">服务器当前时间</p>
                        <span class="info">2016-06-22 11:37:35</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>
<p2 align="center">我的新闻列表</p2>
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
        <button onclick="delectnews(${new_info.news_id})" class="layui-btn">删除</button>
      </td>
    </tr>
    </c:forEach>
    <tr>
     <td colspan="5">
    <jsp:include page="../pageutil.jsp"></jsp:include>
    </td>
    </tr>
  </tbody>
</table>
<script src="/public/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="/public/echarts/echarts.js"></script>
<script type="text/javascript">
    layui.use(['layer','jquery'], function(){
        var layer 	= layui.layer;
        var $=layui.jquery;
        //图表
        var myChart;
        require.config({
            paths: {
                echarts: '/public/echarts'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/bar',
                'echarts/chart/line',
                'echarts/chart/map'
            ],
            function (ec) {
                //--- 折柱 ---
                myChart = ec.init(document.getElementById('chart'));
                myChart.setOption(
                    {
                        title: {
                            text: "数据统计",
                            textStyle: {
                                color: "rgb(85, 85, 85)",
                                fontSize: 18,
                                fontStyle: "normal",
                                fontWeight: "normal"
                            }
                        },
                        tooltip: {
                            trigger: "axis"
                        },
                        legend: {
                            data: ["会员", "文章"],
                            selectedMode: false,
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                dataView: {
                                    show: false,
                                    readOnly: true
                                },
                                magicType: {
                                    show: false,
                                    type: ["line", "bar", "stack", "tiled"]
                                },
                                restore: {
                                    show: true
                                },
                                saveAsImage: {
                                    show: true
                                },
                                mark: {
                                    show: false
                                }
                            }
                        },
                        calculable: false,
                        xAxis: [
                            {
                                type: "category",
                                boundaryGap: false,
                                data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
                            }
                        ],
                        yAxis: [
                            {
                                type: "value"
                            }
                        ],
                        grid: {
                            x2: 30,
                            x: 50
                        },
                        series: [
                            {
                                name: "会员",
                                type: "line",
                                smooth: true,
                                itemStyle: {
                                    normal: {
                                        areaStyle: {
                                            type: "default"
                                        }
                                    }
                                },
                                data: [10, 12, 21, 54, 260, 830, 710]
                            },
                            {
                                name: "文章",
                                type: "line",
                                smooth: true,
                                itemStyle: {
                                    normal: {
                                        areaStyle: {
                                            type: "default"
                                        }
                                    }
                                },
                                data: [30, 182, 434, 791, 390, 30, 10]
                            }
                        ]
                    }
                );
            }
        );
        $(window).resize(function(){
            myChart.resize();
        })
    });
</script>
<script type="text/javascript">
function editnews(news_id){
	var basePath=$("#basePath").val();
	window.location.href=basePath+"login/addnews.html?news_id="+news_id;
}
function delectnews(news_id){
	var basePath=$("#basePath").val();
	 if(confirm('确定要删除该行信息?')){
		 $.ajax({
			 url:basePath+"login/delectnews.do",
			 data:{news_id:news_id},
			 type:"POST",
			 success:function(data){
				 alert(data.msg); 
				 window.location.reload();
			 }
		 });
	 }
}
</script>
</body>
</html>