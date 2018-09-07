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
		String pwd=request.getParameter("new-pwd");
		String nickname=(String)session.getAttribute("nickname");
		blogService password=new blogService();
		try{
			password.pwdUpdate(nickname, pwd);
		}catch(Exception e){
			%>
				<script>
					alert("密码更新失败");
					location.href="../home/pwd.jsp";
				</script>
			<%
		}
		%>
		<script>
			alert("密码更新成功");
			location.href="../person-page/home.jsp";
		</script>
		<%
	%>
</body>
</html>