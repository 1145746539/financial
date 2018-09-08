<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>财务集中化报账平台系统</title>
  <link rel="stylesheet" href="layui1/css/layui.css"  media="all">
</head> 
     
<script src="js/jquery-1.11.0.min.js"></script>    
<script src="js/jquery.table2excel.js"></script>    
<script type="text/javascript" src="layui1/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="icheck/icheck.js"></script>
<script type="text/javascript" src="js/dw.js"></script>  

<jsp:include page="demo.jsp" flush="true"/> 
 
<body class="layui-layout-body" >    
<div class="layui-layout layui-layout-admin">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>资金管理 - 日记账</legend>
            <div class="layui-field-box">
              <hr>
              <div>
                  <button class="layui-btn layui-btn-xs dw-refresh">
                      <i class="layui-icon">&#x1002;</i>刷新
                  </button>
				  <button id="btn" class="layui-btn layui-btn-xs btn btn-primary">
					  <i class="layui-icon">&#x1002;</i>导出
				  </button> 
              </div> 
              <hr>
		  
    <div class="demoTable">
      <label class="layui-form-label">选择日期</label>
      
      <div class="layui-input-inline">
        <input type="text" class="layui-input" name="time" id="time" placeholder="2018-08-27">
      </div>&nbsp;&nbsp;&nbsp;
      
      	搜索编号:
	  <div class="layui-inline">
	    <input class="layui-input" name="id" id="id" autocomplete="off">
	  </div>
	  
	  <button class="layui-btn" data-type="reload">搜索</button>
    </div>
    
                    <div class="table-responsive table2excel" style="width: 802px; "
					data-tableName="Test Table 1">    
						<table class="layui-hide" id="LAY_table_user" lay-filter="test"></table>
                </div> 
			</div>
		</fieldset>	
     </div>
  </div>
</div>

<script>   
//	定义时间的函数
layui.use('laydate', function(){
	var laydate = layui.laydate;
	//年月日选择器
	laydate.render({
	  elem: '#time'
	});
});

layui.use('table', function(){
  var table = layui.table;
  
  var $ = layui.$, active = {
		  reload: function(){
	  	      var id = $('#id').val();
	  	      var time = $('#time').val();
	  	      if(Math.round(id) == id){
	  	    	table.reload('testReload', {
		  	        page: {
		                  curr: 1 //重新从第 1 页开始
		                },
		  	        where: { id: id,time:time}
		  	      });
	  	      }else{
	  	    	 //id不为数字，弹出提示
	  	  	    layui.use('layer', function(){
	  				  var layer = layui.layer;
	  				  layer.msg('请输入正确的整数型id');
	  				}); 
	  	      }
	  	    }
	  };
  
  //第一个实例
  table.render({
    elem: '#LAY_table_user	'
    ,height: 315
    ,url: 'voucher.do?op=journal' //数据接口
    ,page: true //开启分页
	,cols: [[
      {field:'id', width:120, title: '账单编号', sort: true}
      ,{field:'types', width:123, title: '报账类型'}
      ,{field:'project', width:210, title: '报账项目'}
	  ,{field:'formatReport', width:175, title: '报账时间'}
      ,{field:'allmoney', width:150, title: '报账总金额'}
    ]]
  ,id: 'testReload'
  });
  
  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
});
	
$(function() {    	
    $("#btn").click(function(){  
        $(".table2excel").table2excel({  			
            exclude: ".noExl",    
            name: "Excel Document Name",    
            filename: "日记账表",    
            exclude_img: true,    
            exclude_links: true,    
            exclude_inputs: true    
        });  
    });    
}); 
</script> 
 
</body>    
</html>