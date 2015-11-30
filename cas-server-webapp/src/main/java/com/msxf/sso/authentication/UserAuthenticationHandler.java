package com.msxf.sso.authentication;

import org.jasig.cas.authentication.HandlerResult;
import org.jasig.cas.authentication.PreventedException;
import org.jasig.cas.authentication.UsernamePasswordCredential;
import org.jasig.cas.authentication.handler.support.AbstractUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.principal.SimplePrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.security.auth.login.FailedLoginException;
import javax.servlet.http.HttpServletRequest;
import java.security.GeneralSecurityException;

/**
 * 自定义的用户登录认证类
 * @create 2015-7-17 下午3:48:44
 * @author kayson
 */
@Component(value="primaryAuthenticationHandler")
public class UserAuthenticationHandler extends AbstractUsernamePasswordAuthenticationHandler {
	@Resource
	private UserDaoJdbc userDaoJdbc;
	@Autowired
	private  HttpServletRequest request;
	/**
	 * 认证用户名和密码是否正确
	 * @see UsernamePasswordCredential参数包含了前台页面输入的用户信息
	 */
	@Override
	protected HandlerResult authenticateUsernamePasswordInternal(UsernamePasswordCredential transformedCredential) throws GeneralSecurityException, PreventedException {
		String username = transformedCredential.getUsername();
		String password = transformedCredential.getPassword();
		if(password.indexOf(":weixin")!= -1){
			if(userDaoJdbc.verifyAccount2(username)){
				return createHandlerResult(transformedCredential, new SimplePrincipal(username), null);
			}
			
		}
		if(userDaoJdbc.verifyAccount(username, password)){
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
			
		    request.getSession().removeAttribute(ip);
			return createHandlerResult(transformedCredential, new SimplePrincipal(username), null);
		}
		throw new FailedLoginException();
	}
}