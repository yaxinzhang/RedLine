<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
                        <a class="btn btn-default btn-lg btn-block" role="button" href="/blog/qlshuo">情侣说</a><span class="arrow"></span><span class="space"></span></li>
                    <li>
                        <a class="btn btn-default btn-lg btn-block" href="/blog/qlj">情侣街</a><span class="arrow"></span><span class="space"></span></li>
                    <li>
                        <a class="btn btn-default btn-lg btn-block" href="/blog/labd">恋爱宝典</a><span class="arrow"></span><span class="space"></span>
                    </li>
                     <li>
                        <a class="btn btn-default btn-lg btn-block" href="">个人中心</a><span class="arrow"></span><span class="space"></span>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</body>
</html>