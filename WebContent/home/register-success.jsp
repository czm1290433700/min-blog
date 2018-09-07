<%@page import="blog.entity.login"%>
<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="../js/pageEffect.js" type="text/javascript"></script>
<title>REGISTER</title>
</head>
<link href="../css/home.css" rel="stylesheet" type="text/css" />
<body>
<div id="head">
<%@include file="../basicweb/head.html" %>
</div>
<div id="body">
	<div class="introduce">
		<%
			String name=(String)session.getAttribute("name");
			String tel=(String)session.getAttribute("tel");
			String nickname=(String)session.getAttribute("nickname");
			String pwd=(String)session.getAttribute("pwd");
			String interest=(String)session.getAttribute("interest");
			blogService id=new blogService();
			login user=id.loginId(name, tel, nickname, pwd, interest);
			int userId=0;
			try{
			userId=user.getId();
			id.userInsert2(userId);
			}catch(Exception e){
				%>
					<script>
						alert("您尚未注册,无法访问该页面!");
						location.href="register.jsp";
					</script>
				<%
			}
		%>
		<span>恭喜你注册成功!</span><br/><br/>
		<p>这是您的登录id(<%=userId %>),请用该id和您的登录密码进行登录</p>
		<a href="login.jsp"><input class="button" type="button" value="LOGIN NOW"></a>
	</div>
</div>
<div id="foot">
<%@include file="../basicweb/foot.html" %>
</div>
<div id="copyright">
<%@include file="../basicweb/copyright.html" %>
</div>
</body>
</html>