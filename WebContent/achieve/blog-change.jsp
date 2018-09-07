<%@page import="java.text.SimpleDateFormat"%>
<%@page import="blog.entity.blogs"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.io.InputStream"%>
<%@page import="blog.service.blogService"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String path = request.getContextPath();
		int bid=Integer.parseInt(request.getParameter("bid"));
		int pageNum=Integer.parseInt(session.getAttribute("pageNum").toString());
		String uploadFileName = ""; //上传的文件名
		String fieldName = "";  //表单字段元素的name属性值
		String btitle="";
		String tname="";
		String bcontent="";
		String bpic="";
		String fileName="";
		String nickname=(String)session.getAttribute("nickname");
		blogService blog=new blogService();
		//请求信息中的内容是否是multipart类型
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	
		//上传文件的存储路径（服务器文件系统上的绝对文件路径）
		String uploadFilePath = request.getSession().getServletContext().getRealPath("upload/" );
		//创建临时文件目录路径
		File tempPatchFile=new File("d:\\temp\\buffer\\");
		if(!tempPatchFile.exists())  //判断文件或目录是否存在
			tempPatchFile.mkdirs();   //创建指定的目录，包括所有必需但不存在的父目录
		if (isMultipart) {//如果是文件表单则执行上传功能
			DiskFileItemFactory factory=new DiskFileItemFactory();
			//设置缓冲区大小4kb
			factory.setSizeThreshold(4096);   
			//设置上传文件用到临时文件存放路径
			factory.setRepository(tempPatchFile);   
			ServletFileUpload upload = new ServletFileUpload(factory);
			//设置单个文件的最大限制
			upload.setSizeMax(1024*4000);   
			try {
				//解析form表单中所有文件
				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {   //依次处理每个文件
					FileItem item = (FileItem) iter.next();
					if (item.isFormField()){  //普通表单元素
						if(item.getFieldName().equals("btitle")){
							btitle = item.getString("utf-8");
						}
						else if(item.getFieldName().equals("bcontent")){
							bcontent = item.getString("utf-8");
						}
						else if(item.getFieldName().equals("tname")){
							tname = item.getString("utf-8");
						}						
					}else{//文件元素
						fileName = item.getName();
						if(fileName!=""){
						//通过Arrays类的asList()方法创建固定长度的集合
						List<String> filType=Arrays.asList("gif","bmp","jpg","png","tif","pcx","tga","exif","fpx","svg","psd","cdr","pcd","dxf","ufo","eps","ai","raw","WMF","webp");
						String ext=fileName.substring(fileName.lastIndexOf(".")+1);
						if(!filType.contains(ext)){ //判断文件类型是否在允许范围内
							%>
							<script>
								alert("只允许上传图片资源!");
								location.href="../person-page/blog-write.jsp";
							</script>
							<%
						}
						else{
							if (fileName != null && !fileName.equals("")) {
								File fullFile = new File(item.getName());
								SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
								Date date = new Date();
								String fileRealName = df.format(date)+""+date.getHours()+""+
									+date.getMinutes()+""+System.currentTimeMillis()+"."+ext;
								File saveFile = new File(uploadFilePath, fileRealName);
								item.write(saveFile);
								uploadFileName ="upload/"+fileRealName;
								bpic=uploadFileName;
							}
						}
						}
					}
				}
			}catch(FileUploadBase.SizeLimitExceededException ex){
				%>
				<script>
					alert("上传失败，文件太大，单个文件的最大限制是："+upload.getSizeMax()+"bytes!");
					location.href="../person-page/blog-write.jsp";
				</script>
				<%
			}catch (Exception e) {
				e.printStackTrace();
			}
			if(fileName.equals("")){
				try{
					blog.blogUpdate(btitle, tname, bcontent, nickname, bid);
				}catch(Exception e){
					%>
						<script>
							alert("上传信息不符合对应格式或长度，请重新上传！");
							location.href="../person-page/blog-change?bid=<%=bid%>&pageNum=<%=pageNum %>.jsp";
						</script>
					<%
				}
				%>
					<script>
						alert("修改成功！");
						location.href="../person-page/blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum %>";
					</script>
				<%
			}
			else{
				try{
					blog.blogUpdate2(btitle, tname, bcontent, nickname, bid, bpic);
				}catch(Exception e){
					%>
						<script>
							alert("上传信息不符合对应格式或长度，请重新上传！");
							location.href="../person-page/blog-change?bid=<%=bid%>&pageNum=<%=pageNum %>.jsp";
						</script>
					<%
				}
				%>
				<script>
					alert("修改成功！");
					location.href="../person-page/blog.jsp?bid=<%=bid%>&pageNum=<%=pageNum %>";
				</script>
				<%
				}
		}
	%>
</body>
</html>