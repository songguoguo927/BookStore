package com.briup.web.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.bean.User;
import com.briup.common.exception.UserException;
import com.briup.service.IUserService;
import com.briup.service.impl.IUserServiceImpl;
@WebServlet("/RegisterSer")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//解决浏览器发过来的数据乱码,接收前台传过来的数据
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String zip=request.getParameter("zip");
		String address=request.getParameter("address");
		String telephone=request.getParameter("telephone");
		String email=request.getParameter("email");
		//封装对象
		User user=new User();
		user.setAddress(address);
		user.setDob(new Date());
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone(telephone);
		user.setUsername(name);
		user.setZip(zip);
		//构建service
		IUserService service=new IUserServiceImpl();
		try {
			//并把user传给service
			service.registerUser(user);
		} catch (UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
