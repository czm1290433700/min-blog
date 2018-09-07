$(function(){
/**
 * 按钮特效和文本特效
 */
$("input[type='submit']").bind({
		mouseover:function(){
			$(this).css("background-color","#BFBFBF");
		},
		mouseout:function(){
			$(this).css("background-color","#E6E6E6");
		}
	});
$(".answer").bind({
	mouseover:function(){
		$(this).css("color","#95D439");
	},
	mouseout:function(){
		$(this).css("color","#999999");
	}
});
/**
 * 回复框显示
 */
$(".answer").toggle(
		function(){
			$(".ans").css("display","none");
			$(this).parent().next().css("display","block");
		},
		function(){
			$(this).parent().next().css("display","none");
		}
)
})

