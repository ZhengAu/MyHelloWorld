<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>历史数据查询</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h2>历史数据查询窗口</h2>
            </div>
            <div class="main">
                <div class="main-left">
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary allRecords">全部记录</button>
                    <button type="button" name="button" class="btn btn-primary lastMonth">近一个月</button>
                </div>
                <div class="main-body">
                    <div class="content table-responsive">
                        <table class="table table-hover table-bordered table-sm">
                            <thead class="thead-dark">
                                <tr>
                                    <th width="40%">交易日期</th>
                                    <th width="20%">支出</th>
                                    <th width="20%">收入</th>
                                    <th width="30%">对方账号</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>

                    </div>
                </div>
                <div class="main-right">
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                    <button type="button" name="button" class="btn btn-primary"  onclick="history.go(-1)">返回</button>
                </div>
                <div class="clearfix"></div><!-- 清除浮动 -->
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	//实现思路：获得毫秒数 再转化为需要时间格式。形如：yyyy-MM-dd
	var format = function(time, format) {
	    var t = new Date(time);
	    var tf = function(i) {
	        return (i < 10 ? '0': '') + i
	    };
	    return format.replace(/yyyy|MM|dd|HH|mm|ss/g,
	    function(a) {
	        switch (a) {
	        case 'yyyy':
	            return tf(t.getFullYear());
	            break;
	        case 'MM':
	            return tf(t.getMonth() + 1);
	            break;
	        case 'mm':
	            return tf(t.getMinutes());
	            break;
	        case 'dd':
	            return tf(t.getDate());
	            break;
	        case 'HH':
	            return tf(t.getHours());
	            break;
	        case 'ss':
	            return tf(t.getSeconds());
	            break;
	        }
	    });
	}
	//var formatDate= format(data[i].datetime, 'yyyy-MM-dd HH:mm:ss');//只需要更改这一行的时间属性取值，格式化代码不变。
	$(function(){
		//查询全部记录
		var content = "";
		$.post(
			"${pageContext.request.contextPath}/index?method=history",
			{"userid":'${account.userid}'},
			function(data){
				if(data.length==0){
					content+="<h4>无任何历史交易记录</h4>";
				}else{
					for (var i = 0; i < data.length; i++) {
						//sourceid为空的
						if(data[i].sourceid==undefined){
							data[i].sourceid="";
						}
						content+="<tr>"+
		                    "<td>"+format(data[i].datetime, 'yyyy-MM-dd HH:mm:ss')+"</td>"+
		                    "<td>"+data[i].expense+"</td>"+
		                    "<td>"+data[i].income+"</td>"+
		                    "<td>"+data[i].sourceid+"</td>"+
		                "</tr>";
					}
				}
				$("tbody").html(content);
			},
			"json"
		);
		//最近一个月的记录
		$(".lastMonth").on("click",function(){
			var lastMonthContent = "";
			$.post(
				"${pageContext.request.contextPath}/index?method=lastMonthRecords",
				{"userid":'${account.userid}'},
				function(data){
					if(data.length==0){
						lastMonthContent+="<h4>无任何历史交易记录</h4>";
					}else{
						for (var i = 0; i < data.length; i++) {
							//sourceid为空的
							if(data[i].sourceid==undefined){
								data[i].sourceid="";
							}
							lastMonthContent+="<tr>"+
			                    "<td>"+format(data[i].datetime, 'yyyy-MM-dd HH:mm:ss')+"</td>"+
			                    "<td>"+data[i].expense+"</td>"+
			                    "<td>"+data[i].income+"</td>"+
			                    "<td>"+data[i].sourceid+"</td>"+
			                "</tr>";					
						}
					}
					$("tbody").html(lastMonthContent);
				},
				"json"
			);
		});
		//单击全部历史记录
		$(".allRecords").on("click",function(data){
			//查询全部记录
			var content = "";
			$.post(
				"${pageContext.request.contextPath}/index?method=history",
				{"userid":'${account.userid}'},
				function(data){
					if(data.length==0){
						content+="<h4>无任何历史交易记录</h4>";
					}else{
						for (var i = 0; i < data.length; i++) {
							//sourceid为空的
							if(data[i].sourceid==undefined){
								data[i].sourceid="";
							}
							content+="<tr>"+
			                    "<td>"+format(data[i].datetime, 'yyyy-MM-dd HH:mm:ss')+"</td>"+
			                    "<td>"+data[i].expense+"</td>"+
			                    "<td>"+data[i].income+"</td>"+
			                    "<td>"+data[i].sourceid+"</td>"+
			                "</tr>";
						}
					}
					$("tbody").html(content);
				},
				"json"
			);
		});
		
	});
</script>
</html>

