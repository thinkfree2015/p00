package com.msxf.sso.controller;

import com.msxf.sso.authentication.UserDaoJdbc;
import com.msxf.sso.model.MyUser;
import com.msxf.sso.model.UsernamePasswordCaptchaCredential;
import com.msxf.sso.util.HttpUtil;
import org.jasig.cas.authentication.Credential;
import org.jasig.cas.web.support.WebUtils;
import org.springframework.webflow.execution.RequestContext;

import javax.annotation.Resource;
import java.io.Serializable;

public class WxLoginController  implements Serializable{
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 8007243648047109779L;
	@Resource
	private UserDaoJdbc userDaoJdbc;
	public String rest(final RequestContext context, final Credential credential) throws Exception{
		UsernamePasswordCaptchaCredential upc = (UsernamePasswordCaptchaCredential)credential;//"admin","efeiyi"
		String service = WebUtils.getHttpServletRequest(context).getParameter("service").toString();
		String uuid="";
		if(HttpUtil.isWeixin(WebUtils.getHttpServletRequest(context))){
			if(service.indexOf("unionid")!=-1){
				uuid=service.substring(service.indexOf("unionid")+8,service.length());
			}
			if(null==uuid||"".equals(uuid)){
				if (HttpUtil.isPhone(WebUtils.getHttpServletRequest(context).getHeader("User-Agent"))) {
					return "generated2";
		        }else{
		        	return "generated";
		        }
				
			}
		}
		
		String userId = userDaoJdbc.getByUuid(uuid);
		MyUser user = userDaoJdbc.getByUserId(userId);
		upc.setPassword(user.getId()+":weixin");
		upc.setUsername(user.getUsername());
		upc.setRememberMe(false);
        return "success";
    }
}
