<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" 
  content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>财务集中化报账平台系统</title>
  <link rel="stylesheet" type="text/css" href="./layui/css/layui.css" media="all" />
</head>
<%
if(request.getAttribute("modi") == null){
	request.setAttribute("modi","0");
}
%>

<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
<script type="text/javascript" src="./icheck/icheck.js"></script>
<script type="text/javascript" src="./js/dw.js"></script>

<jsp:include page="demo.jsp" flush="true"/>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
                <fieldset class="layui-elem-field">
            <legend>系统信息</legend>
            <div class="layui-field-box">
               <TD width="90%">
						<div class='cnt'><marquee
							style="FONT-SIZE: 20px; COLOR: #0000FF" scrollamount='5'
							direction='left'><IMG height=15 src="image/tp009.gif"
							width=15> 欢迎您光临财务集中化报账平台系统，祝您生活愉快！</marquee></div>
						&nbsp;&nbsp;
						</TD>
            </div>
        </fieldset>
		
        <fieldset class="layui-elem-field">
            <legend>最新公告</legend>
            <div class="layui-field-box">
                  <colgroup>
                      <col width="150">
                      <col width="150">
                      <col>
                  </colgroup>
            <img src="image/new.png"> 通知全体员工：
鉴于公司目前业务量增大，员工每天工作十分辛苦，所以公司领导本着体恤员工、为员工送温暖的心情，
公司决定于2018年10月01号到杭州西湖去旅游，请于当日8:00时间整，在公司前门位置集合乘车前往，旅游过程所有开销由公司负责，希望大家玩的开心，也希望大家继续努力，一起携手开创公司的未来。
            </div>
        </fieldset>
    </div>
  </div>
</div>

<script type="text/javascript">
	var modi = "${modi}"
	if(modi == "1"){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.msg('资料修改成功');
			}); 
	}
	
	if(modi == "2"){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.msg('登录成功,欢迎您');
			}); 
	}
	
	if(modi == "3"){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.msg('暂无权限');
			}); 
	}
	
</script>

</body>
</html>