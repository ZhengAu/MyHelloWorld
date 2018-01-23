<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>修改密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h2>修改密码窗口</h2>
            </div>
            <div class="main">
                <div class="main-left">
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary" onclick="history.go(-1)">返回</button>
                </div>
                <div class="main-body">
                    <div class="content">
                        <br>
                        <h5 class="text-center">密码只能为数字</h5>
                        <br>
                        <div class="form-group row">
                            <label class="col-sm-12 warnning text-center" style="display:none;">
                            </label>
                        </div>
                        <form id="updatePasswordForm">
                            <div class="form-group row">
                              <label for="oldPassword" class="col-sm-3 col-form-label text-right">旧密码：</label>
                              <div class="col-sm-6">
                                <input type="password" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" id="oldPassword" name="oldPassword">
                              </div>
                          </div>
                            <div class="form-group row">
                              <label for="newPassword" class="col-sm-3 col-form-label text-right">新密码：</label>
                              <div class="col-sm-6">
                                <input type="password" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" id="newPassword" name="newPassword">
                              </div>
                              <label for="newPassword" class="col-sm-3 col-form-label error">密码长度6个数字</label>
                            </div>
                          <div class="form-group row">
                            <label for="confirmPassword" class="text-right col-sm-3 col-form-label">确认密码：</label>
                            <div class="col-sm-6">
                              <input type="password" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" id="confirmPassword" name="confirmPassword">
                            </div>
                            <label for="confirmPassword" class="col-sm-3 col-form-label error">密码长度6个数字</label>                            
                        </div>
                        </form>
                    </div>
                </div>
                <div class="main-right">
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary updatePwd">确认</button>
                </div>
                <div class="clearfix"></div><!-- 清除浮动 -->
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/messages_zh.js"></script>
<script type="text/javascript">
	$(function(){
		//确定修改密码
		$(".updatePwd").on("click",function(){
			var oldPassword = $("#oldPassword").val();//旧密码
			var newPassword = $("#newPassword").val();//新密码
			var confirmPassword = $("#confirmPassword").val();//确认密码
			var accountPassword = '${account.password}';//当前登录用户的密码
			//当三个输入框不为空时，进入
			if(oldPassword!=""&&newPassword!=""&&confirmPassword!=""){
				//分情况
				if(accountPassword!=oldPassword){
					$(".warnning").css("display","block").text("原密码不正确！");
				}else if(newPassword!=confirmPassword){
					$(".warnning").css("display","block").text("两次输入的密码不一致！");					
				}else if(newPassword.length!=6){
					$(".warnning").css("display","block").text("密码长度为6个数字！");						
				}else{
					$.post(
						"${pageContext.request.contextPath}/index?method=updatePassword",
						{
							"userid":'${account.userid}',
							"newPassword":newPassword,
							"confirmPassword":confirmPassword
						},
						function(data){
							$(".warnning").css("display","block").text(data.isSuccess);
							$("input[type=password]").val("");
						},
						"json"
					);
				}
			}else if(oldPassword==""){
				$("#oldPassword").focus();
			}else if(newPassword==""){
				$("#newPassword").focus();
			}else if(confirmPassword==""){
				$("#confirmPassword").focus();
			}
		});
	});
</script>
</html>

