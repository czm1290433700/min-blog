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
		String nickname=(String)session.getAttribute("nickname");
		String ccontent=request.getParameter("ccontent");
		blogService comment=new blogService();
		try{
		comment.commentInto(nickname, ccontent, inid, bid, tocid);	
		}catch(Exception e){}
		if(tid==1){
			%>
			<script>
				location.href="../home/travel-blog.jsp?bid=<%=bid%>";
			</script>
			<%
		}
		else if(tid==2){
			%>
			<script>
				location.href="../home/music-blog.jsp?bid=<%=bid%>";
			</script>
			<%
		}
		else{
			%>
			<script>
				location.href="../home/movies-blog.jsp?bid=<%=bid%>";
			</script>
			<%
		}
	%>
</body>
</html>