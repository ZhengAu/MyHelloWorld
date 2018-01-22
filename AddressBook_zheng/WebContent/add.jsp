<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加联系人</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>添加联系人</h2>
        </div>
        <br>
        <div class="addPersonDiv">
            <br>
            <form class="form-horizontal" action="${pageContext.request.contextPath }/AddPersonServlet" method="post">
              <div class="form-group">
                <label for="name" class="col-sm-2 col-sm-offset-2 control-label">姓名</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="name" id="name" placeholder="Username..." required>
                </div>
                <div class="col-sm-3">
                    <label for="name" class="error control-label name-error">姓名不能为空，不能重复，必须唯一</label>
                </div>
              </div>
              <div class="form-group">
                <label for="birthday" class="col-sm-2 col-sm-offset-2 control-label">出生日期</label>
                <div class="col-sm-5">
                  <input type="date" class="form-control" name="birthday" id="birthday" required>
                </div>
                <div class="col-sm-3">
                    <label for="birthday" class="error control-label">不能为空</label>
                </div>
              </div>
              <div class="form-group">
                <label for="email" class="col-sm-2 col-sm-offset-2 control-label">邮箱</label>
                <div class="col-sm-5">
                  <input type="email" class="form-control" name="email" id="email" required>
                </div>
                <div class="col-sm-3">
                    <label for="email" class="error control-label">邮件格式：xxxx@xxxx.xxx</label>
                </div>
              </div>
              <div class="form-group">
                <label for="phone" class="col-sm-2 col-sm-offset-2 control-label">手机</label>
                <div class="col-sm-5">
                  <input type="tel" class="form-control" name="phone" id="phone" required>
                </div>
                <div class="col-sm-3">
                    <label for="phone" class="error control-label">不能为空</label>
                </div>
              </div>
              <div class="form-group">
                <label for="memo" class="col-sm-2 col-sm-offset-2 control-label">备注</label>
                <div class="col-sm-5">
                  <textarea name="memo" rows="5" cols="62"></textarea>
                </div>
              </div>
              <br>
              <div class="form-group">
                <div class="col-sm-offset-4 col-sm-1">
                  <button type="submit" class="btn btn-primary btn-block">添加</button>
                </div>
                <div class="col-sm-offset-1 col-sm-1">
                	<button type="reset" class="btn btn-primary btn-block">重置</button>
                </div>
                <div class="col-sm-offset-1 col-sm-1">
                	<button type="button" class="btn btn-primary btn-block" onclick="history.go(-1)">返回</button>
                </div>
              </div>
            </form>
        </div>
    </div>
    <div class="footer navbar-fixed-bottom">
        <p>Copyright (c) 2017 Copyright</p>
    </div>
</body>
</html>

