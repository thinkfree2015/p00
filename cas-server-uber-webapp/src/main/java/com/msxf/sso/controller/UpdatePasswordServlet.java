package com.msxf.sso.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.msxf.sso.authentication.UserDaoJdbc;
import com.msxf.sso.util.StringUtil;

public class UpdatePasswordServlet extends HttpServlet {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 6385541827856397398L;
	//@Resource
	private UserDaoJdbc userDaoJdbc;
	public void init() throws ServletException {

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	  userDaoJdbc=(UserDaoJdbc) WebApplicationContextUtils.getWebApplicationContext(this.getServletContext()).getBean("userDaoJdbc");
	  String contion = request.getParameter("pwd");
	  String id = request.getParameter("id");
      String password= StringUtil.encodePassword(contion, "SHA");
      String path = request.getContextPath();
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	       int res = userDaoJdbc.updatePwd(id,password);
	       if(res<=0){
	       //request.getRequestDispatcher("/forgetPwd").forward(request, response); 
	    	   response.sendRedirect(basePath+"forgetPwd");
	       }else{
	       //request.getRequestDispatcher("/login").forward(request, response);
	    	   response.sendRedirect(basePath+"login");
	       }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void destroy() {
		super.destroy();
	}
	
	
	

}