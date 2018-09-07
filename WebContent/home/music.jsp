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
<script src="../js/pageEffect.js" type="text/javascript"></script>
<script src="../js/logincheck.js" type="text/javascript"></script>
<title>MUSIC</title>
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
			<h2>MUSIC</h2><br/><br/><br/>
			<%
				int tid=2;
				int pageNum=1;
				int pageSize=4;
				String path = request.getContextPath();
				String pageIndex=request.getParameter("pageNum");
		    	if(pageIndex!=null){
		    		pageNum=Integer.parseInt(pageIndex);
		    	}
		    	page<blogs> blogs=null;
		    	blogService blog=new blogService();
		    	try{
		    		blogs=blog.blogSelectByTid2(tid, pageNum, pageSize);
		    		for(blogs b:blogs.getData()){
		    			int bid=b.getBid();
		    			String btitle=b.getBtitle();
		    			String bauthor=b.getBauthor();
		    			String btime=b.getBtime();
		    			String bcontent=b.getBcontent();
		    			String bpic=b.getBpic();
		    			%>
		    				<a href="music-blog.jsp?bid=<%=bid %>">
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
		    		}%><br/>
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
	    						<a href="travel.jsp?pageNum=<%=pageNum-1 %>"><div class="type"><<</div></a>
	    					<%
		    			}
		    			if(totalPage>3){
		    				for(int i=1;i<=3;i++){
		    					%>
		    						<a href="travel.jsp?pageNum=<%=i %>"><div class="type"><%=i %></div></a>
		    					<% 
		    				}
		    				if(pageNum==3){
		    					%>
		    						<div class="type">>></div>
		    					<% 
		    				}
		    				else{
		    					%>
		    						<a href="travel.jsp?pageNum=<%=pageNum+1 %>"><div class="type">>></div></a>
		    					<%
		    				}
		    			}
		    			else{
		    				for(int i=1;i<=totalPage;i++){
		    					%>
		    						<a href="travel.jsp?pageNum=<%=i %>"><div class="type"><%=i %></div></a>
		    					<% 
		    				}
		    				if(pageNum==totalPage){
		    					%>
		    						<div class="type">>></div>
		    					<% 
		    				}
		    				else{
		    					%>
		    						<a href="travel.jsp?pageNum=<%=pageNum+1 %>"><div class="type">>></div></a>
		    					<%
		    				}
		    			}
		    		%>
		    		</div>
		       		<%
		        	}catch(Exception e){} %>
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