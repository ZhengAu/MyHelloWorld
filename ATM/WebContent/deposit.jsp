<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>存款</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h2>存款窗口</h2>
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
                        <h5 class="text-center">请将整理好的纸币放入存款口（面额必须100）！</h5>
                        <br>
                        <div class="form-group row">
                            <label class="col-sm-12 warnning text-center" style="display:none;">
                            </label>
                        </div>
                        <form>
                            <div class="form-group row">
                                <label for="depositMoney" class="offset-2 col-sm-2 col-form-label">金额：</label>
                                <div class="col-sm-6">
                                    <input type="text" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" id="depositMoney">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="main-right">
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary makeCorrections">更正</button>
                    <button type="button" name="button" class="btn btn-primary submitBtn">确认</button>
                </div>
                <div class="clearfix"></div><!-- 清除浮动 -->
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[type=text]").val("");//每次刷新都让输入框清空
		//更正，把金额和提示框清空
		$(".makeCorrections").on("click",function(){
			$("input[type=text]").val("");
			$(".warnning").css("display","none");
		});
		
		$(".submitBtn").on("click",function(){
			var money = $("input[type=text]").val();
			var remainMoney = /\d/.test(money)&&money%100;//对100求余后的数
			if(confirm("确定存入"+(money-remainMoney)+"元？")){
				$.post(
					"${pageContext.request.contextPath}/index?method=deposit",
					{
						"userid":'${account.userid}',
						"money":(money-remainMoney)
					},
					function(data){
						$(".warnning").css("display","block").text(data.isSuccess);
						$("input[type=text]").val("");
					},
					"json"
				);
			}
		});
	});
</script>
</html>

