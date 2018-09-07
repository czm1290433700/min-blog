/**
 * 点击回复，回复框显示
 */
$(function(){
	$(".href").toggle(
			function(){
				$(".ans").css("display","none");
				$(this).parent().parent().next().css("display","block");
			},
			function(){
				$(this).parent().parent().next().css("display","none");
			}
	)
})