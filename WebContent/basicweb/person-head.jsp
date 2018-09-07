<%@page import="blog.entity.user"%>
<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nickname=(String)session.getAttribute("nickname");
	String path = request.getContextPath();
	String pic="";
	try{
	blogService p=new blogService();
	user loginer=p.userGet(nickname);
	pic=loginer.getPic();
	}catch(Exception e){}
%>
<div class="head">
	<ul class="l">
		<li><a href="blog-show.jsp">我的博文</a></li>
		<li><a href="message-show.jsp">收到的留言</a></li>
		<li><a href="comment-show.jsp">收到的评论</a></li>
	</ul>
	<ul class="r">
		<li><a href="blog-write.jsp">写博客</a></li>
		<a class="nick" href="#"><li><%=nickname %><img class="headpic" src="<%=path%>/<%=pic%>"/></li></a>
	</ul>
</div>