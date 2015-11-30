package com.msxf.sso.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class wxRegisterServlet extends HttpServlet {

	private static final long serialVersionUID = -7964338058818609226L;
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException{
		try {
			request.getRequestDispatcher("/WEB-INF/view/jsp/msxf/ui/register/wxRegister.jsp").forward(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException{
		  doGet(request,response);
	}
}
