<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>财务管理系统</title>
<style>
	#anniu{
		width:190px;
	}
</style>

<link rel="stylesheet" href="/financial/layui1/css/layui.css">
<link rel="shortcut icon"href="/financial/image/yc.ico"/>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">财务管理系统</div>

			</ul> -->
			<ul class="layui-nav layui-layout-right">
				
				<li class="layui-nav-item"><a href="javascript:;"> 
				<img src="/financial/image/yc.ico" class="layui-nav-img"> 管理员:admin
				</a>
				</li>
				<li class="layui-nav-item"><a href="/financial/logout.do">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item" id="selected"><a href="/financial/seldept.do">新增员工账号</a></li>
					<li class="layui-nav-item" id="selected"><a href="/financial/manage/addtype.jsp">新增报账类型</a></li>
					<li class="layui-nav-item" id="selected"><a href="">基础数据维护</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			<p>源辰信息 &copy; 版权所有</p>
		</div>
	</div>
	<script type="text/javascript">
	$('li a').click(function() {
		$('.layui-this').addClass('layui-this');
		$(this).removeClass("layui-this");
	});
	</script>
</body>
</html>