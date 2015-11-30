package com.msxf.sso.controller;

import com.msxf.sso.util.WxPayConfig;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;


public class wxUserInfoServlet extends HttpServlet {

	private static final long serialVersionUID = -7964338058818609226L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException {
		String redirect_uri = "http://www2.efeiyi.com//wx/bind";
		try {
			String url = "https://open.weixin.qq.com/connect/oauth2/authorize?"
					+ "appid="
					+ WxPayConfig.APPID
					+ "&redirect_uri="
					+ URLEncoder.encode(redirect_uri, "UTF-8")
					+ "&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException {
		doGet(request, response);
	}

}
