<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html> 
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>首页</title>
        <!-- 新 Bootstrap 核心 CSS 文件 -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        
        <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
        <script src="<%=request.getContextPath()%>/js/jquery.js"></script>
        
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
        <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
        
		<link rel="shortcut icon" href="http://www.jiluai.com/favicon.ico">
		<link rel="stylesheet" id="css_extstyle" type="text/css" href="<%=request.getContextPath()%>/css/global.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/dashboard/alertbox.css">
		<script src="<%=request.getContextPath()%>/js/newcommon.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/login.js" type="text/javascript"></script>
		
		<script ></script><link rel="stylesheet" type="text/css">
</head>

<body>
 <!--头部-->
    <div class="header">
        <div class="outer">
            <div class="inner">
                <div class="two">
                    <ul>
                       <a class="login_box" href="#">
                            <img src="/images/new_logo.png" alt="小红线"  width = "150px" height= "45px">
                        </a>
                    </ul>
                </div>
                <div class="login_box">
                    <a class="index_topf" href="#">${user.name}</a>
                    <a class="index_topf" href="#" style="margin-left:4px;">欢迎您</a>
                </div>          
            </div>
        </div>
        <div class="nav_i">
            <div class="navOut">
               <!--  <a class="logo" href="#">
                    <img src="/images/new_logo.pn>
                </a>--> 
                <ul>
                    <li>                        
                        <a class="btn btn-default btn-lg btn-block" role="button" href="/blog/home">首 页</a><span class="arrow" style="display:none;"></span><span class="space"></span>
                    </li>
                    <li>
                        <a class="btn btn-default btn-lg btn-block" role="button" href="">情侣说</a><span class="arrow"></span><span class="space"></span></li>
                    <li>
                        <a class="btn btn-default btn-lg btn-block" role="button" href="/blog/qlj">情侣街</a><span class="arrow"></span><span class="space"></span></li>
                    <li>
                        <a class="btn btn-default btn-lg btn-block" role="button" href="/blog/labd">恋爱宝典</a><span class="arrow"></span><span class="space"></span>
                    </li>
                     <li>
                        <a class="btn btn-default btn-lg btn-block" role="button" href="/blog/wo">个人中心</a><span class="arrow"></span><span class="space"></span>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    
    <form action="/addblog/qlshuo" method="post">
		<input type="hidden" name="userId" value="${userId}"><br/>
		<div class="input-group">
  			<span class="input-group-addon">标题：</span>
  			<input type="text" name="title" class="form-control" placeholder="请输入标题">
		</div>
		<div class="input-group">
		  	<span class="input-group-addon">内容：</span>
			<input type="text" name="content" class="form-control" placeholder="请输入正文">
		</div>	
		<input type="submit" value="提交"/>
	</form>
    
    
    
    <!--头部-->
    <img  src="${head_portrait}">
    <c:forEach var="blog" items="${list}">
        <div class="panel panel-default">
            <div class="panel-body">
                <a href="/blog/showBlog?id=${blog.id}" >${blog.title}</a>
                <a href="/blog/updateBlog1?id=${blog.id}&userId=${userId}" >修改</a>  
                |<a href ="/blog/delBlog?id=${blog.id}&userId=${userId}">删除</a><br/>        
            </div>
        </div>
    </c:forEach>
    <input id = "getDate" type="button" value = "获取数据"/>
    <select id = "city">
    </select >
    <select id="county">
    </select>
        
   时间：<br/>${blog_time}<br/>
    <form action="/blog/list"  method="get">
           <input type="hidden"  name = "userId" value = "${userId}"/>
           <input type="hidden"  id = "pageNum"  name = "pageNum" value = "${pageNum}"/>
           <input type="hidden" id = "pageCount" name = "pageCount" value = "${pageCount}"/>
           <input  type="hidden" id ="pagesum"name = "pagesum" value = "${pagesum}"/>
            
            <c:if test="${pageNum>1}">
             <a href = "javascript:pgup()">第一页</a>
            </c:if>
             <c:if test="${pageNum>1}">
             <a href = "javascript:up()">上一页</a>
            </c:if>
            <c:if test="${pageNum<pagesum}">
            <a href = "javascript:next()">下一页</a>
            </c:if>
            <a href = "javascript:pgdn()">最后一页</a>
            第${pageNum}页 每页${pageCount}条
    </form>

<a href="/blog/addBlog1?userId=${userId}">添加博文</a><br/>

</body>
</html>