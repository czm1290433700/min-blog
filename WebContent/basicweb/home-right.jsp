<%@page import="blog.entity.login"%>
<%@page import="blog.entity.user"%>
<%@page import="java.util.List"%>
<%@page import="blog.entity.blogs"%>
<%@page import="blog.service.blogService"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="right">
<div class="newblog">
<h3>热门博主</h3>
<ul>
	<%
		blogService newBlog=new blogService();
		String bpath = request.getContextPath();
		try{
			List<user> bloggers=newBlog.userSelectByblog();
			int i=0;
			for(user blogger:bloggers){
				int id=blogger.getId();
				login l=newBlog.loginGetById(id);
				String name=l.getNickname();
				String pic=blogger.getPic();
				int blogAmount=blogger.getBlog();
				int messageAmount=blogger.getMessage();
				%>
					<li><a href="person-blog.jsp?id=<%=id%>"><img class="photo" src="<%=bpath%>/<%=pic%>"/></a><div id="information"><span class="name"><%=name %></span><br/><span class="amount">博客数：<%=blogAmount %>&nbsp;留言数：<%=messageAmount %></span></div>
				<%
				i++;
				if(i==5){
					break;
				}
			}
		}catch(Exception e){}
	%>		
</ul>
<h3>最新博文</h3>
<ul>
<%
	try{
		List<blogs> newblogs=newBlog.blogSelectByTime();
		int i=0;
		for(blogs newblog:newblogs){
			String blogtitle=newblog.getBtitle();
			int blogid=newblog.getBid();
			%>
				<a href="blog.jsp?bid=<%=blogid%>"><li><%=blogtitle %></li></a>
			<%
			i++;
			if(i==10){
				break;
			}
		}
	}catch(Exception e){}
%>
</ul>
</div>
<h3>最新资讯</h3>
<ul>
<%
	try{
	Document doc = Jsoup.connect("https://www.ithome.com/").get();
	Elements li=doc.getElementsByTag("li");
	Elements newslis=li.select("li.new");
	int i=0;
	for(Element newsli:newslis){
		Element date=newsli.select("span.date").first();
		if(date.text().equals("今日")){
			Element link = newsli.select("a").first();
			String titleHtml=link.attr("href");
			String titleText=link.text();
			%>
				<a href="news.jsp?url=<%=titleHtml%>"><li><%=titleText %></li></a>
			<%
			i++;
			if(i==10){
				break;
			}
		}
	}
	}catch(Exception e){
		%>
			<script>
				alert("服务器访问繁忙，请稍后再试！");
				location.href="/blog/index.jsp";
			</script>
		<%
	}
%>
</ul>
</div>