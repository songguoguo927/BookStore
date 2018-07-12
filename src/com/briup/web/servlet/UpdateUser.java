package com.briup.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.bean.User;
import com.briup.common.exception.UserException;
import com.briup.service.IUserService;
import com.briup.service.impl.IUserServiceImpl;
@WebServlet("/user/UpdateUserSer")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//接收参数
	    String username=request.getParameter("username");
		String password=request.getParameter("password");
		String zip=request.getParameter("zip");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		//要修改session里的信息，先要拿到
		//获取session对象
       HttpSession session=request.getSession();
       User user=(User) session.getAttribute("user");//因为本身返回的是Object类型所以这里要进行强制转换
      //进行修改
       user.setPassword(password);
       user.setZip(zip);
       user.setAddress(address);
       user.setPhone(phone);
       user.setEmail(email);
      
       //参照register.java 去写后面的部分
       //修改user对象之后，覆盖session中的user
       session.setAttribute("user", user);
       //接着去修改数据库，首先调用IUserService
     IUserService service=new IUserServiceImpl();
     try {
		service.updateUserInfo(user);
		//修改成功后提示并跳转至indexSuccess.jsp
		request.setAttribute("msg", "用户修改成功");
		request.getRequestDispatcher("/indexSuccess.jsp")
		.forward(request, response);
	} catch (UserException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
     //servlet搞定接着去service，updateUserInfo在IUserServiceImpl.java里
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
