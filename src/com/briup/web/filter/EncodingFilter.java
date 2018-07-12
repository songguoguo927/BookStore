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
@WebFilter("/*")
public class EncodingFilter implements Filter {
public void destroy() {
		// TODO Auto-generated method stub
	}
//为了写servlet以后不用再设置编码
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		req.setCharacterEncoding("UTF-8");//请求编码
		res.setCharacterEncoding("UTF-8");//响应编码
		chain.doFilter(req, res);
	}
public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
