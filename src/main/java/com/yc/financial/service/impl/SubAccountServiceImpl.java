package com.yc.financial.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.financial.dao.SubAccountDAO;
import com.yc.financial.service.SubAccountService;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.accountypeVO;

@Service
public class SubAccountServiceImpl implements SubAccountService {
	
	@Resource
	private SubAccountDAO dao;

	/**
	 * 查找用户类型表
	 * @return
	 */
	public List<accountypeVO> selectAccountType() {
		return dao.selectAccountType();
	}

	/**
	 * 录凭证
	 * @param detail
	 * @return
	 */
	public int insertaccount(DetailsVO detail) {
		return dao.insertaccount(detail);
	}

	/**
	 * 加入流水表
	 * @param id
	 * @param did
	 * @return
	 */
	public int insertFlowmeter(Integer id,Integer did) {
		return dao.insertFlowmeter(id,did);
	}

	/**
	 * 查找最大ID来获取用户账号
	 * @param account
	 * @return
	 */
	public int selectByID(String account) {
		return dao.selectByID(account);
	}

}
