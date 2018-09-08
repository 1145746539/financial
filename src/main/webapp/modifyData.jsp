	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>财务管理系统</title>

  <link rel="stylesheet" href="./layui1/css/layui.css"  media="all">

</head>
<%
if(request.getAttribute("modi") == null){
	request.setAttribute("modi","0");
}
%>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./layui1/layui.js"></script>
<script type="text/javascript" src="./js/sys_config.js"></script>
<jsp:include page="demo.jsp" flush="true"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>个人信息 - 修改个人资料</legend>
            <div class="layui-field-box">
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-xs dw-refresh">
                        <i class="layui-icon">&#x1002;</i>刷新
                    </button>
                </div>	
                <hr>
                <form class="layui-form" method="post" action="intoMdData" enctype="multipart/form-data">
                    <div class="layui-form-item">
                        <label class="layui-form-label">员工姓名</label>
                        <div class="layui-input-block">
                        <input type="text" name="uname" style="width:190px;"  value="${sessionScope.users.uname }" autocomplete="off" class="layui-input">
                        </div>
                    </div>
					
					<div class="layui-form-item">
                        <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="phone" lay-verify="phone" style="width:190px;"  value="${sessionScope.users.phone }" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                        <input type="text" required lay-verify="required" lay-verify="email" name="email" id="email" style="width:190px;" value="${sessionScope.users.email }" autocomplete="off" class="layui-input">
                        </div>
                    </div>
					
					<div class="layui-form-item">
                        <label class="layui-form-label">更改邮箱</label>
                        <div class="layui-input-block">
                        <input type="text" name="newemail" id="newemail" style="width:190px;"  placeholder="输入新邮箱" autocomplete="off" class="layui-input">
                        </div>
                    </div>
					
					<div class="layui-form-item">
						<label class="layui-form-label" style="width:100px;"> 
						<center><button class="layui-btn-sm layui-btn" id="tel_btn">获取验证码</button></center></label>
						<div class="layui-input-block">
						<input type="text"  name="VerificationCode" style="width:100px;"  placeholder="输入验证码" autocomplete="off" class="layui-input">
						</div>
					</div>
					
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择部门</label>
                        <div class="layui-input-block" style="width:190px;" >
                        <select name="did" >
                            <option value="${sessionScope.users.did }"></option>
                            <option value="0">采购部</option>
                            <option value="1">财务部</option>
                            <option value="2">财务经理</option>
                            <option value="3">总经理</option>
                        </select>
                        </div>
                    </div>
                   
                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                        <input type="radio" name="sex" value="1" title="男" ${sessionScope.users.sex eq 1 ? 'checked="checked"' :"" } />
                        <input type="radio" name="sex" value="2" title="女" ${sessionScope.users.sex eq 2 ? 'checked="checked"' :"" } />
                        </div>
                    </div>

					<div class="layui-upload">
					<label class="layui-form-label">更改头像:</label>
					  <input style="display:none" type="text" name="name"/>
					  <div class="layui-input-block">
					  <input type="file" style="color:blue;width:200px;" value="${sessionScope.users.uid }" name="file"/>
					  </div>
					</div>
					<input type="hidden"  name="uid" value="${sessionScope.users.uid }"/>
					
                    <div class="layui-form-item" style="margin-top: 15px;">
                        <div class="layui-input-block">
                        <button class="layui-btn" lay-submit type="submit">立即修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
    </div>
  </div>
</div>

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
    			var em = $("#newemail").val();
    			$.post("modifyEmail",{email:em,jspType:'Data'},function(data){
    				layui.use('layer', function(){
    					  var layer = layui.layer;
    					  if(data=="no"){
    						  layer.alert("邮箱："+em+" 格式错误！不能发送验证码！", {icon: 6}); 
    					  }if(data=="yes"){
    						  layer.alert("验证码已发送至"+em+"请注意查收！", {icon: 6}); 
    					  }
    					}); 
    			});
    		}
    	 
    	})

    	var modi = "${modi}"
	if(modi == "2"){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.msg('资料修改失败，请重新修改');
			}); 
	}
    	
    </script>
</body>
</html>