<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改博客</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
		
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
		
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</head>
<body>
<form role="form" action="/blog/updateBlog" method="post">
  <div class="form-group">
  <input type="hidden"name="id"value="${id}">
  <input type="hidden"name="userId"value="${userId}">
    <label for="exampleInputEmail1">标题</label>  
    <input type="text"  name = "title" class="form-control" id="exampleInputEmail1" placeholder="请输入修改后的标题">
  	<label for="exampleInputEmail2">内容</label>
  	<textarea  name="content" class="form-control" rows="3" placeholder="请输入修改后的内容"></textarea><br/><br/>
	<center><input type ="submit" value="提交"  style="width:100px; color: #FFFFFF; background-color: #15A0F5; align:center;" ></center>  
  </div>
  </form>
  <!--  
<form action="/updateBlog" method="post">
		<input type="hidden"name="id"value="${id}"><br/>
		<input type="hidden"name="userId"value="${userId}"><br/>
		标题<input type="text" name="title"><br/>
		内容<input type="text" name="content"><br/>
		<input type="submit"value="提交"><br/>
	</form>
	-->
</body>
</html>