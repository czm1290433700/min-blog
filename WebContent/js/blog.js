/**
 * 按钮特效
 */
$(function(){
	$("input[type='button']").bind({
		mouseover:function(){
			$(this).css("background-color","#03D103");
		},
		mouseout:function(){
			$(this).css("background-color","#15DE15");
		}
	});
	$("input[value='删除']").click(function(){
		return confirm("是否确认删除?");
	});
})