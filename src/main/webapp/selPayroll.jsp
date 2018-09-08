<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>财务集中化报账平台系统</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="stylesheet" href="./layui1/css/layui.css"  media="all">
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
            <legend>用户管理 - 用户列表</legend>
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
                    <div class="table-responsive table2excel" style="width: 865px; "
					data-tableName="Test Table 1">    
						<table id="demo" lay-filter="test"></table>
            	 </div>     
            </div>    
            </fieldset>
  		</div>
 	</div>
</div>
 <script>
	
layui.use('table', function(){
  var table = layui.table;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 375
    ,url: 'voucher.do?op=salary' //数据接口
    ,page: true //开启分页
	,cols: [[
      {field:'pid', width:150, title: '部门编号', sort: true}
      ,{field:'uname', width:150, title: '员工名'}
      ,{field:'dname', width:150, title: '部门名称'}
      ,{field:'pay', width:150, title: '应付工资'}
      ,{field:'paytime', title: '发工资的日期', width: '30%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
    ]]
  });
  
});
	
	layui.use('table', function(){
	var table = layui.table;
  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
});
	
        $(function() {    	
            $("#btn").click(function(){  
                $(".table2excel").table2excel({  			
                    exclude: ".noExl",    
                    name: "Excel Document Name",    
                    filename: "工资表",    
                    exclude_img: true,    
                    exclude_links: true,    
                    exclude_inputs: true    
                });  
            });    
        });  
</script>
</body>    
</html>