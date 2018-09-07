<%@page import="blog.entity.login"%>
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
		int inid=0;
		try{
		String mcontent=request.getParameter("mcontent");
		inid=Integer.parseInt(request.getParameter("inid"));
		String nickname=session.getAttribute("nickname").toString();
		blogService message=new blogService();
		login blogger=message.loginGetByNick(nickname);
		int toid=blogger.getId();
		message.messageInsert(mcontent, inid, toid);
		}catch(Exception e){}
		%>
			<script>
				alert("留言成功!");
				location.href="../home/person-blog.jsp?id=<%=inid%>";
			</script>
		<%
	%>
</body>
</html>