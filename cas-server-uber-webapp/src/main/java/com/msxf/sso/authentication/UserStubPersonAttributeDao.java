package com.msxf.sso.authentication;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jasig.services.persondir.IPersonAttributes;
import org.jasig.services.persondir.support.AttributeNamedPersonImpl;
import org.jasig.services.persondir.support.StubPersonAttributeDao;
import org.springframework.stereotype.Component;

import com.msxf.sso.model.MyUser;

/**
 * 自定义的返回给客户端相关信息
 * @create 2015-7-18 下午5:52:56
 * @author kayson
 */
@Component(value="attributeRepository")
public class UserStubPersonAttributeDao extends StubPersonAttributeDao {
	@Resource
	private UserDaoJdbc userDaoJdbc;
	
	@Override
	public IPersonAttributes getPerson(String uid) {
		Map<String, List<Object>> attributes = new HashMap<String, List<Object>>();
		try {
			MyUser user = userDaoJdbc.getByUsername(uid);
			if(user.getId()!=null && !"".equalsIgnoreCase(user.getId()))
			attributes.put("userId", Collections.singletonList((Object)user.getId()));
			
			if(user.getUsername()!=null && !"".equalsIgnoreCase(user.getUsername()))
			attributes.put("username", Collections.singletonList((Object)user.getUsername()));
			
			if(user.getPassword()!=null && !"".equalsIgnoreCase(user.getPassword()))
			attributes.put("password", Collections.singletonList((Object)user.getPassword()));
			
			if(user.getTheStatus()!=null)
			attributes.put("status", Collections.singletonList((Object)user.getTheStatus()));
			
			if(user.getName()!=null && !"".equalsIgnoreCase(user.getName()))
			attributes.put("name", Collections.singletonList((Object)URLEncoder.encode(user.getName(), "UTF-8")));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new AttributeNamedPersonImpl(attributes);
	}
}