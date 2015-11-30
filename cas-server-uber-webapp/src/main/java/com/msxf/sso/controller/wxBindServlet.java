package com.msxf.sso.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.msxf.sso.util.HttpUtil;
import com.msxf.sso.util.WxPayConfig;

public class wxBindServlet extends HttpServlet {

	private static final long serialVersionUID = -7964338058818609226L;
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException{
		 String result = "";
	        //1、网页授权后获取传递的code，用于获取openId
	        String code = request.getParameter("code");
	        if (request.getSession().getAttribute(code) != null) {
	            result = request.getSession().getAttribute(code).toString();
	        } else {

	            System.out.println("1、 page code value：" + code);
	            String urlForOpenId = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + WxPayConfig.APPID + "&secret=" + WxPayConfig.APPSECRET + "&code=" + code + "&grant_type=authorization_code";
	            try {
					result = HttpUtil.getHttpResponse(urlForOpenId, null);
				} catch (Exception e) {
					e.printStackTrace();
				}
	            request.getSession().setAttribute(code, result);
	        }
	        System.out.println("2、get openid result：" + result);
	        JSONObject jsonObject = JSONObject.parseObject(result);//fromObject(result);
	        if (jsonObject.containsKey("errcode")) {
	            throw new RuntimeException("get openId error：" + result);
	        }
	        String unionid = jsonObject.getString("unionid");
	        request.setAttribute("unionid", unionid);
	       try {
			request.getRequestDispatcher("/WEB-INF/view/jsp/msxf/ui/register/wapregister.jsp").forward(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException{
		  doGet(request,response);
	}
}
