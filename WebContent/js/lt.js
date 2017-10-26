$(document).ready(function(){
//	这里写代码
var url = "ws://127.0.0.1/LtSocket";
var  ws;
if("WebSocket" in window){
	console.log("支持");
	ws= new WebSocket(url);
}else{
	alert("不支持");
}
//websocket发生错误时调用
	ws.onerror = function(evt){
		console.log("发生错误了"+evt);
		setMessage("发生错误了"+evt);
	}
	ws.onopen = function(){
		console.log("连接成功"+evt);
//		setMessage
		
	}
	ws.onmessage = function(evt){
		sendNowMessage(evt.data);
	}
	ws.onclose = function(evt){
		console.log()
	}

});
function sendNowMessage(name){
	var msg = $("#message").val();
		if(msg){
			$("#content").append(name+":"+msg+'<br/>');
			}else{
				alert("内容为空");
			}
		
	}
function sendMessage(name){
	var msg = $("#message").val();
		if(msg){
			$("#content").append(name+":"+msg+'<br/>');
			}else{
				alert("内容为空");
			}
		
	}