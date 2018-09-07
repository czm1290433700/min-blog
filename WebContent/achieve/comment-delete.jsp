<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除成功</title>
</head>
<body>
	<%
		int cid=Integer.parseInt(request.getParameter("cid"));
		int bid=Integer.parseInt(request.getParameter("bid"));
		int tid=Integer.parseInt(request.getParameter("tid"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		blogService comment=new blogService();
		try{
			comment.commentDelete(cid);
			comment.commentDelete2(cid);
		}catch(Exception e){}
		if(tid==0){
			if(request.getParameter("pageNum2")!=null){
				int pageNum2=Integer.parseInt(request.getParameter("pageNum2"));
			%>
				<script>
					alert("删除成功!");
					location.href="../home/blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=pageNum2%>";
				</script>
			<%
			}else{
			%>
				<script>
					alert("删除成功!");
					location.href="../home/blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>";
				</script>
			<%	
			}
		}
		else if(tid==1){
			if(request.getParameter("pageNum2")!=null){
				int pageNum2=Integer.parseInt(request.getParameter("pageNum2"));
			%>
				<script>
					alert("删除成功!");
					location.href="../home/travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=pageNum2%>";
				</script>
			<%
			}else{
			%>
				<script>
					alert("删除成功!");
					location.href="../home/travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>";
				</script>
			<%	
			}
		}else if(tid==2){
			if(request.getParameter("pageNum2")!=null){
				int pageNum2=Integer.parseInt(request.getParameter("pageNum2"));
			%>
				<script>
					alert("删除成功!");
					location.href="../home/music-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=pageNum2%>";
				</script>
			<%
			}else{
			%>
				<script>
					alert("删除成功!");
					location.href="../home/music-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>";
				</script>
			<%	
			}
		}else{
			if(request.getParameter("pageNum2")!=null){
				int pageNum2=Integer.parseInt(request.getParameter("pageNum2"));
			%>
				<script>
					alert("删除成功!");
					location.href="../home/movies-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=pageNum2%>";
				</script>
			<%
			}else{
			%>
				<script>
					alert("删除成功!");
					location.href="../home/movies-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>";
				</script>
			<%	
			}
		}
	%>
</body>
</html>