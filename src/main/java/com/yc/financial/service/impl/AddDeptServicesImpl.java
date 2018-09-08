package com.yc.financial.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.financial.dao.AddDeptDao;
import com.yc.financial.service.AddDeptService;
import com.yc.financial.vo.DeptVO;

@Service
public class AddDeptServicesImpl implements AddDeptService {
	
	@Autowired
	private AddDeptDao dao;  
		
	/**
	 * 新增部门
	 */
	@Override
	public Integer addNewDept(DeptVO deptvo) {
		return dao.addDept(deptvo);
	}

}
