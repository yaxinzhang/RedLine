<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全屏/整屏滚动组件fullPage演示-CSS3旋转缩放_dowebok</title>
<style>
body,  div,  p { margin: 0; padding: 0;}
ul { list-style: none;}
html { overflow: hidden;}
body { width: 100%;  *cursor: default;
overflow: hidden; font: 16px/1.5 "Microsoft YaHei", Helvetica, STHeiti STXihei, Microsoft JhengHei, Arial;}
#pageContain { overflow: hidden;}
.page { display: none; width: 100%; height: 100%; overflow: hidden; position: absolute; top: 0; left: 0;}
.contain { width: 100%; height: 100%; display: none; position: relative; z-index: 0;}
.current .contain, .slide .contain { display: block;}
.current { display: block; z-index: 1;}
.slide { display: block; z-index: 2;}
.swipe { display: block; z-index: 3; transition-duration: 0ms !important; -webkit-transition-duration: 0ms !important;}
.page1 { background: #37c1e3;}
.page2 { background: #009922;}
.page3 { background: #992211;}
.page4 { background: #ff00ff;}
.page5 { background: #00ff00;}
.page6 { background: #22ffff;}
#navBar { z-index: 3; position: absolute; top: 30%; right: 3%;}
#navBar .active { background: #ccc;}
#navBar li { cursor: pointer; margin-bottom: 10px; transition: all .7s ease; border-radius: 50%; line-height: 40px; text-align: center; width: 40px; height: 40px;}

.txt { margin-top: 20%; font-size: 50px; color: #fff; text-align: center;}
</style>
</head>

<body>
<div id="pageContain">
	<div class="page page1 current">
		<div class="contain">
			<p class="txt">我懂你</p>
		</div>
	</div>

	<div class="page page2">
		<div class="contain">
			<p class="txt">你懂我</p>
		</div>
	</div>

	<div class="page page3">
		<div class="contain">
			<p class="txt">你懂我懂你</p>
		</div>
	</div>

	<div class="page page4">
		<div class="contain">
			<p class="txt">我懂你懂我</p>
		</div>
	</div>

	<div class="page page5">
		<div class="contain">
			<p class="txt">这些都是为啥子？哈哈哈</p>
		</div>
	</div>
</div>

<ul id="navBar">
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>5</li>
</ul>

<script src="/js/fullPage.min.js"></script>
<script>
var runPage;
runPage = new FullPage({
	id: 'pageContain',
	slideTime: 800,
	effect: {
		transform: {
			translate: 'X',
			scale: [0, 1],
			rotate: [270, 0]
		},
		opacity: [0, 1]
	},
	mode: 'wheel, touch, nav:navBar',
	easing: 'ease'
});
</script>

</body>
</html>