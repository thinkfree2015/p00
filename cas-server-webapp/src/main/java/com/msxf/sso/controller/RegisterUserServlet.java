package com.msxf.sso.controller;

import com.msxf.sso.authentication.UserDaoJdbc;
import com.msxf.sso.util.StringUtil;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class RegisterUserServlet extends HttpServlet {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 6385541827856397398L;
	//@Resource
	private UserDaoJdbc userDaoJdbc;
	public void init() throws ServletException {

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	  userDaoJdbc=(UserDaoJdbc) WebApplicationContextUtils.getWebApplicationContext(this.getServletContext()).getBean("userDaoJdbc");
	  String username = request.getParameter("username");
	  String password = StringUtil.encodePassword(request.getParameter("password"), "SHA");
	  String backUrl = request.getParameter("backUrl");
	  
	  SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String createDatetime = sdf2.format(new Date());
	  String id ="";
	  try {
		 id = generate();
	  } catch (Exception e) {
		e.printStackTrace();
	 }
	  String SQL_USER_INSERT = " insert into organization_user(account_expired, account_locked, address_city_id, tenant_id, birth, branch_id, card_number, city_id, create_datetime, credentials_expited, email, account_enabled, identity, last_login_datetime, memo, truename, truename2, password, phone, picture, province_id, role_id, serial, sex, status, username, work_status, id)" +
	  		                                          " values('0', '0', null, null, null, null, null, null, '"+createDatetime+"', '0', null, '1', null, null, null, null, null,'" +password+"', null, null, null, null, null, null, '1', '"+username+"', null, '"+id+"')";
	   System.out.println(SQL_USER_INSERT);
	  int res = userDaoJdbc.registerUser(SQL_USER_INSERT);
	  int res1 = 0;
	  String unionid =request.getParameter("unionid");
	  if(unionid!=null && !"".equals(unionid)){
		  res1 = userDaoJdbc.registerUser("insert into organization_consumer(deposit,score,id,unionid)values(null,null,'"+id+"','"+unionid+"')"); 
	  }else{
		  res1 = userDaoJdbc.registerUser("insert into organization_consumer(deposit,score,id,unionid)values(null,null,'"+id+"',null)");
	  }
	  
	  //int res1 = userDaoJdbc.registerUser("insert into organization_consumer(deposit,score,id,unionid)values(null,null,'"+id+"',null)");
	  String callUrl ="";
	  if(res>=1 && res1>=1){
		   if(backUrl.indexOf("j_spring_cas_security_check")!=-1){
			   
			   if(backUrl.indexOf("callUrl")!=-1){
				   callUrl = backUrl.substring(backUrl.indexOf("callUrl"), backUrl.length());
			   }
			   backUrl=backUrl.substring(0, backUrl.indexOf("j_spring_cas_security_check"));
			   if(callUrl!=null && !"".equals(callUrl)){
				   response.sendRedirect(backUrl+"sso.do?userId="+id+"&"+callUrl);
			   }else{
				   response.sendRedirect(backUrl+"sso.do?userId="+id); 
			   }
			  
		   }else{
			   //backUrl=backUrl+"/j_spring_cas_security_check";
			   if(callUrl!=null && !"".equals(callUrl)){
				   response.sendRedirect(backUrl+"?userId="+id+"&callUrl="+callUrl);
			   }else{
				   response.sendRedirect(backUrl+"?userId="+id);
			   }
			   
		   }
		   //response.sendRedirect(backUrl+"sso.do");
		   
	   }else{
		   request.getRequestDispatcher("/register").forward(request, response);
	   }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void destroy() {
		super.destroy();
	}
	
	public String generate()throws Exception {

		String dateId = Long.toString(System.currentTimeMillis(), 36);

		Double numIds = Math.random();
		String numIds2 = numIds.toString();
		numIds2 = numIds2.substring(numIds2.indexOf(".") + 1,
				numIds2.length() - 1);
		if (numIds2.length() <= 17) {
			numIds2 = fillWithZero(numIds2, 17);
		}
		String numIds3 = numIds2.substring(1, 15);
		String numId = Long.toString(Long.parseLong(numIds3), 36);

		StringBuilder stringBuilder = new StringBuilder(16);

		stringBuilder
		// .append(fillWithZero(branchId, 4))
				.append(fillWithZero(dateId, 8)).append(fillWithZero(numId, 8));

		return stringBuilder.toString();

	}
	private String fillWithZero(String str, Integer length) {

        StringBuilder stringBuilder = new StringBuilder(length);

        stringBuilder.append(str);
        if (str.length() > length) {
            stringBuilder.deleteCharAt(length);
        } else if (str.length() < length) {
            int tempLength = length - str.length();
            for (int i = 0; i < tempLength; i++) {
                stringBuilder.insert(0, "0");
            }
        }

        return stringBuilder.toString();
    }

}
