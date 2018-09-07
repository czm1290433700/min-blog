<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="../js/pageEffect.js" type="text/javascript"></script>
<title>LOGIN</title>
</head>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<body>
<div id="head">
<%@include file="../basicweb/head.html" %>
</div>
<div id="body">
	<div class="introduce">
	<form action="../achieve/login-do.jsp" method="post">
		<table class="login">
			<tr> 
				<td class="title" colspan="2">LOGIN</td>
			</tr>
			<tr>
				<td>I&nbsp;&nbsp;D:</td>
				<td><input class="text" type="text" name="id" placeholder="Your ID"></td>
			</tr>
			<tr>
				<td>PASSWORD:</td>
				<td><input class="text" type="password" name="pwd" placeholder="Your PASSWORD"></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="register.jsp">REGISTER NOW！</a></td>
			</tr>
			<tr>
				<td colspan="2"><input class="button" type="submit" value="SUBMIT"></td>
			</tr>
		</table>
	</form>
	</div>
</div>
<div id="foot">
<%@include file="../basicweb/foot.html" %>
</div>
<div id="copyright">
<%@include file="../basicweb/copyright.html" %>
</div>
</body>
</html>