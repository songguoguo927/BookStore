package com.briup.web.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.briup.bean.Category;
import com.briup.service.ICategoryService;
import com.briup.service.impl.ICategoryServiceImpl;
/**
 *对application（ServletContext）对象监听 
 *application生命周期：始于tomcat终止与tomcat
 *
 */
@WebListener
public class ApplicationListener implements ServletContextListener {
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	//获取application(ServletContext)容器对象
    	ServletContext sc=arg0.getServletContext();
    	ICategoryService service=new ICategoryServiceImpl();
    	List<Category> list=service.listCategory();
    	sc.setAttribute("cates", list);
    	//存储简报
    	
    }
	
}






