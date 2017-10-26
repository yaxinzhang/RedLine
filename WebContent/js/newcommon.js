$(document).ready(function(){

	
	$('.navOut ul li').mouseover(function(){$(this).find('.navmenu_down').show();});
	$('.navOut ul li').mouseout(function(){$(this).find('.navmenu_down').hide();});
	
	$('#logout').click(function(){
		$.post('/connect.php?c=logout' ,function(){
			window.location = window.location;
		})
	})
	
	$('#go_home').click(function(){
		window.location = '/home';
	});
	
	$('.scroll a').click(function(){
		if ( !$(this).hasClass('current') ){
			var hideClass = $(this).parent().children('.current').data('class');
			var showClass = $(this).data('class');
			$('.center .'+showClass).fadeIn(1000);
			$('.center .'+hideClass).fadeOut(1000);
			$(this).parent().children('.current').removeClass('current');
			$(this).addClass('current');			
		}
	});	
		 
	$('.article_search_input').focus(function(){
		if ($(this).val()=='搜索标签、标题、内容'){
			$(this).val('');
			$(this).css('color','#999');
		}
	});
	$('.article_search_input').blur(function(){
		if ($(this).val()==''){
			$(this).val('搜索标签、标题、内容');
			$(this).css('color','#ccc');
		}
	});	
	
	$(".text").focus(function(){
		$(".text").attr("class","text noactived");
		$(this).attr("class","text actived");
				
		if ($(this).attr('data-value')==$(this).val()){
			$(this).val('');
		}
	});

	$(".text").blur(function(){	
		if ($(this).val()==''){
			$(this).val($(this).attr('data-value'));
		}
	});
	
	$('.common_big_btn').mouseover(function(){
		$(this).addClass('hover')
	}).mouseout(function(){
		$(this).removeClass('hover')
	});
	
	var tid = bannerScroll();
	
	$('.center').mouseover(function(){
	    clearInterval(tid);
	}).mouseout(function(){
	    tid = bannerScroll();
	})
	
	if ($('.top_btn').length){
		$(window).bind('scroll', function(){
		    var t = document.documentElement.scrollTop || document.body.scrollTop;  
		    var top_btn = $( ".top_btn a" );
		    if( t >= 600 ) { 
		    	if (top_btn.css('bottom')=='0px'){
		    		top_btn.show().animate({bottom:'150px'});
		    	}
		    } else { 		    	
		    	if (top_btn.css('bottom')=='150px'){
			    	top_btn.animate({bottom:'0'} ,'fast' ,function(){top_btn.hide()});
		    	}
		    } 
		});
	}
	 $('.rank_tab li').click(function(){
	    	var parent = $(this).parent().parent() ,
	    		box = parent.next() ,
	    		clickTxt = getType( $('a' ,this).text() ) ,
	    		curTxt = getType( $('.current' ,parent).text() ) ,
	    		clickNode = $(clickTxt ,box) ,
	    		curNode = $(curTxt ,box) ;
	    	if (clickTxt!=curTxt){
	    		$('.current' ,parent).removeClass('current');
	    		$(this).addClass('current');
	    		curNode.hide();
	    		clickNode.show();
	    	}
	    	function getType(txt){
	    		return /周/.test(txt) ? '.week' : (/月/.test(txt) ? '.month' : '.all') ;
	    	}
	    });
	    
	    $('.rank_page a').click(function(){
	    	var rp = $(this).parent()  ,
	    		rc = rp.prev() ,
	    		rt = rc.prev() ,
	    		type = getType( $('.current' ,rt).text() ) ,
	    		up = $(this).attr('class')=='next' ,
	    		p = rp.data(type) ,
	    		max = Math.ceil($(type+' li' ,rc).length / 10);    		
	    	p = p ? p : 1;
	    	var h = $(type ,rc).height();
	    	$(type+' ul' ,rc).animate({'top':-( (p-1) * h) });
	    	if ( up ){
	    		p < max && rp.data(type ,p+1);
	    	}else{
	    		p > 1 &&rp.data(type ,p-1);
	    	}
	    });
	    
	    if ( $('.xf_rw').length ){
	        $('body').css('position' ,'relative');
	        $('.xf_rw').animate({opacity:1 ,bottom:150} ,1000);
	    }
	    

});

function bannerScroll(){
    return setInterval(function(){
        var li = $('.scroll a');
        var index = li.index($('.scroll .current'));
        if (index >= li.length -1){
            index = -1;
        }
        $(li[index+1]).click();
    } , 3000);
}

function getType(txt){
	return /周/.test(txt) ? '.week' : (/月/.test(txt) ? '.month' : '.all') ;
}

function turn(d ,node ,size){
	var box = $(node);
	var ul  = $(node+' ul');
	var li  = $(node+' li');
	var bw	= box.width(); //div的宽
	var uw	= li.length*size + 1*li.length; //ul的宽
	ul.css('width',uw);	
	if (d==1){
		var left   = ul.position().left ;
		var offset = (left+size < 0) ? left+size : 0;
		ul.stop(true,false).animate({"left" : offset},1000);
	}else{
		var right  = uw + ul.position().left ;
			right  = (right-size<bw) ? bw : right-size;
		var offset = right - uw ;
		ul.stop(true,false).animate({"left" : offset},1000);
	}
}

function alertlogin(title){
	window._comment.reload = true;
    window._comment.showLoginIfream(title);
}	

function tobevip(type){
	var vip = $('#do').val();
	window.location = '/home/deposits.php?c=writebuylog&do='+vip+'&type='+type;
}

function select(rmb ,val){
	$('.rmb').html(rmb.toString());
	$('.rmb').attr('class' ,val=='vip' ? 'rmb fvip' : 'rmb '+val);
	$('#do').val(val);
}

function addPic(src ,photoid){
	$('#postid').val(photoid);
	$('#upload_btn').hide();
	$('#SWFUpload_0').hide();
	$('#upload_pic').attr('src' ,src).show();
}