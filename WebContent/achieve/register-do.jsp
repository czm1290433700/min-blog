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
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String nickname=request.getParameter("nickname");
		String pwd=request.getParameter("pwd");
		String []interest=request.getParameterValues("interest");
		blogService register=new blogService();	
		int a=register.register(name, tel, nickname, pwd, interest[0]);
		if(a==1){
			session.setAttribute("name", name);
			session.setAttribute("tel", tel);
			session.setAttribute("nickname", nickname);
			session.setAttribute("pwd", pwd);
			session.setAttribute("interest", interest[0]);
			response.sendRedirect("../home/register-success.jsp");
		}
		else{
			%>
				<script>
					alert("抱歉,注册失败!");
					location.href="../home/register.jsp";
				</script>
			<%
		}
	%>
</body>
</html>