<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="${pageContext.request.contextPath }/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<!-- 引入自定义样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<!-- 弹出层样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/layer.css">

<title>个人通讯录</title>
</head>
<body>
	<div class="container">
		<div class="head row">
			<div class="col-sm-6 text-left">
				<h1>个人通讯录</h1>
			</div>
			<div class="col-sm-2 text-center head-right">
				<span>欢迎登陆！</span>
			</div>
			<div class="col-sm-2 text-center head-right">
				<i class="fa fa-user"></i>&nbsp;&nbsp;<span>${root.username}</span>
			</div>
			<div class="col-sm-2 text-center head-right logout">
				<a href="${pageContext.request.contextPath }/logout"><i class="fa fa-sign-out"></i>&nbsp;<span>退出系统</span></a>
			</div>
		</div>
		<br>
		<div class="main">
			<div class="row">
				<div class="col-sm-3" style="line-height: 50px;">
					<button type="button" class="btn btn-primary addPersonBtn">
						<i class="fa fa-plus" style="color: #fff"></i>&nbsp;&nbsp;添加联系人
					</button>
				</div>
				<div class="col-sm-offset-4 col-sm-5">
					<form action="javascript:;" method="post" class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input id="searchInput" value="" type="text" class="form-control" 
							placeholder="用户名" onkeyup="searchPersonByUsername(this)" onblur="HiddenTheShowResult()">
							<!-- 搜索框显示的内容 -->
							<div id="showResult"></div>
						</div>
						<button type="submit" id="searchBtn" class="btn btn-primary">搜索</button>
					</form>
				</div>
			</div>
			<br>
			<!-- 响应式表格 -->
			<div class="table-responsive">
				<table class="table table-bordered  table-hover">
					<thead class="fixed-thead">
						<tr>
							<th width="6%">序号</th>
							<th width="10%">用户名</th>
							<th width="10%">出生日期</th>
							<th width="6%">性别</th>
							<th width="12%">联系电话</th>
							<th width="12%">邮箱</th>
							<th width="12%">QQ</th>
							<th width="20%">备注</th>
							<th width="6%">编辑</th>
							<th width="6%">删除</th>
						</tr>
					</thead>
					<tbody class="tbody">
					</tbody>
				</table>
			</div><!-- end of .table-responsive -->
		</div>
		<!-- end of .main -->

		<!-- 引入添加弹出层 -->
		<jsp:include page="addPerson.jsp"></jsp:include>
		
		<!-- 引入编辑弹出层 -->
		<jsp:include page="editPerson.jsp"></jsp:include>

		<div class="foot text-center navbar-fixed-bottom">
			<p>Copyright (c) 2017 Copyright Holder All Rights Reserved.</p>
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/messages_zh.js"></script>
<!-- 引入自定义的弹出层JS -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/layer.js"></script>

<!-- 页面加载完毕后，aJax加载全部数据 -->
<script type="text/javascript">
$(function(){
	/* 把搜索框的内容清空 */
	$("#searchInput").val("");
	/* ajax加载全部数据 */
	$.post(
		"${pageContext.request.contextPath}/person?method=personList",
		function(data){
 			var content = "";
 			for (var i = 0; i < data.length; i++) {
				content+="<tr>"+
							"<th>"+(i+1)+"</th>"+
							"<td>"+data[i].username+"</td>"+
							"<td>"+data[i].birthDate+"</td>"+
							"<td>"+data[i].gender+"</td>"+
							"<td>"+data[i].telephone+"</td>"+
							"<td>"+data[i].email+"</td>"+
							"<td>"+data[i].qq+"</td>"+
							"<td>"+data[i].remarks+"</td>"+
							"<td><a href='javascript:;' class='editPerson' onclick=editPersonByIdFn("+data[i].id+")><i class='fa fa-edit'></i></a></td>"+
							"<td><a href='javascript:;' class='deletePerson' onclick=deletePersonById("+data[i].id+")><i class='fa fa-trash'></i></a></td>"+
						 "</tr>";
			}
 			$(".tbody").html(content);
		},
		"json"
	);
});
</script>
<!-- 添加联系人信息 -->
<script type="text/javascript">
//自定义校验规则，判断用户名是否存在
$.validator.addMethod(
	//规则名称
	"checkUsername",
	function(value,element,params){
		var flag = false;
		$.ajax({
			"async":false,
			"url":"${pageContext.request.contextPath}/person?method=checkUsername",
			"data":{"username":value},
			"type":"POST",
			"success":function(data){
				flag = data.isUsernameExist;
			},
			"dataType":"json"
		});
		return flag;
	}
);
/* 添加页面校验规则 */
$(function(){
	$("#addForm").validate({
		rules:{
			"username":{
				"required":true,
				"checkUsername":true
			},
			"birthDate":{
				"required":true				
			},
			"gender":{
				"required":true
			},
			"telephone":{
				"required":true								
			},
			"email":{
				"required":true
			},
			"qq":{
				"required":true
			}
		},
		messages:{
			"username":{
				"checkUsername":"此用户名已存在"
			},
		}
	});
});
/* 编辑页面校验规则 */
$(function(){
	$("#editForm").validate({
		rules:{
			"username":{
				"required":true,
			},
			"birthDate":{
				"required":true				
			},
			"gender":{
				"required":true
			},
			"telephone":{
				"required":true								
			},
			"email":{
				"required":true
			},
			"qq":{
				"required":true
			}
		}
	});
});
</script>
<!-- 查询 -->
<script type="text/javascript">
	
	/* 显示搜索后的数据 */
	$(function(){
		$("#searchBtn").click(function(){
			/* 先把搜索显示框隐藏 */
			$("#showResult").css("display","none");
			var $searchInput = $("#searchInput").val();
			var searchContext = "";
			$.post(
				"${pageContext.request.contextPath}/person?method=showSearchPersonByUsername",
				{"username":$searchInput},
				function(data){
					/*[
					 	{"id":"10","username":"张三","birthDate":"1995-06-06","gender":"男","telephone":"12312345658","email":"123123@123.com","qq":"159874568","remarks":"天之骄子zpj"},
					 	{"id":"1512319801091","username":"俄而三六九","birthDate":"1990-01-01","gender":"男","telephone":"123789","email":"asdf@123","qq":"12341234","remarks":"三六九"}
					   ]
					*/
					for (var i = 0; i < data.length; i++) {
						searchContext +="<tr>"+
									"<th>"+(i+1)+"</th>"+
									"<td>"+data[i].username+"</td>"+
									"<td>"+data[i].birthDate+"</td>"+
									"<td>"+data[i].gender+"</td>"+
									"<td>"+data[i].telephone+"</td>"+
									"<td>"+data[i].email+"</td>"+
									"<td>"+data[i].qq+"</td>"+
									"<td>"+data[i].remarks+"</td>"+
									"<td><a href='javascript:;' class='editPerson' onclick=editPersonByIdFn("+data[i].id+")><i class='fa fa-edit'></i></a></td>"+
									"<td><a href='javascript:;' class='deletePerson' onclick=deletePersonById("+data[i].id+")><i class='fa fa-trash'></i></a></td>"+
								 "</tr>";
					}
		 			$(".tbody").html(searchContext);
				},
				"json"
			);
		});
	});

	/*onclick和onblur事件会发生冲突
	  解决方法是加一个定时器，让onblur事件推迟一定的毫秒再执行
	  这样onclick事件就有足够的时间处理了
	 注意时间间隔
	*/
	var timer;
	HiddenTheShowResult = function (){
		timer = setTimeout(function(){
			/* 隐藏搜索内容框 */
			$("#showResult").css("display","none");
		},100);
	};
	clickFn = function(obj){
		clearTimeout(timer);
		/* 点击，把内容显示在搜索框中 */
		$("#searchInput").val($(obj).html());
		$("#showResult").css("display","none");
	}

	/* 鼠标滑入 */
	function mouseoverFn(obj){
		$(obj).css("background","#DBEAF9");
	}
	/* 鼠标滑出 */
	function mouseoutFn(obj){
		$(obj).css("background","#fff");
	}
	
	/* 模糊搜索 */
	function searchPersonByUsername(obj){
		//获得输入框的内容
		var username = $(obj).val();
		//模糊查询
		var content = "";
		$.post(
			"${pageContext.request.contextPath}/person?method=searchPersonByUsername",
			{"username":username},
			function(data){
				if(data.length>0){
					/*[lisi, si]*/
					for (var i = 0; i < data.length; i++) {
						content += "<div class='resultLI' onclick='clickFn(this)' onmouseover='mouseoverFn(this)' onmouseout='mouseoutFn(this)'>"+data[i]+"</div>";
					}
					$("#showResult").html(content);
					$("#showResult").css("display","block");
				}else{					
					$("#showResult").css("display","none");
				}
			},
			"json"
		);
	}
</script>
<!-- 删除、编辑 -->
<script type="text/javascript">
	/* 单选删除 */
	function deletePersonById(id){
		var isDel = confirm("确定删除当前联系人吗？");
		if(isDel){
			window.location.href="${pageContext.request.contextPath}/person?method=deletePersonById&id="+id;
		}
	}
	/* 编辑 */
	function editPersonByIdFn(id){
		$(".popupLayerOfEdit").show();
		/* 重置，保存，会出现校验提醒，关闭重新打开，把校验规则的提醒清空 */
		$(".error").text("");
		/* 重置，保存，会出现校验提醒，关闭重新打开，设置输入框的字体颜色为黑色 */
		$("#editForm input").css("color","#000");
		/* ajax读取要编辑的信息 */
		$.post(
			"${pageContext.request.contextPath}/person?method=findPersonByIdForEdit",
			{"id":id},
			function(data){
				/*{"id":"10","username":"张三","birthDate":"1995-06-06",
					"gender":"男","telephone":"12312345658",
					"email":"123123@123.com","qq":"159874568","remarks":"天之骄子"
				}*/
				$("#editForm input[name=id]").val(data.id);
				$("#editForm input[name=username]").val(data.username);
				$("#editForm input[name=birthDate]").val(data.birthDate);
				$("#editForm input[name=gender][value="+data.gender+"]").prop("checked",true);
				$("#editForm input[name=telephone]").val(data.telephone);
				$("#editForm input[name=email]").val(data.email);
				$("#editForm input[name=qq]").val(data.qq);
				$("#editForm textarea[name=remarks]").val(data.remarks);
			},
			"json"
		);
	}
</script>
</html>
