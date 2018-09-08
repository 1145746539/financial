<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>财务集中化报账平台系统</title>

<link rel="stylesheet" href="./layui1/css/layui.css">
<link rel="shortcut icon"href="image/yc.ico"/>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">财务集中化报账平台系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">

			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="#">未处理报账<span
						class="layui-badge" id="count">
						<p></p>
						</span></a></li>
				<li class="layui-nav-item"><a href="javascript:;"> 
				<img src="/imgage/${sessionScope.fileName}" class="layui-nav-img">${dept.dname }:${users.uname }
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a class="layui-btn layui-btn-lg layui-btn-primary" href="modifyData.jsp">修改资料</a>
						</dd>
						<dd padding-top:15px style="text-align: center">
							<button
								class="layui-btn layui-btn-lg layui-btn-primary dw-dailog"
								dw-url="modifypwd.jsp" dw-title="修改密码" dw-width="50%"
								dw-height="50%" id="anniu">修改密码</button>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="logout.do">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item" id="selected"><a href="index.jsp">主页管理</a></li>

					<li class="layui-nav-item"><a href="javascript:;">员工管理</a>

						<dl class="layui-nav-child">
							<dd>
								<a href="userlist.for">员工列表</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a href="javascript:;">报账管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="subaccount">报账</a>
							</dd>
							<dd>
								<a href="selaccount.for">查看报账信息</a>
							</dd>
							<dd>
								<a href="account.for">审核报账信息</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a href="javascript:;">资金管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="journal.for">日记账</a>
							</dd>

						</dl></li>

					<li class="layui-nav-item"><a href="javascript:;">工资管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="payroll.for">工资表</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-footer">
		<footer>
			<span>源辰信息 &copy; 版权所有</span>
		</footer>
		</div>
	</div>
	<script type="text/javascript">
	$('li a').click(function() {
		$('.layui-this').addClass('layui-this');
		$(this).removeClass("layui-this");
	});
	layui.use('layer', function(){
		  var layer = layui.layer;
		  $.post("countNum.for",
			{},
			function(data){
				console.log(data);
			 $("p").html(data);
		  });
		}); 

	</script>
</body>
</html>