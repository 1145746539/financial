<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <legend>员工管理 - 员工列表</legend>
            <div class="layui-field-box">
              <hr>
              <div>
                  <button class="layui-btn layui-btn-xs dw-refresh">
                      <i class="layui-icon">&#x1002;</i>刷新
                  </button>
				  
              </div> 
              <hr>
		  
    <div class="demoTable" >
      
      	查询员工:
	  <div class="layui-inline">
	    <input class="layui-input" name="uname" id="uname" autocomplete="off" placeholder="请输入员工姓名">
	  </div>
	  
	  <div class="layui-inline" style="width:130px;">
		<select name="did" id="did" class="layui-input">
			 <option value="">请选择员工部门</option>
				 <c:forEach items="${list2}" var="l"> 
					 <option value="${l.did }">${l.dname }</option>
				 </c:forEach>
		</select> 
	</div>
	  
	  <button class="layui-btn" data-type="reload">查询</button>
	  
    </div>
        <div class="table-responsive table2excel" style="width: 1250px; text-align: center;"
					data-tableName="Test Table 1">    
						<table class="layui-hide" id="LAY_table_user" lay-filter="test"></table>
                </div> 
			</div>
		</fieldset>	
     </div>
  </div>
</div>
     


<script>   

layui.use('table', function(){
  var table = layui.table;
  
  var $ = layui.$, active = {
		  reload: function(){
	  	      var uname = $('#uname').val();
	  	      var did = $('#did').val();
			  //执行重载
	  	      table.reload('testReload', {
		  	        page: {
		                  curr: 1 //重新从第 1 页开始
		                },
		  	        where: {
		  	        		uname: uname,did:did
		  	        	}
		  	      });
	  	    }
	  };
  
  //第一个实例 方法级渲染
  table.render({
    elem: '#LAY_table_user',
    height: 375,
    url: 'userlist.do?op=fenye', //数据接口
    page: true, //开启分页
	cols: [[
      {field:'uid', width:150, title: '员工编号', sort: true}
      ,{field:'uname', width:150, title: '员工姓名'}
      ,{field:'sex', width:150, title: '性别',templet:'#forSex'}
	  ,{field:'phone', width:280, title: '联系方式'}
	  ,{field:'did', width:200, title: '所在部门',templet:'#forDid'}
      ,{field:'email', width:300, title: '邮箱'}
    ]]
  ,id: 'testReload'
  });
  
  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
});
</script> 

<script type="text/javascript" id="forSex">
	{{# if(d.sex == '1'){d.sex = '男'}}
		<span style="color:#000000;">{{d.sex}}</span>
		{{# } else {d.sex ='女'}}
		{{d.sex}}
		{{# }}}
</script>

<script type="text/javascript" id="forDid">
	{{# if(d.did == '1'){d.did = '采购部'}}
		<span style="color:#000000;">{{d.did}}</span>
		{{# } else if(d.did == '2'){d.did ='财务部'}}
		<span style="color:#000000;">{{d.did}}</span>
		{{# } else if(d.did == '3'){d.did ='财务总监'}}
		<span style="color:#000000;">{{d.did}}</span>
		{{# } else if(d.did == '4'){d.did ='总经理'}}
		<span style="color:#000000;">{{d.did}}</span>
		{{# }}}
</script>
</body>    
</html>