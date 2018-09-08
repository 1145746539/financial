package com.yc.financial.service;

import java.util.List;

import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.accountypeVO;


public interface SubAccountService {
	
	public List<accountypeVO> selectAccountType();
	
	public int insertaccount(DetailsVO detail);

	public int insertFlowmeter(Integer id,Integer did);
	
	public int selectByID(String account);
	
}
