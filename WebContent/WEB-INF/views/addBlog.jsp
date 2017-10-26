<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加博客</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</head>
<body>
	<form action="/blog/add" method="post">
		<div class="form-group">
			    <input type="text" name="userId" value="${userId}"> 
			    <label for="exampleInputEmail1">标题</label> 
				<input type="text" name="title" class="form-control" id="title" placeholder="请输入标题">
			    <label for="exampleInputEmail2">内容</label>
			    <textarea name="content" class="form-control"  id="content" rows="3" placeholder="请输入内容"></textarea>
			<br /> <br />
			<center>
				<input type="submit" value="提交" style="width: 100px; color: #FFFFFF; background-color: #15A0F5;">
			</center>
		</div>
	</form>
</body>
</html>