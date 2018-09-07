<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/person-page.css" rel="stylesheet" type="text/css" />
<link href="../css/user.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/personuser.js"></script>
<script type="text/javascript" src="../js/submit.js"></script>
<title>个人首页-资料设置</title>
</head>
<body>
<div id="body">
	<%@include file="../basicweb/logincheck.jsp" %>
	<div class="user">
	<%@include file="../basicweb/person-user.jsp" %>
	</div>
	<%@include file="../basicweb/person-left.html" %>
	<div id="right">
	<%@include file="../basicweb/person-head.jsp" %>
	</div>
	<div id="main">
	<div class="left">
	<h2>资料完善</h2><br/><br/>
	<form action="../achieve/user-insert.jsp" method="post" enctype = "multipart/form-data">
	<table>
		<%
			blogService blog=new blogService();
			String nick=(String)session.getAttribute("nickname");
			user user=new user();
			String se="";
			String bi="";
			String ci="";
			String jo="";
			String si="";
			try{
			user=blog.userGet(nick);
			se=user.getSex();
			bi=user.getBirth();
			ci=user.getCity();
			jo=user.getJob();
			si=user.getSign();
			}catch(Exception e){}
		%>
		<tr>
			<td class="title">用户头像:</td>
			<td class="userpic">
				<img class="pic" src="<%=path%>/<%=pic%>"/><br/>
				<span>上传图片请勿超过4mb</span> 
				<input type="file" name ="file" id="file" class="file"><br/>
				<input type="button" class="filebutton" value="更换头像" onclick="document.getElementById('file').click()">
			</td>
		</tr>
		<tr>
			<td class="title">性别:</td>
			<td><input type="radio" name="sex" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女">女</td>
		</tr>
		<tr>
			<td class="title">生日:</td>
			<td><%@include file="../basicweb/time.jsp" %></td>
		</tr>
		<tr>
			<td class="title">城市:</td>
			<td><input type="text" name="city" value=<%=ci%>></td>
		</tr>
		<tr>
			<td class="title">工作:</td>
			<td><input type="text" name="job" value=<%=jo%>></td>
		</tr>
		<tr>
			<td class="title">签名:</td>
			<td><input type="text" name="sign" value=<%=si%>></td>
		</tr>
		<tr>
			<td class="title"></td>
			<td><input type="submit" value="保存"></td>
		</tr>
	</table>		
	</form>
	</div>
	<div class="right">
	<%@include file="../basicweb/person-right.jsp" %>
	</div>
	</div>
</div>
<div id="copyright">
<%@include file="../basicweb/copyright.html" %>
</div>
</body>
</html>