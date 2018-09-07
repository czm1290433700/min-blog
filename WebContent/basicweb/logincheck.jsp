<% 
	String ss=session.getAttribute("nickname").toString();
	if(session.getAttribute("nickname").toString()==null){
	%>
		<script>
			alert("please login first!");
			location.href="../home/login.jsp";
		</script>
	<%
	}
%>