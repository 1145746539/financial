<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>财务集中化报账平台系统</title>
  <link rel="stylesheet" href="./layui1/css/layui.css">
</head>
<div class="layui-container">  
    <div class="layui-row">
        <div class="layui-col-lg12">
            <fieldset class="layui-elem-field">
                <legend>用户管理 - 修改密码</legend>
                <div class="layui-field-box">
                    <form class="layui-form" action="">
					
					<div class="layui-form-item">
                        <label class="layui-form-label">用户邮箱</label>
                        <div class="layui-input-block">
                        <input type="text" required lay-verify="required"  lay-verify="email" id="email" name="email" style="width:190px;"  placeholder="用户邮箱" autocomplete="off" class="layui-input">
                        </div>
                    </div>
					
					<div class="layui-form-item">
						<label class="layui-form-label" style="width:100px;"> 
						<center><button class="layui-btn-sm layui-btn" id="tel_btn">获取验证码</button></center></label>
						<div class="layui-input-block">
						<input type="text" required lay-verify="required" name="VerificationCode" style="width:100px;"  placeholder="验证码" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="newPwd1" style="width:190px;"  placeholder="新密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
					
					
					<div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="newPwd2" style="width:190px;"  placeholder="再次输入新密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
			
                    <div class="layui-form-item" style="margin-top: 15px;">
                        <div class="layui-input-block">
                        <button class="layui-btn" lay-submit >立即修改</button>
                        </div>
                    </div>
                </form>
                </div>
            </fieldset>
        </div>
    </div>
</div>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./js/dw_form_submit.js"></script>

<script type="text/javascript">


$(function() {
	 
	var btn = $("#tel_btn");
	$(function() {
		btn.click(settime);
		btn.click(modify);
	})
	var countdown = 10;//倒计时总时间，为了演示效果，设为5秒，一般都是60s
	function settime() {
		if (countdown == 0) {
			btn.attr("disabled", false);
			btn.html("获取验证码");
			btn.removeClass("disabled");
			countdown = 10;
			return;
		} else {
			btn.addClass("disabled");
			btn.attr("disabled", true);
			btn.html("重新发送(" + countdown + ")");
			countdown--;
		}
		setTimeout(settime, 1000);
	}
	
	function modify(){
		var em = $("#email").val();
		$.post("modifyEmail",{email:em,jspType:'pwd'},function(data){
			layui.use('layer', function(){
				  var layer = layui.layer;
				  if(data=="no"){
					  layer.alert("邮箱："+em+" 格式错误！不能发送验证码！", {icon: 6}); 
				  }if(data=="yes"){
					  layer.alert("验证码已发送至"+em+"请注意查收！", {icon: 6}); 
				  }if(data=="null"){
					  layer.alert(em+"没有绑定任何账号，请重新输入！", {icon: 6}); 
				  }
				  
				}); 
		});
	}
 
})

var sign = "${modify}";
	console.log(sign);
		if( sign == "true"){
			layui.use('layer', function(){
				  var layer = layui.layer;
				  layer.msg('密码修改成功');
				}); 
		}
		if( sign == "false"){
			layui.use('layer', function(){
				  var layer = layui.layer;
				  layer.msg('密码修改失败.请重新输入');
				}); 
		}

</script>

</body>
</html>