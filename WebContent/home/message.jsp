<%@page import="blog.entity.topic"%>
<%@page import="blog.entity.blogs"%>
<%@page import="blog.entity.page"%>
<%@page import="blog.entity.login"%>
<%@page import="blog.entity.user"%>
<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="../js/pageEffect.js" type="text/javascript"></script>
<script src="../js/logincheck.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	String path=request.getContextPath();
	blogService blog=new blogService();
	login loginer=blog.loginGetById(id);
	String name=loginer.getNickname();
	user user=blog.userGet(name);
	String pic=user.getPic();
	String sign=user.getSign();
	String sex=user.getSex();
	String birth=user.getBirth();
	String city=user.getCity();
	String job=user.getJob();
	int blogAmount=0;
	int messageAmount=0;
	String blogbirth="";
	try{
		blogAmount=user.getBlog();
		messageAmount=user.getMessage();
		blogbirth=loginer.getBlogbirth();
	}catch(Exception e){}
%>
<title><%=name %>的博客</title>
</head>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<body>
<div id="head">
<%@include file="../basicweb/head.html" %>
</div>
<div id="body">
	<div class="introduce">
	</div>
	<div class="body">
		<div class="left">
			<h2>留言</h2><br/><br/>
			<%
				String nickname=null;
				try{
				nickname=session.getAttribute("nickname").toString();
				}catch(Exception e){nickname=null;}
				if(nickname==null){
					%>
					<textarea id="mcontent" name="mcontent" cols="30" rows="10" class="ckeditor" disabled= "true">请先登录再进行留言</textarea>
					<script type="text/javascript">
						ckeditor.replace('TextArea');
					</script>
					<%
				}else{
					%>
					<form action="../achieve/message-insert.jsp?inid=<%=id %>" method="post">
					<%=nickname %>:<br/><br/>
					<textarea id="mcontent" name="mcontent" cols="30" rows="10" class="ckeditor"></textarea>
					<script type="text/javascript">
						ckeditor.replace('TextArea');
					</script><br/>
					<br/>
					<input class="type" type="submit" value="发表">
					</form>
					<%
				} 
			%>
		</div>
		<div class="right">
			<h3>博主信息</h3>
			<img class="img" src="<%=path%>/<%=pic%>"/>
		<div class="blogger">
		<form action="message.jsp?id=<%=id %>" method="post">
			<span class="name"><%=name %></span><br/>
			<span class="sign"><%=sign %></span><br/><br/>
			<input class="message" type="submit" value="留言"/><br/><br/>
		</form>
		</div>
		<span class="aboutMe">关于我</span>
		<div class="about">
			<ul>
				<li>性别：<%=sex %></li>
				<li>已写博客：<%=blogAmount %></li>
				<li>已有留言：<%=messageAmount %></li>
				<li>城市：<%=city %></li>
				<li>工作：<%=job %></li>
				<li>生日：<%=birth %></li>
				<li>创建时间：<%=blogbirth %></li>
			</ul>
		</div>
		</div>
	</div>
	<%
	String nick=(String)session.getAttribute("nickname");
	%>
	<input id="hiddenName" type="hidden" value="<%=nick%>" />
</div>
<div id="foot">
<%@include file="../basicweb/foot.html" %>
</div>
<div id="copyright">
<%@include file="../basicweb/copyright.html" %>
</div>
</body>
</html>