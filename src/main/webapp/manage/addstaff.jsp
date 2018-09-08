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
<link rel="stylesheet" href="/financial/layui1/css/layui.css" media="all">
<style type="text/css">
#anniu {
	position: absolute;
	top: 231px;
}

#deptid {
	color: red;
}
</style>
</head>
<%
	if (request.getAttribute("states") == null) {
		request.setAttribute("states", "0");
	}
%>

	<script type="text/javascript" src="/financial/js/jquery.min.js"></script>
	<script type="text/javascript" src="/financial/layui1/layui.js"></script>
	<script type="text/javascript" src="/financial/js/sys_config.js"></script>
	<script type="text/javascript" src="/financial/icheck/icheck.js"></script>
	<script type="text/javascript" src="/financial/js/dw.js"></script>
	
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
				<fieldset class="layui-elem-field">
					<legend>新增员工账号</legend>
					<div class="layui-field-box">
						<hr>
						<div class="layui-form-item">
							<label class="layui-form-label">员工账号</label>
							<div class="layui-input-block">
								<input type="text" name="account" id="account"
									style="width: 190px;" autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label">初始密码</label>
							<div class="layui-input-block">
								<input type="text" name="newpwd" id="newpwd" required
									lay-verify="required" style="width: 190px;" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						
						<label class="layui-form-label">选择部门</label>
						<div class="layui-inline" style="width: 190px;">
							<select name="did" id="did" class="layui-input" lay-verify="required">
								<c:forEach items="${list1}" var="dept">
									<option value="${dept.did}">
									<c:if test="${dept.did eq 1}">采购部</c:if>
									<c:if test="${dept.did eq 2}">财务部</c:if>
									<c:if test="${dept.did eq 3}">财务总监</c:if>
									<c:if test="${dept.did eq 4}">总经理</c:if>
									</option>
								</c:forEach>
							</select>
						</div>

						<div class="layui-form-item"
							style="margin-top: 15px; margin-left: 110px;">
							<div class="layui-input-block">
								<input type="submit" value="确认提交" class="layui-btn"
									onclick="saveDate()" />
							</div>
						</div>

						<div class="layui-form-item" id="anniu">
							<div class="layui-input-block">
								<button class="layui-btn" onclick="create()">一键生成</button>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//纯数字
		function random(len) {
			var pwd = "";
			for (var idx = 0; idx < len; idx++) {
				var seed = parseInt(Math.random() * 9);
				pwd = pwd + seed;
			}
			return pwd;
		}

		function create() {
			var newpwd = document.getElementById("newpwd");
			var account = document.getElementById("account");
			for (var i = 0; i < 6; i++) {
				newpwd.value = random(6);
				account.value = newpwd.value;
			}
		}
	</script>

	<script type="text/javascript">
		function saveDate() {
			var account = $("#account").val();
			var newpwd = $("#newpwd").val();
			var did = $("#did").val();

			$.post("regist.do", {
				account : account,
				newpwd : newpwd,
				did : did
			}, function(data) {
				var states = data;
				if (states == "1") {
					layui.use('layer', function() {
						var layer = layui.layer;
						layer.msg('初始账号注册成功');
					});
				}
			});
		}
	</script>
</body>
</html>