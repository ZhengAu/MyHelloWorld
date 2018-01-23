<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>取款</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h2>现金提取窗口</h2>
            </div>
            <div class="main">
                <div class="main-left">
                    <button type="button" name="button" class="btn btn-primary item">500</button>
                    <button type="button" name="button" class="btn btn-primary item">1000</button>
                    <button type="button" name="button" class="btn btn-primary item">1500</button>
                    <button type="button" name="button" class="btn btn-primary" onclick="history.go(-1)">返回</button>
                </div>
                <div class="main-body">
                    <div class="content">
                        <br><br>
                        <h5 class="text-center">请选择金额！</h5>
                        <br>
                        <div class="form-group row">
                            <label class="col-sm-12 warnning text-center" style="display:none;">
                            </label>
                        </div>
                        <form>
                          <div class="form-group row">
                            <label for="inputOtherMoney" class="col-sm-3 col-form-label text-center">金额：</label>
                            <div class="col-sm-6">
                              <input type="text" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" id="inputOtherMoney">
                            </div>
                            <label class="col-sm-3 col-form-label error">需是100的整数倍</label>
                          </div>
                        </form>
                    </div>
                </div>
                <div class="main-right">
                    <button type="button" name="button" class="btn btn-primary item">100</button>
                    <button type="button" name="button" class="btn btn-primary item">200</button>
                    <button type="button" name="button" class="btn btn-primary item">300</button>
                    <button type="button" name="button" class="btn btn-primary submitBtn">确定</button>
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
		//点击金额的button，让其金额显示在输入框中
		$(".item").each(function(){
			$(this).on("click",function(){
				$("input[type=text]").val($(this).text());				
			})
		});
		//确定取款button
		$(".submitBtn").on("click",function(){
			var money = $("input[type=text]").val();
			var remainMoney = /\d/.test(money)&&money%100;//对100求余后的数
			//输入框不为空
			if(money!=""){
				//提取金额大于账户余额
				if(parseFloat(money-remainMoney)>parseFloat('${account.balance}')){
					$(".warnning").css("display","block").text("提现金额不能多于${account.balance}");
				}else{
					if(confirm("确定取款"+(money-remainMoney)+"元？")){
						$.post(
							"${pageContext.request.contextPath}/index?method=draw",
							{
								"userid":'${account.userid}',
								"money":(money-remainMoney)
							},
							function(data){
								alert(data.isSuccess);//弹窗，提示提现成功
								document.location.reload();//重新加载页面，更新session中account
							},
							"json"
						);
					}
				}
			}else{
				$("input[type=text]").focus();
			}
		});
	});
</script>
</html>
