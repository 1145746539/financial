<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>财务集中化报账平台系统</title>
<link rel="stylesheet" href="./layui1/css/layui.css" media="all">
</head>
<%
	// 如果不是servlet跳转过来，则应跳至  board.s  servlet
	if (request.getAttribute("modi") == null) {
		request.setAttribute("modi", "0");
	}
%>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">财务管理系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">

			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="" class="layui-nav-img"> 请先完善资料
				</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a>暂无权限</a></li>
				</ul>
			</div>
		</div>
		<div class="layui-body">
			<!-- 内容主题区域 -->
			<div style="padding: 15px;">
				<fieldset class="layui-elem-field">
					<legend>完善资料</legend>
					<div class="layui-field-box">
						<form class="layui-form" method="post" action="allregist.do"
							enctype="multipart/form-data">
							
							<div class="layui-form-item">
								<label class="layui-form-label">员工账号</label>
								<div class="layui-input-block">
									<input type="text" name="account" style="width: 190px;"
										autocomplete="off" value="${account}" class="layui-input" readonly>
								</div>
							</div>
							
							<div class="layui-form-item">
								<label class="layui-form-label">员工姓名</label>
								<div class="layui-input-block">
									<input type="text" name="uname" style="width: 190px;"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							
							<div class="layui-form-item">
								<label class="layui-form-label">新密码</label>
								<div class="layui-input-block">
									<input type="text" name="upwd" style="width: 190px;"
										autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label">联系方式</label>
								<div class="layui-input-block">
									<input type="text" required lay-verify="required" name="phone"
										lay-verify="phone" style="width: 190px;" autocomplete="off"
										class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label">邮箱</label>
								<div class="layui-input-block">
									<input type="text" required lay-verify="required"
										lay-verify="email" name="email" id="email"
										style="width: 190px;" autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label">性别</label>
								<div class="layui-input-block">
									<input type="radio" name="sex" value="1" title="男" /> <input
										type="radio" name="sex" value="2" title="女" />
								</div>
							</div>

							<div class="layui-upload">
								<label class="layui-form-label">上传头像:</label> 
								<div class="layui-input-block">
									<input type="file" style="color: blue; width: 22d0px;"
										name="file" />
								</div>
							</div>

							<div class="layui-form-item" style="margin-top: 15px;">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit type="submit">立即提交</button>
									<button type="reset" class="layui-btn layui-btn-primary">重置</button>
								</div>
							</div>
						</form>
					</div>
				</fieldset>
			</div>
		</div>
		<script type="text/javascript" src="./js/jquery.min.js"></script>
		<script type="text/javascript" src="./layui1/layui.js"></script>
		<script type="text/javascript" src="./js/sys_config.js"></script>
		<script type="text/javascript">
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.msg('检测到您是新账号，请完善个人资料');
		});
		</script>
</body>
</html>