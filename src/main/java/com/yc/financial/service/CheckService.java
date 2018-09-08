package com.yc.financial.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.PayrollVO;

public interface CheckService {

	/**
	 * 查询凭证表
	 * @param details
	 * @return
	 */
	public List<DetailsVO> selectByCheckVoucher(DetailsVO details);
	
	/**
	 * 查询工资表
	 * @param payroll
	 * @return
	 */
	public List<PayrollVO> selectBySalary(PayrollVO payroll);
	
	/**
	 * 查询工资表总数
	 * @param payroll
	 * @return
	 */
	public int countCountSalary(PayrollVO payroll);
	
	/**
	 * 查询指定类型
	 * @param types
	 * @return
	 */
	public List<DetailsVO> selectTypes(String types);
	
	/**
	 * 
	 * @param id	id
	 * @param time	时间（String）
	 * @param start  查询开始的地方
	 * @param limit	 查多少条
	 * @return
	 */
	List<DetailsVO> selectByPag(Integer id,String time,Integer did,String account,Integer start,Integer limit);

	
	
	/**
	 * 通过月份查找总数据
	 * @param time
	 * @return
	 */
	public Integer selectByMonthCount(String time,Integer did,String account);

	/**
	 * 通过天查找总数据
	 * @param time
	 * @return
	 */
	public Integer selectByDayCount(Integer id,String time);

	/**
	 * 查找账号
	 * @param account
	 * @return
	 */
	List<DetailsVO> selectByAccount(String account);

	/**
	 * 通过账号查找工资表
	 * @param account
	 * @return
	 */
	List<PayrollVO> selectByPayroll(String account);
	
	/**
	 * 审核报账
	 * @param did
	 * @param state
	 * @return
	 */
	Integer CountExam(Integer did,Integer state,String time);
	
	/**
	 * 通过月份查找数据
	 * @param time
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<DetailsVO> selectByMonth(String time, Integer start, Integer limit);
	
	
	public List<DetailsVO> selectExam(Integer did,Integer state,String time,Integer start,Integer limit);

	public List<DetailsVO> selectForJournal(Integer id, String time, Integer did, String account, Integer start,
			Integer limit);
	
	
	
}
