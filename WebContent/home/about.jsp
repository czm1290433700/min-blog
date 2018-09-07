<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="../js/pageEffect.js" type="text/javascript"></script>
<script src="../js/logincheck.js" type="text/javascript"></script>
<title>ABOUT</title>
</head>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<body>
<div id="head">
<%@include file="../basicweb/head.html" %>
</div>
<div id="body">
	<div class="introduce">
	</div>
	<div class="body">
		<div class="left"></div>
		<%@include file="../basicweb/home-right.jsp" %>
	</div>
	<%
	String nick=(String)session.getAttribute("nickname");
	%>
	<input id="hiddenName" type="hidden" value="<%=nick%>" />
</div>
<div id="foot">
<%@include file="../basicweb/foot.html" %>
</div>
<div id="copyright">
<%@include file="../basicweb/copyright.html" %>
</div>
</body>
</html>