package com.yc.financial.vo;

import java.sql.Timestamp;

/**
 * 报账明细
 * @author 何彦霄
 *
 */

public class DetailsVO {

	//	明细id
	private Integer id;
	//	类型名称
	private String types;
	//	报账项目
	private String project;
	//	报账人
	private String account;
	private String uname;
//	格式化报账时间
	private String formatReport;
//	格式化审核时间
	private String formatAudi;
	

	//	报账时间
	private Timestamp reportime;
	//	审核时间
	private Timestamp auditime;
	//	报账金额
	private Double money;
	//	账单数量
	private Integer number;
	//	报账总金额
	private Double allmoney;
	//	报账状态
	private Integer state;
	
	private Integer did;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	/**
	 * 部门did
	 * 
	 */
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	/**
	 * 明细id
	 * 
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 明细id
	 * 
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 类型名称
	 * 
	 */
	public String getTypes() {
		return types;
	}
	/**
	 * 类型名称
	 * 
	 */
	public void setTypes(String types) {
		this.types = types;
	}
	/**
	 * 报账项目
	 * 
	 */
	public String getProject() {
		return project;
	}
	/**
	 * 报账项目
	 * 
	 */
	public void setProject(String project) {
		this.project = project;
	}
	/**
	 * 报账人
	 * 
	 */
	public String getAccount() {
		return account;
	}
	/**
	 * 报账人
	 * 
	 */
	public void setAccount(String account) {
		this.account = account;
	}
	/**
	 * 报账时间
	 * 
	 */
	public Timestamp getReportime() {
		return reportime;
	}
	/**
	 * 报账时间
	 * 
	 */
	public void setReportime(Timestamp reportime) {
		this.reportime = reportime;
	}
	/**
	 * 审核时间
	 * 
	 */
	public Timestamp getAuditime() {
		return auditime;
	}
	/**
	 * 审核时间
	 * 
	 */
	public void setAuditime(Timestamp auditime) {
		this.auditime = auditime;
	}
	/**
	 * 报账金额
	 * 
	 */
	public Double getMoney() {
		return money;
	}
	/**
	 * 报账金额
	 * 
	 */
	public void setMoney(Double money) {
		this.money = money;
	}
	/**
	 * 账单数量
	 * 
	 */
	public Integer getNumber() {
		return number;
	}
	/**
	 * 账单数量
	 * 
	 */
	public void setNumber(Integer number) {
		this.number = number;
	}
	/**
	 * 报账总金额
	 * 
	 */
	public Double getAllmoney() {
		return allmoney;
	}
	/**
	 * 报账总金额
	 * 
	 */
	public void setAllmoney(Double allmoney) {
		this.allmoney = allmoney;
	}
	/**
	 * 报账状态
	 * 
	 */
	public Integer getState() {
		return state;
	}
	/**
	 * 报账状态
	 * 
	 */
	public void setState(Integer state) {
		this.state = state;
	}
	public String getFormatReport() {
		return formatReport;
	}
	public void setFormatReport(String formatReport) {
		this.formatReport = formatReport;
	}
	public String getFormatAudi() {
		return formatAudi;
	}
	public void setFormatAudi(String formatAudi) {
		this.formatAudi = formatAudi;
	}
}
