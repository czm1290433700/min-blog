<%@page import="blog.entity.user"%>
<%@page import="blog.entity.login"%>
<%@page import="blog.entity.comment"%>
<%@page import="blog.entity.page"%>
<%@page import="blog.entity.blogs"%>
<%@page import="blog.service.blogService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<%
				int	bid=Integer.parseInt(request.getParameter("bid"));
				String path = request.getContextPath();
				blogService blog=new blogService();
				blog.blogVisitorAdd(bid);
				blogs article=blog.blogGetByBid(bid);
				String btitle=article.getBtitle();
				String bauthor=article.getBauthor();
				String bcontent=article.getBcontent();
				String bpic=article.getBpic();
				String btime=article.getBtime();
				String nickname=null;
				nickname=(String)session.getAttribute("nickname");
				int visitor=article.getVisitor();
			%>
			<div class="content">
				<h2 class="title"><%=btitle %></h2><br/><span class="author"><%=bauthor %></span><br/><br/>
				<%if(bpic!=null){ %>
					<img src="<%=path%>/<%=bpic%>"/>
				<%} %><br/>
				<%=bcontent %><br/>
				<span class="time"><%=btime %>&nbsp;&nbsp;</span>
				<span class="glyphicon glyphicon-comment"></span>
				<span class="glyphicon glyphicon-eye-open"></span><%=visitor %>
			</div><br/><br/>
			<h3>评论</h3><br/><br/>
			<%
				int pageNum=1;
				int pageSize=5;
				String pageIndex=request.getParameter("pageNum");
		    	if(pageIndex!=null){
		    		pageNum=Integer.parseInt(pageIndex);
		    	}
		    	page<comment> comments=null;
				try{
					comments=blog.commentSelectByBID(bid, pageNum, pageSize);
					for(comment c:comments.getData()){
						String ctime=c.getCtime();
						int toid=c.getToid();
						String ccontent=c.getCcontent();
						String commenter=null;
						String pic=null;
						int cid=0;
						try{
							login l=blog.loginGetById(toid);
							commenter=l.getNickname();
							user u=blog.userGet(commenter);
							pic=u.getPic();
							cid=c.getCid();
						}catch(Exception e){}
						%>
							<div class="comment">
								<span class="user">
									<img src="<%=path%>/<%=pic%>"/>
									<span class="author"><%=commenter %>:</span>
								</span>							
								<span class="sub">
									<span class="con"><%=ccontent %></span>
									<%if(commenter.equals(nickname)){ %>
									<a href="../achieve/comment-delete.jsp?cid=<%=cid%>&pageNum=<%=pageNum%>&bid=<%=bid%>&tid=<%=tid%>" class="del">删除</a>
									<%} %>
									<a class="href">回复</a>
									<span class="time"><%=ctime %></span>
								</span>
							</div>
							<%
								if(nickname==null){
							%>
									<div class="ans">
										<%
											login ans=blog.loginGetByNick(commenter);
											int inid=ans.getId();
										%>
										<span class="answ">回复<%=commenter %>:</span><br/><textarea rows="4" cols="55" name="ccontent" disabled= "true">请先登录后再评论</textarea><br/><br/>
									</div>
							<%}else{ %>
								<div class="ans">
									<%
										login ans=blog.loginGetByNick(commenter);
										int inid=ans.getId();
									%>
									<form action="../achieve/commentInsert2.jsp?inid=<%=inid %>&bid=<%=bid %>&tocid=<%=cid %>&tid=<%=tid %>" method="post">
									<span class="answ">回复<%=commenter %>:</span><br/><textarea rows="4" cols="55" name="ccontent"></textarea><br/><br/>
									<input class="tx" type="submit" value="发表" onclick="return checkTextarea()">
									</form>
								</div>
							<% 
							}
							int pageNum2=1;
							int pageSize2=5;
							String pageIndex2=request.getParameter("pageNum2");
					    	if(pageIndex2!=null){
					    		pageNum2=Integer.parseInt(pageIndex2);
					    	}
							page<comment> comments2=null;
							int tocid=cid;
							try{
								comments2=blog.commentSelectByBID2(bid, tocid, pageNum2, pageSize);
								for(comment c2:comments2.getData()){
									String ctime2=c2.getCtime();
									int toid2=c2.getToid();
									int inid=c2.getInid();
									String ccontent2=c2.getCcontent();
									String commenter2=null;
									String Commentator2=null;
									String pic2=null;
									String pic3=null;
									int cid2=0;
									try{
										login l2=blog.loginGetById(toid2);
										commenter2=l2.getNickname();
										l2=blog.loginGetById(inid);
										Commentator2=l2.getNickname();
										user u2=blog.userGet(commenter2);
										pic2=u2.getPic();
										cid2=c2.getCid();
										u2=blog.userGet(Commentator2);
									}catch(Exception e){}
									%>
									<div class="comment2">
										<span class="user">
											<img src="<%=path%>/<%=pic2%>"/>
											<span class="author">回复</span>
											<span class="author"><%=Commentator2 %>:</span>
										</span>
										<span class="sub">
											<span class="con"><%=ccontent2 %></span>&nbsp;&nbsp;&nbsp;<br/>
											<%if(commenter2.equals(nickname)){%>
											<a href="../achieve/comment-delete2.jsp?cid=<%=cid2%>&bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=pageNum2%>&tid=<%=tid%>" class="del">删除</a>
											<%} %>
											<a class="href">回复</a>
											<span class="time"><%=ctime2 %></span>
										</span>
									</div>
								<%
									if(nickname==null){
								%>
									<div class="ans">
										<%
											login ans2=blog.loginGetByNick(commenter);
											int inid2=ans2.getId();
										%>
										<span class="answ">回复<%=commenter2 %>:</span><br/><textarea rows="4" cols="55" name="ccontent" disabled="true">请登录后再评论</textarea><br/><br/>
									</div>
								<%}else{ %>
								<div class="ans">
									<%
										login ans2=blog.loginGetByNick(commenter);
										int inid2=ans2.getId();
									%>
									<form action="../achieve/commentInsert2.jsp?inid=<%=inid2 %>&bid=<%=bid %>&tocid=<%=cid2 %>&tid=<%=tid %>" method="post">
									<span class="answ">回复<%=commenter2 %>:</span><br/><textarea rows="4" cols="55" name="ccontent"></textarea><br/><br/>
									<input class="tx" type="submit" value="发表" onclick="return checkTextarea()">
									</form>
								</div>
								<%}
								}
							}catch(Exception e){}
							%>
							<div class="page2">
								<%
									if(comments2.getTotalPage()<=1){}
									else if(comments2.getTotalPage()==2){
										if(comments2.getPageNum()==1){
											%>
												<<
											<%
										}
										else{
											%>
												<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=(pageNum2-1)%>"><<</a>
											<%
										}
										%>
											<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=1">1</a>
											<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=2">2</a>
										<%
										if(comments2.getPageNum()==2){
											%>
												>>
											<%
										}
										else{
											%>
												<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=(pageNum2+1)%>">>></a>
											<%
										}
									}
									else{
										if(comments2.getPageNum()==1){
											%>
												<<
											<%
										}
										else{
											%>
												<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=(pageNum2-1)%>"><<</a>
											<%
										}
										%>
											<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=1">1</a>
											<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=2">2</a>
											<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=2">3</a>
										<%
										if(comments2.getPageNum()==comments2.getTotalPage()){
											%>
												>>
											<%
										}
										else{
											%>
												<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum%>&pageNum2=<%=(pageNum2+1)%>">>></a>
											<%
										}
									}
								%>
							</div>
							<br/><br/>
							<%
					}
				}catch(Exception e){}
			%>
    		<%
    			int totalPage=comments.getTotalPage();
    			if(totalPage==0){
    				%>
   						<span class="none">尚未有评论</span>
   					<%
    			}
    			else{
    				%>
    				<div class="page">
    				<%
	    			if(pageNum==1){
	    				%>
	    					<div class="type"><<</div>
	    				<%
	    			}
	    			else{
	    				%>
    						<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum-1%>"><div class="type"><<</div></a>
    					<%
	    			}
	    			if(totalPage>3){
	    				for(int i=1;i<=3;i++){
	    					%>
	    						<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=i %>"><div class="type"><%=i %></div></a>
	    					<% 
	    				}
	    				if(pageNum==3){
	    					%>
	    						<div class="type">>></div>
	    					<% 
	    				}
	    				else{
	    					%>
	    						<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum+1%>"><div class="type">>></div></a>
	    					<%
	    				}
	    			}
	    			else{
	    				for(int i=1;i<=totalPage;i++){
	    					%>
	    						<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=i %>"><div class="type"><%=i %></div></a>
	    					<% 
	    				}
	    				if(pageNum==totalPage){
	    					%>
	    						<div class="type">>></div>
	    					<% 
	    				}
	    				else{
	    					%>
	    						<a href="travel-blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum+1%>"><div class="type">>></div></a>
	    					<%
	    				}
	    			}
	    		%>
	    			</div>
	    		<%
    			}
    		%>
		    <br/><br/>
			<h3>写评论</h3><br/><br/>
			<%
				if(nickname==null){
					%>
					<textarea id="ccontent" name="ccontent" cols="30" rows="10" class="ckeditor" disabled= "true">请先登录再发表评论</textarea>
					<script type="text/javascript">
						ckeditor.replace('TextArea');
					</script>
					<%
				}else{
					%>
					<form action="../achieve/commentInsert.jsp?bid=<%=bid%>&tid=<%=tid%>" method="post">
					<%=nickname %>:<br/><br/>
					<textarea id="ccontent" name="ccontent" cols="30" rows="10" class="ckeditor"></textarea>
					<script type="text/javascript">
						ckeditor.replace('TextArea');
					</script><br/>
					<br/>
					<input class="type" type="submit" value="发表" onclick="return checkCkeditor()">
					</form>
					<%
				} 
			%>