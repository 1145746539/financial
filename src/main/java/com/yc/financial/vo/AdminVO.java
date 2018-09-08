package com.yc.financial.vo;

/**
 *管理员表 
 */
public class AdminVO {
	
	private Integer aid;
	
	private String aname;
	
	private String apwd;

	/**
	 * 管理员id
	 */
	public Integer getAid() {
		return aid;
	}
	/**
	 * 管理员id
	 */
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	/**
	 * 管理员账号
	 */
	public String getAname() {
		return aname;
	}
	/**
	 * 管理员账号
	 */
	public void setAname(String aname) {
		this.aname = aname;
	}
	/**
	 * 管理员密码
	 */
	public String getApwd() {
		return apwd;
	}
	/**
	 * 管理员密码
	 */
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
	
	

}
