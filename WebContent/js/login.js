$(document).ready(function(){
    $('#logintel,#loginpassword').keydown(function(event){
        if (event.keyCode==13 && $('#login').length>0 && $('#logintel').val() && $('#loginpassword').val()){				
            login();
        }
    })
	
	$("#tel,#logintel,#othertel").focus(function(){
		if($(this).val()==$(this).attr('data-value')){
			$(this).val('');
		}
	});
	$("#tel,#logintel,#othertel").blur(function(){
		if ($(this).val()==''){
			$(this).val($(this).attr('data-value'))
		}
	});
    $('#tel').keyup(function(){
        var tel = $('#tel').val();
        if (tel.length<6)return false;
        if (tel==$(this).attr('data'))return false;
        $(this).attr('data' ,tel);
        $.post('connect.php?c=checkactive' ,{'tel':tel} ,function(data){
            if (data!=0){
                if (confirm('"'+data+'"邀请您与TA创建的账号绑定')){
                    $('#othertel').parent().hide().prev().hide();
                    $('.labelBox').parent().hide();
                    $('#zhuce').hide();
                    $('#tel').attr('readonly' ,true).trigger('blur');
                    $('#active').show();
                }
            }
        });
    });

	$("#regUser .se .text").focus(function(){
		$(".text").attr("class","text noactived");
		$(this).attr("class","text actived");
		if ($(this).val()==''){
		    showTextMsg($(this).attr('id') ,$(this).next().data('tip'))
		}
	}).blur(function(){
	    var id = $(this).attr('id') , 
	        v = $(this).val() ,
	        tip = $(this).next().data('tip')
	        gender = $('input[name=gender]:checked').val();
	    if ( $('.labelBox').parent().css('display')!='none' ){
	        if ( gender!=1 && gender!=2 ){
	            showErrMsg( 'GM' , '必须选择性别');return;
	        }else{
	            showSucMsg( 'GM' , 'OK');
	        }
	    }
	    if (v){
	        if ( id=='name' ){
	            if ( v.length > 20 ){
	                showErrMsg( id , tip);return;
	            }
	        }else if(id=='tel'){
	            if ( !/@/.test(v) && !/[0-9]+/.test(v) ){
	                showErrMsg( id , '不是有效的手机号码或者邮箱地址');return;
	            }
	        }else if(id=='password'){
	            if ( v.length <6 || v.length>20 ){
                    showErrMsg( id , tip);return;
                }
	        }else if(id=='repassword'){
                if ( v.length <6 || v.length>20 ){
                    showErrMsg( id , tip);return;
                }
                if ( v !== $('#password').val() ){
                    showErrMsg( id , '两次密码不一致');return;
                }
            }
	        showSucMsg( id , 'OK');
	    }
	});
	
	$('#goreg').click(function(){
		window.location.href = "/connect.php?c=create";
	});
	
	$('#active').click(function(){
		$('.error').hide();
		$(this).attr('disabled' ,true);
		var tel = $('#tel').val();		
		var password = $('#password').val();	
		var repassword = $('#repassword').val();
		var name = $('#name').val();
		var _this = $(this);
		$.post('connect.php?c=create&type=activeinit',{'name':name ,'tel':tel,'password':password,'repassword':repassword},function(data){
			
			switch (data) {	
	            case "01": showErrMsg('tel', '您好像忘记填写手机号码了，赶紧填写一下吧');break;
	            case "02": showErrMsg('password', '您好像忘记填写密码了，赶紧填一个吧');break;
	            case "03": showErrMsg('repassword', '您好像忘记验证你的密码了，赶紧填下吧。');break;
	            case "04": showErrMsg('tel', '您好，手机号码不是正确的手机号码？请重新填写下？');break;
	            case "05": showErrMsg('tel', '您好，手机号码已经注册过了，您是不是忘记了？');break;
	            case "06": showErrMsg('password', '请把密码长度控制在大于6小于20');break;
	            case "07": showErrMsg('repassword', '两个密码不一致，再填写一次？');break;
	            
	            case "13": alert('激活失败！');break;
	            	            
	            case "0": window.location.href = "/home";return;
	        }
			_this.attr('disabled' ,false);
		});
	});
	
	$("#zhuce").click(function(){
	    if ( $('.txtMsg.alert').length>0 )return;
		$('.txtMsg').hide();
		$(this).attr('disabled' ,true);
		var name = $('#name').val();
		var tel = $('#tel').val();		
		var password = $('#password').val();	
		var repassword = $('#repassword').val();
		var othertel = $('#othertel').val();
		var gender = $('input[name=gender]:checked').val();
		var marry  = $('#marryid').val();
		var LoveWords  = $('#LoveWords').val();
		var code = $('#code').val();
		var _this = $(this);
		
		var tkey = suiji(16);
		var sendData = {'Key':tkey,'Name':name,'LoveWords':LoveWords,'Gender':gender,'Marry':marry,'tel':tel,'repassword':repassword,'password':password,'othertel':othertel} ;
		if (code){
			$.extend( sendData ,{'code':code});
		}
		
		$.post('connect.php?c=create&type=init',sendData,function(data){
			
			switch (data) {	
	            case "01": showErrMsg('tel' ,'您好像忘记填写账号了');break;
	            case "02": showErrMsg('password' ,'您好像忘记填写密码了');break;
	            case "03": showErrMsg('repassword' ,'您好像忘记验证你的密码了');break;
	            case "04": showErrMsg('tel' ,'这不是一个有效的手机或邮箱');break;
	            case "05": showErrMsg('tel' ,'这个账号已经注册过了，您是不是忘记了？');break;
	            case "06": showErrMsg('password' ,'请把密码长度控制在大于6小于20');break;
	            case "07": showErrMsg('repassword' ,'两个密码不一致，再填写一次？');break;
	            case '13' : showErrMsg('code' ,'验证码错误');break;
	            
	            case "08": showErrMsg('othertel' ,'您好像忘记邀请对方了，赶紧填写一下吧');break;
	            case "09": showErrMsg('othertel' ,'这不是一个有效的手机或邮箱？请重新填写一下？');break;
	            case "10": showErrMsg('othertel' ,'这个账号已经注册过了，您是不是忘记了？');break;
	            
	            case "11": showErrMsg("GM","抱歉，性别必须填写才能提交哦~");break;
	            case "12": showErrMsg("GM","抱歉，婚姻状况必须填写才能提交哦~");break;
	            case "14": showErrMsg('name' ,'您需要一个有爱的昵称');break;
	            
	            case "0": window.location.href = "/home";return;
	        }
			_this.attr('disabled' ,false);
		});
	});
	
	$("#login").click(function(){
		login($('#logintel').val() ,$('#loginpassword').val());
	});
	
	$("#loginframe").click(function(){
		var $d = window.parent.document;
		  	
		$('.error').hide();
		var logintel = $('#logintel').val();
		var loginpassword = $('#loginpassword').val();
		$.post('/connect.php?c=tellogin',{'logintel':logintel,'loginpassword':loginpassword},function(data){	
			switch (data) {
	            case "01": $('#error').text('对不起手机号码和密码不匹配，请检查后再登录吧').show();break;;
	            case "1": window.parent.location.reload();$('#commentlogin',$d).remove();break;
        	} 	
			setTimeout(function(){$('#error').hide();} ,2000);
		});
	});
	
	$('#sendcode').click(sendcode);
	
	$('#changetel').click(function(){
		$('.error').hide();
		var tel = $('#tel').val();
		var pwd = $('#password').val();
		var code = $('#code').val();
		$.post('connect.php?c=changetel',{'tel':tel,'pwd':pwd,'code':code} ,function(data){
			switch (data) {
				case "01": $('#error_tel').text('手机号码不能为空').show();break;
				case "02": $('#error_password').text('密码不能为空').show();break;
				case "03": $('#error_code').text('验证码不能为空').show();break;
				case "04": $('#error_tel').text('手机号码不是正确的手机号码').show();break;
		        case "05": $('#error_password').text('对不起，密码错误').show();break;
		        case "06": $('#error_code').text('验证码错误').show();break;
		        case "07": alert('对不起，提交失败！请重试。');break;
		        case "08": alert('对不起，数据已过期！请重试。');window.location = "/connect.php?c=tel";break;
		        
		        case "1": window.location = "/connect.php?c=tel&type=change";return;;
		        case "2": window.location = "/connect.php?c=tel";return;;
			}
		});
	});
		
});


var suiji = function randomString(len) {
　　len = len || 32;
　　var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
　　var maxPos = $chars.length;
　　var pwd = '';
　　for (i = 0; i < len; i++) {
　　　　pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
　　}
　　return pwd;
}


var login = function( logintel ,loginpassword){
	$('.error').hide();
	if (!logintel || !loginpassword){
		return false;
	}
	
	
	$.post('/connect.php?c=tellogin',{'logintel':logintel,'loginpassword':loginpassword},function(data){	
		switch (data) {
            case "01":
            	if ( $('#error_userpassword').length==0){
            		alert('用户或密码错误~.~');           		
            	}else{
            		$('#error_userpassword').text('对不起，手机号码和密码不匹配，请检查后再登录吧').show();
            	}
            	break;
            
            case "1": window.location.href = "/home/";return;
            case "2": window.location.href = "/connect.php?c=tel&type=change";return;;
           }	
		}
	);
}

var sendcode = function(callback){
	$('.error').text('').hide();
	var tel = $('#tel').val();
	$.post('connect.php?c=sendSMS',{'tel':tel},function(data){
		switch(data){
			case '01' : $('#error_tel').text('您好像忘记填写手机号码了，赶紧填写一下吧').show();return;
			case '02' : $('#error_tel').text('您好，手机号码已经注册过了，您是不是忘记了？').show();return;
			case '03' : $('#error_tel').text('您好，手机号码不是正确的手机号码？请重新填写以下？').show();return;
			case '04' : $('#error_tel').text('发送失败').show();return;
			case '05' : $('#error_tel').text('您点的太快了，稍后在点吧').show();return;			
			
			case '1' : $('#error_tel').text('发送成功').show();return;
		}
	});
	if (callback){
		callback();
	}
}

function sendcodehtml(){
	var html = '<dd class="error" id="error_yz" style="display:block">如果您能通过手机短信验证，那么你能够使用这个号码</dd>';
	    html+= '<dd class="it se telno"><a href="#" id="sendcode" onclick="sendcode(codehtml);">发送验证码</a></dd>'
	    $('#error_tel').after(html);
	    
}

var codehtml = function(){
	html = '<dd class="it se">'
	    html+= '<input type="text" name="code" id="code" class="text noactived"/>'	            		   
	    html+= '<span class="notice">验证码</span></dd>'
	    html+= '<dd class="error" id="error_code" ></dd>'
	    $('#zhuce').before(html);
}

function showTextMsg( id , msg ){
    $('#error_'+id).removeClass('suc').removeClass('alert').show().text(msg)
}

function showErrMsg( id , msg ){
    $('#error_'+id).removeClass('suc').addClass('alert').show().text(msg);
}

function showSucMsg( id , msg ){
    $('#error_'+id).removeClass('alert').addClass('suc').show().text(msg)
}