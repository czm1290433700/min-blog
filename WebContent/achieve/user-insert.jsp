<%@page import="java.text.SimpleDateFormat"%>
<%@page import="blog.entity.user"%>
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
		String nickname=(String)session.getAttribute("nickname");
		String bpic="";
		String sex="";
		String birth="";
		String city="";
		String job="";
		String sign="";
		String pic="";
		request.setCharacterEncoding("utf-8");
		String uploadFileName = ""; //上传的文件名
		String fieldName = "";  //表单字段元素的name属性值
		//请求信息中的内容是否是multipart类型
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		//上传文件的存储路径（服务器文件系统上的绝对文件路径）
		String uploadFilePath = request.getSession().getServletContext().getRealPath("upload/");
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
			upload.setSizeMax(1024*3000);   
			try {
				//解析form表单中所有文件
				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {   //依次处理每个文件
					FileItem item = (FileItem) iter.next();
					if (!item.isFormField()){  //文件表单字段
						String fileName = item.getName();
						//通过Arrays类的asList()方法创建固定长度的集合
						List<String> filType=Arrays.asList("gif","bmp","jpg");
						String ext=fileName.substring(fileName.lastIndexOf(".")+1);
						if(!filType.contains(ext)){  //判断文件类型是否在允许范围内
						%>
							<script>
								alert("上传失败，文件类型只能是gif、bmp、jpg");
								location.href="../person-page/user.jsp";
							</script>
						<%}
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
								pic=uploadFileName;
							}		
						}					
					}else{//如果是普通表单元素
						
						if(item.getFieldName().equals("sex")){
							if(item.getString("utf-8")!=null){
								sex = item.getString("utf-8");
							}
						}
						else if(item.getFieldName().equals("birth")){
							if(item.getString("utf-8")!=null){
								birth = item.getString("utf-8");
							}
						}
						else if(item.getFieldName().equals("city")){
							if(item.getString("utf-8")!=null){
								city = item.getString("utf-8");
							}
						}
						else if(item.getFieldName().equals("job")){
							if(item.getString("utf-8")!=null){
								job = item.getString("utf-8");
							}
						}
						else if(item.getFieldName().equals("sign")){
							if(item.getString("utf-8")!=null){
								sign = item.getString("utf-8");
							}
						}
					}
				}
			}catch(FileUploadBase.SizeLimitExceededException ex){
				%>
					<script>
						alert("上传失败，文件太大，单个文件的最大限制是："+upload.getSizeMax()+"bytes!");
						location.href="../person-page/user.jsp";
					</script>
				<%
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		blogService user=new blogService();
		user login=null;
		login=user.userGet(nickname);
		if(login!=null){
			try{
				user.userUpdate(nickname, sex, birth, city, job, sign,pic);//不为空说明已有资料
			}catch(Exception e){
				%>
					<script>
						alert("上传数据过期，请重新输入!");
						location.href="../person-page/user.jsp";
					</script>
				<%
			}
		}
		else{
			try{
			user.userInto(nickname, sex, birth, city, job, sign,pic);
			}catch(Exception e){
				%>
					<script>
						alert("上传数据过期，请重新输入!");
						location.href="../person-page/user.jsp";
					</script>
				<%
			}
		}
		%>
			<script>
				alert("上传成功!");
				location.href="../person-page/home.jsp";
			</script>
		<%
	%>
</body>
</html>