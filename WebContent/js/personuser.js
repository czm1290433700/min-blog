/**
 * 用户功能框隐藏显示和链接特效
 */
$(function(){
	/**
	 * 鼠标移过
	 */
	$("a li").bind({
		mouseover:function(){
			$(this).css("background-color","#F7F7F7");
		},
		mouseout:function(){
			$(this).css("background-color","white");
		}
	});
	$(".left li").bind({
		mouseover:function(){
			$(this).css("background-color","#F7F7F7");
		},
		mouseout:function(){
			$(this).css("background-color","white");
		}
	});
	/**
	 * user框显示
	 */
	$(".nick").toggle(
		function(){
			$(this).next().css("background-color","#F7F7F7");
			$(".user").css("visibility","visible");
		},
		function(){
			$(this).next().css("background-color","white");
			$(".user").css("visibility","hidden");	
		}
	);
	$("#left li").bind({
		mouseover:function(){
			$(this).css("background-color","#0F5D90");
		},
		mouseout:function(){
			$(this).css("background-color","#232C32");
		}
	});
	$("#left .home").bind({
		mouseover:function(){
			$(this).css("background-color","#0F5D90");
		},
		mouseout:function(){
			$(this).css("background-color","#36B0C8");
		}
	});
})