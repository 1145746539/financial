<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>财务后台管理系统</title>
<link rel="stylesheet" type="text/css" href="./layui1/css/layui.css"
	media="all" />
<link rel="stylesheet" type="text/css" href="./css/login.css" />

<script type="text/javascript">
	function backlogin() {
		location.href="login.html"; 
	}

</script>
<style>
h1 {
	text-align: right
}

a {
	color: #3333ff;
}

#code {
	width: 100px;
	height: 30px;
	font-style: font-size: 20px;
	font-family: Arial;
	font-style: italic;
	font-weight: bold;
	border: 0;
	letter-spacing: 2px;
	color: red;
}
</style>

<div class="admin">

	<h1>
		<a href="index.html">管理员入口</a>
	</h1>
</div>

</head>
<body class="beg-login-bg">

	<!-- 登录页面-->
	<div class="beg-login-box" id="beg-login-box">
		<header>
			<h1>财务后台管理系统</h1>
		</header>
		<div class="beg-login-main">
			<form action="login.html" class="layui-form" method="post">
				<div class="layui-form-item">
					<label class="beg-login-icon"> <i class="layui-icon">&#xe612;</i>
					</label> <input type="text" lay-verify="required" name="name"
						autocomplete="off" placeholder="请输入账号" class="layui-input"
						lay-verType="tips">
				</div>
				<div class="layui-form-item">
					<label class="beg-login-icon"> <i class="layui-icon">&#xe642;</i>
					</label> <input type="password" lay-verify="required" name="password"
						autocomplete="off" placeholder="请输入新密码" class="layui-input"
						lay-verType="tips">
				</div>
				
				<div class="layui-form-item">
					<label class="beg-login-icon"> <img alt=""
						src='image/key.png'>
					</label> <input type="text" id="input" lay-verify="required" maxlength="4"
						autocomplete="off" placeholder="请输入验证码" class="layui-input"
						lay-verType="tips">
				</div>
				<!-- 验证码-->
				<div class="shurukuang">
					<input type="button" id="code" />
				</div>
				
				<div class="layui-form-item"></div>
				<div class="layui-form-item">
					<div class="beg-pull">
						<button type="button" id="check" class="layui-btn layui-btn-normal"
							style="width: 29%;" lay-submit lay-filter="formDemo">确定
						</button>
						
						<button type="button" onClick="backlogin()"
							class="layui-btn layui-btn-normal" style="width: 29%;">
							back</button>

						<button type="reset" class="layui-btn layui-btn-normal"
							style="width: 29%;">重置</button>
					</div>
				</div>
				
			</form>
		</div>
		<footer>
			<p>源辰信息 &copy; 版权所有</p>
		</footer>
	</div>

	<script type="text/javascript" src="./js/jquery.min1.js"></script>
	<script type="text/javascript" src="./layui1/layui.js"></script>
	<script type="text/javascript" src="./js/login.js"></script>
	<script type="text/javascript">
		function change() {
			code = $("#code");
			// 验证码组成库
			var arrays = new Array('1', '2', '3', '4', '5', '6', '7', '8', '9',
					'0', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
					'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
					'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
					'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
					'V', 'W', 'X', 'Y', 'Z');
			codes = '';// 重新初始化验证码
			for (var i = 0; i < 4; i++) {
				// 随机获取一个数组的下标
				var r = parseInt(Math.random() * arrays.length);
				codes += arrays[r];
			}
			// 验证码添加到input里
			code.val(codes);
		}
		change();
		code.click(change);
		//单击验证
		$("#check").click(function() {
			var inputCode = $("#input").val().toUpperCase(); //取得输入的验证码并转化为大写 
			console.log(inputCode);
			if (inputCode.length == 0) { //若输入的验证码长度为0
				alert("请输入验证码！"); //则弹出请输入验证码
			} else if (inputCode != codes.toUpperCase()) { //若输入的验证码与产生的验证码不一致时
				alert("验证码输入错误!请重新输入"); //则弹出验证码输入错误
				change();//刷新验证码
				$("#input").val("");//清空文本框
			} else { //输入正确时
				alert("正确"); //弹出
			}
		});
	</script>
</body>
</html>