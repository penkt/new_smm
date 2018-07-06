<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	request.setAttribute("ctx", basePath);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<script src="${ctx}/public/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/public/layui/layui.js"></script>
 <link rel="stylesheet" href="${ctx}/public/layui/css/layui.css">
<style type="text/css">
.stocksListBox {
	width: 1100px;
	height: 220px;
}

.stocksListBox li {
	width: 250px;
	float: left;
}

.stocksListBox li h4 {
	border-bottom: 1px solid #dadada;
	padding-left: 5px;
	font-size: 12px;
	height: 24px;
	line-height: 24px;
	background: #f7f7f7;
}

p.xdhq, tr.xdhq {
	color: green;
}

p.szhq, tr.szhq {
	color: red;
}

span.showdaima {
	font-size: 18px;
}

#hszs, #szzs, #hs300zs {
	line-height: 30px;
	height: 30px;
}

.quanqiuzs tbody tr th {
	font-size: 16px;
	line-height: 20px;
	height: 20px;
	font-weight: 100;
	width: 160px;
	text-align: center;
}

.quanqiuzs tbody tr {
	line-height: 25px;
	height: 25 px;
}

#showquanqiu th {
	width: 70px;
}
</style>
</head>
<body>
<ul class="stocksListBox">
			<li style="margin-right: 15px;">
				<h4>上证指数</h4>
				<div id="hszs"></div>
				<p><a href="http://quotes.cnfol.com/new/exponent/000001K.html" target="_blank"><img src="http://chart2.api.cnfol.com/r/11/000001K.png"></a></p>
			</li>
			<li style="margin-right: 15px;">
				<h4>深证成指</h4>
				<div id="szzs"></div>
				<p><a href="http://quotes.cnfol.com/new/exponent/399001J.html" target="_blank"><img src="http://chart2.api.cnfol.com/r/11/399001J.png"></a></p>
			</li>
			<li style="margin-right: 15px;">
				<h4>沪深300</h4>
				<div id="hs300zs"></div>
				<p><a href="http://quotes.cnfol.com/new/exponent/000300K.html" target="_blank"><img src="http://chart2.api.cnfol.com/r/11/000300K.png"></a></p>
			</li>
			
			<li style="width:305px">
				<h4>全球股市</h4>
				<table class="quanqiuzs">
				<tr id="showquanqiu">
				<th style="width: 100px;">名称</th><th>当前价</th><th>涨跌额</th><th>涨跌幅</th>
				</tr>
				<tr id="int_dji" class=""> </tr>
				<tr id="int_nasdaq" class=""> </tr>
				<tr id="int_hangseng" class=""> </tr>
				<tr id="int_nikkei" class=""> </tr>
				<tr id="b_FSSTI" class=""> </tr>
				<tr id="b_TWSE" class=""> </tr>			
				
				</table>
				
			</li>
</ul>
		


<script type="text/javascript" src="http://hq.sinajs.cn/list=sh000001" charset="gb2312"></script>  
<script type="text/javascript" src="http://hq.sinajs.cn/list=sh000300" charset="gb2312"></script>  
<script type="text/javascript" src="http://hq.sinajs.cn/list=sz399001" charset="gb2312"></script>  
<script type="text/javascript" src="http://hq.sinajs.cn/list=int_dji" charset="gb2312"></script>
<script type="text/javascript" src="http://hq.sinajs.cn/list=int_nasdaq" charset="gb2312"></script>
<script type="text/javascript" src="http://hq.sinajs.cn/list=int_hangseng" charset="gb2312"></script>
<script type="text/javascript" src="http://hq.sinajs.cn/list=int_nikkei" charset="gb2312">
<script type="text/javascript" src="http://hq.sinajs.cn/list=b_FSSTI" charset="gb2312"></script>
<script type="text/javascript" src="http://hq.sinajs.cn/list=b_TWSE" charset="gb2312"></script>
<script type="text/javascript" src="http://hq.sinajs.cn/list=b_FSSTI" charset="gb2312"></script>
<script type="text/javascript">
    var elements = hq_str_sh000001.split(",");
	var kpj =parseInt(parseInt(elements[1]).toFixed(0));
	var spj = parseInt(parseInt(elements[3]).toFixed(0));
	var zspj = parseInt(parseInt(elements[2]).toFixed(0));
	var zdzs = spj-zspj;
	var zdfd=((zdzs/zspj)*100).toFixed(2);
	if(zdzs>0){
		$("#hszs").append("<p class='szhq'>今开:" + kpj + " &nbsp;&nbsp;今收:" + spj + " &nbsp;&nbsp;" + zdzs+"&nbsp;&nbsp; "+zdfd+"%</p>");
	}else if(zdzs<0){
		$("#hszs").append("<p class='xdhq'>今开:" + kpj + "&nbsp;&nbsp; 今收:" + spj + " &nbsp;&nbsp;" + zdzs+"&nbsp;&nbsp;"+zdfd+"%</p>");
	}

    var elements = hq_str_sh000300.split(",");
	var kpj =parseInt(parseInt(elements[1]).toFixed(0));
	var spj = parseInt(parseInt(elements[3]).toFixed(0));
	var zspj = parseInt(parseInt(elements[2]).toFixed(0));
	var zdzs = spj-zspj;
	var zdfd=((zdzs/zspj)*100).toFixed(2);
	if(zdzs>0){
		$("#szzs").append("<p class='szhq'>今开:" + kpj + " &nbsp;&nbsp;今收:" + spj + " &nbsp;&nbsp;" + zdzs+"&nbsp;&nbsp; "+zdfd+"%</p>");
	}else if(zdzs<0){
		$("#szzs").append("<p class='xdhq'>今开:" + kpj + "&nbsp;&nbsp; 今收:" + spj + " &nbsp;&nbsp;" + zdzs+"&nbsp;&nbsp;"+zdfd+"%</p>");
	}
		
		var elements = hq_str_sz399001.split(",");
		var kpj =parseInt(parseInt(elements[1]).toFixed(0));
		var spj = parseInt(parseInt(elements[3]).toFixed(0));
		var zspj = parseInt(parseInt(elements[2]).toFixed(0));
		var zdzs = spj-zspj;
		var zdfd=((zdzs/zspj)*100).toFixed(2);
		if(zdzs>0){
			$("#hs300zs").append("<p class='szhq'>今开:" + kpj + " &nbsp;&nbsp;今收:" + spj + " &nbsp;&nbsp;" + zdzs+"&nbsp;&nbsp; "+zdfd+"%</p>");
		}else if(zdzs<0){
			$("#hs300zs").append("<p class='xdhq'>今开:" + kpj + "&nbsp;&nbsp; 今收:" + spj + " &nbsp;&nbsp;" + zdzs+"&nbsp;&nbsp;"+zdfd+"%</p>");
		}
		
		var elements = hq_str_int_dji.split(",");
		var name=elements[0];
	    var dqj = parseInt(parseInt(elements[1]).toFixed(0));
		var zdzs = parseInt(parseInt(elements[2]).toFixed(0));
		var zdfd =elements[3];
		if(zdzs>0){
			$("#int_dji").attr("class","szhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}else if(zdzs<0){
			$("#int_dji").attr("class","xdhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}
		
		var elements = hq_str_int_nasdaq.split(",");
		var name=elements[0];
	    var dqj = parseInt(parseInt(elements[1]).toFixed(0));
		var zdzs = parseInt(parseInt(elements[2]).toFixed(0));
		var zdfd =elements[3];
		if(zdzs>0){
			$("#int_nasdaq").attr("class","szhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}else if(zdzs<0){
			$("#int_nasdaq").attr("class","xdhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}
		
		var elements = hq_str_int_hangseng.split(",");
		var name=elements[0];
	    var dqj = parseInt(parseInt(elements[1]).toFixed(0));
		var zdzs = parseInt(parseInt(elements[2]).toFixed(0));
		var zdfd =elements[3];
		if(zdzs>0){
			$("#int_hangseng").attr("class","szhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}else if(zdzs<0){
			$("#int_hangseng").attr("class","xdhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}
		
		var elements = hq_str_int_nikkei.split(",");
		var name=elements[0];
	    var dqj = parseInt(parseInt(elements[1]).toFixed(0));
		var zdzs = parseInt(parseInt(elements[2]).toFixed(0));
		var zdfd =elements[3];
		if(zdzs>0){
			$("#int_nikkei").attr("class","szhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}else if(zdzs<0){
			$("#int_nikkei").attr("class","xdhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}
		
		var elements = hq_str_b_FSSTI.split(",");
		var name="新加坡";
	    var dqj = parseInt(parseInt(elements[1]).toFixed(0));
		var zdzs = parseInt(parseInt(elements[2]).toFixed(0));
		var zdfd =elements[3];
		if(zdzs>0){
			$("#b_FSSTI").attr("class","szhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}else if(zdzs<0){
			$("#b_FSSTI").attr("class","xdhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}
		var elements = hq_str_b_TWSE.split(",");
		var name="台湾指数";
	    var dqj = parseInt(parseInt(elements[1]).toFixed(0));
		var zdzs = parseInt(parseInt(elements[2]).toFixed(0));
		var zdfd =elements[3];
		if(zdzs>0){
			$("#b_TWSE").attr("class","szhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}else if(zdzs<0){
			$("#b_TWSE").attr("class","xdhq").append("<td><span>"+name+"</span></td>").append("<td>"+dqj+"</td>").append("<td>"+zdzs+"</td>")
			.append("<td>"+zdfd+"%</td>");
		}
		
		
		
		
</script>
<script>
layui.use('element', function(){
  var element = layui.element;
});
</script>
</body>
</html>