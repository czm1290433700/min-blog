<%@page import="blog.entity.topic"%>
<%@page import="blog.entity.blogs"%>
<%@page import="blog.entity.user"%>
<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/person-page.css" rel="stylesheet" type="text/css" />
<link href="../css/blog.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/personuser.js"></script>
<script type="text/javascript" src="../js/blog.js"></script>
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
		<%
			int bid=Integer.parseInt(request.getParameter("bid"));
			int pageNum=Integer.parseInt(session.getAttribute("pageNum").toString());
			blogService blog=new blogService();
			blogs article=blog.blogGetByBid(bid);
			String btitle=article.getBtitle();
			String bcontent=article.getBcontent();
			String bpic=article.getBpic();
			String btime=article.getBtime();
			int tid=article.getTid();
			topic t=blog.topicSelectByTid(tid);
			String tname=t.getTname();
		%>
		<div class="content">
		<a href="blog-show.jsp?pageNum=<%=pageNum %>"><input class="button" type="button" name="return" value="返回"></a>
		<a href="../achieve/blog-delete.jsp?bid=<%=bid%>"><input class="button" type="button" name="delete" value="删除"></a>
		<a href="blog-change.jsp?bid=<%=bid%>&pageNum=<%=pageNum %>"><input class="button" type="button" name="change" value="修改"></a><br/><br/>
		<h2><%=btitle %></h2><br/><br/><span class="tn"><%=tname %></span><br/><span class="bt"><%=btime %></span><br/><br/>
		<%if(bpic!=null){ %>
			<img src="<%=path%>/<%=bpic%>"/>
		<%} %>
		<%=bcontent %>
		</div>
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