package org.jasig.cas.web.flow2;


import java.io.IOException;

import org.jasig.cas.util.UniqueTicketIdGenerator;
import org.jasig.cas.web.support.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.webflow.execution.RequestContext;

import com.msxf.sso.util.HttpUtil;

public class GenerateLoginTicketAction {

	public GenerateLoginTicketAction() {
	}

	public final String generate(RequestContext context) {
		String loginTicket = ticketIdGenerator.getNewTicketId("LT");
		logger.debug("Generated login ticket {}", loginTicket);
		WebUtils.putLoginTicket(context, loginTicket);
		HttpUtil.isPhone(WebUtils.getHttpServletRequest(context));
		
		if(HttpUtil.isWeixin(WebUtils.getHttpServletRequest(context))){//unionid
			String service = WebUtils.getHttpServletRequest(context).getParameter("service").toString();
			String wx="";
			if(service.indexOf("unionid")!=-1){
				 wx= service.substring(service.indexOf("unionid")+8,service.length());
			}
			
			if(wx!=null && !"".equals(wx)){
				WebUtils.getHttpServletRequest(context).setAttribute("wx", wx);
				logger.debug("unionid-->", wx);
				return "success";
			}else{
				try {
					WebUtils.getHttpServletResponse(context).sendRedirect("www.efeiyi.com/wx/getInfo.do?callback="+service.substring(service.indexOf("callUrl=")+8, service.length())+"&datakey=unionid");
					logger.info("callUrl-->"+service.substring(service.indexOf("callUrl=")+8, service.length()));
					//System.out.println(service.substring(service.indexOf("callUrl=")+8, service.length()));
					System.out.println(service.substring(service.indexOf("unionid=")+8, service.length()));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return null;
			}
		}
		
		if (HttpUtil.isPhone(WebUtils.getHttpServletRequest(context).getHeader("User-Agent"))) {
			return "generated2";
        }
		return "generated";
	}

	public void setTicketIdGenerator(UniqueTicketIdGenerator generator) {
		ticketIdGenerator = generator;
	}

	private static final String PREFIX = "LT";
	private final Logger logger = LoggerFactory.getLogger(getClass());
	private UniqueTicketIdGenerator ticketIdGenerator;
}
