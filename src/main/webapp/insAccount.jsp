<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>财务集中化报账平台系统</title>
  <link rel="stylesheet" href="./layui1/css/layui.css">
</head>

<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./js/sys_config.js"></script>

<jsp:include page="demo.jsp" flush="true"/>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>报账管理 - 上传报账</legend>
            <div class="layui-field-box">
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-xs dw-refresh">
                        <i class="layui-icon">&#x1002;</i>刷新
                    </button>
                </div>	
                <hr>
                <form class="layui-form" action="insertaccount" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">报账类型</label>
                        <div class="layui-input-block" style="width:190px;">                        
						<select name="types" lay-verify="required">
							  <option value="">请选择报账类型</option>
							  <c:forEach items="${list}" var="lo"> 
							  <option value="${lo.types}">${lo.types}</option>
							  </c:forEach>
						</select> 
						</div>		
                    </div>
					
                    <div class="layui-form-item">
                        <label class="layui-form-label">报账项目</label>
                        <div class="layui-input-block" style="width:190px;">
                        <input type="text" name="project" required lay-verify="required" placeholder="请输入报账项目" autocomplete="off" class="layui-input">
                        </div>
						
                    </div>
					
					<div class="layui-form-item">
                        <label class="layui-form-label">员工编号</label>
						<div class="layui-input-block" style="width:190px;">
						<input type="text" name="account" required lay-verify="required" value="${sessionScope.users.account}" autocomplete="off" class="layui-input" readonly>
						</div>
                    </div>
					
                    <div class="layui-form-item">
                        <label class="layui-form-label">报账金额</label>
						<div class="layui-input-block" style="width:190px;">
						<input type="text" name="money" id="money" onblur="sum()" required lay-verify="required" placeholder="请输入报账金额" autocomplete="off" class="layui-input">
						</div>
                    </div>
					
					<div class="layui-form-item">
                        <label class="layui-form-label">账单数量</label>
						<div class="layui-input-block" style="width:190px;">
						<input type="text" name="number" id="number" onblur="sum()" required lay-verify="required" placeholder="请输入账单数量" autocomplete="off" class="layui-input" >
						</div>
                    </div>
					
					<div class="layui-form-item">
                    <label class="layui-form-label">报账总金额</label>
						<div class="layui-input-block" style="width:190px;">
						<input type="text" name="allmoney" id="allmoney" value="" required lay-verify="required" placeholder="请输入报账总金额" autocomplete="off" class="layui-input" readonly>
						</div>
                    </div>
					
                    <div class="layui-form-item">
                        <label class="layui-form-label">审核状态</label>
                        <div class="layui-input-block">
							<input type="checkbox" name="state" value="1" title="未审核" disabled> 
                        </div>
                    </div>
                    
                    <hr class="layui-bg-blue">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                        <button class="layui-btn" lay-submit>立即提交</button>
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
	var sign = "${sign}";
	console.log(sign);
		if( sign == "ok"){
			layui.use('layer', function(){
				  var layer = layui.layer;
				  layer.msg('提交成功');
				}); 
		}
		if( sign == "no"){
			layui.use('layer', function(){
				  var layer = layui.layer;
				  layer.msg('提交失败');
				}); 
			}
</script>

<!-- 计算总金额的方法 -->
<script type="text/javascript">
	function sum(){
		//失焦获取到金额的值和数量的值
		var number = $("#number").val();
		var money = $("#money").val();
		//进行非空判断
		if((Math.round(number) == number) && ((Math.round(money) == money))){
				if((number >=0) && (money >=0)){
					//数量*金额
					var sumer = number * money;
					//将计算好的值放入文本中
					$("#allmoney").val(sumer);
				}else {
					var layer = layui.layer;
					layer.msg('请输入正确的正整数');
				}
			}
		}
</script>

</body>
</html>