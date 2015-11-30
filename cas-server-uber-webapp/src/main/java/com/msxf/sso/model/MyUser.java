package com.msxf.sso.model;


import java.io.Serializable;
import java.util.*;


public class MyUser implements Serializable{

    /**
	 * @Fields serialVersionUID : 4121641691316+491651L
	 */
	private static final long serialVersionUID = -1690430503461904734L;
	private String id;
    private String username;
    private String name;
    private String name2;    //别名
    private String password;
    private Integer theStatus;      // 0假删  1用户/人员      2人员     3用户
    private String confirmPassword;
    private String oldPassword;
    private boolean enabled;               //是否可用
    private boolean accountExpired;       //账号过期
    private boolean accountLocked;        //账号锁定
    private boolean credentialsExpired;  //证书过期
    private String tempPageUrl;
    private Map<String, String> settingMap;
    private Integer utype; //总部用户，分公司用户
    private Date lastLoginDatetime;//最后一次登陆时间

    public Integer getTheStatus() {
		return theStatus;
	}



	public void setTheStatus(Integer theStatus) {
		this.theStatus = theStatus;
	}



	public MyUser() {
    }



    public Integer getUtype() {
        return utype;
    }

    public void setUtype(Integer utype) {
        this.utype = utype;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public boolean isAccountExpired() {
        return accountExpired;
    }

    public void setAccountExpired(boolean accountExpired) {
        this.accountExpired = accountExpired;
    }

    public boolean isAccountLocked() {
        return accountLocked;
    }

    public void setAccountLocked(boolean accountLocked) {
        this.accountLocked = accountLocked;
    }

    public boolean isCredentialsExpired() {
        return credentialsExpired;
    }

    public void setCredentialsExpired(boolean credentialsExpired) {
        this.credentialsExpired = credentialsExpired;
    }


    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public boolean isAccountNonExpired() {
        return !isAccountExpired();
    }

    public boolean isAccountNonLocked() {
        return !isAccountLocked();
    }

    public boolean isCredentialsNonExpired() {
        return !credentialsExpired;
    }

    public String getFullName() {
        return this.name + "[" + this.username + "]";
    }

    @Override
    public String toString() {
        return "User{id = " + id + ", username = " + username + "}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + username.hashCode();
        return result;
    }

    public String getName2() {
        return name2;
    }

    public void setName2(String name2) {
        this.name2 = name2;
    }

    public String getTempPageUrl() {
        return tempPageUrl;
    }

    public void setTempPageUrl(String tempPageUrl) {
        this.tempPageUrl = tempPageUrl;
    }

    public Map<String, String> getSettingMap() {
        return settingMap;
    }

    public void setSettingMap(Map<String, String> settingMap) {
        this.settingMap = settingMap;
    }

    public Date getLastLoginDatetime() {
        return lastLoginDatetime;
    }

    public void setLastLoginDatetime(Date lastLoginDatetime) {
        this.lastLoginDatetime = lastLoginDatetime;
    }
}
