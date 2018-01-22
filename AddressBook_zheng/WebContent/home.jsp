<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 引入JSTL核心库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎来到个人通讯录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		
    	});
    	/* 添加联系人 */
    	function addPersonFn(){
    		/* 跳到add.jsp页面 */
    		window.location.href="${pageContext.request.contextPath }/add.jsp";
    	}
    	/* 删除联系人 */
    	function deletePersonById(id){
    		if(confirm("删除联系人？")){
    			/* 跳到servlet，删除联系人 */
    			window.location.href="${pageContext.request.contextPath }/DeletePersonServlet?id="+id;
    		}
    	}
    	/* 编辑联系人 */
    	function editPersonById(id){
    		window.location.href="${pageContext.request.contextPath }/EditPersonByIdServlet?id="+id;
    	}
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>欢迎来到个人通讯录</h2>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-offset-10 col-sm-2 text-right">
                <button type="button" name="button" id="addPerson" class="btn btn-primary" onclick="addPersonFn()">添加联系人</button>
            </div>
        </div>
        <br>
        <div class="tableDiv table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>生日</th>
                        <th>联系电话</th>
                        <th>Email</th>
                        <th>备注</th>
                        <th>修改</th>
                        <th>删除</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 用核心库中foreach循环输出全部数据 -->
                	<!-- 用el表达式 -->
                	<!-- list相当于对象链，person相当于单个对象，varStatus相当于循环序号，即for循环中的i -->
                	<c:forEach items="${list }" var="person" varStatus="vs">
                		<tr>
	                        <th>${vs.count }</th>
	                        <td>${person.name }</td>
	                        <td>${person.birthday }</td>
	                        <td>${person.phone }</td>
	                        <td>${person.email }</td>
	                        <td>${person.memo }</td>
	                        <td><button type="button" name="edit" onclick="editPersonById('${person.id}')">修改</button></td>
	                        <td><button type="button" name="delete" onclick="deletePersonById('${person.id}')">删除</button></td>
	                    </tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="footer ">
        <p>Copyright (c) 2017 Copyright</p>
    </div>
</body>
</html>
