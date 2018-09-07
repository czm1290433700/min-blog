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
		request.setCharacterEncoding("UTF-8");
		int inid=Integer.parseInt(request.getParameter("inid"));
		int toid=Integer.parseInt(request.getParameter("toid"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		String mcontent=request.getParameter("mcontent");
		blogService message=new blogService();
		try{
			message.messageInsert(mcontent, inid, toid);
		}catch(Exception e){}
	%>
	<script>
		alert("留言成功!");
		location.href="../person-page/message-show.jsp?pageNum=<%=pageNum%>";
	</script>
</body>
</html>