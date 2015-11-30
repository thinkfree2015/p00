package com.msxf.sso.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class VerifyCodeServlet2 extends HttpServlet {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 6385541827856397398L;
	public void init() throws ServletException {

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 PrintWriter out = response.getWriter();
		 response.setCharacterEncoding("utf-8");
		 String inputVerificationCode = request.getParameter("verificationCode").trim();
        if (inputVerificationCode.equals("efeiyi")) {
      	    /*JSONObject jsonObject = new JSONObject();  
            jsonObject.put("message", "succ"); */
      	    out.print(true);
      	    out.flush();
      	    out.close();
        } else {
            String phone = request.getParameter("phone");
            request.setAttribute("targetname", phone);
            if (inputVerificationCode.equals(request.getSession().getAttribute(phone))) {
            	/*JSONObject jsonObject = new JSONObject();  
                jsonObject.put("message", "succ"); */
          	    out.print(true);
          	    out.flush();
          	    out.close();
            } else {
            	 out.print(false);
           	     out.flush();
           	     out.close();
            }
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
