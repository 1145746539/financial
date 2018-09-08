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
<script src="js/jquery-1.11.0.min.js"></script>    
<script src="js/jquery.table2excel.js"></script>    
<script type="text/javascript" src="layui1/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="icheck/icheck.js"></script>
<script type="text/javascript" src="js/dw.js"></script>
<jsp:include page="demo.jsp" flush="true"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>报账管理 - 审核报账信息</legend>
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
			    <div class="layui-inline">
			      <label class="layui-form-label">选择日期</label>
			      <div class="layui-input-inline">
        			<input type="text" class="layui-input" name="time" id="time" placeholder="2018-08">
      				</div>&nbsp;&nbsp;&nbsp;
				  <button class="layui-btn" data-type="reload">搜索</button>
			    </div>
			 </div>
						
                    <div class="table-responsive table2excel" style="width: 1300px; "
					data-tableName="Test Table 1">    
						<table id="demo" lay-filter="demo"></table>
                    </div> 
				</div>
			</fieldset>	
        </div>
    </div>
  </div>
  
<script>

layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  //年月选择器
	  laydate.render({
	    elem: '#time'
	    ,type: 'month'
	  });
	});
	
layui.use('table', function(){
  var table = layui.table;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 375
    ,url: 'voucher.do?op=examAccount' //数据接口
    ,page: true //开启分页
	,cols: [[
      {checkbox: true, fixed: true}
      ,{field:'id', width:80, title: 'ID', sort: true}
      ,{field:'types', width:100, title: '报账类型'}
      ,{field:'project', width:130, title: '报账项目'}
      ,{field:'uname', width:90, title: '报账人'}
      ,{field:'formatReport', width:175, title: '报账时间'}
	  ,{field:'money', width:100, title: '报账金额'}
      ,{field:'number', width:100, title: '账单数量'}
      ,{field:'allmoney', width:100, title: '报账总金额'}
      ,{field:'state', width:98, title: '账单状态',templet:'#stateId'}
      ,{field:'note',width:100, edit:'text', title: '备注'}
      ,{field:'', width:150 , title:'审核操作', toolbar: '#barDemo'}
    ]]
  ,id: 'testReload'
  });
  
  var $ = layui.$, active = {
		  reload: function(){
	  	      var time = $('#time').val();
	  	    	table.reload('testReload', {
		  	        page: {
		                  curr: 1 //重新从第 1 页开始
		                },
		  	        where: {time:time}
		  	      });
	  	    }
	  };
  
  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
  
	//监听单元格编辑
	  table.on('edit(demo)', function(obj){
	    var value = obj.value //得到修改后的值
	    ,data = obj.data //得到所在行所有键值
	    ,field = obj.field; //得到字段
	  });
	  
	  table.on('tool(demo)', function(obj){
		  var data = obj.data;
		  var note = data.note
		  var id = data.id;
		  console.log(note);
		  if(note == "undefined"){
			  note="无";
		  }
		  console.log(note);
		  
		  console.log(data.id);
		    if(obj.event === 'noPass'){
		    	layer.msg('审核不通过');
		    	$.post("examOne?ex=fail",
			    		{note:note,id:id},
			    		function(data){
			    			//通过成功
			    			if(data == "2"){
			    				obj.del();
			    				setTimeout("location.reload()",300);
			    			}	
			    	});
		    } else if(obj.event === 'Pass'){
		    	layer.msg('审核通过');
		    	$.post("examOne?ex=pass",
			    		{note:note,id:id},
			    		function(data){
			    			//通过成功
			    			if(data == "1"){
			    				obj.del();
			    				setTimeout("location.reload()",300);
			    			}
			    	});
	    }
	});
  
});

/* //	分类显示审核状态
$("[data-field='state']").children().each(function(){
	if($(this).text()=='0'){
		$(this).text("未审核")
	}else if($(this).text()=='1'){
		$(this).text("审核通过")
	}else if($(this).text()=='2'){
		$(this).text("审核不通过")
	}
}) */

$(function() {    
    $("#btn").click(function(){  
        $(".table2excel").table2excel({  			
            exclude: ".noExl",    
            name: "Excel Document Name",    
            filename: "审核报账表",    
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

<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs" lay-event="Pass">审核通过</a>
<a class="layui-btn layui-btn-danger layui-btn-xs dw-refresh" lay-event="noPass" >不通过</a>
</script>

</body>
</html>