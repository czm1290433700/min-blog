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
		request.setCharacterEncoding("utf-8");
		login a=null;
		String nickname=null;
		try{
		int id=Integer.parseInt(request.getParameter("id"));
		String pwd=request.getParameter("pwd");
		blogService user=new blogService();
		a=user.login(id, pwd);
		nickname=a.getNickname();
		}catch(Exception e){
			%>
				<script>
					alert("登录失败，请检查id密码是否正确!");
					location.href="../home/login.jsp";
				</script>
			<%
		}
		if(a!=null){
			session.setAttribute("nickname", nickname);
			response.sendRedirect("/blog/index.jsp");
		}
	%>
</body>
</html>