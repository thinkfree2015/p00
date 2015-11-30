package com.msxf.sso.service;

public interface SmsCheckManager {
	  public String createCheckCode();

	  //  public Boolean validate(String phone, String code);

	    public String send(String phone, String content, String tpl_id, Integer company);

//	    public void send(String phone, String content, String branchName,String tpl_id) throws Exception;

	    public Boolean checkPhoneRegistered(String phone);
}
