<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="../js/pageEffect.js" type="text/javascript"></script>
<script src="../js/login.js" type="text/javascript"></script>
<title>REGISTER</title>
</head>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<body>
<div id="head">
<%@include file="../basicweb/head.html" %>
</div>
<div id="body">
	<div class="introduce">
	<form action="../achieve/register-do.jsp" method="post">
		<table class="register">
			<tr>
				<td class="title" colspan="3">REGISTER</td>
			</tr>
			<tr>
				<td>NAME:</td>
				<td><input type="text" name="name" placeholder="Your Name"></td>
				<td class="name"></td>
			</tr>
			<tr>
				<td>TEL:</td>
				<td><input type="text" name="tel" placeholder="Your Tel"></td>
				<td class="tel"></td>
			</tr>
			<tr>
				<td>NICKNAME:</td>
				<td><input type="text" name="nickname" placeholder="Your Nickname"></td>
				<td class="nickname"></td>
			</tr>
			<tr>
				<td>PASSWORD:</td>
				<td><input type="password" name="pwd" placeholder="Your Password"></td>
				<td class="pwd"></td>
			</tr>
			<tr>
				<td>CONFIRM PASSWORD:</td>
				<td><input type="password" name="okpwd" placeholder="Determine your password"></td>
				<td class="okpwd"></td>
			</tr>
			<tr>
				<td>INTEREST:</td>
				<td><input type="checkbox" name="interest" value="music">music
					<input type="checkbox" name="interest" value="sports">sports
					<input type="checkbox" name="interest" value="military">military
					<input type="checkbox" name="interest" value="amusement">amusement
					<input type="checkbox" name="interest" value="cate">cate</td>
				<td class="interest"></td>
			</tr>	
			<tr>
				<td colspan="3"><input class="button" type="submit" value="REGISTER" onclick="return checkAll()"></td>
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