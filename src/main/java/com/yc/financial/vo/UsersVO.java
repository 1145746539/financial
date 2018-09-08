package com.yc.financial.vo;

import org.springframework.stereotype.Component;

/**
 * 用户表(针对系统的使用者)
 */
@Component
public class UsersVO {
	
	private Integer uid;
	private String uname;
	private String account;
	private String upwd;
	private String phone;
	private String email;
	private Integer did;
	private Integer sex;
	private String upic;
	/**
	 * 用户id
	 */
	public Integer getUid() {
		return uid;
	}
	/**
	 * 用户id
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	/**
	 * 用户名字
	 */
	public String getUname() {
		return uname;
	}
	/**
	 * 用户名字
	 */
	public void setUname(String uname) {
		this.uname = uname;
	}
	/**
	 * 用户账号
	 */
	public String getAccount() {
		return account;
	}
	/**
	 * 用户账号
	 */
	public void setAccount(String account) {
		this.account = account;
	}
	/**
	 * 用户密码
	 */
	public String getUpwd() {
		return upwd;
	}
	/**
	 * 用户密码
	 */
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	/**
	 * 联系方式
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * 联系方式
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * 用户邮箱
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * 用户邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 外键(dept表部门id)
	 */
	public Integer getDid() {
		return did;
	}
	/**
	 * 外键(dept表部门id)
	 */
	public void setDid(Integer did) {
		this.did = did;
	}
	/**
	 * 性别(1女，2男，默认为1)
	 */
	public Integer getSex() {
		return sex;
	}
	/**
	 * 性别(1女，2男，默认为1)
	 */
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	/**
	 * 用户头像
	 */
	public String getUpic() {
		return upic;
	}
	/**
	 * 用户头像
	 */
	public void setUpic(String upic) {
		this.upic = upic;
	}
	
}
