<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>3D拖拽相册</title>
    <style>
        *{
            padding:0;
            margin:0;
        }
        body{
           background-image:url(/images/ad1.png);
        }
        #wrap{
            width:120px;
            height:180px;
            margin:150px auto;
            position: relative;
            /*3D转换*/
            transform-style: preserve-3d;
            transform: perspective(800px) rotateY(0deg) rotateX(-10deg);
        }
        #wrap img{
            width:120px;
            height:180px;
            position: absolute;
            border-radius: 3px;
            box-shadow: 0 0 5px #fff;
        }
    </style>
</head>
<body>
<div id="wrap">
    <img src="/images/photo/1.jpg">
    <img src="/images/photo/2.jpg">
    <img src="/images/photo/5.jpg">
    <img src="/images/photo/6.jpg">
    <img src="/images/photo/7.jpg">
    <img src="/images/photo/8.jpg">
    <img src="/images/photo/9.jpg">
    <img src="/images/photo/10.jpg">
    <img src="/images/photo/11.jpg">
    <img src="/images/photo/12.jpg">
    <img src="/images/photo/13.jpg">
    <img src="/images/photo/14.jpg">
    <img src="/images/photo/17.jpg">
    <img src="/images/photo/18.jpg">
    <img src="/images/photo/21.jpg">
    <img src="/images/photo/24.jpg">
    <img src="/images/photo/25.jpg">
    <img src="/images/photo/26.jpg">
    <img src="/images/photo/29.jpg">
    <img src="/images/photo/30.jpg">
    <img src="/images/photo/31.jpg">
    <img src="/images/photo/32.jpg">
    <img src="/images/photo/33.jpg">
    <img src="/images/photo/36.jpg">
</div>
</div>
</body>
</html>
<script>
    window.onload = function(){
        var oWrap = document.getElementById("wrap");
        var oImg = oWrap.getElementsByTagName("img");
        //360处于所有的img  求出一个img所占的度数
        var Deg = 360 / oImg.length;
        //32.333
        console.log(Deg)


        for(var i = 0; i < oImg.length; i++){
            //设置每个img的旋转角度
            oImg[i].style.transform = 'rotateY('+ Deg * i + 'deg) translateZ(350px)';
            oImg[i].ondragstart = function(){
                return false;
            }
        }
        var roX = -10, roY = 0;
        /**********************内部样式*******************************/
        document.onmousedown = function(event){
            //获取鼠标点击时候的坐标
            x_ = event.clientX;
            y_ = event.clientY;
            //鼠标在移动时
            this.onmousemove = function(event){
                //获取鼠标移动时候的坐标
                x = event.clientX;
                y = event.clientY;
                //获取点击和移动时候的偏移量
                xN = x - x_;
                yN = y - y_;
                //测试了下 偏移量有点大 旋转的太多了  就让他*0.1
                roY += xN * 0.1;
                roX -= yN * 0.1;

                oWrap.style.transform = 'perspective(800px) rotateX('+ roX+'deg) rotateY('+ roY+'deg)';


                x_ = event.clientX;
                y_ = event.clientY;
            }

            this.onmouseup = function(){
                this.onmousemove = null;
            }
        }
    }
</script>