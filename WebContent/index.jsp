<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/blog/js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="/blog/js/pageEffect.js" type="text/javascript"></script>
<script src="/blog/js/logincheck.js" type="text/javascript"></script>
<title>Home</title>
</head>
<link href="/blog/css/home.css" rel="stylesheet" type="text/css" />
<body>
<div id="head">
<%@include file="basicweb/head.html" %>
</div>
<div id="body">
	<div class="introduce">
		<span>Contrary to popular belief, Lorem Ipsum simply</span><br/><br/>
		<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when </p>
		<p>an unknown printer took a galley of type and scrambled it to make Lorem Ipsum has </p>
		<p>been the industry's standard dummy text ever since the 1500s</p>
		<input class="button" type="button" value="READ MORE">
	</div>
	<%
	String nick=(String)session.getAttribute("nickname");
	%>
	<input id="hiddenName" type="hidden" value="<%=nick%>" />
</div>
<div id="foot">
<%@include file="basicweb/foot.html" %>
</div>
<div id="copyright">
<%@include file="basicweb/copyright.html" %>
</div>
</body>
</html>