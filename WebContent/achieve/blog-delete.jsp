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
		int bid=Integer.parseInt(request.getParameter("bid"));
		int pageNum=Integer.parseInt(session.getAttribute("pageNum").toString());
		blogService blog=new blogService();
		try{
			blog.blogDelete(bid);
		}catch(Exception e){
			e.printStackTrace();
		}
		blog.userBlogMinus();
		%>
			<script>
				alert("删除成功！");
				location.href="../person-page/blog-show.jsp?pageNum=<%=pageNum%>";
			</script>
		<%
	%>
</body>
</html>