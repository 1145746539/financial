package com.yc.financial.vo;

import java.sql.Date;

public class PayrollVO {

	private Integer pid;
	
	private String uname;
	
	private String dname;
	
	private Double pay;
	
	private Date paytime;

	private String account;
	
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public Double getPay() {
		return pay;
	}

	public void setPay(Double pay) {
		this.pay = pay;
	}

	public Date getPaytime() {
		return paytime;
	}

	public void setPaytime(Date paytime) {
		this.paytime = paytime;
	}

	public PayrollVO(Integer pid, String uname, String dname, Double pay, Date paytime) {
		super();
		this.pid = pid;
		this.uname = uname;
		this.dname = dname;
		this.pay = pay;
		this.paytime = paytime;
	}

	public PayrollVO() {
		super();
	}
	
}
