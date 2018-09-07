$(function(){
		/**
		 * 按钮特效
		 */
		$(".button,input[type='submit']").bind({
			mouseover:function(){
				$(this).css("background-color","black");
			},
			mouseout:function(){
				$(this).css("background-color","#FA4B2A");
			}
		});
		$(".type").bind({
			mouseover:function(){
				$(this).css("background-color","#DEDEDE");
			},
			mouseout:function(){
				$(this).css("background-color","white");
			}
		});
		$(".message").bind({
			mouseover:function(){
				$(this).css("background-color","#67E595");
			},
			mouseout:function(){
				$(this).css("background-color","#7EF5AA");
			}
		})
		/**
		 * 文本框特效
		 */
		$("input[type='text'],input[type='password']").click(function(){
			$(this).css("border","1px red solid");
		});
		$("input[type='text'],input[type='password']").blur(function(){
			$(this).css("border","none");
		})
})
