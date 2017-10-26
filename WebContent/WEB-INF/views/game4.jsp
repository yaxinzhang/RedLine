<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html{height:100%;}
ul{margin:0;padding-left:0;}
li{list-style:none;}
body{height:100%;position:relative;margin:0;background:#c0c0c0;}
#bg {width:400px; height:420px; background:#444 url(/images/bg.gif); position:absolute; top:50%; left:50%; margin-left:-200px; margin-top:-200px; }
#man {width:40px; height:40px; background:url(/images/miaov.jpg); position:absolute; display:none; z-index:1;}
#score {width:216px;height:24px; line-height:24px; color:#fff; font-size:12px; font-family:"微软雅黑"; margin:0 auto; position:relative; top:6px; }
#score li { float:left; width:108px; text-align:center; }
#game_over {display:none;z-index:2; position:absolute; top:194px; left:95px;}
#game_over img { display:block; }
#start {position:absolute; width:50px; height:26px; left:50%; margin-left:-25px; top:70%;}
#progress {position:absolute; width:100%; height:20px; background: url(/images/progress.jpg) no-repeat; bottom:0px; left:0;}
#progress span {width:100%; height:100%; position:absolute; left:0; top:0; background: url(/images/progress_span.jpg) no-repeat; }
.bullet {width:5px; height:5px; overflow:hidden; background:yellow; position:absolute;}
#img_logo {position:absolute; left:87px; top:134px;}
#shadow{position:absolute;left:0;top:0;width:100%;height:100%;background:#000;opacity:0.8;filter:alpha(opacity=80);display:none; z-index:2000;}
#popup{width:280px;height:160px; position:absolute; top:50%; left:50%; margin-left:-160px; margin-top:-80px; background:#eee;padding:20px 20px;overflow:hidden;display:none; z-index:2001;}
#popup li{height:20px;padding:10px 0;line-height:20px;font-weight:bold;}
#popup li var{font-style:normal;color:#666;padding-right:10px;}

#popup p{height:20px; padding:10px 0;text-align:center;margin:0;}

#clos{position:absolute;top:2px;right:5px;text-decoration:none;color:#bbb;font-size:16px;line-height:20px;font-family:Arial;}
#bg .btn {width:85px; height:34px; background:url(/images/btn.gif) no-repeat; color:#000; font-family:"微软雅黑"; font-size:12px; border:none; }
#btn_pos { padding:20px 0 0 20px; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>妙味课堂 —— 是男人就撑20秒(测试版)</title>
<script type="text/javascript">
function rnd(min, max)
{
	return parseInt((Math.random()*999)%(max-min+1))+min;
}

document.oncontextmenu=function ()
{
	return false;
};

window.onload=function ()
{
	var oBg=document.getElementById('bg');
	var oMan=document.getElementById('man');
	var oScore=document.getElementById('score');
	var oGameOver=document.getElementById('game_over');
	var oStart=document.getElementById('start');
	var oImgLog=document.getElementById('img_logo');
	var oProgress=document.getElementById('progress');
	var oProgressSpan=oProgress.getElementsByTagName('span')[0];
	var oShadow=document.getElementById('shadow');
	var oPopup=document.getElementById('popup');
	var oCommitBtn=document.getElementById('commit_btn');
	var oCloseBtn=document.getElementById('clos');
	var iTimerBullet=null;
	var aBullet=[];
	var MAX_SPEED=5;
	var MIN_SPEED=2;
	var SCREEN_TIME=3;
	var COUNT_BULLET=10;
	var iLevel=1;
	var iScore=0;
	var i=0;
	
	oCommitBtn.onclick=function ()
	{
		var oScore=document.getElementsByName('cmt_score')[0];
		var oLevel=document.getElementsByName('cmt_level')[0];
		var oName=document.getElementsByName('cmt_name')[0];
		
		oShadow.style.display='block';
		oPopup.style.display='block';
		
		oScore.value=iScore;
		oLevel.value=iLevel;
	};
	
	oCloseBtn.onclick=function ()
	{
		oShadow.style.display='none';
		oPopup.style.display='none';
	};
	
	oStart.onclick=function (ev)
	{
		oMan.style.display='block';
		oImgLog.style.display='none';
		
		//移动红快
		(document.onmousemove=function (ev)
		{
			var oEvent=ev||event;
			
			var l=oEvent.clientX-oBg.offsetLeft-oMan.offsetWidth/2;
			var t=oEvent.clientY-oBg.offsetTop-oMan.offsetHeight/2;
			
			if(l<0)
			{
				l=0;
			}
			else if(l>=oBg.offsetWidth-oMan.offsetWidth)
			{
				l=oBg.offsetWidth-oMan.offsetWidth;
			}
			
			if(t<0)
			{
				t=0;
			}
			else if(t>=oBg.offsetHeight-oMan.offsetHeight)
			{
				t=oBg.offsetHeight-oMan.offsetHeight;
			}
			
			oMan.style.left=l+'px';
			oMan.style.top=t+'px';
		})(ev);
		
		//子弹
		var startTime=(new Date()).getTime();
		var startTimeAll=(new Date()).getTime();
		iTimerBullet=setInterval(function (){
			for(i=0;i<aBullet.length;i++)
			{
				aBullet[i].x+=aBullet[i].speedX;
				aBullet[i].y+=aBullet[i].speedY;
				
				aBullet[i].obj.style.left=aBullet[i].x+'px';
				aBullet[i].obj.style.top=aBullet[i].y+'px';
				
				if(aBullet[i].x<0 || aBullet[i].x>oBg.offsetWidth || aBullet[i].y<0 || aBullet[i].y>oBg.offsetHeight)
				{
					removeBullet(aBullet[i]);
					createBullet();
					i--;
				}
				
				if(cd(aBullet[i].obj, oMan))
				{
					clearInterval(iTimerBullet);
					document.onmousemove=null;
					oGameOver.style.display='block';
				}
			}
			
			var t=(new Date()).getTime()-startTimeAll;
			iScore=parseInt(t/300);
			oScore.innerHTML='<li>难度：'+iLevel+'</li><li>得分：'+iScore+'</li>';
			
			var t=(new Date()).getTime()-startTime;
			var scale=100*(1-t/(SCREEN_TIME*1000));
			
			if(scale<=0)
			{
				oProgressSpan.style.width=0+'%';
				startTime=(new Date()).getTime();
				createBullet();
				COUNT_BULLET++;
				MAX_SPEED+=0.5;
				iLevel++;
			}
			else
			{
				oProgressSpan.style.width=scale+'%';
			}
			//document.title=100*(1-t/(SCREEN_TIME*1000));
		}, 30);
		
		function createBullet()
		{
			var x,y,speedX,speedY;
			
			do
			{
				var left=rnd(0,2);
				var top=rnd(0,2);
			}while(!(left==1 && top!=1 || left!=1 && top==1));
			
			if(0==left)
			{
				x=0;
				speedX=rnd(MIN_SPEED, MAX_SPEED);
			}
			else if(1==left)
			{
				x=rnd(0, oBg.offsetWidth);
				speedX=rnd(-MAX_SPEED, MAX_SPEED);
			}
			else
			{
				x=oBg.offsetWidth;
				speedX=-rnd(MIN_SPEED, MAX_SPEED);
			}
			
			if(0==top)
			{
				y=0;
				speedY=rnd(MIN_SPEED, MAX_SPEED);
			}
			else if(1==top)
			{
				y=rnd(0, oBg.offsetHeight);
				speedY=rnd(-MAX_SPEED, MAX_SPEED);
			}
			else
			{
				y=oBg.offsetHeight;
				speedY=-rnd(MIN_SPEED, MAX_SPEED);
			}
			
			var oDiv=document.createElement('div');
			oDiv.className='bullet';
			oDiv.style.left=x+'px';
			oDiv.style.top=y+'px';
			
			oBg.appendChild(oDiv);
			
			aBullet.push({obj: oDiv, x: x, y: y, speedX: speedX, speedY: speedY});
		}
		
		function removeBullet(oBullet)
		{
			var aResult=[];
			for(i=0;i<aBullet.length;i++)
			{
				if(aBullet[i]!=oBullet)
				{
					aResult.push(aBullet[i]);
				}
			}
			
			oBg.removeChild(oBullet.obj);
			
			aBullet=aResult;
		}
		
		for(i=0;i<COUNT_BULLET;i++)
		{
			createBullet();
		}
		
		function cd(obj1, obj2)
		{
			var l1=obj1.offsetLeft;
			var r1=obj1.offsetLeft+obj1.offsetWidth;
			var t1=obj1.offsetTop;
			var b1=obj1.offsetTop+obj1.offsetHeight;
			
			var l2=obj2.offsetLeft;
			var r2=obj2.offsetLeft+obj2.offsetWidth;
			var t2=obj2.offsetTop;
			var b2=obj2.offsetTop+obj2.offsetHeight;
			
			if(r1<l2 || l1>r2 || b1<t2 || t1>b2)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		oStart.style.display='none';
	};
};

function auth()
{
	var oScore=document.getElementsByName('cmt_score')[0];
	var oLevel=document.getElementsByName('cmt_level')[0];
	var oName=document.getElementsByName('cmt_name')[0];
	
	if(!oName.value)
	{
		alert('请填写姓名');
		return false;
	}
}
</script>
</head>

<body>
<div id="bg">
	<img id="img_logo" src="/images/logo.jpg">
	<input class="btn" id="start" value="开始" type="button">
	<div id="progress">
		<span></span>
	</div>
	<ul id="score">
		<li>难度：1</li>
		<li>得分：0</li>
	</ul>
	<div id="game_over">
		<img src="/images/game_over.jpg" alt="game_over">
		<div id="btn_pos">
		<input class="btn" value="重新开始" onclick="window.location.reload()" type="button">
		<input class="btn" id="commit_btn" value="提交分数" type="button">
		</div>
	</div>
	<div id="man"></div>
</div>
<div id="shadow"></div>
<div id="popup">
	<form onsubmit="return auth();" id="form_score" action="http://bbs.miaov.com/applications/man_20/post.php?act=post" method="post" target="_blank">
		<ul>
			<li><var>分数：</var><span><input value="3" name="cmt_score" style="border: 0pt none; background: none repeat scroll 0% 0% rgb(238, 238, 238);" readonly="1" type="text"></span></li>
			<li><var>难度：</var><span><input value="1" name="cmt_level" style="border: 0pt none; background: none repeat scroll 0% 0% rgb(238, 238, 238);" readonly="1" type="text"></span></li>
			<li><var>姓名：</var><input name="cmt_name" type="text"></li>
		</ul>
		<p>
			<input class="btn" value="提交" type="submit">
			<input class="btn" value="查看排行榜" onclick="window.open('http://bbs.miaov.com/applications/man_20/post.php', '_blank')" type="button"></p>
	</form>
	<a href="###" id="clos">X</a>
</div>


</body></html>