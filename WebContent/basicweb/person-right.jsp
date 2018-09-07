<%@page import="blog.entity.login"%>
<%@page import="blog.entity.user"%>
<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="one">
		<%
			blogService b=new blogService();
			String n=(String)session.getAttribute("nickname");
			user u=new user();
			String sex="未知";
			String birth="未知";
			String city="未知";
			String job="未知";
			String sign="未知";
			try{
			u=b.userGet(n);
			sex=u.getSex();
			birth=u.getBirth();
			city=u.getCity();
			job=u.getJob();
			sign=u.getSign();
			}catch(Exception e){}
		%>
		<ul>
			<li><h2>About ME</h2></li>
			<li>性别：<%=sex %></li>
			<li>生日：<%=birth %></li>
			<li>城市：<%=city %></li>
			<li>工作：<%=job %></li>
			<li>签名：<%=sign %></li>
		</ul>
</div>
<div class="two">
		<%
			int blogAmount=0;
			int messageAmount=0;
			String blogbirth="";
			try{
				blogAmount=u.getBlog();
				messageAmount=u.getMessage();
				login l=b.loginGetByNick(n);
				blogbirth=l.getBlogbirth();
			}catch(Exception e){}
		%>
		<ul>
			<li><h2>Other ME</h2></li>
			<li>已写博客：<%=blogAmount %></li>
			<li>已有留言：<%=messageAmount %></li>
			<li>博客生日：<%=blogbirth %></li>
		</ul>
</div>