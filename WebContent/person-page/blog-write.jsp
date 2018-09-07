<%@page import="blog.entity.user"%>
<%@page import="blog.entity.login"%>
<%@page import="blog.entity.topic"%>
<%@page import="java.util.List"%>
<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/person-page.css" rel="stylesheet" type="text/css" />
<link href="../css/blog-write.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/personuser.js"></script>
<script type="text/javascript" src="../js/submit.js"></script>
<script type="text/javascript" src="../js/blog-check.js"></script>
<title>个人首页-写博客</title>
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
		<h2>写博客</h2><br/>
		<form action="../achieve/blog-do.jsp" method="post" enctype = "multipart/form-data">
			<table>
				<tr>
					<td class="title">博客标题:</td>
					<td><input type="text" name="btitle"><span class="btitle"></span></td>	
				</tr>
				<tr>
					<td class="title">主题:</td>
					<td><select name="tname" id="tname">
						<%
							blogService blog=new blogService();
							List<topic> t=blog.topicGet();
							for(topic tpc:t){
								String tname=tpc.getTname();
								%>
								<option value=<%=tname %>><%=tname %></option>
								<%
							}
						%>
					</select></td>	
				</tr>
				<tr>
					<td class="title">博客内容:</td>
					<td>
					<textarea id="bcontent" name="bcontent" cols="30" rows="10" class="ckeditor"></textarea>
					<script type="text/javascript">
						ckeditor.replace('TextArea');
					</script>
					<span class="bcontent"></span>
					</td>	
				</tr>
				<tr>
					<td class="title">选择图片:</td>
					<td><input type="button" class="filebutton" value="选择图片" onclick="document.getElementById('file').click()"><input type="file" class="file" name = "file" id="file"><span class="note">图片大小应不超过4mb</span></td>
				</tr>
				<tr>
					<td class="title"></td>
					<td><input type="submit" value="发表" onclick="return checkAll()"></td>
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