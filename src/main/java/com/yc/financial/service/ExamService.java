package com.yc.financial.service;

public interface ExamService {
	
	/**
	 * 修改流水表
	 * @author 张胜
	 */
	public Integer updataFlowOne(Integer id,Integer did,String note,int state);
	
	
	/**
	 * 增加流水表中数据
	 * @author 张胜
	 */
	public Integer  insertFlow(Integer id,Integer did);
	
	/**
	 * 修改明细表中的状态值
	 * @param id
	 * @return
	 */
	public Integer updataDetails(Integer id,Integer state);
	

}
