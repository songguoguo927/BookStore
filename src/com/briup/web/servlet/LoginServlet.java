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

@WebServlet("/LoginSer")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//接收参数
		String name=request.getParameter("name");
		String passwd=request.getParameter("password");
		//将接收的参数传给service ，去找service
	    IUserService service=new IUserServiceImpl();
	    try {
			User user=service.loginUser(name, passwd);
			//（登录成功后）把user保存到session中
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			request.getRequestDispatcher("/indexSuccess.jsp").forward(request,response);
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());//报错
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			e.printStackTrace();
		}
	    	 
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("****棒呆*****");
		doGet(request, response);
	}

}
