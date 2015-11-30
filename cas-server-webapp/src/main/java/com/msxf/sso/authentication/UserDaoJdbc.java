package com.msxf.sso.authentication;

import com.msxf.sso.model.MyUser;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 自定义的dao
 * @create 2015-8-14 下午3:48:44
 * @author kayson
 */
@Repository
public class UserDaoJdbc {
	private static final String SQL_USER_VERIFY = "SELECT COUNT(*) FROM organization_user WHERE username=? AND status='1' AND password=SHA1(?)";
	private static final String SQL_USER_GET = "SELECT * FROM organization_user WHERE username=? AND status='1'";
	private static final String SQL_USER_GET_WX ="SELECT id FROM organization_consumer where unionid=?";
	private static final String SQL_USER_GET2 = "SELECT COUNT(*) FROM organization_user WHERE username=? AND status='1'";//SQL_USER_GETBYID
	private static final String SQL_USER_GETBYID = "SELECT * FROM organization_user WHERE id=? AND status='1'";
	private JdbcTemplate jdbcTemplate;

	@Resource
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/**
	 * 验证用户名和密码是否正确
	 */
	public boolean verifyAccount(String username, String password){
		
		try{
			return 1==this.jdbcTemplate.queryForObject(SQL_USER_VERIFY, new Object[]{username, password}, Integer.class);
		}catch(EmptyResultDataAccessException e){
			return false;
		}
	}
	/**
	 * 验证用户名是否正确
	 */
	public boolean verifyAccount2(String username){
		
		try{
			return 1==this.jdbcTemplate.queryForObject(SQL_USER_GET2, new Object[]{username}, Integer.class);
		}catch(EmptyResultDataAccessException e){
			return false;
		}
	}
	
	/**
	 * 根据用户名获取用户信息
	 * @create 2015-7-20 上午10:40:54
	 * @author 
	 */
	public MyUser getByUsername(String username){
		try{
			return (MyUser)this.jdbcTemplate.queryForObject(SQL_USER_GET, new Object[]{username}, new UserRowMapper());
		}catch(EmptyResultDataAccessException e){
			return new MyUser();
		}
	}
	/**
	 * 根据uuid获取用户信息
	 * @create 2015-7-20 上午10:40:54
	 * @author 
	 */
	public String getByUuid(String uuid){
		try{
			return  this.jdbcTemplate.queryForObject(SQL_USER_GET_WX, new Object[]{uuid},String.class);
		}catch(EmptyResultDataAccessException e){
			return new String("");
		}
	}
	/**
	 * 根据用户id获取用户信息
	 * @create 2015-7-20 上午10:40:54
	 * @author 
	 */
	public MyUser getByUserId(String userId){
		try{
			return (MyUser)this.jdbcTemplate.queryForObject(SQL_USER_GETBYID, new Object[]{userId}, new UserRowMapper());
		}catch(EmptyResultDataAccessException e){
			return new MyUser();
		}
	}
	public int registerUser(String sql){
		try{
		return this.jdbcTemplate.update(sql);
		}catch(EmptyResultDataAccessException e){
		return 0;
		}
	}
	public int registerConsumer(String sql){
		try{
		return this.jdbcTemplate.update(sql);
		}catch(EmptyResultDataAccessException e){
		return 0;
		}
	}
	public int updatePwd(String id,String passwd){
		final String id2 = id;
		int res = 0;
		final String passwd2 = passwd;
		try{
			res = this.jdbcTemplate.update("update organization_user set password=? where id=?", new PreparedStatementSetter(){
		       public void setValues(PreparedStatement ps) throws SQLException{
		           ps.setString(1,passwd2);
		           ps.setString(2,id2);
		       }
		});
		return res;
		}catch(EmptyResultDataAccessException e){
		  e.printStackTrace();
		  return res;
		}
	}
}


class UserRowMapper implements RowMapper<MyUser> {
	@Override
	public MyUser mapRow(ResultSet rs, int index) throws SQLException {
		MyUser user = new MyUser();
		user.setId(rs.getString("id"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setName(rs.getString("truename"));
		user.setTheStatus(Integer.parseInt(rs.getString("status")));
		return user;
	}
}