<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>财务管理系统</title>
<%@ include file="admin.jsp"%>
<link rel="stylesheet" href="/financial/layui1/css/layui.css">
</head>
<%
	if (request.getAttribute("states") == null) {
		request.setAttribute("states", "0");
	}
%>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
				<fieldset class="layui-elem-field">
					<legend>新增部门</legend>
					<div class="layui-field-box">
						<div class="layui-btn-group">
							<button class="layui-btn layui-btn-xs dw-refresh">
								<i class="layui-icon">&#x1002;</i>刷新
							</button>
						</div>
						<hr>
							<div class="layui-form-item">

								<div class="layui-form-item">
									<label class="layui-form-label">报账类型</label>
									<div class="layui-input-block" style="width: 190px;">
										<input type="text" name="types" id="types" required
											lay-verify="required" placeholder="请输入新增报账类型"
											autocomplete="off" class="layui-input">
									</div>
								</div>

							<hr class="layui-bg-blue">
							<div class="layui-form-item">
								<div class="layui-input-block">
									<input type="submit" value="确认添加" class="layui-btn"
									onclick="saveDate()" />
								</div>
							</div>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/financial/js/jquery.min.js"></script>
	<script type="text/javascript" src="/financial/layui/layui.js"></script>
	<script type="text/javascript" src="/financial/js/sys_config.js"></script>
	<script type="text/javascript">
		function saveDate() {
			var types = $("#types").val();
			$.post("/financial/admin.do", {
				types : types,
			}, function(data) {
				var states = data;
				if (states == "1") {
					layui.use('layer', function() {
						var layer = layui.layer;
						layer.msg('新增报账类型成功');
					});
				}
			});
		}
	</script>

</body>
</html>