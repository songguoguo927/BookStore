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
<title>briup电子商务-首页</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/icons.css" />
<link rel="stylesheet" href="css/table.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
      $(function(){
    	  //退出按钮，session里面有user对象时，添加退出按钮
    	  var m="${sessionScope.user}"
    	  if(m.trim().length!=0){
    		  var ss="<li><a href="index.jsp">退出</a>|</li>";
    		  ${".top_bars"}.prepend(ss);
    		  //欢迎某某按钮
    		  ${".top_lr"}.append("<li><a>欢迎 <font style="color:red; font-weight:900;">${sessionScope.user.username}</font></a></li>");
    		  
    	  }else{
    		  ${".top_lr"}.append("<li><a href="login.jsp" style="color: red;">亲,请登入</a></li>"); 
    	  }
    	  
    	  /*servlet把数据写回给页面的方式
    	  1，
            	  var msg=$("input[name='msg']").val();
            	  if(msg.trim().length!=0){
            		  alert(msg);
            	  }*/
          /*2  	  var msg="${requestScope.msg}";
            	  if(msg.trim().length!=0){
            		  alert(msg);
          */    });
</script>
</head>
<body>
	<input type="hidden" name="msg" value="${requestScope.msg }">
	<!--顶部-->
	<div class="top">
    	<div class="top_center">
    		<ul class="top_lr">
            	<!-- 欢迎按钮位置 -->
            </ul>
            <ul class="top_bars">
            	<!-- 退出按钮位置 -->
                <li><a href="#">我的订单<span class="jt_down"></span></a>|</li>
                <li><a href="#">关注杰普<span class="jt_down"></span></a>|</li>
                <li><a href="#">网站导航<span class="jt_down"></span></a></li>
            </ul>
        </div>
    </div>
    <!--头部-->
    <div class="header3">
    	<a href="#"><img src="images/logo.png"></a>
    	<div class="h3_center">
        	<div class="search_box">
            	<input type="text"/>
                <span>搜索</span>
            </div>
            <p>
            <c:forEach items="${applicationScope.cates }" var="cate">
            	<a href="listCateBookSer?id=${cate.id}">${cate.name}</a>|
            	</c:forEach>
            </p>
        </div>
        <div class="h3_right">
        	<div class="myyy">
            	<a href="user/userinfo.jsp">个人信息</a>
                <span class="sj_down"></span>
             </div>
            <div class="tsc">
            	<a href="emptyCar.jsp">去购物车结算</a>
                <span class="sj_right"></span>
            </div>
        </div>
    </div>
    <!--头部导航-->
    <div class="nav_top">
    	<div class="nav_top_center">
            <div>
                全部图书分类
            </div>
            <ul>
            <c:forEach items="${applicationScope.cates }" var="cate">
                <li><a href="listCateBookSer?id=${cate.id}">${cate.name}</a></li>
              </c:forEach>  
            </ul>
        </div>
    </div>
    
	<div class="container3">
    	<div class="c3_b1">
        	<div class="c3_b1_left">
            	<dl>
            	 <c:forEach items="${applicationScope.cates }" var="cate">
               		<dd>
                    	<h1>${cate.name}</h1>
                    	<p>
                    	<c:forEach items="${cate.detail}" var="cd">
                        	<a href="listCateDetailBookSer?id=${cd.id }">${cd.name}</a><!-- 简报，产品，写法与此类似，侧边栏forEach循环 -->
                         </c:forEach>  
                      	</p>
                    </dd>
             </c:forEach>       
                </dl>
            </div>
            <div class="c3_b1_center">
            	<div>
                	<a href="viewBook.html"><img src="images/ad1.png"></a>
                </div>
                <div class="c3_b1_c_bottom">
                    <ul>
                        <li>
                           <a href="viewBook.html"><img src="images/p01.png"/></a>
                           <a href="viewBook.html">Java从入门到精通</a>  
                        </li>
                       <li>
                           <a href="viewBook.html"><img src="images/p01.png"/></a> 
                           <a href="viewBook.html">Java从入门到精通</a> 
                        </li>
                        <li>
                           <a href="viewBook.html"><img src="images/p01.png"/></a> 
                           <a href="viewBook.html">Java从入门到精通</a> 
                        </li>
                    </ul>
            	</div>
            </div>
            <div class="c3_b1_right">
            	<h1>杰普快报<a href="#">更多</a></h1>
            	<ul>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                </ul>
            </div>
            <div style="clear:both"></div>
        </div>
        </div>
    <div class="c20"></div>
    <!--脚部-->
    <div class="footer3">
    	<div class="f3_top">
        	<div class="f3_center">
                <div class="ts1">品目繁多 愉悦购物</div>
                <div class="ts2">正品保障 天天低价</div>
                <div class="ts3">极速物流 特色定制</div>
                <div class="ts4">优质服务 以客为尊</div>
            </div>
        </div>
        <div class="f3_middle">
        	<ul class="f3_center">
            	<li class="f3_mi_li01">
                	<h1>购物指南</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>配送方式</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>支付方式</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>售后服务</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>服务保障</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li06">
                	<h1>客服中心</h1>
                    <img src="images/qrcode_jprj.jpg" width="80px" height="80px">
                    <p>抢红包、疑问咨询、优惠活动</p>
                </li>
            </ul>
        </div>
        <div class="f3_bottom">
        	<p class="f3_links">
                <a href="#">关于我们</a>|
                <a href="#">联系我们</a>|
                <a href="#">友情链接</a>|
                <a href="#">供货商入驻</a> 
           	</p>
            <p>沪ICP备14033591号-8 杰普briup.com版权所有 杰普软件科技有限公司 </p>
          	<img src="images/police.png">
        </div>
    </div>

</body>
</html>
