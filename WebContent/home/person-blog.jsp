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
<%
	int id=201801;
	try{
		id=Integer.parseInt(request.getParameter("id"));
	}catch(Exception e){}
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
			<h2>Ta的博文</h2><br/><br/><br/>
			<%
				int pageNum=1;
				int pageSize=4;
				String pageIndex=request.getParameter("pageNum");
		    	if(pageIndex!=null){
		    		pageNum=Integer.parseInt(pageIndex);
		    	}
		    	session.setAttribute("pageNum", pageNum);
		    	page<blogs> blogs=null;
		    	try{
		    	blogs=blog.blogGet(name, pageNum, pageSize);
		    	String btitle="";
		    	for(blogs b:blogs.getData()){
		    		btitle=b.getBtitle();
		    		int bid=b.getBid();
		    		String btime=b.getBtime();
	    			String bauthor=b.getBauthor();
	    			String bcontent=b.getBcontent();
	    			String bpic=b.getBpic();
		    		%>
		    			<a href="blog.jsp?bid=<%=bid %>">
		    				<div class="blog">
		    					<%if(bpic!=null){ %>
									<img src="<%=path%>/<%=bpic%>"/>
									<br/><br/>
									<h3 class="content3"><%=btitle %></h3><br/>
									<span class="author"><%=bauthor %></span><br/><br/><span class="time"><%=btime %></span><br/><br/>
									<span class="content1"><%=bcontent %></span>
									<span class="more">...</span><br/><br/><br/>
									<%}else{ %>
												<h3 class="content3"><%=btitle %></h3><br/><br/><br/>
												<span class="author"><%=bauthor %></span><br/><br/><span class="time"><%=btime %></span><br/><br/>
												<span class="content2"><%=bcontent %></span>
												<span class="more">...</span><br/><br/><br/>
												<%}%>
		    				</div></a>
		    		<%
		    	}
			%><br/>
			<%if(!btitle.equals("")){ %>
			<div class="page">
		    		<%
		    			int totalPage=blogs.getTotalPage();
		    			if(pageNum==1){
		    				%>
		    					<div class="type"><<</div>
		    				<%
		    			}
		    			else{
		    				%>
	    						<a href="person-blog.jsp?id=<%=id %>&pageNum=<%=pageNum-1 %>"><div class="type"><<</div></a>
	    					<%
		    			}
		    			if(totalPage>3){
		    				for(int i=1;i<=3;i++){
		    					%>
		    						<a href="person-blog.jsp?id=<%=id %>&pageNum=<%=i %>"><div class="type"><%=i %></div></a>
		    					<% 
		    				}
		    				if(pageNum==3){
		    					%>
		    						<div class="type">>></div>
		    					<% 
		    				}
		    				else{
		    					%>
		    						<a href="person-blog.jsp?id=<%=id %>&pageNum=<%=pageNum+1 %>"><div class="type">>></div></a>
		    					<%
		    				}
		    			}
		    			else{
		    				for(int i=1;i<=totalPage;i++){
		    					%>
		    						<a href="person-blog.jsp?id=<%=id %>&pageNum=<%=i %>"><div class="type"><%=i %></div></a>
		    					<% 
		    				}
		    				if(pageNum==totalPage){
		    					%>
		    						<div class="type">>></div>
		    					<% 
		    				}
		    				else{
		    					%>
		    						<a href="person-blog.jsp?id=<%=id %>&pageNum=<%=pageNum+1 %>"><div class="type">>></div></a>
		    					<%
		    				}
		    			}
		    		%>
		    		</div>
		       		<%}else{
		       			%><span class="cue">他还没有发表博客哦</span><%
		       		}
		        	}catch(Exception e){} %>
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