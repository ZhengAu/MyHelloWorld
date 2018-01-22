<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>编辑联系人</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>编辑联系人</h2>
        </div>
        <br>
        <div class="addPersonDiv">
            <br>
            <form class="form-horizontal" action="${pageContext.request.contextPath }/UpdatePersonServlet" method="post">
            	<input type="hidden" name="id" value="${person.id }">
              <div class="form-group">
                <label for="name" class="col-sm-2 col-sm-offset-2 control-label">姓名</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" value="${person.name }" name="name" id="name" placeholder="Username..." readonly>
                </div>
                <div class="col-sm-3">
                    <label for="name" class="error control-label">姓名不能更改</label>
                </div>
              </div>
              <div class="form-group">
                <label for="birthday" class="col-sm-2 col-sm-offset-2 control-label">出生日期</label>
                <div class="col-sm-5">
                  <input type="date" class="form-control" value="${person.birthday }" name="birthday" id="birthday" required>
                </div>
                <div class="col-sm-3">
                    <label for="birthday" class="error control-label">不能为空</label>
                </div>
              </div>
              <div class="form-group">
                <label for="email" class="col-sm-2 col-sm-offset-2 control-label">邮箱</label>
                <div class="col-sm-5">
                  <input type="email" class="form-control" value="${person.email }" name="email" id="email" required>
                </div>
                <div class="col-sm-3">
                    <label for="email" class="error control-label">邮件格式：xxxx@xxxx.xxx</label>
                </div>
              </div>
              <div class="form-group">
                <label for="phone" class="col-sm-2 col-sm-offset-2 control-label">手机</label>
                <div class="col-sm-5">
                  <input type="tel" class="form-control" value="${person.phone }" name="phone" id="phone" required>
                </div>
                <div class="col-sm-3">
                    <label for="phone" class="error control-label">不能为空</label>
                </div>
              </div>
              <div class="form-group">
                <label for="memo" class="col-sm-2 col-sm-offset-2 control-label">备注</label>
                <div class="col-sm-5">
                  <textarea name="memo" rows="5" cols="62">${person.memo }</textarea>
                </div>
              </div>
              <br>
              <div class="form-group">
                <div class="col-sm-offset-4 col-sm-1">
                  <button type="submit" class="btn btn-primary btn-block">确定</button>
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

