<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>财务集中化报账平台系统</title>
<link rel="stylesheet" type="text/css" href="./layui1/css/layui.css"
	media="all" />
<link rel="stylesheet" type="text/css" href="./css/login.css" />
<link rel="shortcut icon"href="image/yc.ico"/>

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
		<a href="./manage/AdminIndex.jsp">管理员入口</a>
	</h1>
</div>

</head>
<%
// 如果不是servlet跳转过来，则应跳至  board.s  servlet
if(request.getAttribute("del") == null){
	request.setAttribute("del","0");
}
%>
<body class="beg-login-bg">

	<!-- 登录页面-->
	<div class="beg-login-box" id="beg-login-box">
		<header>
			<h1>财务集中化报账平台系统</h1>
		</header>
		<div class="beg-login-main">
			<form action="login.do" class="layui-form" method="POST">
				<div class="layui-form-item">
					<label class="beg-login-icon"> <i class="layui-icon">&#xe612;</i>
					</label> <input type="text" lay-verify="required" name="account"
						autocomplete="off" placeholder="这里输入账号" class="layui-input"
						lay-verType="tips">
				</div>
				<div class="layui-form-item">
					<label class="beg-login-icon"> <i class="layui-icon">&#xe642;</i>
					</label> <input type="password" lay-verify="required" name="upwd"
						autocomplete="off" placeholder="这里输入密码"  onblur="check()" class="layui-input"
						lay-verType="tips">
				</div>
				<div class="layui-form-item">
					<div class="beg-pull">
						<button type="submit" class="layui-btn layui-btn-normal"
							style="width: 47%;" lay-submit>登录</button>

<!-- 						<button type="button" onClick="showRegisterPage()"
							class="layui-btn layui-btn-normal" style="width: 29%;">
							注册</button>

 -->						<button type="reset" class="layui-btn layui-btn-normal"
							style="width: 47%;">重置</button>

					</div>
				</div>
			</form>
		</div>
		<footer>
			<p>源辰信息 &copy; 版权所有</p>
		</footer>
	</div>


	<!-- 注册页面-->
<!-- 	<div class="beg-regist-box" id="beg-regist-box" style="display: none;">
		<header>
			<h1>财务集中化报账平台系统</h1>
		</header>

		<div class="beg-login-main">
			<form action="regist.do" class="layui-form" method="post">
				<div class="layui-form-item">
					<label class="beg-login-icon"> <i class="layui-icon">&#xe612;</i>
					</label> <input type="text" lay-verify="required" name="account"
						id="account" autocomplete="off" placeholder="请输入账号" class="layui-input"
						lay-verType="tips" onblur="message()">
				</div>
				<div class="layui-form-item">
					<label class="beg-login-icon"> <i class="layui-icon">&#xe642;</i>
					</label> <input type="password" lay-verify="required" name="upwd"
						autocomplete="off" placeholder="请输入密码" class="layui-input"
						lay-verType="tips">
				</div>
				
				<div class="layui-form-item">
					<label class="beg-login-icon"> <img alt=""
						src='image/key.png'>
					</label> <input type="text" id="input" lay-verify="required" maxlength="4"
						autocomplete="off" placeholder="这里输入验证码" class="layui-input"
						lay-verType="tips">
				</div>
				验证码

				<input type="button" id="code" />

				<div class="layui-form-item"></div>

				<div class="layui-form-item">
					<div class="beg-pull">
						<button type="button" id="check"
							class="layui-btn layui-btn-normal" dw-url="addInfo.jsp"
							style="width: 29%;" lay-submit lay-filter="formDemo">注册</button>
						<button type="reset" onClick="backlogin()"
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
	</div> -->

	<script type="text/javascript">
		function showRegisterPage() {
			$("#beg-login-box").css("display", "none");
			$("#beg-regist-box").css("display", "block");
		}

		function backlogin() {
			$("#beg-regist-box").css("display", "none");
			$("#beg-login-box").css("display", "block");
		}
		
	</script>

	<script type="text/javascript" src="./js/jquery.min1.js"></script>
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script type="text/javascript" src="./layui1/layui.js"></script>
	<script type="text/javascript" src="./js/login.js"></script>
	<script type="text/javascript">
	
		function add(){
			var index = layer.open({
				type:2, //2（iframe层）
				shade:0.1, //遮罩层透明度
				area:['650px','560px'], //弹出层宽高
				title:'完善个人资料',	  //弹出层标题
				content:'addInfo.jsp'	//URL
			});
		}
	
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
			if (inputCode.length == 0) { //若输入的验证码长度为0
				alert("请输入验证码！"); //则弹出请输入验证码
			} else if (inputCode != codes.toUpperCase()) { //若输入的验证码与产生的验证码不一致时
				alert("验证码输入错误!请重新输入"); //则弹出验证码输入错误
				change();//刷新验证码
				$("#input").val("");//清空文本框
			} else { //输入正确时
				add();
			}
		});
		
/* 		function message(){
			var account = $("#account").val();
			$.post("verAccount",{account:account},function(data){
				if(data == "no"){
					document.getElementById('account').value="";
					alert("账号已存在，请重新输入！");
				}
			})
		} */
		
		var modi = "${del}"
			if(modi == "1"){
				layui.use('layer', function(){
					  var layer = layui.layer;
					  layer.msg('账号或密码错误，请重新输入');
					}); 
			}
		
	</script>
</body>
</html>