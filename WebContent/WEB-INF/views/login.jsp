<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</head>

<body>
	<div class="container">
		<h1 align="center">小红线</h1>
		<form action="/user/login" method="post">
			<div class="row">
				<div class="col-md-12">
					<div class="input-group  input-group-lg">
						<span class="input-group-addon">账&nbsp&nbsp号</span> <input
							name="name" type="text" class="form-control" placeholder="请输入账号">
					</div>
				</div>
			</div>
			<br> <br>
			<div class="row">

				<div class="col-md-12">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">密&nbsp&nbsp码</span> <input
							name="password" type="password" class="form-control"
							placeholder="请输入密码">
					</div>

				</div>
				<br> <br>
			</div>
			<br> <br>
			<button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
			<br> <br>
			<button type="reset" class="btn btn-warning btn-lg btn-block">重置</button>


			<br /> <a href="/user/register1"
				class="btn btn-default btn-lg btn-block" role="button">注册</a>


		</form>

	</div>

</body>
<c:if test="${not empty msg }">
                ${msg }
                </c:if>

</html>