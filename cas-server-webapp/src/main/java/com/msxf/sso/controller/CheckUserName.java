package com.msxf.sso.controller;

import com.msxf.sso.authentication.UserDaoJdbc;
import com.msxf.sso.model.MyUser;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class CheckUserName  extends HttpServlet {
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
		  PrintWriter out = response.getWriter();
		  response.setCharacterEncoding("utf-8");
		  userDaoJdbc=(UserDaoJdbc) WebApplicationContextUtils.getWebApplicationContext(this.getServletContext()).getBean("userDaoJdbc");
		  MyUser user = userDaoJdbc.getByUsername(request.getParameter("username"));
		  if(user == null || user.getId()==null || user.getUsername()==null || user.getTheStatus()==0){
			    out.print(false);
	      	    out.flush();
	      	    out.close(); 
		  }else{
			    //JSONObject jsonObject = new JSONObject();  
	            //jsonObject.put("message", "succ"); 
	      	    out.print(true);
	      	    out.flush();
	      	    out.close(); 
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
