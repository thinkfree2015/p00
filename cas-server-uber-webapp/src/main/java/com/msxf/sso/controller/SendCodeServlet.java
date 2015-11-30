package com.msxf.sso.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.msxf.sso.service.SmsCheckManager;
import com.msxf.sso.service.impl.SmsCheckManagerImpl;
import com.msxf.sso.util.PConst;
import com.msxf.sso.util.VerificationCodeGenerator;

public class SendCodeServlet extends HttpServlet {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 6385541827856397398L;
    private SmsCheckManager  smsCheckManager = new SmsCheckManagerImpl();
	public void init() throws ServletException {

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		   String cellPhoneNumber = request.getParameter("phone");
	        String verificationCode = VerificationCodeGenerator.createVerificationCode();
	        System.out.println(verificationCode);
	        request.getSession().setAttribute(cellPhoneNumber, verificationCode);
	        String massage = this.smsCheckManager.send(cellPhoneNumber, verificationCode, "1104699", PConst.TIANYI);
	        response.setCharacterEncoding("utf-8");
	        if (massage != null) {
	        	  PrintWriter out = response.getWriter();
	        	  JSONObject jsonObject = new JSONObject();  
	              jsonObject.put("message", massage); 
	        	  out.print(jsonObject);
	        	  out.flush();
	        	  out.close();
	            } else {
	                
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

