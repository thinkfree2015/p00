package com.msxf.sso.authentication;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jasig.cas.authentication.Credential;
import org.jasig.cas.web.flow2.AuthenticationViaFormAction;
import org.jasig.cas.web.support.WebUtils;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.util.StringUtils;
import org.springframework.webflow.execution.RequestContext;

import com.msxf.sso.model.UsernamePasswordCaptchaCredential;

/**
 * 自定义的处理验证码登录逻辑的Action
 * @create 2015-7-14 下午4:28:55
 * @author kayson
 */
public class AuthenticationViaCaptchaFormAction extends AuthenticationViaFormAction {
	public final String validateCaptcha(final RequestContext context, final Credential credential, final MessageContext messageContext){
		final HttpServletRequest request = WebUtils.getHttpServletRequest(context);
		HttpSession session = request.getSession();
		String rand = (String)session.getAttribute("rand");
		session.removeAttribute("rand");
		String ip = request.getHeader("x-forwarded-for"); 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
	        ip = request.getHeader("Proxy-Client-IP"); 
	    } 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
	        ip = request.getHeader("WL-Proxy-Client-IP"); 
	    } 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
	        ip = request.getRemoteAddr(); 
	    } 
	   ip = ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
		if(null==session.getAttribute(ip)){
			session.setAttribute(ip, 1);
			System.out.println(session.getAttribute(ip).toString()+"&&&&&&&&");
			return "success";
		}
		UsernamePasswordCaptchaCredential upc = (UsernamePasswordCaptchaCredential)credential;
		String captcha = upc.getCaptcha();
		
		System.out.println("获取Session验证码-->" + rand);
		System.out.println("获取表单输入验证码-->" + captcha);

		if(!StringUtils.hasText(rand) || !StringUtils.hasText(captcha)){
			messageContext.addMessage(new MessageBuilder().error().code("required.captcha").build());
			return "error";
		}
		if(captcha.equals(rand)){
			return "success";
		}
		//别人这么写的messageContext.addMessage(new MessageBuilder().code("required.captcha").build());
		//实际上这么写是org.springframework.binding.message.INFO级别的,这会导致前台表单无法显示这里的错误信息
		messageContext.addMessage(new MessageBuilder().error().code("error.authentication.captcha.bad").build());
		return "error";
	}
}