<%@page import="blog.entity.user"%>
<%@page import="blog.service.blogService"%>
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
<title>个人首页</title>
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
	<h2>密码修改</h2><br/><br/>
	<form action="../achieve/pwd-update.jsp">
	 	<table>
	 		<tr>
	 			<td class="title">旧密码:</td>
	 			<td><input type="password" name="old-pwd"></td>
	 		</tr>
	 		<tr>
	 			<td class="title">新密码:</td>
	 			<td><input type="password" name="new-pwd"></td>
	 		</tr>
	 		<tr>
	 			<td class="title">确定密码:</td>
	 			<td><input type="password" name="ok-pwd"></td>
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