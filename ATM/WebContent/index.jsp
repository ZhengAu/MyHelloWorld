<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎使用ATM机</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h2>欢迎使用银行ATM机</h2>
            </div>
            <div class="main">
                <div class="main-left">
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary cancelBtn">取消</button>
                </div>
                <div class="main-body">
                    <div class="content">
                        <br>
                        <div class="form-group row">
                            <label class="col-sm-12 error text-center" style="display:none;">
                            </label>
                        </div>
                        <form>
                          <div class="form-group row">
                            <label for="inputState" class="offset-2 col-sm-2 col-form-label">账号：</label>
                            <div class="col-sm-6">
                                <select id="inputState" class="form-control">
                                </select>
                            </div>
                          </div>
                          <br>
                          <div class="form-group row">
                            <label for="inputPassword" class="offset-2 col-sm-2 col-form-label">密码：</label>
                            <div class="col-sm-6">
                              <input type="password" name="password" value="" class="form-control" id="inputPassword" placeholder="Password...">
                            </div>
                          </div>
                          <input type="hidden" name="userid" value="${account.userid }"/>
                          <input type="hidden" name="password" value="${account.password }"/>
                        </form>
                    </div>
                </div>
                <div class="main-right">
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary loginBtn">确认</button>
                </div>
                <div class="clearfix"></div><!-- 清除浮动 -->
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//展示全部账号
		var content = "<option selected>请选择预置账号...</option>";
		$.post(
			"${pageContext.request.contextPath}/index?method=findAccountList",
			function(data){
				for (var i = 0; i < data.length; i++) {
					content+="<option onclick='login(this)'>"+data[i]+"</option>";					
				}
				$("#inputState").html(content);
			},
			"json"
		);
	});
</script>
<script type="text/javascript">
	var passwordGlobal = "";//全局变量
	var type="";//全局变量，账号是否可用，或被冻结
	//点击账号，把密码显示出来
	function login(obj){
		$(".error").css("display","none");//当点击某个账号后，把之前账号登录错误提示清除
		var accountId = $(obj).text();//获取账号
		$.post(
			"${pageContext.request.contextPath}/index?method=login",
			{"accountId":accountId},
			function(data){
				$("input[type=password]").val(data.password);
				passwordGlobal=data.password;//放当前userid的password
				type=data.type;//放当前账号的type
			},
			"json"
		);
	}
	$(function(){
		/* $("#inputState option").each(function(){
			$(this).on("click",function(){
				var accountId = $(this).text();
				$.post(
					"${pageContext.request.contextPath}/index?method=login",
					{"accountId":accountId},
					function(data){
						$("input[type=password]").val(data.password);
						passwordGlobal=data.password;//放当前userid的password
						type=data.type;//放当前账号的type
					},
					"json"
				);
			});
		}); */
		
		//登录，进入主界面
		$(".loginBtn").on("click",function(){
			//选择的option
			var accountId = $("#inputState option:selected").text();
			var accountPWD = $("input[type=password]").val();
			
			if(accountId!="" && accountPWD!=""){
				if(type==1){
					//此处用session域的userid和password不可行
					//因为没有刷新，故还是上一个session中account的值
					if(accountId!="" && accountPWD!="" && passwordGlobal==accountPWD){
						window.location.href='${pageContext.request.contextPath }/home.jsp';				
					} else{
						$(".error").css("display","block").text("账号或密码错误");
					} 				
				}else{
					$(".error").css("display","block").text("对不起，您的账户已被冻结。");
				}				
			}
		});
		//取消，需不需要把session中的account清除？如同退出系统
		$(".cancelBtn").on("click",function(){
			$("#inputState option:first").prop("selected",true);
			$("input[type=password]").val("");
			$.post(
				"${pageContext.request.contextPath }/index?method=logout"		
			);
		});
	})
</script>
</html>

