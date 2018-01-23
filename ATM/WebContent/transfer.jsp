<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>转账</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h2>转账窗口</h2>
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
                        <h5 class="text-center">请输入要转入的账号和金额：</h5>
                        <br>
                        <div class="form-group row">
                            <label class="col-sm-12 warnning text-center" style="display:none;">
                            </label>
                        </div>
                        <form>
                          <div class="form-group row">
                            <label for="inputState" class="offset-1 col-sm-2 col-form-label">账号：</label>
                            <div class="col-sm-6">
                                <select id="inputState" class="form-control">
                                
                                </select>
                            </div>
                          </div>
                          <br>
                          <div class="form-group row">
                            <label for="transferAccount" class="offset-1 col-sm-2 col-form-label">金额：</label>
                            <div class="col-sm-6">
                            	<!-- 只能输入整数 -->
                              <input type="text" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" id="transferAccount">
                            </div>
                          </div>
                        </form>
                    </div>
                </div>
                <div class="main-right">
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary makeCorrections">更正</button>
                    <button type="button" name="button" class="btn btn-primary confirmBtn">确认</button>
                </div>
                <div class="clearfix"></div><!-- 清除浮动 -->
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[type=text]").val("");
		//展示除自己账号外的全部账号
		var content = "<option selected>请选择预置账号...</option>";
		$.post(
			"${pageContext.request.contextPath}/index?method=findTransferAccount",
			{"userid":'${account.userid}'},
			function(data){
				for (var i = 0; i < data.length; i++) {
					content+="<option>"+data[i]+"</option>";					
				}
				$("#inputState").html(content);
			},
			"json"
		);
		//更正，把金额和提示框清空
		$(".makeCorrections").on("click",function(){
			$("input[type=text]").val("");
			$(".warnning").css("display","none");
		});
		//确定，对方金额增加，自己金额减少，添加个人的历史记录，转账金额<=balance，更新session中的数据
		$(".confirmBtn").on("click",function(){
			var transferMoney = $("input[type=text]").val();//转账金额
			var sourceid = $("select option:selected").text();//对方账号
			//转账金额不为空
			if(transferMoney!=""){
				if(parseFloat(transferMoney)>parseFloat('${account.balance}')){
					$(".warnning").css("display","block").text("转账金额不能多于${account.balance}");
				}else{
					$.post(
						"${pageContext.request.contextPath}/index?method=transfer",
						{
							"userid":'${account.userid}',
							"sourceid":sourceid,
							"transferMoney":transferMoney
						},
						function(data){
							alert(data.isSuccess);//弹窗，提示转账成功
							document.location.reload();//重新加载页面，更新session中account
						},
						"json"
					);
				}
			}else{
				$("input[type=text]").focus();//让金额输入框获取焦点
			}
		});
	});
</script>
</html>

