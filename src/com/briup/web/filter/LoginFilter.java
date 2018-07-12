package com.briup.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//规定拦截资源的位置
//项目名字后跟了user的全部拦截
//拦截的资源全部交给doFilter去处理
@WebFilter("/user/*")
public class LoginFilter implements Filter {
 public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 验证合法性
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		//判断用户有没有登录，判断的依据是session中是否有user
		//有放行，没有拦截
		HttpSession session=req.getSession();
		Object obj=session.getAttribute("user");
		if(obj==null) {
			//表明没有登陆过，则提示
			req.setAttribute("msg", "亲！请先登录");
			req.getRequestDispatcher("/login.jsp").forward(req, res);			
		}else {
			chain.doFilter(request, response);//放行操作，原来执行什么请求还执行什么请求
		}
		
		// pass the request along the filter chain
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
