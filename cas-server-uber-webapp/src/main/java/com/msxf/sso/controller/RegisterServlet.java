package com.msxf.sso.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.msxf.sso.util.HttpUtil;

public class RegisterServlet extends HttpServlet {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 6385541827856397398L;

	public void init() throws ServletException {

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	  String backUrl =request.getParameter("service");
	  request.setAttribute("backUrl", backUrl);
	  String unionid =request.getParameter("unionid");
	  if(unionid!=null && !"".equals(unionid)){
		  request.setAttribute("unionid", unionid);
	  }
	  if(HttpUtil.isPhone(request)){
	      request.getRequestDispatcher("/WEB-INF/view/jsp/msxf/ui/register/wapregister.jsp").forward(request, response);
	  }else{
		  request.getRequestDispatcher("/WEB-INF/view/jsp/msxf/ui/register/register.jsp").forward(request, response);
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
