package com.msxf.sso.controller;

import com.alibaba.fastjson.JSONObject;
import com.msxf.sso.util.HttpUtil;
import com.msxf.sso.util.WxPayConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;

@Controller
public class ThirdSigninController {
	 @RequestMapping({"/wx/userInfo"})
	    public String wxPay(HttpServletRequest request) throws Exception {
	        String redirect_uri = "http://master4.efeiyi.com//wx/bind";
	        String url = "https://open.weixin.qq.com/connect/oauth2/authorize?" +
	                "appid=" + WxPayConfig.APPID +
	                "&redirect_uri=" +
	                URLEncoder.encode(redirect_uri, "UTF-8") +
	                "&response_type=code&scope=snsapi_base&state=123#wechat_redirect";

	        return "redirect:" + url;
	    }

	    @RequestMapping({"/wx/bind"})
	    public String getWxOpenId(HttpServletRequest request, Model model) throws Exception {
	        String result = "";
	        //1、网页授权后获取传递的code，用于获取openId
	        String code = request.getParameter("code");
	        if (request.getSession().getAttribute(code) != null) {
	            result = request.getSession().getAttribute(code).toString();
	        } else {

	            System.out.println("1、 page code value：" + code);
	            String urlForOpenId = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + WxPayConfig.APPID + "&secret=" + WxPayConfig.APPSECRET + "&code=" + code + "&grant_type=authorization_code";
	            result = HttpUtil.getHttpResponse(urlForOpenId, null);
	            request.getSession().setAttribute(code, result);
	        }
	        System.out.println("2、get openid result：" + result);
	        //JSONObject jsonObject = JSONObject.fromObject(result);
	        JSONObject jsonObject = JSONObject.parseObject(result);//fromObject(result);
	        if (jsonObject.containsKey("errcode")) {
	            throw new RuntimeException("get openId error：" + result);
	        }
	        String unionid = jsonObject.getString("unionid");
	        model.addAttribute("unionid", unionid);
	        return "/register";
	    }
	   /* @RequestMapping("/wx/login")
	    public String wxLogin(HttpServletRequest request, Model model) throws Exception {
	        String result = "";
	        //1、网页授权后获取传递的code，用于获取openId
	        String code = request.getParameter("code");
	        if (request.getSession().getAttribute(code) != null) {
	            result = request.getSession().getAttribute(code).toString();
	        } else {

	            System.out.println("1、 page code value：" + code);
	            String urlForOpenId = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + WxPayConfig.APPID + "&secret=" + WxPayConfig.APPSECRET + "&code=" + code + "&grant_type=authorization_code";
	            result = HttpUtil.getHttpResponse(urlForOpenId, null);
	            request.getSession().setAttribute(code, result);
	        }
	        System.out.println("2、get openid result：" + result);
	        JSONObject jsonObject = JSONObject.fromObject(result);
	        if (jsonObject.containsKey("errcode")) {
	            throw new RuntimeException("get openId error：" + result);
	        }
	        String unionid = jsonObject.getString("unionid");
	        LinkedHashMap<String, Object> param = new LinkedHashMap<>();
	        param.put("unionid", unionid);
	        Consumer consumer = (Consumer) baseManager.getUniqueObjectByConditions("select obj from Consumer obj where obj.unionid=:unionid", param);
	        MyUser myUser = (MyUser) baseManager.getObject(MyUser.class.getName(), consumer.getId());
	        AuthenticationManager am = new SampleAuthenticationManager();
	        try {
	            Authentication authentication = new UsernamePasswordAuthenticationToken(myUser, myUser.getPassword());
	            Authentication authentication2 = am.authenticate(authentication);
	            Object obj = authentication2.getPrincipal();
	            SecurityContextHolder.getContext().setAuthentication(authentication2);
	        } catch (AuthenticationException e) {
	            System.out.println("Authentication failed: " + e.getMessage());
	        }
	        return "redirect:" + request.getParameter("redirect");
	    }
  */
}
