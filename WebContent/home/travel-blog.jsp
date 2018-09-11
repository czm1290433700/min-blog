<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="../js/pageEffect.js" type="text/javascript"></script>
<script src="../js/logincheck.js" type="text/javascript"></script>
<script src="../js/submit.js" type="text/javascript"></script>
<script src="../js/answer.js" type="text/javascript"></script>
<script src="../js/textarea.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<title>TRAVEL</title>
</head>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/bootstrap.min.css">
<body>
<div id="head">
<%@include file="../basicweb/head.html" %>
</div>
<div id="body">
	<div class="introduce">
	</div>
	<div class="body">
		<div class="left">
			<h2>TRAVEL</h2><br/><br/><br/>
			<%int tid=1; %>
			<%@include file="../basicweb/home-left.jsp" %>
		</div>
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