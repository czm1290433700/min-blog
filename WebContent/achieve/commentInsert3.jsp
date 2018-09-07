<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int inid=Integer.parseInt(request.getParameter("inid"));
		int bid=Integer.parseInt(request.getParameter("bid"));
		int tid=Integer.parseInt(request.getParameter("tid"));
		int tocid=Integer.parseInt(request.getParameter("tocid"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		String nickname=(String)session.getAttribute("nickname");
		String ccontent=request.getParameter("ccontent");
		blogService comment=new blogService();
		try{
		comment.commentInto(nickname, ccontent, inid, bid, tocid);	
		}catch(Exception e){}
		%>
		<script>
			alert("回复成功!");
			location.href="../person-page/comment-show.jsp?pageNum=<%=pageNum%>";
		</script>
</body>
</html>