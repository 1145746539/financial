package com.yc.financial.vo;

/**
 * 部门表
 */
public class DeptVO {
	private Integer did;
	private String dname;
	private Integer staff;
	private Integer dlevel;
	private String account;
	private Integer uplevel;
	/**
	 * 部门id
	 */
	public Integer getDid() {
		return did;
	}
	/**
	 * 部门id
	 */
	public void setDid(Integer did) {
		this.did = did;
	}
	/**
	 * 部门名称
	 */
	public String getDname() {
		return dname;
	}
	/**
	 * 部门名称
	 */
	public void setDname(String dname) {
		this.dname = dname;
	}
	/**
	 * 部门等级(1采购部,2财务部,3财务经理,
	 * 4总经理 不能为空 4为最高等级)
	 */
	public Integer getDlevel() {
		return dlevel;
	}
	/**
	 * 部门等级(1采购部,2财务部,3财务经理,
	 * 4总经理 不能为空 4为最高等级)
	 */
	public void setDlevel(Integer dlevel) {
		this.dlevel = dlevel;
	}
	
	public Integer getStaff() {
		return staff;
	}
	public void setStaff(Integer staff) {
		this.staff = staff;
	}
	
	public Integer getUplevel() {
		return uplevel;
	}
	public void setUplevel(Integer uplevel) {
		this.uplevel = uplevel;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}

}
