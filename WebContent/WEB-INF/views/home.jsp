<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
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
    <!--头部-导航栏-->
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
                        <a href="#" class="btn btn-default btn-lg btn-block" role="button" >首 页</a><span class="arrow" style="display:none;"></span><span class="space"></span>
                    </li>
                    <li>
                        <a href="/blog/qlshuo" class="btn btn-default btn-lg btn-block" role="button">情侣说</a><span class="arrow"></span>
                        <span class="space"></span></li>
                    <li>
                        <a href="/blog/qlj" class="btn btn-default btn-lg btn-block" role="button" >情侣街</a><span class="arrow"></span><span class="space"></span></li>
                    <li>
                        <a href="/blog/labd" class="btn btn-default btn-lg btn-block" role="button" >恋爱宝典</a><span class="arrow"></span><span class="space"></span>
                    </li>
                     <li>
                        <a href="/blog/wo" class="btn btn-default btn-lg btn-block" role="button" >个人中心</a><span class="arrow"></span><span class="space"></span>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <!--头部-->
    <div class="center">
        <div class="banner b1" style="display: none;">     
            <a class="linkbanner" href="/blog/photo1"></a>
            <!--<div class="start"><a href="/start.php">开始记录</a></div>-->           
        </div>      
        <div class="banner b2 qx2015" style="display: block;">
            <a class="linkbanner" href="/blog/photo"></a>
        </div> 
    </div>
        <div class="banner_scroll">
            <div class="scroll">
                <ul>
                    <a data-class="b2" class="current"></a>
                    <!-- <a data-class="b4" class="current"></a> -->
                    <a data-class="b1" class=""></a>
                    <!-- <a data-class="b3"></a> -->
                    <!-- <li data-class="b4"></li>   -->
                </ul>
            </div>
        </div>
    <!--中间-->
    <div class="center_column" id="index_d">
        <div class="column_index">
            <!--1-->
            <div class="column_son">
                <div class="Q1">
                    <span class="imgcut">
                    	<a href="/user/gundong1" class="btn btn-default btn-lg btn-block" role="button">
                        <img src="/images/q.jpg" style="margin-top: 0px;">
                        </a>
                    </span>
                    <strong>浪漫时光</strong>
                    <em>随时随地小红线</em>
                    <span class="ovbg"> &nbsp;</span>
                 </div>
            </div>
            <!--2-->
            <div class="column_son noline">
                <div class="sfea">
                    <span class="imgcut">
                         <a href="/user/photo2" class="btn btn-default btn-lg btn-block" role="button">
                        <img src="/images/w.png" style="margin-top: 0px;">
                        </a>
                    </span>
                    <strong>知心他人</strong>
                    <em>为爱牵手</em>
                    <span class="ovbg"> &nbsp;</span>
                 </div>
            </div>
            <!---->
           <!--3-->
            <div class="column_son">
                <div class="Q3">
                    <span class="imgcut">
                   <a href="/user/game3" class="btn btn-default btn-lg btn-block" role="button">
                        <img src="/images/e.png" style="margin-top: 0px;">
                        </a>
                    </span>
                    <strong>甜言蜜语</strong>
                    <em>随时随地小红线</em>
                    <span class="ovbg"> &nbsp;</span>
                 </div>
            </div>
            <!--4-->
            <div class="column_son noline">
                <div class="Q4">
                    <span class="imgcut">
                         <a href="/user/game4" class="btn btn-default btn-lg btn-block" role="button">
                        <img src="/images/r.png" style="margin-top: 0px;">
                        </a>
                    </span>
                    <strong>知心他人</strong>
                    <em>为爱牵手</em>
                    <span class="ovbg"> &nbsp;</span>
                 </div>
            </div>
        </div>
    </div>      
    <!--底部-->
    </div>
<script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6527846" ></script>

<script type="text/javascript">
document.getElementById("bdshell_js")
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=11786926" charset="UTF-8"></script>
</body>
</html>