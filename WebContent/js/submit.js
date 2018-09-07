$(function(){
	/**
	 * 提交按钮特效
	 */
	$("input[type='submit']").bind({
		mouseover:function(){
			$(this).css("background-color","#BFBFBF");
		},
		mouseout:function(){
			$(this).css("background-color","#E6E6E6");
		}
	});
	$("input[type='button']").bind({
		mouseover:function(){
			$(this).css("background-color","#277ED3");
		},
		mouseout:function(){
			$(this).css("background-color","#71AFED");
		}
	})
	/**
	 * 文本框特效
	 */
	$("input[type='text'],input[type='password']").click(function(){
			$(this).css("border","1.5px red solid");
		});
	$("input[type='text'],input[type='password']").blur(function(){
		$(this).css("border","1px black solid");
	});
	$("input[type='password'],input[type='password']").click(function(){
			$(this).css("border","1.5px red solid");
		});
	$("input[type='password'],input[type='password']").blur(function(){
		$(this).css("border","1px black solid");
	});
	/**
	 * 删除确认
	 */
	$(".del").click(function(){
			return confirm("是否确认删除?");
	});
})