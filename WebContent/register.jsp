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
<title>briup电子商务-注册页</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[name='name']").blur(function(){
			var name=$("input[name='name']").val();
			if(name.trim().length!=0){
				$.ajax({
					url:"YnUserSer",
					type:"post",
					data:{name:name},
					dataType:"text",
					success:function(data){
						$("#div").text(data);
					}
				});
			}
		});
		//给注册按钮绑定鼠标单击事件
		$(".btn_submit").click(function(){
			//获取标签对象
			var name=$("input[name='name']").val();
			var passwd=$("input[name='password']").val();
			var zip=$("input[name='zip']").val();
			var addr=$("input[name='address']").val();
			var phone=$("input[name='telephone']").val();
			var email=$("input[name='email']").val();
			if(name.trim().length==0){
				alert("名字不能为空");
				return false;
			}
			if(passwd.trim().length==0){
				alert("密码不能为空");
				return false;
			}
			if(isNaN(zip)||zip.trim().length==0){
				alert("邮编必须是数字");
				return false;
			}
			if(zip.trim().length!=6){
				alert("邮编必须是6位");
				return false;
			}
			if(addr.trim().length==0){
				alert("地址栏不能为空");
				return false;
			}
			if(addr.trim().length>20){
				alert("地址栏不能超出20个汉子");
				return false;
			}
			if(isNaN(phone)){
				alert("手机号码必须为数字");
				return false;
			}
			if(phone.trim().length!=11){
				alert("手机号码必须是11位");
				return false;
			}
			if(email.trim().length==0){
				alert("邮箱不能为空");
				return false;
			}
			//获取标签的属性,attr表示标签中的属性值
			//参数是标签中属性等于符号前的名子
			var c=$("#check").attr("checked");
			if(c!="checked"){
				alert("请阅读协议");
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div class="container2">
    	<div class="header2">
        	<div>
            	<a href="index.html"><img class="logo" src="images/logon_register.png"></a>
            </div>
            <div>
            	<ul class="tabs">
                	<li class="phone current">用手机登陆</li>
                </ul>
            </div>
            <div class="tlg">
            	已有账号 <a href="login.html">登陆</a>
            </div>
        </div>
        <div class="content2">
        <form action="RegisterSer" method="post">
			<ul class="reg_box">
            	<li>
                	<span><b>*</b>用户名：</span>
                    <input type="text" name="name"/><span id="div"></span>
                </li>
               <li>
                	<span><b>*</b>密码：</span>
                    <input type="password" name="password"/>
                </li>
                <li>
                	<span><b>*</b>邮编：</span>
                    <input type="text" name="zip"/>
                </li>
                <li>
                	<span><b>*</b>地址：</span>
                    <input type="text" name="address"/>
                </li>
                <li>
                	<span><b>*</b>电话：</span>
                    <input type="text" name="telephone"/>
                </li>
                <li>
                	<span><b>*</b>电子邮箱：</span>
                    <input type="text" name="email"/>
                </li>
            </ul>
			<p>
            	<input type="checkbox" id="check" checked/>
               	 我已阅读并同意
                <a href="#">用户注册协议</a>
            </p>
            <input class="btn_submit" type="submit" value="立即注册"/>
           </form>
        </div>
   	</div>
</body>
</html>







