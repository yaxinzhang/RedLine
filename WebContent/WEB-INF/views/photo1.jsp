<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keyword" content="关键词1，关键词2">
<meta name="Description" content="描述">
	<style>
		*{
			margin: 0;
			padding: 0;
		}

		body{
			background-image:url(/images/bj.jpg);
		}
		#banner{
			font-size: 40px;
			color:#ff5809;
			text-align: center;
			padding: 25px 0 0 0;
			text-decoration: none; 
		}
		#box{
			width: 1120px;
			height: 500px;
			/*background-color: red;*/
			margin: 0px auto;
		}

		#box ul li{
			list-style: none;
			width: 250px;
			/*height: 500px;
			background: blue;*/
			float: left;	
			margin: 10px;		
		}

		#box ul li div{
			width: 250px;
			box-shadow: 0px 5px 5px #000;
			padding: 5px;
			margin: 5px;
		}
		img{
			width:250px;
		}
	</style>
</head>
<body>
	<div id="banner">
		<h1>天一一部</h1>
	</div>
	<div id="box">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>			
		</ul>
	</div>
	<script src = "js/jquery.js"></script>
	<script>
		var i =0;
		var arr = [
				{src:"/images/photo/1.jpg"},
				{src:"/images/photo/2.jpg"},
				{src:"/images/photo/5.jpg"},
				{src:"/images/photo/6.jpg"},
				{src:"/images/photo/7.jpg"},
				{src:"/images/photo/8.jpg"},
				{src:"/images/photo/9.jpg"},
				{src:"/images/photo/10.jpg"},
				{src:"/images/photo/11.jpg"},
				{src:"/images/photo/12.jpg"},
				{src:"/images/photo/13.jpg"},
				{src:"/images/photo/14.jpg"},
				{src:"/images/photo/15.jpg"},
				{src:"/images/photo/16.jpg"},
				{src:"/images/photo/17.jpg"},
				{src:"/images/photo/18.jpg"},
				{src:"/images/photo/19.jpg"},
				{src:"/images/photo/20.jpg"},
				{src:"/images/photo/21.jpg"},
				{src:"/images/photo/22.jpg"},
				{src:"/images/photo/24.jpg"},
				{src:"/images/photo/25.jpg"},
				{src:"/images/photo/26.jpg"},
				{src:"/images/photo/28.jpg"},
				{src:"/images/photo/29.jpg"},
				{src:"/images/photo/30.jpg"},
				{src:"/images/photo/31.jpg"},
				{src:"/images/photo/32.jpg"},
				{src:"/images/photo/33.jpg"},
				{src:"/images/photo/34.jpg"},
				{src:"/images/photo/35.jpg"},
				{src:"/images/photo/36.jpg"}			
		];
	
		function create(){
			var oDiv = document.createElement("div");
			var oImg = new Image();
			oImg.src = arr[i%arr.length].src;
			oDiv.appendChild(oImg);

			getList($("#box ul li")).append(oDiv);
		}

		function getList(obj){
			var length = obj.length;
			var h = Infinity;
			var getLi = '';

			for (var i = 0;i<length;i++){
				if(obj.eq(i).height()<h)
				{
					h = obj.eq(i).height();
					getLi = obj.eq(i);
				}
			}
			return getLi;
		}
		var sum = 0;
		function onload(){
			i++;
			if (i<37) {				
				for (;i<37;i++){
					create()
				}
			}else{
				sum = i;
				for (;i<sum+3;i++)
				{
					create();
				}
			}
		}
		onload();

		var scrollH = 0;
		var scrollT = 0;
		var _height = $(window).height();
		$(window).scroll(function(){
			scrollH = $(document).height();
			scrollT = $(window).scrollTop();

			if(_height + scrollT + 50> scrollH)
			{
				onload();
				console.log(i);
			}
		})
	</script>

</body>
</html>