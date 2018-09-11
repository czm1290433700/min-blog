<%@page import="blog.entity.message"%>
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
<link href="../css/message-show.css" rel="stylesheet" type="text/css" />
<link href="../css/ul.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/personuser.js"></script>
<script type="text/javascript" src="../js/textarea.js"></script>
<script type="text/javascript" src="../js/comment-show.js"></script>
<title>个人首页-留言</title>
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
	<h2><%=nickname %>的留言</h2>
	<ul>
	<%
		int pageNum=1;
		int pageSize=5;
		String pageIndex=request.getParameter("pageNum");
    	if(pageIndex!=null){
    		pageNum=Integer.parseInt(pageIndex);
    	}
    	page<message> messages=null;
    	blogService message=new blogService();
    	login l2=message.loginGetByNick(nickname);
    	int inid=l2.getId();
    	try{
    	messages=message.messageGet(nickname, pageNum, pageSize);
    	for(message b:messages.getData()){
    		String mcontent=b.getMcontent();
    		String mtime=b.getMtime();
    		int toid=b.getToid();   		
    		login l=message.loginGetById(toid);
    		String messager=l.getNickname();
    		user u=message.userGet(messager);
    		String mpic=u.getPic();
    		%>
    			<li><span class="author"><img src="<%=path%>/<%=mpic%>"/><%=messager %>:</span><span class="content"><%=mcontent %></span><br/><a href="#" class="answer">给他留言</a><br/><span class="note"><span class="time"><%=mtime %></span></span></li>
    		<%
    		if(nickname==null){
    			%>
    				<div class="ans">
    					<span class="answ">留言</span><br/><textarea rows="4" cols="55" name="mcontent" disabled="true">请登录后再评论</textarea><br/><br/>
    				</div>
    			<%}else{ %>
    			<div class="ans">
    				<%
    					login ans2=message.loginGetByNick(messager);
    					int inid2=ans2.getId();
    				%>
    				<form action="../achieve/message-insert2.jsp?inid=<%=toid %>&toid=<%=inid %>&pageNum=<%=pageNum %>" method="post">
    				<span class="answ">留言</span><br/><textarea rows="4" cols="75" name="mcontent"></textarea><br/><br/>
    				<input class="tx" type="submit" value="回复" onclick="return checkTextarea()">
    				</form>
    			</div>
    			<%
    	}
    	}
	%>
	</ul>
	<%if(messages.getTotalNum()==0){
		%>
		<div class="none"><br/><br/>还没有人对您留言呢==</div>
		<%
	}else{
		%>
	   <div class="a">
   		共<%=messages.getTotalNum() %>条留言 <%=messages.getPageNum() %>页/<%=messages.getTotalPage() %>页
   		<a href="message-show.jsp?pageNum=1">首页</a>
   		<%
   			if(messages.getPageNum()==1){
   				%>
   				上一页 <a href="message-show.jsp?pageNum=<%=(pageNum+1) %>">下一页</a>
   				<%
   			}
   			else if(messages.getPageNum()==messages.getTotalPage()){
   				%>
   				<a href="message-show.jsp?pageNum=<%=(pageNum-1) %>">上一页</a> 下一页
   				<%
   			}
   			else{
   				%>
   				<a href="message-show.jsp?pageNum=<%=(pageNum-1) %>">上一页</a> <a href="message-show.jsp?pageNum=<%=(pageNum+1) %>">下一页</a>
   				<% 
   			}
   		%>
   		<a href="message-show.jsp?pageNum=<%=messages.getTotalPage() %>">尾页</a>
   		<%}
   		}catch(Exception e){} %>
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