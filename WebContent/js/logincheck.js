/**
 * 是否登录检测
 */
$(function(){
	var nickname=null;
	nickname=$("#hiddenName").val();
	if(nickname!=='null'){
		var text='<li>欢迎 '+nickname+'<li> '+'<li><a href="/blog/person-page/home.jsp">我的主页</a></li>'+'<li><a href="../achieve/session-delete.jsp">退出</a></li>';
		$("#login").html(text);
	}
	else{
		var back='<li><a href="/blog/home/login.jsp">LOGIN</a></li>'+'<li><a href="/blog/home/register.jsp">REGISTER</a></li>';
		$("#login").html(back);
	}
})
