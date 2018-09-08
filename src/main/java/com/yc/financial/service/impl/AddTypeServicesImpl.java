package com.yc.financial.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.financial.dao.AddTypeDao;
import com.yc.financial.service.AddTypeService;
import com.yc.financial.vo.accountypeVO;

@Service
public class AddTypeServicesImpl implements AddTypeService {
	
	@Autowired
	private AddTypeDao dao;  
		
	/**
	 * 新增部门
	 */
	@Override
	public Integer addNewType(accountypeVO accountype) {
		return dao.addAccountype(accountype);
	}

}
