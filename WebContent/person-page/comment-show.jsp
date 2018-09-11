<%@page import="blog.entity.blogs"%>
<%@page import="blog.entity.comment"%>
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
<link href="../css/comment-show.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/textarea.js"></script>
<script type="text/javascript" src="../js/personuser.js"></script>
<script type="text/javascript" src="../js/comment-show.js"></script>
<title>个人首页-评论</title>
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
	<h2><%=nickname %>收到的评论</h2>
	<ul>
	<%
		int pageNum=1;
		int pageSize=5;
		String pageIndex=request.getParameter("pageNum");
    	if(pageIndex!=null){
    		pageNum=Integer.parseInt(pageIndex);
    	}
    	page<comment> comments=null;
    	blogService comment=new blogService();
    	try{
    	comments=comment.commentGet(nickname, pageNum, pageSize);
    	for(comment c:comments.getData()){
    		String ccontent=c.getCcontent();
    		String ctime=c.getCtime();
    		int bid=c.getBid();
    		int toid=c.getToid();
    		int tocid=c.getTocid();
    		blogs b=comment.blogGetByBid(bid);
    		String btitle=b.getBtitle();//被评论博客标题
    		int tid=b.getTid();
    		login l=comment.loginGetById(toid);
    		String observer =l.getNickname();//评论者姓名
    		user u=comment.userGet(observer);
    		String pic2=u.getPic();
    		if(tid==1){
    		%>
    			<li><span class="author"><img src="<%=path%>/<%=pic2%>"/><%=observer %>:</span><span class="content"><%=ccontent %></span><br/><a href="#" class="answer">回复</a><br/><span class="note"><span class="time"><%=ctime %></span><a href="../home/travel-blog.jsp?bid=<%=bid%>"><%=btitle %></a></span></li>
    		<%
    		}else if(tid==2){
    		%>
    			<li><span class="author"><img src="<%=path%>/<%=pic2%>"/><%=observer %>:</span><span class="content"><%=ccontent %></span><br/><a href="#" class="answer">回复</a><br/><span class="note"><span class="time"><%=ctime %></span><a href="../home/music-blog.jsp?bid=<%=bid%>"><%=btitle %></a></span></li></a>
    		<%
    		}else{
    		%>
    			<li><span class="author"><img src="<%=path%>/<%=pic2%>"/><%=observer %>:</span><span class="content"><%=ccontent %></span><br/><a href="#" class="answer">回复</a><br/><span class="note"><span class="time"><%=ctime %></span><a href="../home/movies-blog.jsp?bid=<%=bid%>"><%=btitle %></a></span></li>
    		<%
    		}
			if(nickname==null){
			%>
				<div class="ans">
					<span class="answ">回复</span><br/><textarea rows="4" cols="55" name="ccontent" disabled="true">请登录后再评论</textarea><br/><br/>
				</div>
			<%}else{ %>
			<div class="ans">
				<%
					login ans2=comment.loginGetByNick(observer);
					int inid2=ans2.getId();
				%>
				<form action="../achieve/commentInsert3.jsp?inid=<%=inid2 %>&bid=<%=bid %>&tocid=<%=tocid %>&tid=<%=tid %>&pageNum=<%=pageNum %>" method="post">
				<span class="answ">回复</span><br/><textarea rows="4" cols="75" name="ccontent"></textarea><br/><br/>
				<input class="tx" type="submit" value="发表" onclick="return checkTextarea()">
				</form>
			</div>
			<%}
	    	}
	%>
	</ul>
	<%if(comments.getTotalNum()==0){
		%>
		<div class="none"><br/><br/>还没有人对您评论进行回复呢==</div>
		<%
	}else{
		%>
	   <div class="a">
   		共<%=comments.getTotalNum() %>条回复 <%=comments.getPageNum() %>页/<%=comments.getTotalPage() %>页
   		<a href="comment-show.jsp?pageNum=1">首页</a>
   		<%
   			if(comments.getPageNum()==1){
   				%>
   				上一页 <a href="comment-show.jsp?pageNum=<%=(pageNum+1) %>">下一页</a>
   				<%
   			}
   			else if(comments.getPageNum()==comments.getTotalPage()){
   				%>
   				<a href="comment-show.jsp?pageNum=<%=(pageNum-1) %>">上一页</a> 下一页
   				<%
   			}
   			else{
   				%>
   				<a href="comment-show.jsp?pageNum=<%=(pageNum-1) %>">上一页 </a><a href="comment-show.jsp?pageNum=<%=(pageNum+1) %>">下一页</a>
   				<% 
   			}
   		%>
   		<a href="comment-show.jsp?pageNum=<%=comments.getTotalPage() %>">尾页</a>
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