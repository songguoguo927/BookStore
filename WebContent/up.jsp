<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath %>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>上传</title>
</head>
<body>
	<center>
		<form action="http://localhost:8099" method="post" enctype="multipart/form-data">
		<input type="file" name="filename"><p>
		<input type="submit" value="提交">
		</form>
	</center>
</body>
</html>