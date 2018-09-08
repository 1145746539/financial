<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>财务集中化报账平台系统</title>
  <link rel="stylesheet" href="layui1/css/layui.css">
</head>

<script src="js/jquery-1.11.0.min.js" charset="utf-8"></script>    
<script src="js/jquery.table2excel.js" charset="utf-8"></script>    
<script type="text/javascript" src="layui1/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="icheck/icheck.js" charset="utf-8"></script>
<script type="text/javascript" src="js/dw.js" charset="utf-8"></script>

<jsp:include page="demo.jsp" flush="true"/> 

<body class="layui-layout-body" >    
<div class="layui-layout layui-layout-admin">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>报账管理 - 报账信息列表</legend>
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
                    <div class="table-responsive table2excel"  style="width: 1300px; "
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
    ,url: 'voucher.do?op=checkvoucher' //数据接口
    ,page: true
    ,method:'post'
	,cols: [[
      {field:'id', width:100, title: 'ID', sort: true}
      ,{field:'types', width:100, title: '报账类型'}
      ,{field:'project', width:200, title: '报账项目'}
      ,{field:'uname', width:100, title: '报账人'}
	  ,{field:'formatReport', width:175, title: '报账时间'}
      ,{field:'formatAudi', width:175, title: '审核时间'}
      ,{field:'money', width:100, title: '报账金额'}
      ,{field:'number', width:100, title: '账单数量'}
      ,{field:'allmoney', width:120, title: '报账总金额'}
      ,{field:'state', width:104, title: '报账状态',templet:'#stateId'}
    ]]
  });
});
	
        $(function() {    
            $("#btn").click(function(){  
                $(".table2excel").table2excel({  			
                    exclude: ".noExl",    
                    name: "Excel Document Name",    
                    filename: "凭证表",    
                    exclude_img: true,    
                    exclude_links: true,    
                    exclude_inputs: true    
                });  
            });    
        });    
    </script> 
<script type="text/javascript" id="stateId">
	{{# if(d.state == '0'){d.did = '未审核'}}
		<span style="color:#CCC;">{{d.did}}</span>
		{{# } else if(d.state == '1'){d.did ='审核通过'}}
		<span style="color:#0F0;">{{d.did}}</span>
		{{# } else if(d.state == '2'){d.did ='审核不通过'}}
		<span style="color:#F00;">{{d.did}}</span>
		{{# }}}
</script>
</body>    
</html>