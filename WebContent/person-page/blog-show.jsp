<%@page import="blog.entity.topic"%>
<%@page import="blog.entity.blogs"%>
<%@page import="blog.entity.page"%>
<%@page import="blog.entity.user"%>
<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/person-page.css" rel="stylesheet" type="text/css" />
<link href="../css/blog-show.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/personuser.js"></script>
<title>个人首页-博客</title>
</head>
<body>
<div id="body">
	<%@include file="../basicweb/logincheck.jsp" %>
	<div class="user">
	<%@include file="../basicweb/person-user.jsp" %>
	</div>
	<%@include file="../basicweb/person-left.html" %>
	<div id="right">
	<%@include file="../basicweb/person-head.jsp" %>
	</div>
	<div id="main">
	<div class="left">
	<h2><%=nickname %>的博客</h2><br/><br/>
	<ul>
	<%
		int pageNum=1;
		int pageSize=5;
		String pageIndex=request.getParameter("pageNum");
    	if(pageIndex!=null){
    		pageNum=Integer.parseInt(pageIndex);
    	}
    	session.setAttribute("pageNum", pageNum);
    	page<blogs> blogs=null;
    	blogService blog=new blogService();
    	try{
    	blogs=blog.blogGet(nickname, pageNum, pageSize);
    	String btitle="";
    	for(blogs b:blogs.getData()){
    		btitle=b.getBtitle();
    		int bid=b.getBid();
    		String btime=b.getBtime();
    		int tid=b.getTid();
    		topic t=blog.topicSelectByTid(tid);
    		String tname=t.getTname();
    		%>
    			<a href="blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum %>"><li><span class="d"><%=btitle %></span><br/><br/><span class="b"><%=tname %></span><span class="c"><%=btime%></span></li></a>
    		<%
    	}
	%>
	</ul>
		<%if(btitle.equals("")){ %>
	   <div class="none"><br/><br/>您还没有发表文章呢==</div>
	   <%}else{ %>
	   <div class="a">
   		共<%=blogs.getTotalNum()%>条博客 <%=blogs.getPageNum() %>页/<%=blogs.getTotalPage() %>页
   		<a href="blog-show.jsp?pageNum=1">首页</a>
   		<%
   			if(blogs.getPageNum()==1){
   				%>
   				上一页 <a href="blog-show.jsp?pageNum=<%=(pageNum+1) %>">下一页</a>
   				<%
   			}
   			else if(blogs.getPageNum()==blogs.getTotalPage()){
   				%>
   				<a href="blog-show.jsp?pageNum=<%=(pageNum-1) %>">上一页</a> 下一页
   				<%
   			}
   			else{
   				%>
   				<a href="blog-show.jsp?pageNum=<%=(pageNum-1) %>">上一页</a><a href="blog-show.jsp?pageNum=<%=(pageNum+1) %>">下一页</a>
   				<% 
   			}
   		%>
   		<a href="blog-show.jsp?pageNum=<%=blogs.getTotalPage() %>">尾页</a>
   		</div>
   		<%}
    	}catch(Exception e){} %>
	</div>
	<div class="right">
	<%@include file="../basicweb/person-right.jsp" %>
	</div>
	</div>
</div>
<div id="copyright">
<%@include file="../basicweb/copyright.html" %>
</div>
</body>
</html>