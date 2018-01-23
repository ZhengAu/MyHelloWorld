<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ATM</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h2>ATM主窗口</h2>
            </div>
            <div class="main">
                <div class="main-left">
                    <button type="button" name="button" class="btn btn-primary" onclick="window.location.href='draw.jsp'">取款</button>
                    <button type="button" name="button" class="btn btn-primary" onclick="window.location.href='deposit.jsp'">存款</button>
                    <button type="button" name="button" class="btn btn-primary" onclick="window.location.href='transfer.jsp'">转账</button>
                    <button type="button" name="button" class="btn btn-primary"></button>
                </div>
                <div class="main-body">
                    <div class="content">
                        <br><br>
                        <h5 class="text-center">请选择相应的功能！</h5>
                    </div>
                </div>
                <div class="main-right">
                    <button type="button" name="button" class="btn btn-primary" onclick="window.location.href='query.jsp'">查询余额</button>
                    <button type="button" name="button" class="btn btn-primary" onclick="window.location.href='updatePassword.jsp'">修改密码</button>
                    <button type="button" name="button" class="btn btn-primary" onclick="window.location.href='history.jsp'">历史数据</button>
                    <button type="button" name="button" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/index?method=logout'">退出系统</button>
                </div>
                <div class="clearfix"></div><!-- 清除浮动 -->
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
</html>

