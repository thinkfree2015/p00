package com.msxf.sso.service;

import java.io.IOException;

import com.msxf.sso.model.SendCode;

public interface SmsProvider {
	
	    public final Integer SUCCESS = 0;//成功
	    public final Integer FAILED = 1; //发送失败
	    public final Integer LOSSDATA = 3; //数据丢失
	    public final Integer ILLEGAL = 4; //手机号码不合法
	    public final Integer UNKNOWN = 5; //未知错误
	    public final Integer NORESULTS = 6; //无返回结果

	    /**
	     * 发送短信
	     *
	     * @param phone
	     * @param content
	     * @return
	     */
	    public SendCode post(String phone, String content, String tpl_id);

	    public String checkAmount() throws IOException;

	}

