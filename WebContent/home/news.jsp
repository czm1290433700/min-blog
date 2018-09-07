<%@page import="blog.service.blogService"%>
<%@page import="blog.entity.blogs"%>
<%@page import="blog.entity.page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="../js/jquery.lazyload.js" type="text/javascript"></script>
<script src="../js/pageEffect.js" type="text/javascript"></script>
<script src="../js/logincheck.js" type="text/javascript"></script>
<script src="../js/lazyload.js" type="text/javascript"></script>
<title>NEWS</title>
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
			<%
				String url=request.getParameter("url");
				if(url==null){
					%>
						<script>
							alert("无效访问!");
							location.href="index.jsp";
						</script>
					<%
				}
				String title="";
				String content="";
				String time="";
				String source="";
				String author="";
				String editor="";
				try{
				Document document = Jsoup.connect(url).get();
				title=document.getElementsByClass("post_title").select("h1").text();
				content=document.getElementsByClass("post_content").html();
				time=document.getElementById("pubtime_baidu").html();
				source=document.getElementById("source_baidu").html();
				author=document.getElementById("author_baidu").html();
				editor=document.getElementById("editor_baidu").html();
				}catch(Exception e){}
			%>
			<div id="news">
				<h2 class="title"><%=title %></h2>
				<span class="info">
					<span class="time"><%=time %></span>
					<span class="source"><%=source %></span>
					<span class="author"><%=author %></span>
					<span class="editor"><%=editor %></span>
				</span><br/>
				<span class="content"><%=content %><br/><br/>
				本文爬自<a href=<%=url %>><%=url %></a>。<br/>如有侵权请联系管理员删除</span>
			</div>
		</div>
		<%@include file="../basicweb/home-right.jsp" %>
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