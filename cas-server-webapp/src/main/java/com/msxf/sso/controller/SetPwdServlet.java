package com.msxf.sso.controller;

import com.msxf.sso.authentication.UserDaoJdbc;
import com.msxf.sso.model.MyUser;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class SetPwdServlet extends HttpServlet {
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
	  String username = request.getParameter("targetname");
	       MyUser myUser = userDaoJdbc.getByUsername(username);
	       request.setAttribute("user",myUser);
	       request.getRequestDispatcher("/WEB-INF/view/jsp/msxf/ui/register/setPassword.jsp").forward(request, response);
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
