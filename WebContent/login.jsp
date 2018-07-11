<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath %>"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>briup电子商务-登录页</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
	//提示
	var msg=$("input[name='msg']").val();
	if(msg.trim().length!=0){
		alert(msg);
	}
//给登录按钮绑定一个鼠标单击事件
      $("input[type='submit']").click(function(){
	//获取标签对象
	var name=$("input[name='name']").val();
	var passwd=$("input[name='password']").val();
	if(name.trim().length==0){
		alert("名字不能为空");
		return false;
	}
	if(passwd.trim().length==0){
		alert("密码不能为空");
		return false;
	}
    });
});
</script>
</head>
<body>
	<div class="header1">
    	<a href="#">
        	<img src="images/logo.png">
        </a>
    </div>
    <div class="content1">	<!--背景颜色-->
    	<div class="c1_box1"><!--背景图片-->
        	<div class="login_box"><!--登陆框-->
            	<div class="center1">
            	<input type="hidden" name="msg" value="${requestScope.msg }">
        		<form action="LoginSer" method="post">
                	<h1>账号登陆</h1>
                    <h2>公共场所请不要泄露您的密码，以防止账号丢失
                    </h2>
                    <div class="si_box">
                    	<span class="usr_icon"></span>
                        <input type="text" name="name"/>
                    </div>
                    <!--分割条-->
                    <div class="c10"></div>
                    <div class="si_box">
                    	<span class="pwd_icon"></span>
                        <input type="password" name="password"/>
                    </div>
                    <div class="fg_box">
                    	<a class="fg" href="forgetPassword.jsp">忘记登陆密码？</a>
                        <a class="treg" href="register.jsp">立即注册</a>
                    </div>
                    <div class="sub_box">
                    	<input  type="submit" value="登陆"/>
                    </div>
                 </form>
                    <div>
                    	请使用合作网站账号登陆杰普电子商务网：
                    </div>
                    <div class="com_box">
                    	<span class="tencent"></span>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer1">
    	<div class="links">
        	<a href="#">关于我们</a>|
            <a href="#">联系我们</a>|
            <a href="#">友情链接</a>|
            <a href="#">关于我们</a>|
            <a href="#">联系我们</a>|
            <a href="#">友情链接</a>
        </div>
        <div>
        	沪ICP备1928832 杰普软件briup.com版权所有。
        </div>
        
        <img src="images/police.png">
        
    </div>
</body>
</html>







